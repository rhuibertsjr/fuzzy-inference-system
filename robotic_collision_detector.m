### robotic_collision_detector.m - HBO-ICT: Intelligent Systems assignment n. 2
##
## Author: Rene Huiberts
## Date:  06 - 01 - 2024
##
## Dependencies
##   - pkg load fuzzy-logic-toolkit
#

## rhjr: Create Fuzzy Inference System.
fuz = newfis("path_finder")

## rhjr: adding membership functions.
fuz = addvar(fuz, "input", "speed",  "trapmf", [ ])



### References
##    -  
##
### robotic_collision_detector.m ends here.
