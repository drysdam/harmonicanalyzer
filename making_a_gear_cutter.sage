from numpy import *

def define_cutters(PA=14.5, DP=20, actual_tip_removal=.020, cutter_dia=.500, flutes=8, output=True):
    """Inputs:
         PA: Pressure angle, in degrees.
         DP: Diametral pitch, in teeth/inch.
         actual_tip_removal: Amount ground off end of single-point cutter, in inches.
         cutter_dia: Diameter of rack-form cutter blank.
         flutes: Number of fluts to cut into rack-form cutter. 
         output: Boolean controlling whether output/graph are emitted

       Outputs:
         a bunch of text and a graph 
         
       Returns:
         infeed: amount rack-form gear cutter should be fed into a
         gear blank to cut teeth properly
    """

    if output:
        print "Making a %.1f degree pressure angle, %d teeth/diametral inch gear cutter" % (PA, DP)
        print "-" * 70

    # shapes being cut on the rack-form cutter
    cutter_spacing = pi/DP
    cutter_depth = pi/(4*DP*tan(deg2rad(PA)))+1.25/DP

    # making the single-point cutter
    max_tip_removal = pi/(4*DP*tan(deg2rad(PA)))-1/DP
    if output:
        print "sp cutter max tip removal: %.04f" % max_tip_removal
        print "sp cutter actual tip removal: %.04f" % actual_tip_removal
        print
    # making the rack-form cutter
    actual_cutter_depth = cutter_depth - actual_tip_removal
    if output:
        print "rf cutter tooth spacing: %.04f" % cutter_spacing
        print "rf cutter tooth depth (sharp): %.04f" % cutter_depth
        print "rf cutter tooth depth (actual): %.04f" % actual_cutter_depth
        print

    # rf cutter diagram
    crests = plot(circle((0,0), cutter_dia/2))
    # diameter of teeth roots
    roots = plot(circle((0,0), cutter_dia/2-actual_cutter_depth))

    # real amounts I care about
    xcorner = cutter_dia/2-actual_cutter_depth-.005
    ycorner = -.005
    if output:
        print "rf cutter flute count: %d" % flutes
        print "rf cutter flute depth (from outer edge): %.04f" % (actual_cutter_depth+.005)
        print "rf cutter flute height (from center): %.04f" % ycorner
        print
    # arbitrary numbers to get me outside the cutting area
    xouter = cutter_dia/2+actual_cutter_depth
    youter = cutter_dia/2
    onechunkcoords = [(xcorner,youter), (xcorner,ycorner), (xouter,ycorner), (xcorner,youter)]
    figure = crests + roots
    for t in range(0,flutes):
        a = 2*pi/flutes * t
        R = array([[cos(a), -sin(a)],
                   [sin(a), cos(a)]])
        chunkcoords = transpose(dot(R, transpose(onechunkcoords)))
        figure += polygon(chunkcoords, rgbcolor=(1,0,1), edgecolor="blue", fill=True)

    if output:
        show(figure, aspect_ratio=1.0)

    # making the gear
    infeed = 2.25/DP
    if output:
        print "rf cutter infeed: %.04f" % infeed

    return infeed

define_cutters(PA=14.5,DP=72,actual_tip_removal=.020,cutter_dia=.500,flutes = 8, 
               output=False)
