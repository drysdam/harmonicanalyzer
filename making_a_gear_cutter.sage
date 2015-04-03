from numpy import *

# choices
PA = 14.5
DP = 72
actual_tip_removal = .020
cutter_dia = .500
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
actual_cutter_depth = cutter_depth - actual_tip_removal
print "rf cutter tooth spacing: %.04f" % cutter_spacing
print "rf cutter tooth depth (sharp): %.04f" % cutter_depth
print "rf cutter tooth depth (actual): %.04f" % actual_cutter_depth
print

# rf cutter diagram
crests = plot(circle((0,0), cutter_dia/2))
# diameter of teeth roots
roots = plot(circle((0,0), cutter_dia/2-actual_cutter_depth))

xcorner = cutter_dia/2-actual_cutter_depth-.005
ycorner = -.005
xedge = cutter_dia/2
yedge = sqrt((cutter_dia/2)^2 - xcorner^2)
xouter = cutter_dia
youter = cutter_dia
onechunkcoords = [(xcorner, yedge), (xcorner, ycorner), (xedge, ycorner)]
onechunkcoords = [(xcorner,youter), (xcorner,ycorner), (xouter,ycorner), (xcorner,youter)]
figure = crests + roots
for t in range(0,cutting_teeth):
    a = 2*pi/cutting_teeth * t
    R = array([[cos(a), -sin(a)],
               [sin(a), cos(a)]])
    chunkcoords = transpose(dot(R, transpose(onechunkcoords)))
    figure += polygon(chunkcoords, rgbcolor=(1,0,1), fill=True, alpha=1)

show(figure, aspect_ratio=1.0)

# making the gear
infeed = 2.25/DP
print "rf cutter infeed: %.04f" % infeed

