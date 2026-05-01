class monitor;
  transaction tr;
  virtual comp_intr vif;
  int i = 1;
  mailbox m; //this mbox is different than gen-drv mailbox
  function new(virtual comp_intr vif, mailbox m);
     begin
       this.vif = vif; 
       this.m = m; 
       tr=new();
     end
  endfunction
   
  task run();
   
    forever begin
      @(posedge vif.valid);
          tr.a = vif.a;
          tr.b = vif.b;
      	  tr.result = vif.result;
      $display("[%0t,%0d] result = %h",$time,i++,tr.result);
      m.put(tr);
        end
  endtask
endclass
