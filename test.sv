`include "environment.sv"

program test(comp_intr vif);
  environment env;
  initial
    begin
      void'($urandom(4568)); //change this as per req
      env=new(vif);
      #10;
      env.run();
      #20000;
    end
endprogram
