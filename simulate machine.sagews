from numpy import *

def crank_gear(amplitude_bars, f, x):
    N = len(amplitude_bars)
    y = zeros((1, len(x)))
    # python is zero-based, so index 0 is freqbin 1
    for freqbin in range(1,N+1):
        y += amplitude_bars[freqbin-1] * f(freqbin*x)
    return y[0]        

def synthesize(coeffs, f, cycles=1):
    # in synthesize mode, the amplitude bars are coeffs to each
    # freqbin and we only have "analog" output
    xa = linspace(0,2*pi,cycles*1000)
    ya = crank_gear(coeffs, f, xa)
    return line(zip(xa, ya))

def analyze(samples, f, cycles=1):
    # in analyze mode, the amplitude bars are samples of some function
    # and we have both "analog" and "digital" output
    xa = linspace(0,2*pi,cycles*1000)
    ya = crank_gear(samples, f, xa)
    xd = linspace(0,2*pi,cycles*len(samples))
    yd = crank_gear(samples, f, xd)
    return line(zip(xa, ya)) + points(zip(xd, yd), pointsize=30)

def michelson_graphs(width):
    invs = array([1/x for x in range(1,width+1)])
    oddinvs = array([1/x if x%2==1 else 0 for x in range(1,width+1)])
    alternating = array([(-1)^floor(x/2) for x in range(0,width)])
    # 3a 
    # cos(x) + 1/3^2 cos(3x) + 1/5^2 cos(5x) + ...
    show(synthesize(oddinvs*oddinvs, cos))
    # 3b
    # cos(x) - 1/3 cos(3x) + 1/5 cos(5x) - ...
    show(synthesize(alternating*oddinvs, cos))
    # 3c
    # cos(4x) + 1/3^2 cos(12x) + 1/5^2 cos(20x) + ...
    # not much point in this, since it's just 3x the freq of 3a
    # 3d
    # sin(x) - 1/3^2 sin(3x) + 1/5^2 sin(5x) + ...
    show(synthesize(alternating*oddinvs*oddinvs, sin))

    # 4a
    # sin(x) + 1/3 sin(3x) + 1/5 sin(5x) + ...
    show(synthesize(oddinvs, sin))
    # 4b
    # sin(x) + 1/2 sin(2x) + 1/3 sin(3x) + ...
    show(synthesize(invs, sin))
    # 4c
    # cos(4x) - 1/3 cos(12x) + 1/5 cos(20x) - ...
    # not much point in this, since it's just 3x the freq of 3b
    # 4d
    # sum n=1-10: ((sin(1/2 n*pi) - sin(1/4 n*pi))*something*/(n*pi) cos(n*pi))
    # huh?

    # 5a
    # cos(x) + 1/2 cos(2x) + 1/3 cos(3x) + ...
    show(synthesize(invs, cos))
    

michelson_graphs(2)

#synthesize([1, 0, 0, 0], cos)
#synthesize([0, 1, 0, ], cos)

















