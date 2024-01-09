### robotic_collision_detector.m - HBO-ICT: Intelligent Systems assignment n. 2
##
## Author: Rene Huiberts
## Date:  09 - 01 - 2024
##
## Dependencies
##   - pkg load fuzzy-logic-toolkit
#

## rhjr: Create Fuzzy Inference System.
fis = newfis("path_finder");

## rhjr: adding membership functions (mf):
##         - trapezoid 
##         - triangle    
fis = addvar(fis, "input", "speed",            [-0.1 1.1]);
fis = addmf(fis, "input", 1, "slow",     "trapmf", [-0.1 0.0 0.3 0.4]);
fis = addmf(fis, "input", 1, "moderate", "trimf",  [0.2 0.6 0.8]);
fis = addmf(fis, "input", 1, "fast",     "trapmf", [0.7 0.9 1.0 1.1]);

fis = addvar(fis, "input", "obstacle density", [-0.1 1.1]);
fis = addmf(fis, "input", 2, "sparse",   "trapmf", [-0.1 0.0 0.5 0.6]);
fis = addmf(fis, "input", 2, "moderate", "trimf",  [0.5 0.6 0.8]);
fis = addmf(fis, "input", 2, "dense",    "trapmf", [0.8 0.9 1.0 1.1]);

## rhjr: output membership function
fis = addvar(fis, "output", "status", [0.0 1.0]);
fis = addmf(fis, "output", 1, "ok",      "constant", 0.3);
fis = addmf(fis, "output", 1, "warning", "constant", 0.6);
fis = addmf(fis, "output", 1, "crashed", "constant", 0.9);

## rhjr: visualize membership functions
#plotmf (fis, "input",  1);
#plotmf (fis, "input",  2);
#plotmf (fis, "output", 1);

## rhjr: adding rules to the system.
##   - [input1_index, input2_index, output_index   weight if/then]
fis = addrule(fis, [1 1 1  1 1]) # slow - sparse 
fis = addrule(fis, [1 2 1  1 1]) # slow - moderate 
fis = addrule(fis, [1 3 1  1 1]) # slow - dense 
fis = addrule(fis, [2 1 1  1 1]) # moderate - sparse 
fis = addrule(fis, [2 2 2  1 1]) # moderate - moderate
fis = addrule(fis, [3 3 3  1 1]) # moderate - dense 
fis = addrule(fis, [3 1 1  1 1]) # fast - sparse 
fis = addrule(fis, [3 2 2  1 1]) # fast - moderate 
fis = addrule(fis, [3 3 3  1 1]) # fast - dense 

## rhjr: trying random values.
fis = addrule(fis, [2 2 1  1 1])
fis = addrule(fis, [1 2 1  1 1])
fis = addrule(fis, [1 3 2  1 1]) 
fis = addrule(fis, [2 3 2  1 1]) # moderate - dense - warning
showrule(fis);

## rhjr: visualize correlation 
gensurf(fis);

## rhjr: demonstration
puts("\n=== Fuzzy Inference System =======================================\n");
puts("  - Author: Rene Huiberts\n")
puts("  - Testing data:\n")
data = [0.7 0.4; 0.0 0.9; 0.4 0.6; 0.0 0.0]

puts ("=== Risk of crashing the robot ===================================\n");
crisp_value = evalfis(data, fis)

### References
##    - https://octave.sourceforge.io/fuzzy-logic-toolkit/function/addrule.html
##    - https://sourceforge.net/p/octave/fuzzy-logic-toolkit/ci/default/tree/inst/heart_disease_demo_1.m#l84
##    - https://sourceforge.net/p/octave/fuzzy-logic-toolkit/ci/default/tree/inst/heart_disease_demo_2.m
##    - https://octave.sourceforge.io/fuzzy-logic-toolkit/function/addmf.html
### robotic_collision_detector.m ends here.
