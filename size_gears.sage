PA = 14.5
DP = 72

# shapes being cut on the rack-form cutter
cutter_spacing = pi/DP
cutter_depth = pi/(4*DP*tan(deg2rad(PA)))+1.25/DP

# making the single-point cutter
max_tip_removal = pi/(4*DP*tan(deg2rad(PA)))-1/DP
actual_tip_removal = .020
print "sp cutter max tip removal: %.04f" % max_tip_removal
print "sp cutter actual tip removal: %.04f" % actual_tip_removal
print
# making the rack-form cutter
infeed = 2.25/DP
actual_cutter_depth = cutter_depth - actual_tip_removal
print "rf cutter tooth spacing: %.04f" % cutter_spacing
print "rf cutter tooth depth (sharp): %.04f" % cutter_depth
print "rf cutter tooth depth (actual): %.04f" % actual_cutter_depth
print
# making the gear
print "rf cutter infeed: %.04f" % infeed
print "bin  N    PCD   blank  usable div plates"
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
    div = how_divide(T, div_gear_ratio, div_plates)
    print "%2d %3d  %.04f  %.04f" %(i, T, PCD, blank),
    print div
    

def how_divide(divisions, gear_ratio, division_plates):
    dplates = array(division_plates)
    stops = gear_ratio * dplates
    stops_mods = stops % divisions
    matches = array(map((lambda x: x == 0 and True or False), stops_mods))
    return dplates[matches]

