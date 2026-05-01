class scoreboard;
  mailbox m;
  transaction tr;
  logic [33:0] x;
  int j = 1;
  function new(mailbox m);
    this.m = m;
  endfunction
  
  task run();
    forever begin
      tr = new();
      m.get(tr);
      x=34'b0;
      $display("a=%d, b=%d",tr.a,tr.b);
      x[16:0] = tr.a/tr.b;
      x[33:17] = tr.a%tr.b;
      
      if(x == tr.result)
        $display("[%0t,%0d, right ans-> %h] PASS\n",$time,j++,x);
      else $display("[%0t,%0d, right ans-> %h] FAIL\n",$time,j++,x);
    end
  endtask
  
endclass
