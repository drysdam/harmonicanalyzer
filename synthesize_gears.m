function [ td ] = synthesize_gears ( coeffs, f, samples, cycles )
  % f(x) = \sum_{i=1}^{N} a_i*cos(ix)
  % where N is the fft length
  % and x ranges from 0 to 2\pi.
  N = length(coeffs);
  
  % for synthesize, I think we can do as many samples as we want...?
  td = zeros(1,samples);

% normally, index = 1 -> freq = 0, but the harmonic analyzer does a bias by just moving the platen up or down, so the first index is actually freq = 1;
  for cf=1:N
	if strcmp(f,"c")
	  td += coeffs(cf) * cos(cycles*2*pi*cf*[1:samples]/samples);
	else
	  td += coeffs(cf) * sin(cycles*2*pi*cf*[1:samples]/samples);
	endif
  endfor

% some interesting ones, labeled by Michelson's paper
%  3a
%  plot(synthesize_gears([1 0 1/9 0 1/25], 'c', 100, 2))
%  4a
%  plot(synthesize_gears([1 0 1/3 0 1/5 0 1/7 0 1/9 0 1/11 0 1/13 0 1/15 0 1/17 0 1/19], 's', 1000, 2))
%  5a
%  plot(synthesize_gears([1 1/2 1/3 1/4 1/5 1/6 1/7 1/8 1/9 1/10 1/11 1/12 1/13 1/14 1/15 1/16 1/17 1/18 1/19 1/20], 'c', 100, 2))
