function [] = analyze_gears ( coeffs, f, oversamplerate, cycles )
  [xanalog yanalog xdigital ydigital] = crank_gears( coeffs, f, oversamplerate, cycles );
  figure(1);
  plot(xanalog, yanalog, 'b', 'linewidth', 2); hold on;
  %% during analyze, we just crank and pause
  plot(xdigital, ydigital, 'b o', 'markersize', 3, 'markerfacecolor', 'blue'); hold off;
endfunction
