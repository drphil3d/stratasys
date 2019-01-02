# Stratasys Reprap Project

Repurposing and rebuilding 3D printers made by stratasys "Rat-trap"

This will cover various models, mainly the ones that are old enough to get for free, however these printers are very similar in design so small modifications in configuration may be needed for your printer.

**Something to consider only if you have an older printer** these printers use high torque - high voltage NEMA 23 stepper motors this means you may have to replace them with something more suitable for use with modern stepper drivers. 

This guide will cover the following printers:
Dimension 1200 SST
uPrint

### Printer Board options
Ideally you want to use a board that has decently powerful stepper drivers, possibly even high amperage external drivers.
I'm using the Einsy Retro because thats what I had avalible at the time. It's definately underpowered for the high torque stepper motors on top of that I also have a terrible squeeling noise I can't get rid of in SpreadCycle mode so I'm forced to run the XY in StealthChop.

One imporatnt feature that I gain from the use of Trinamic drivers is StallGuard which provides sensorless homing.
Use something more powerfull then a TMC2130


Bake Oven Tempature Range

    75° C (167° F) Max

Gantry

    uPrint
    254 x 254 x 305 mm (10 x 10 x 12 in)


Max Travel

    uPrint X270 Y290 Z330
    1200sst X:237.162 mm (9.33 in) Y:265.613 mm (10.45 in) Z:330.2 mm
  
Normal Travel

    uPrint X260 Y280 Z300
    1200SST X:254 Y:254 Z:305

End Stops

    5v logic
    Optical Endstop min-max of all axis
    Use power distrobution board test pins for endstop signal
  
Homing Directions

     X-Min Y-Max Z-Max

Steps/mm

    Uprint X60 Y126 Z1266
    1200SST X126 Y267.5 Z1266
    
[Thank You! More info may not be correct](https://reprap.org/forum/read.php?1,418999,435031#msg-435031) 

Gantry Specs

    3mm belt pitch - 12 mm GT3 Belts
    16 mm Linear Rods

Motors

    Uprint
    X 16tx60tx20t (motor 16 tooth pulley) - (60 tooth pulley) - (20t drive shaft belt)
    Y 20t (20 tooth pulley) to (ideler pulley)
    Z lead screw driven through motor mounted to bed

    1200SST
    X (motor 16 tooth pulley) - (60 tooth pulley)
    Y (20 tooth pulley) to (ideler pulley)
    Z (36 tooth pulley) to (36 tooth) to (big lead screw pitch unknown)
    
Electronics

    2x 120v DC 400 Watt (B075 CAT NO. FS2001G102) - Build Chamber Heaters one on each side
    4x 24V 0.48A Radial Blower Fans (blows air through the heating elements)
    1x 24V Radial Blower Fan (blows cooler air on the print head via a tube that runs down to the bottom of the printers case)

Motion

    Standing at the front of the printer.
    X asix moves right in the positive direction
    Y axis moves away from you to the back of the printer in the negative direction
    Z asix moves up in the positive direction

![ScreenShot](Stratasysxyz_illustration1.jpg)

    XY Axis Belt Specs

>Gates 3MR-282-09 Belt
>SKU 9390-4094
>Part Number 3MR-282-09
>Profile GT
>Pitch	3 mm
>Number of Teeth 94
>Length (inch)	11.1
>Length (mm)	282


    Y Axis Small Belt

>SDP A 6T53M280090
>Bet Thikness 9mm
>Pitch Length 840mm
>Part Number: A 6R53M280090
>Belt Type: Single Sided
>Number of Grooves: 280
>Belt Witdth: 9mm
>Pitch Length: 840mm

>GT®3 is an equivalent and direct replacement for GT®2 belts.

>Neoprene - Nylon Covered, Fiberglass Reinforced
>Breaking Strength: 158 N per 1 mm (113 lbf per 1/8 in.) 
>Belt Width; not representative of the load-carrying capacity of the belt.
>Working Tension:507 N for 25.4 mm belt (114 lbf for 1 in. belt).
>Temperature Range: -34°C to +85°C (-30°F to +185°F)
