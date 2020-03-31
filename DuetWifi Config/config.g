; Configuration file for Duet WiFi (firmware version 1.21)
; 
; Stratasys Dimension 1200SSt

; General preferences
G90                                               ; Send absolute coordinates...
M83                                               ; ...but relative extruder moves

; Network
M550 P"Stratasys-1200"                                   ; Set machine name
M552 S1                                           ; Enable network
M587 S"wifi network name goes here"
M586 P0 S1                                        ; Enable HTTP
M586 P1 S0                                        ; Disable FTP
M586 P2 S0                                        ; Disable Telnet

; Drives
M569 P0 S1                                        ; Physical drive 0 goes forwards
M569 P2 S1                                        ; Physical drive 2 goes forwards
M569 P1 S1                                        ; Physical drive 1 goes forwards
M569 P3 S0                                        ; Physical drive 3 goes forwards
M569 P4 S0                                        ; Physical drive 4 goes forwards
M350 X32 Y32 Z16 E16 I1                  ; Configure microstepping with interpolation
;M92  X53.33 Y134 Z1011.99 E417          	  ; Set steps per mm for 16x microstepping
M92 X106.66 Y268 Z1011.99 E417				; Set Steps Per mm
M566 X1200.00 Y1200.00 Z24.00 E300.00 			; ; set maximum instantaneous speed changes (mm/min)
M203 X30000 Y30000 Z650 E7200  				 ; Set maximum speeds (mm/min)
M201 X720 Y720 Z100.00 E5000.00 			; set maximum instantaneous speed changes (mm/min)
M906 X1100 Y1100 Z800 E800 I40 			; Set motor currents (mA) and motor idle factor in percent
M84 S30                                            ; Set idle timeout

; Retraction
M207 S3 R0 F1920 T1920 ;set firmware retraction
M572 D0 S0.01                                      ; pressure advance 

; Axis Limits
M208 X0 Y0 Z0 S1                               ; set axis minima
M208 X295 Y300 Z305 S0                         ; set axis maxima

; Endstops
M574 X1 S3                                     ; configure sensorless endstop for low end on X
M574 Y2 S3                                     ; configure sensorless endstop for high end on Y
;M915 X S4 Y S-12 R0 F0


; Z-Probe
M574 Z2 S2                                        ; Set endstops controlled by probe
M307 H3 A-1 C-1 D-1                               ; Disable heater on PWM channel for BLTouch
M558 P9 H5 F100 T4000                            ; Set Z probe type to bltouch and the dive height + speeds
G31 P25 X48.1 Y12.9 Z0.98                         ; Set Z probe trigger value, offset and trigger height

;M557 X10:420 Y10:250 P4:3                            ; Define mesh grid
;M557 X49:393 Y13:237 P3:3                            ; Define mesh grid
;M671 X45:135:179 Y225:225:4 S1.0 P0.5 F1.0

; Heaters
M307 H0 B0 S1.00                                  ; Disable bang-bang mode for the bed heater and set PWM limit
M305 P0 T100000 B4138 R4700                       ; Set thermistor + ADC parameters for heater 0
M143 H0 S120                                      ; Set temperature limit for heater 0 to 120C

M305 P1 T100000 B4092 R4700                        ; Set thermistor + ADC parameters for heater 1
M143 H1 S270                                      ; Set temperature limit for heater 1 to 300C

;Fans
M950 F0 C"fan0" Q500                           ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                 ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q500                           ; create fan 1 on pin fan1 and set its frequency
M106 P1 S1 H1 T45                              ; set fan 1 value. Thermostatic control is turned on
M950 F2 C"fan2" Q500                           ; create fan 2 on pin fan2 and set its frequency
M106 P2 S1 H1:0 T45                            ; set fan 2 value. Thermostatic control is turned on

; Tools
M563 P0 D0 H1 F0                               ; define tool 0
G10 P0 X0 Y0 Z0                                ; set tool 0 axis offsets
G10 P0 R0 S0                                   ; set initial tool 0 active and standby temperatures to 0C

; Automatic saving after power loss is not enabled

; Custom settings are not configured
M501
