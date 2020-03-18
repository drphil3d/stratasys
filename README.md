# Stratasys Reprap Project

Models
   [Stratasys uPrint, uPrint SE / Plus](https://github.com/drphil3d/stratasys/tree/uPrint-SE)
   [Dimension 1200es SST / BST](https://github.com/drphil3d/stratasys/tree/Dimension-1200-SST)

Discussion
[Duet Forum](https://forum.duet3d.com/topic/10982/stratasys-uprint-retrofit-finally-complete/7)

### Printer Control Board options

Ideally you want to use a board with decently powerful stepper drivers. Something in the 2amp range is preferable

##### DuetWifi
 -Pros
    Best option that matches the stepper drivers
    Sensorless Homing means no need to wire endstops
    Macro system is necessary for the extra features

 -Cons
    Display firmware doesn't support rotation of 90degrees
    Expensive
    
#### Klipper

 -Pros
   Use any board or combination of boards you want
   Super Fast Printing
   High Accuracy
   Customizable
   Macro Support
    
 -Cons
   Requires a raspberry pi or other embedded system

#### Marlin
 -Pros
   It works that was the first option I used on the uPrint

 -Cons
   Must be compiled and flashed every time you make a small change
   Most boards don't have stepper drivers that are powerful enough


##### Bake Oven temperature control
The stock bake oven runs on 120VDC - Unfortunately the 120VDC power supply in my printer was not functional. I figured the better option was to simply use an AC Solid State Rely to control the two heating elements. Keep in mind the heating elements can be wired for to operate at 120v ot 240v parallel or series.

Make sure the heater safety shutoff switches operate correctly, If a fan stops spinning the heater will overheat without the shutoff switch. Do not remove them.

This oven gets very hot under operation, I noticed the soldier on the OEM optical endstop PCB had melted and dripped down the board.
Operating Temperature 0c - 75° C (167° F) Max

Heating
   2x 120v DC 400 Watt (B075 CAT NO. FS2001G102) - Build Chamber Heaters one on each side
   2x 24V 0.48A Radial Blower Fans (blows air through the heating elements)
Cooling   
   1x 24V Radial Blower Fan - Blows room temperature air onto the printhead and part from outside the build oven.


##### Gantry Information

Depending on the model you may have more usable build area than what is immediately evident. The standard uPrint has a 152x152 build plate. However the printhead can reach outside of the build plate area to access more unused print volume. I believe the standard uPrint can accept two sizes of build platforms.

Factory Specs
 uPrint 254 x 254 x 305 mm (10 x 10 x 12 in)
 Dimension SST 1200 SST X:254 Y:254 Z:305
 
Actual Build Volume 
 uPrint X152 Y152 Z160

Max Travel
  uPrint X280 Y262 Z150
  1200sst X:237.162 mm (9.33 in) Y:265.613 mm (10.45 in) Z:330.2 mm

End Stops
   Use StallGuard sensorless homing and avoid all this madness, otherwise there are 2 optical endstops on each axis.

However another method is to tap into the test points the power distribution board if not already removed for the endstop signals   

X-Min Y-Max Z-Max

Steps Per mm at 16x Microstepping
These seem to be accurate for the uPrint M92 X106.66 Y268 Z1011.99 E417
Z axis threaded rod is Imperial

Hardware
    XY 3mm belt pitch - 12mm GT3 Belts 16mm Linear Rods


Uprint
    X 16t x 60t x 20t (motor 16 tooth pulley) - (60 tooth pulley) - (20t drive shaft belt)
    Y 20t (20 tooth pulley) to (idler pulley)
    Z lead screw driven through motor mounted to bed
1200 SST
    X (motor 16 tooth pulley) - (60 tooth pulley)
    Y (20 tooth pulley) to (idler pulley)
    Z (36 tooth pulley) to (36 tooth) to (big lead screw pitch unknown)
    
[Hardware Specs](hardwarespecs.md)
