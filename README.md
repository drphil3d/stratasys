# Stratasys Reprap Project

Stratasys uPrint and Dimension 1200 SST Retrofit

Just download the zip file containing the config for this machine.

### Printer Board options

DuetWifi - The option that makes sense


Ideally you want to use a board that has decently powerful stepper drivers, possibly even high amperage external drivers.
I'm using the Einsy Retro because that's what I had available at the time. It's definitely underpowered for the high torque stepper motors on top of that I also have a horrible squealing noise I can't get rid of in SpreadCycle mode so I'm forced to run the XY in StealthChop.

One important feature that I gain from the use of Trinamic drivers is StallGuard which provides sensorless homing.
Use something more powerful than a TMC2130

#### Bake Oven
    Use an SSR to energize heating elements
    They can be wired to run at 120vac or 240vac depending on where you live
    Operating Tempature 0c - 75° C (167° F) Max

#### Gantry
    uPrint 
    254 x 254 x 305 mm (10 x 10 x 12 in)


#### Max Travel
    uPrint X280 Y262 Z150
    1200sst X:237.162 mm (9.33 in) Y:265.613 mm (10.45 in) Z:330.2 mm
  
#### Normal Travel
    uPrint XX260 Y280 Z160
    1200 SST X:254 Y:254 Z:305

#### Offsets
        uPrint X52

#### End Stops
   Use StallGuard sensorless homing and avoid all this madness
    
    5v logic
    Optical Endstop min-max of all axis
    Use power distribution board test pins for endstop signal
  
#### Homing Directions
     X-Min Y-Max Z-Max

#### Steps/mm
Uprint
      
      X53.33 Y133.75 Z1011.89 E418
1200SST
        
        X126 Y267.5 Z1266
    
[Thank You! More info may not be correct](https://reprap.org/forum/read.php?1,418999,435031#msg-435031) 

#### Gantry Specs

    3mm belt pitch - 12mm GT3 Belts
    16mm Linear Rods

#### Belts and Pulleys

   Uprint
    
    X 16t x 60t x 20t (motor 16 tooth pulley) - (60 tooth pulley) - (20t drive shaft belt)
    Y 20t (20 tooth pulley) to (idler pulley)
    Z lead screw driven through motor mounted to bed

   1200 SST
  
    X (motor 16 tooth pulley) - (60 tooth pulley)
    Y (20 tooth pulley) to (idler pulley)
    Z (36 tooth pulley) to (36 tooth) to (big lead screw pitch unknown)
    
#### Electronics

    2x 120v DC 400 Watt (B075 CAT NO. FS2001G102) - Build Chamber Heaters one on each side
    4x 24V 0.48A Radial Blower Fans (blows air through the heating elements)
    1x 24V Radial Blower Fan (blows colder air on the printhead via a tube that runs down to the bottom of the printers case)


![ScreenShot](Stratasysxyz_illustration1.jpg)

##### XY Axis Belt Specs

>Gates 3MR-282-09 Belt
>SKU 9390-4094
>Part Number 3MR-282-09
>Profile GT
>Pitch	3 mm
>Number of Teeth 94
>Length (inch)	11.1
>Length (mm)	282

##### Y Axis Small Belt

>SDP A 6T53M280090
>Bet Thickness 9mm
>Pitch Length 840mm
>Part Number: A 6R53M280090
>Belt Type: Single Sided
>Number of Grooves: 280
>Belt Width: 9mm
>Pitch Length: 840mm

>GT®3 is an equivalent and direct replacement for GT®2 belts.
>Neoprene - Nylon Covered, Fiberglass Reinforced
>Breaking Strength: 158 N per 1 mm (113 lbf per 1/8 in.) 
>Belt Width; not representative of the load-carrying capacity of the belt.
>Working Tension:507 N for 25.4 mm belt (114 lbf for 1 in. belt).
>Temperature Range: -34°C to +85°C (-30°F to +185°F)
