M400 ; wait til Sstuff stops
M574 Y2 S3 ; use stall guard for endstops
M913 Y30  ; drop motor currents to 30% 
M201 Y800 ; reduce acceleration on X/Y to stop false triggers
M915 Y S4 R0 F0 H200; Sensitivity 4, don’t take action, don’t filter
G91 ; set relative
G1 Z5 F1600 S2
G1 S1 Y265 F3000 ; move forward stopping at the endstop
G1 Y-25 F1200 ; move away from end
G1 Z-5 F1200 S2
G90 ; back to absolute positioning
M400              ; wait again
M913 Y100         ; motor currents back to 100%
M201 Y1000       ; accel back to original
M574 Y2 S0     ; set endstops back 



