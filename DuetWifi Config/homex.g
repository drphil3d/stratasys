M574 X1 S3                      ; use stall guard for endstops
M400                    	; make sure everything has stopped before we make changes
M913 X65 	             	; reduce motor current to 50% to prevent belts slipping unfiltered
M915 P0 S1 R1 F0		; Motor number Sensitivity Report filtering
;M201 X800 ; reduce acceleration on X/Y to stop false triggers

G91                   	 	; use relative positioning
G1 Z5 F9000 S2
G1 S1 X-300 F6000    		; move to home position
;G1 X10 F2000          		; back off to edge of bed
G1 Z-5 F9000 S2
	
G90            			; back to absolute positioning
M400
M913 X100       		; motor currents back to normal