PA = 14.5
DP = 72

# shapes being cut on the rack-form cutter
cutter_spacing = pi/DP
cutter_depth = pi/(4*DP*tan(deg2rad(PA)))+1.25/DP

# making the single-point cutter
max_tip_removal = pi/(4*DP*tan(deg2rad(PA)))-1/DP
width_at_max_removal = 2*max_tip_removal * tan(deg2rad(PA))
actual_tip_removal = .010
print "sp cutter max tip removal: %.04f" % max_tip_removal
print "sp cutter max tip removal width: %.04f" % width_at_max_removal
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
print "  N    PCD   blank"
for i in range(1, 20):
    T = 6 * i
    PCD = T/DP
    blank = (T+2)/DP
    print "%3d  %.04f  %.04f" %(T, PCD, blank)
