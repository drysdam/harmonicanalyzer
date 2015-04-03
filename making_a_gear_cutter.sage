# choices
PA = 14.5
DP = 72
actual_tip_removal = .020
cutting_teeth = 9

print "Making a %d degree pressure angle, %d teeth/diametral inch gear cutter" % (PA, DP)
print "-" * 70

# shapes being cut on the rack-form cutter
cutter_spacing = pi/DP
cutter_depth = pi/(4*DP*tan(deg2rad(PA)))+1.25/DP

# making the single-point cutter
max_tip_removal = pi/(4*DP*tan(deg2rad(PA)))-1/DP
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
