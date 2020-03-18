M400 ; wait til Sstuff stops
M574 X1 S3 ; use stall guard for endstops
M913 X30  ; drop motor currents to 30% 
M201 X800 ; reduce acceleration on X/Y to stop false triggers
M915 X S2 R0 F0 H200; Sensitivity 4, don’t take action, don’t filter, 200steps/sec
G91 ; set relative
G1 Z5 F1600 S2
G1 S1 X-265 F6000 ; move forward stopping at the endstop
G1 X26 F1200 ; move away from end
G1 Z-5 F1200 S2
G90 ; back to absolute positioning
M400              ; wait again
M913 X100         ; motor currents back to 100%
M201 X1000        ; accel back to original
M574 X1 S0     ; set endstops back