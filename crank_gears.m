function [ xa ya xd yd ] = crank_gears ( coeffs, f, oversamplerate, cycles )
  N = length(coeffs);
  xd = [1:N]/N;
  yd = zeros(1,N);
  xa = [1:cycles*oversamplerate*N]/(oversamplerate*N);
  ya = zeros(1,cycles*oversamplerate*N);

  %% normally, index = 1 -> freq = 0, but the harmonic analyzer does a
  %% bias by just moving the platen up or down, so the first index is
  %% actually freq = 1;
  for cf=1:N
	if strcmp(f,"c")
	  ya += coeffs(cf) * cos(2*pi*cf*xa);
	  yd += coeffs(cf) * cos(2*pi*cf*xd);
	else
	  ya += coeffs(cf) * sin(2*pi*cf*xa);
	  yd += coeffs(cf) * sin(2*pi*cf*xd);
	endif
  endfor
endfunction
%% some interesting ones, labeled by Michelson's paper 
%% 3a
%% synthesize_gears([1 0 1/9 0 1/25], 'c', 100, 2) 

%% 4a
%% synthesize_gears([1 0 1/3 0 1/5 0 1/7 0 1/9 0 1/11 0 1/13 0 1/15 0 1/17 0 1/19], 's', 1000, 2) 

%% 5a 
%% synthesize_gears([1 1/2 1/3 1/4 1/5 1/6 1/7 1/8 1/9 1/10 1/11 1/12 1/13 1/14 1/15 1/16 1/17 1/18 1/19 1/20], 'c', 100, 2)
