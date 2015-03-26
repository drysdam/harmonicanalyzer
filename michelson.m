function [] = michelson( width, oversamplerate )
  figure(1);
  [xanalog yanalog xdigital ydigital] = crank_gears( [1 0 0 0], 'c', oversamplerate, 1 );
  plot(xanalog, yanalog, 'b', 'linewidth', 2);
endfunction
