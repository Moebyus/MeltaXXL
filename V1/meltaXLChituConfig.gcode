;The contents after semicolon are comments. Please make appropriate parameters according to the comments
;The basic format is Mxxx Ixxx, Mxxx Txxx or Mxxx Sxxx, among which Ixx (it��s the letter I, the first letter of integer, rather than the number 1) is followed by an integer. The integer can be either decimal or hexadecimal (beginning with 0x ). Sxx is followed by floating-point numbers

;;;;;;;;;;;;;;;;;;;;;;;;; The following two configurations should be matched with ��power�� modules;;;;;;;;;;;;;;;;;;;;;;;;;;;;
M8000 I0     ; whether support ��save after power off�� or not, I1 indicates support, I0 indicates not support. After setting, it can only be effective after restart.
M8001 I0     ; whether support ��shutdown after print�� or not, I1 indicates support, I0 indicates not support. After setting, it can only be effective after restart.


;The following is direction control of the stepper motor. Directions of I1 and I-1 are just the opposite. Therefore, if the motor is in the wrong direction, either the wiring or the direction parameter should be changed
M8002 I-1    ;direction of X stepper motor, I1 or I-1
M8003 I-1    ;direction of Y stepper motor
M8004 I-1    ;direction of Z stepper motor 
M8005 I-1    ;direction of E stepper motor 
;M8005 I1 E2 ; to set the direction of the second E stepping motor, I1 or I-1. If not set, then the direction of the second E stepping motor is opposite to the first motor


;;;;;;;;;;;;;;;;;XYZ axis  motion configuration, just will affect the actual movement direction of the manual interface button;;;;;;;;;;;;;;;;;
;Currently on the market of 3D printers, most of them are head moving
M8005 X0		;0: X axis direction    Extrusion head movement       1: X axis direction   Platform movement       
;Currently I3 structure of the 3D printer, the Y axis is the platform motion, delta, ultimaker and makerbot structure of the 3D printer, Y axis is the head motion
M8005 Y0		;0: Y axis direction    Extrusion head movement       1: Y axis direction   Platform movement       
;Currently I3 and delta structure of the 3D printer, the Z axis is the head motion, ultimaker and makerbot structure of the 3D printer, the Z axis is the platform motion
M8005 Z0		;0: Z axis direction    Extrusion head movement       1: Z axis direction   Platform movement        

;Speed settings: speed is in mm/s; acceleration is in mm/ s^2 
M8006 I60    ;start speed.When the moving speed exceeds this speed, it takes this speed as the starting speed and begins to accelerate. Otherwise, it is in constant motion at the moving speed
M8007 I40    ;maximum speed while turning a corner. There there will be a large number of reciprocating motion while filling. The noise is loud while this value is large. When the value is small, the speed   is slow
M8008 I1000  ;acceleration, the larger the value is, the greater the actual average moving speed is. However, the noise is loud. The actual speed is small when the value is small


;machine parameters. When finishing setting up the parameters, please print a cube. Then use a ruler to measure the size to make sure there is no problem with parameters
M8009 S0.012475             ;mm value of each step of XY. For example, 1.8 degree stepper motor, pulley with 20 teeth, tooth pitch is 2.032mm, 1/16 microstepping are (20*2.032)/((360/1.8)*16)
;M8009 X0.0127 Y0.0127    ;if independent X,Y stepper motor parameters need set up, this command can be used(remove the semicolon at the beginning)
M8010 S0.012475          ;mm value of each step of Z. The calculation formula: lead /((360/1.8)*16), lead is the ascending height of the platform when the screw turns around

;For the delta type of machine, X, Y, Z three parameters are set to the same value
M8011 S0.009          ;mm value of each step of E. This value is equal to the 1/3200 circumference of extruder gear. In addition, if there are retarding devices, it needs to be divided by the reduction ratio;if the setting is has relatively thin wire, or it has frequent faults, the value is recommended to be smaller than the real value, so that the wire is better


;maximum speed of various parameters. In order to ensure the stabilization of the machine, please make settings according to the measured results
M8012 I200   ;maximum speed of XY movement mm/s
M8013 I200    ;maximum speed of Z movement  mm/s
M8014 I120   ;maximum speed of the extruder  mm/s


;Z-axis home speed.When using makerware software,the home speed will be ignored while slicing,because gcode specified the home speed
M8015 I80    ;first home speed when Z-axis returns to zero, higher
M8015 S80    ;first home speed when X-axis and Y-axis returns to zero, higher
M8016 I6     ;second home speed when Z-axis returns to zero, slower
M8016 S6     ;second home speed when X-axis and Y-axis returns to zero, slower


;Pre-extrusion before print
M8017 I1    ;the length of pre-extrusion(mm), whether the first layer is glued to the board effects the quality of print directly, the more extruded, the better glued.
M8018 I20    ;max speed of pre-extrusion(mm/s), feeding by non-reduction gear, max speed always above 100. 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;The following 2 parameters are closely associated with compatibility of Replicator/Makerware, if you don not want to use such software, you can just ignore it.
M8019 I50    ;max supported back wire speed(mm/s), when it is 0, it is equal to E max speed. Makerware double-headed slicing software backs the wire very slowly, and the pause time is very long.
M8020 S1.5   ;length of back wire(mm), pumpback distance, too small pumpback will lead to leakage of wire, and too big pumpback will lead to long pause time and leaking easily. Please set properly according to the type of feeding and extrusion head. If 0, the length of back wire should follow slicing software.
M8033 S8     ;length of back wire when makerware change the extrusion head. The back wire specified by makerware is very long, it will be jammed when returning it back. If 0, following the setting of slicing software.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;Set default diameter of supplies used in the machine(mm)
M8021 S1.75  ;diameter of supplies


;Maximum temperature of extrusion head
M8022 I265   ;The maximum temperature that extrusion head can support, setting this temperature is to prevent users from wrongly operating the temperature of the extrusion head and damaging the extrusion head, thermal resistance can be 260��to the maximum, and peek tube begins to soften at the temperature of about 260��


;Maximum temperature of hot bed
M8023 I100   ;maximum temperature of hot bed, over heated temperature is likely to damage the hot plate

;Forbidding temperature error detection. The default temperature error detection will pop up the warning when the temperature sensor is not well plugged in or the heating power is too small. Strongly suggest not forbidding this function
M8023 T0     ;1: Forbidding temperature error detection  0: Enable temperature error detection

;Set the number of extrusion head, at least 1, at most 2 at present
M8027 I1     ;Set the number of extrusion head

;The second extrusion head is used as the first one, because some machines use two motors to feed the wire
;M8027  E0      ;If you need to enable this feature, please remove the front ";"

;Some machines want to forbidden  hot bed, the hot bed may be forbidden through this instructions. 
M8027  T1    ;1��enabled hot bed ,0��ban hot bed


;advanced settings
M8028  S0.00 ;wire back compensation , extrusion back wire. The location will be stepped back compared with the original position. Failed to understand, set to zero.


;wiring types for limit switch 
M8029  T1     ;0: XYZ limit switch normally open, when not triggered, the signal level is high  
               1:XYZ limit switch normally closed, when not triggered, the signal level is low

;The fault detection enable, the breaking limit switch is connected to the FILAMENT limit,if the function is enabled, the delta structure of the leveling limit must be received from the Z-, if not enabled, the delta structure of the leveling limit is connected to FILAMENT.
M8029 	D1		;0:ban fault detection			1:enabled fault detection


;;;;;;;;;;;;;;;;;;;Fault detection limit switch configuration;;;;;;;;;;;;;;;;;;;;;;;;;;;;
M8029	P1	;-1: the same with XYZ limit type   -1: opposite to XYZ limit type

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;If the extruder is  similar to makerbot, it is necessary to dissipate hot when the extruder is heating, or the extruder will be overheat. If the extruder is similar to ultimaker,fans turn is determined by slicing software
M8030  I0         ;if it is necessary to force extruder to open the fan automatically when it is higher than the temperature, setting a temperature that is larger than 0. If it is set as 0, the fan is controlled by slicing software.
;Set the self-starting temperature of mainboard fan, which should be put after instruction of M8030 I0. There are two fans on makerbot mainboard. One fan will open automatically when higher than a temperature, The fan can link to fan of mainboard and the parameter can be set.
;M8030 I0 T-1	  ;the parameter after I represents temperature, the current one is 0, indicating that the mainboard fan will not change with the change of temperature or the fan will be initiated when the extruder temperature is higher than designed temperature.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;Set the excursion of the second extruder(the right extruder), the unit is mm, When the nozzle number is set to 2, the following two parameters to take effect
M8031	S0.0	  ; the excursion of X direction
M8032	S0.0	  ; the excursion of Y direction


;If SD card will support the display of folder
M8034	I1	  ; 0:No  1: Yes


;Machine type and thermal type
M8080 I1     ;machine type: 1:Delta or Kossel type(For delta types of machine,the limit switches are all connected to X+,Y+ and Z+)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;types of heat resistance;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;For the heat resistance, the heat resistances with the same parameters are also different. The low temperatures for different heat resistances are similar, while at high temperature, the temperature differences shown can be as high as 40 degree
M8081 I2     ;Types of temperature sensor : 0: Ideal NTC 100K 1% 3950 B  , 1: K-Thermocouple , 2:EPCOS NTC 100K 1% 3950 B, corresponding to the type 2 sensor of marlin 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;Delta and Kossel parameter settings;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;M8083 S666	;length of the Delta bar, which can be set directly on the Delta interface 
;M8084 S325.6	;radium of Delta circle, which can be set directly on the Delta interface. During adjusting, it will be much convenient to set directly on the interface
M8084 D0	; the difference value of leveling radium, extraction point radium for automatic leveling = radium of circle+ difference value of leveling radium, for some printers, the print scope is larger than the disc below, so the probe is easy to exceed the printing scope. In the most cases, the difference value is negative, such as M8084 D-10
M8084 P0	; extraction point patterns for Delta automatic leveling, for the different extraction point patterns, the extraction point scope is a little different, which can be adjusted with the difference value of leveling radium   
                0:7x7 points, extract points from the square, and the leveling diameter is the diagonal distance   
                1��37 points, extract points from the hexagon, and the leveling diameter is the diagonal distance
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Delta 3D printer   the height difference of Z leveling limit = Z zero position- Z position for leveling limit, in most cases, you should only set as 0
;; 0: forbid deviation, the route of Z is determined by ��set Z as zero��, the printed gcode doesn��t need the automatic high leveling order. It��s recommended to use this mode. 
;; the current position of non 0:Z is automatically determined when the leveling limit is triggered. Under this mode, G29 automatic leveling order must be after the return to zero of G28 and before the order of print. If it��s photoelectric leveling limit, the value is normally negative. If the extrusion head is near to main board during limitation, the value is positive. 
M8084 Z0 	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
M8085 I2000  ;the duration of the boot screen,the minimum is 100ms,the maximum is 6000ms
M8085 P0     ; how long it takes from the standby mode to shutdown of the equipment. This function can only be used for the equipment installed with the power module. The unit is second(s). When the value is 0, it indicates forbidding the function of shutdown after standby.
M8086	I1   ; frequency division of software, some users use the motor of 0.9 stepping angle or the external drive of 32 subdivision, if hoping to reach the effect of 1.8 stepping angle or 16 subdivision, the frequency division can be set at 2. The default value is 1, without frequency division
M8087 I100000 T0  ;I: the establishment time from effectiveness of direction signal to high leveling of pulse signal. The unit is ns  T��the shortest keeping time of pulse signal with the unit of ns. If there is no external drive control panel, set the others at zero
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;; advanced configuration, in most cases, do not change;;;;;;;;;;;;;;;;;;;;;
M8489  I256	; pwm percentage when the fan of main board is self startup, max 256, for some fan of the main board, the wind force is too strong with large noise, which can be adjusted through this parameter 
M8489	T6	; in the interface of consumables, the wire feeding speed of loading consumables with the unit of mm/s, the wire feeding speed is too fast or the wire cannot be fed in time can cause the extruder stay still and out of step
M8489	S4	; when the delta is leveling, the decreasing speed at extraction point, by reducing this speed, the accuracy of automatically leveling and extraction point can be elevated
M8489	P1	; after printing, forced the closure of all motor and heating or not          0��close all        1��completely obey the gcode command
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;PID parameter setup of temperature, if you are not an expert, and your current temperature control is comparatively stable, you need not set the parameter
;M301 P22.2 I1.08 D114 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Automatic modulation PID command, this command will be blocked for a long time
;M303 E0 S150 C5     ;temperature 150��, automatic cycle vibrates 4 times, the PID parameter after automatic modulation can see through repetier-host
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

M8520	I0	;1: support laser engraving, the�� more�� button inside to set speed.
                 0: do not support the laser engraving


;Save the parameter, this parameter must be saved, or the parameter cannot be saved to the equipment 
M8500		; save the configuration
