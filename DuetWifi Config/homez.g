G91              ; relative positioning
G1 Z5 F6000 S2   ; lift Z relative to current position
G90              ; absolute positioning
G1 X88 Y130 F6000 ; go to first probe point
G30              ; home Z by probing the bed
G29 S1

; Uncomment the following lines to lift Z after probing
;G91             ; relative positioning
;G1 S2 Z5 F100   ; lift Z relative to current position
;G90             ; absolute positioning