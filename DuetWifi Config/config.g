; Configuration file for Duet WiFi (firmware version 1.21)
; executed by the firmware on start-up
;
;Stratasys uPrint Configuration 6-20-2019
;
; General preferences
G90                                      ; Send absolute coordinates...
M83                                      ; ...but relative extruder moves

; Network
;M552 S1 P"SET NETWORK NAME"

; Drives
M569 P0 S0                               ; Physical drive 0 goes forwards
M569 P1 S0                               ; Physical drive 1 goes forwards
M569 P2 S0                               ; Physical drive 2 goes forwards
M569 P3 S1                               ; Physical drive 3 goes forwards
M350 X32 Y32 Z16 E16 I1                  ; Configure microstepping with interpolation
;M92  X53.33 Y134 Z1011.99 E417            ; Set steps per mm
M92 X106.66 Y268 Z1011.99 E417
M566 X1500 Y1200.00 Z25 E1500      ; Set maximum instantaneous speed changes (mm/min)
M203 X24000 Y24000.00 Z650 E1200.00   ; Set maximum speeds (mm/min)
M201 X1000 Y800 Z50 E3000        ; Set accelerations (mm/s^2)
M906 X950 Y950 Z950 E500 I35 ; Set motor currents (mA) and motor idle factor in per cent
M84 S30                                  ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                         ; Set axis minima
M208 X262 Y265 Z185 S0                   ; Set axis maxima

; Endstops
M574 X1 Y2 S1                            ; Set active high endstops

; Z-Probe
M574 Z2 S1                              ; Set endstops controlled by probe
M558 P1 H10 F120 T6000                  ; Set Z probe type to unmodulated and the dive height + speeds
G31 P520 X-38 Y18 Z1.982                ; Set Z probe trigger value, offset and trigger height
;M557 X88:260 Y0:157 S50                 ; Define mesh grid

; Heaters
;M140 H-1                                 ; Disable heated bed
;M305 P0 T100000 B4725 C7.060000e-8 R4700 ; Set thermistor + ADC parameters for heater 0
;M143 H0 S55                              ; Set temperature limit for heater 0 to 50C
M305 P1 T100000 B4138 R4700              ; Set thermistor + ADC parameters for heater 1
M143 H1 S280                             ; Set temperature limit for heater 1 to 280C

; Fans
M106 P0 S0 I0 F500 H1 T45                ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P1 S1 I0 F500 H0 T40
M106 P2 S1 I0 F500 H0 T40               ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on

; Chamber
M141 H0                                    ; Assign chamber heater to heater 0
M143 H0 S55                                ; Set temperature limit for heater 0 to 55C
M307 H0 A50 D90 B1                         ; use bang-bang heater with 60 seconds dead time
M305 P0 T100000 B4725 C7.060000e-8 R4700   ; Set thermistor + ADC parameters for chamber mid thermistor

; Tools
M563 P0 D0 H1                            ; Define tool 0
G10 P0 X0 Y0 Z0                          ; Set tool 0 axis offsets
G10 P0 R0 S0                             ; Set initial tool 0 active and standby temperatures to 0C

; Automatic saving after power loss is not enabled

; Custom settings are not configured

