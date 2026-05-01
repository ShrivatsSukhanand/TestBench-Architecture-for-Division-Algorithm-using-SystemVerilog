class transaction;
  randc logic signed [16:0] a;
  randc logic signed [16:0] b;
  logic rst;
  logic [33:0] result;
  constraint mag { (a > 0 ? a : -a) >= (b > 0 ? b : -b); }
endclass
