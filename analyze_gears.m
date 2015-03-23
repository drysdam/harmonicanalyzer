function [ ] = analyze_gears ( samples, f )
  [analog digital] = crank_gears(samples, f, length(samples), 1);
  plot(analog);
endfunction
