

/* NOT YET FULLY TESTED
 * Miguel Sanchez 2106

   
   This program uses an Arduino Pro Micro variant for a closed-loop control of a 360servo. 
   Motor motion is detected by a magnetic encoder.
   Two inputs named STEP and DIR allow changing the target position.
   Serial port prints current position and target position every second.
   Serial input can be used to feed a new location for the servo (no CR LF).
   
   MKR1000 Pins used:
   I2C input is used for magnetic encoder SCL SDA
   Digital input 2 is the STEP input.
   Digital input 3 is the DIR input.
   Digital output 7 is servo control
   Please note PID gains kp, ki, kd need to be tuned to each different setup. 
*/

#include <PID_v1.h>
#include <Wire.h>         // support for I2C encoder
#include <Servo.h>

Servo servo;
const int Step = 2;
const int DIR = 3;


byte pos[1000]; int p=0;
double kp=.1,ki=0,kd=0.0;
double input=0, output=0, setpoint=0;
PID myPID(&input, &output, &setpoint,kp,ki,kd, REVERSE);
volatile long encoder0Pos = 0;
boolean auto1=false, auto2=false,counting=false;
long previousMillis = 0;        // will store last time LED was updated
long pos1;

long target1=0;  // destination location at any moment

//for motor control ramps 1.4
bool newStep = false;
bool oldStep = false;
bool dir = false;
byte skip=0;


word readTwoBytes()
{
  word retVal = -1;

  /* Read Low Byte */
  Wire.beginTransmission(0x36);
  Wire.write(0x0d);
  Wire.endTransmission();
  Wire.requestFrom(0x36, 1);
  while (Wire.available() == 0);
  int low = Wire.read();

  /* Read High Byte */
  Wire.beginTransmission(0x36);
  Wire.write(0x0c);
  Wire.endTransmission();
  Wire.requestFrom(0x36, 1);

  while (Wire.available() == 0);

  word high = Wire.read();

  high = high << 8;
  retVal = high | low;

  return retVal;
}

int angle,diff;
double before = 0;

void setup() {
  Serial.begin (115200);
  pinMode(Step, INPUT);
  pinMode(DIR,OUTPUT);
  //attachInterrupt(Step, countStep, RISING);
  //analogWriteFreq(10000);  // set PWM to 20Khz
  //analogWriteRange(255);   // set PWM to 255 levels (not sure if more is better)
  //toggle();
  help();
  //recoverPIDfromEEPROM();
  //Setup the pid 
  myPID.SetMode(AUTOMATIC);
  myPID.SetSampleTime(1);
  myPID.SetOutputLimits(0,180);
  Wire.begin(); // start I2C driver code D6 & D7
  servo.attach(7);
}
void loop() {
    angle = readTwoBytes(); //analogRead(A0); // encoder0Pos;
  // process encoder rollover
  diff = angle - before;
  if (diff < -3500) pos1 += 4096;
  else if (diff > 3500) pos1 -= 4096;
  before = angle;
  input = pos1 + angle;
  
    //if(!client) client = server.available();
    //input = encoder0Pos; 
    setpoint=target1;
    while(!myPID.Compute()); // wait till PID is actually computed
    if(Serial.available()) process_line();
    //if(client && client.available()) process_line();
    pwmOut(output); 
    if(auto1) if(millis() % 3000 == 0) target1=random(2000); // that was for self test with no input from main controller
    if(auto2) if(millis() % 1000 == 0) printPos();
    if(counting && abs(input-target1)<15) counting=false; 
    if(counting &&  (skip++ % 5)==0 ) {pos[p]=input; if(p<999) p++; else counting=false;}

   }
   /*
  void pwmOut(int out) {
   if(out>=0) digitalWrite(DIR, HIGH); else digitalWrite(DIR, LOW); // control direction pin
   analogWrite(PWM,255-abs(out)); // my Nidec Brushless Motor 24H PWM works the other way around
  }
*/
  // continuous servo output
  void pwmOut(int out) {
    servo.write(out);
  }

void countStep(){ if (digitalRead(DIR)== HIGH) target1--;else target1++;
} // pin A0 represents direction == PF7 en Pro Micro

void process_line() {
 char cmd = Serial.read();
 if(cmd>'Z') cmd-=32;
 switch(cmd) {
  case 'P': kp=Serial.parseFloat(); myPID.SetTunings(kp,ki,kd); break;
  case 'D': kd=Serial.parseFloat(); myPID.SetTunings(kp,ki,kd); break;
  case 'I': ki=Serial.parseFloat(); myPID.SetTunings(kp,ki,kd); break;
  case '?': printPos(); break;
  case 'X': target1=Serial.parseInt(); counting=true; for(int i=0; i<p; i++) pos[i]=0; p=0; break;
  case 'T': auto1 = !auto1; break;
  case 'A': auto2 = !auto2; break;
  case 'Q': Serial.print("P="); Serial.print(kp); Serial.print(" I="); Serial.print(ki); Serial.print(" D="); Serial.println(kd); break;
  case 'H': help(); break;
  case 'W': //writetoEEPROM(); break;
  case 'K': //eedump(); break;
  case 'R': //recoverPIDfromEEPROM() ; break;
  case 'S': for(int i=0; i<p; i++) Serial.println(pos[i]); break;
  case 'M': pwmOut(Serial.parseInt()); break; // just ignore it unless you disable pwmOut in the main loop
 }
// while(Serial.read()!=10); // dump extra characters till LF is seen (you can use CRLF or just LF)
}

void printPos() {
  Serial.print(F("Position=")); Serial.print(input); Serial.print(F(" PID_output=")); Serial.print(output); Serial.print(F(" Target=")); Serial.println(setpoint);
}



   void help() {
 Serial.println(F("\nPID DC motor controller and stepper interface emulator"));
 Serial.println(F("by misan - porting cured by Exilaus"));
 Serial.println(F("Available serial commands: (lines end with CRLF or LF)"));
 Serial.println(F("P123.34 sets proportional term to 123.34"));
 Serial.println(F("I123.34 sets integral term to 123.34"));
 Serial.println(F("D123.34 sets derivative term to 123.34"));
 Serial.println(F("? prints out current encoder, output and setpoint values"));
 Serial.println(F("X123 sets the target destination for the motor to 123 encoder pulses"));
 Serial.println(F("T will start a sequence of random destinations (between 0 and 2000) every 3 seconds. T again will disable that"));
 Serial.println(F("Q will print out the current values of P, I and D parameters")); 
 Serial.println(F("W will store current values of P, I and D parameters into EEPROM")); 
 Serial.println(F("H will print this help message again")); 
 Serial.println(F("A will toggle on/off showing regulator status every second\n")); 
}
/*
void writetoEEPROM() { // keep PID set values in EEPROM so they are kept when arduino goes off
  eeput(kp,0);
  eeput(ki,4);
  eeput(kd,8);
  double cks=0;
  for(int i=0; i<12; i++) cks+=EEPROM.read(i);
  eeput(cks,12);
  Serial.println("\nPID values stored to EEPROM");
  //Serial.println(cks);
}

void recoverPIDfromEEPROM() {
  double cks=0;
  double cksEE;
  for(int i=0; i<12; i++) cks+=EEPROM.read(i);
  cksEE=eeget(12);
  //Serial.println(cks);
  if(cks==cksEE) {
    Serial.println(F("*** Found PID values on EEPROM"));
    kp=eeget(0);
    ki=eeget(4);
    kd=eeget(8);
    myPID.SetTunings(kp,ki,kd); 
  }
  else Serial.println(F("*** Bad checksum"));
}

void eeput(double value, int dir) { // Snow Leopard keeps me grounded to 1.0.6 Arduino, so I have to do this :-(
  char * addr = (char * ) &value;
  for(int i=dir; i<dir+4; i++)  EEPROM.write(i,addr[i-dir]);
}

double eeget(int dir) { // Snow Leopard keeps me grounded to 1.0.6 Arduino, so I have to do this :-(
  double value;
  char * addr = (char * ) &value;
  for(int i=dir; i<dir+4; i++) addr[i-dir]=EEPROM.read(i);
  return value;
}

void eedump() {
 for(int i=0; i<16; i++) { Serial.print(EEPROM.read(i),HEX); Serial.print(" "); }Serial.println(); 
}
*/
