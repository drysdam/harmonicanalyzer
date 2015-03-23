function [] = analyze_gears ( coeffs, f, oversamplerate, cycles )
  [xanalog yanalog xdigital ydigital] = crank_gears( coeffs, f, oversamplerate, cycles );
  plot(xanalog, yanalog, 'b', 'linewidth', 2); hold on;
  plot(xdigital, ydigital, 'b o', 'markersize', 8, 'markerfacecolor', 'blue'); hold off;
endfunction
