function [ a ] = analyze_gears ( samples )
  %% 'samples' contains a sampled function that we are going to do a
  %% convolution on with each of several frequencies to see what the
  %% coeff for that frequency is. How many frequencies? We need to have
  %% at least two samples for each frequency we want to identify. So if
  %% we had 8 samples, we could detect frequencies 0, 1, 2, 3 and 4.

  %% However, the book shows getting the same number of coeffs as there
  %% are samples. Maybe because the samples come from 1/2 period of a
  %% periodic function? Also, there's no 0 freq (DC offset).
  
  samplecount = length(samples);
  a = zeros(1,samplecount);
  %% do the convolutions manually for maximum understanding. also, only
  %% doing each frequency from 0 to pi.

  %% I want N evenly spaced *fenceposts*, so divide into N-1 fence
  %% *spans* and include both ends
  a(1) = sum(samples .* cos(1 * pi * [0:3]/3));
  a(2) = sum(samples .* cos(2 * pi * [0:3]/3));
  a(3) = sum(samples .* cos(3 * pi * [0:3]/3));
  a(4) = sum(samples .* cos(4 * pi * [0:3]/3));

endfunction
