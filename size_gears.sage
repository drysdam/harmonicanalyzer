from numpy import *
load making_a_gear_cutter.sage

def how_divide(divisions, gear_ratio, division_plates):
    dplates = array(division_plates)
    stops = gear_ratio * dplates
    stops_mods = stops % divisions
    matches = array(map((lambda x: x == 0 and True or False), stops_mods))
    return dplates[matches]

PA=14.5
DP=72
infeed = define_cutters(PA,DP,.020,.500,8,False)

print "Making a %d teeth/diametral inch gear" % (DP)
print "bin  N    PCD   blank  core   usable div plates"
div_gear_ratio = 30
div_plates = [21, 23, 27, 29, 31, 33, 37, 39, 41, 43, 47, 49]
# real plate A
#div_plates += [15,16,17,18,19,20]
# minimum ring replacement plate
#div_plates += [14, 17, 18, 19, 48]
# best plate
div_plates += [12,14,16,17,18,19]
for i in range(1, 21):
    T = 6 * i
    PCD = T/DP
    blank = (T+2)/DP
    core = blank - 2*infeed
    div = how_divide(T, div_gear_ratio, div_plates)
    print "%2d %3d  %.04f  %.04f %.04f" %(i, T, PCD, blank, core),
    print div

