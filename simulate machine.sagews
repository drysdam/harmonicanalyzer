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
    oddinvs = array([1/x if x%2==1 else 0 for x in range(1,width+1)])
    alternating = array([(-1)^floor(x/2) for x in range(0,width)])
    # 3a
    show(synthesize(oddinvs*oddinvs, cos))
    # 3b
    show(synthesize(alternating*oddinvs, cos))
    # 4a
    show(synthesize(oddinvs, sin))

michelson_graphs(2)

#synthesize([1, 0, 0, 0], cos)
#synthesize([0, 1, 0, ], cos)

















