interface comp_intr;
  
  logic signed [16:0] a;
  logic signed [16:0] b;
  logic [33:0] result;
  logic clk;
  logic rst;
  logic valid;
  
  clocking cb @(posedge clk);
    input #2.5 result,valid;
    output a,b,rst;
  endclocking
  
endinterface
