function [ a ] = analyze_gears ( fks  )
  a = zeros(1,4);

  a += fks(1) * cos(1 * [1:4] * pi/4);
  a += fks(2) * cos(2 * [1:4] * pi/4);
  a += fks(3) * cos(3 * [1:4] * pi/4);
  a += fks(4) * cos(4 * [1:4] * pi/4);

endfunction