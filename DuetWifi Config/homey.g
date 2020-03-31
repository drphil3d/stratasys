M400 
M574 Y2 S3			; use stall guard for endstops                   	; make sure everything has stopped before we make changes
M913 Y100          	; reduce motor current to 50% to prevent belts slipping unfiltered
M915 P0 S6 R0 F1 H200
;M201 X800 ; reduce acceleration on X/Y to stop false triggers

G91                   	 	; use relative positioning
G1 Z5 F9000 S2
G1 S1 Y325 F6000    		; move to home position
;G1 Y-25 F2000          		; back off to edge of bed
G1 Z-5 F9000 S2
	
G90            			; back to absolute positioning
M400
M913 Y100        		; motor currents back to normal
