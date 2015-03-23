function [] = synthesize_gears ( coeffs, f, oversamplerate, cycles )
  [xanalog yanalog xdigital ydigital] = crank_gears( coeffs, f, oversamplerate, cycles );
  figure(1);
  plot(xanalog, yanalog, 'b', 'linewidth', 2);
  %% during synthesize, we just crank
  %% plot(xdigital, ydigital, 'b o', 'markersize', 8, 'markerfacecolor', 'blue'); hold off;
endfunction