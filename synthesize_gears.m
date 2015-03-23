function [] = synthesize_gears ( coeffs, f, samplecount, cycles )
  [analog digital] = crank_gears( coeffs, f, samplecount, cycles );
  plot(analog);
endfunction