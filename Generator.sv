class generator;
  
  //generator creates transaction and puts it into mailbox
  
  transaction tr;
  mailbox mbox;
  virtual comp_intr vif;
  int k =1;
  
  function new(mailbox mbox);
    this.mbox = mbox;
    this.vif = vif;
  endfunction
  
  task run();
    repeat(20)
    begin   
       tr=new(); 
       tr.randomize();
       if(!tr.randomize())
          $display("Randomization has failed");
       mbox.put(tr);
       $display("[%0t,%0d] a = %d, b = %d ",$time,k++,tr.a,tr.b);

    end
  endtask
  
endclass
