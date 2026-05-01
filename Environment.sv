`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;

  generator gen;
  driver drv;
  monitor mon;
  scoreboard scr;
  mailbox mbox;
  mailbox m;
  virtual comp_intr vif;
  function new(virtual comp_intr vif);
    begin
     this.vif=vif;
     mbox=new();
     m=new();
     gen=new(mbox);
     drv=new(vif,mbox);
     mon=new(vif,m);
     scr=new(m);
    end
  endfunction
  
  task run();
    fork
      gen.run();
      drv.run();
      mon.run();
      scr.run();
    join_none
  endtask
  
endclass 
