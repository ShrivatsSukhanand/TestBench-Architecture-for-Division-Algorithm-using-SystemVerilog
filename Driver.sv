class driver;
  
  //driver takes tr from mail box and puts it into interface wires
  
   virtual comp_intr vif;
   mailbox mbox;
   transaction tr;

  function new( virtual comp_intr vif, mailbox mbox);
     begin
       this.vif = vif;
       this.mbox = mbox;
     end
  endfunction
  
  task run();
    forever
      begin
        vif.rst = 1;
        #2;
        vif.rst = 0;
        tr=new();
        
        mbox.get(tr);
    //    $display("hi i am in driver\n");
        vif.cb.a<=tr.a;
        vif.cb.b<=tr.b;
        @(posedge vif.valid);
        if(mbox.num() == 0) break;
      end
  endtask
  
  
endclass
