
`include "interface.sv"
`include "test.sv"

module testbench1;
  
  comp_intr rif();
  test tb(rif);
  division2 mymodule(
    .clk(rif.clk),
    .rst(rif.rst),
    .dividend_inp(rif.a),
    .divisor_inp(rif.b),
    .accumulator_rem_dividend(rif.result),
    .valid(rif.valid)
  );
    
  always #8 rif.clk = ~rif.clk;
  
  initial
    begin
      rif.clk = 0;
      $dumpfile("dump.vcd");
      $dumpvars(0,testbench1);
    end
  
endmodule
