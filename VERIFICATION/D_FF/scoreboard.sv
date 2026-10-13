class scoreboard;
  transaction trans;
  mailbox mon2scr;
  bit ex_q;
  
  function new(mailbox mon2scr);
    this.mon2scr = mon2scr;
  endfunction
  
  task run();
    repeat(4) begin
      mon2scr.get(trans);
      
      if(trans.reset)
        ex_q = 0;
      else 
        ex_q = trans.d;
      
      if(ex_q == trans.q)
        $display("Verification is passed");
      else
        $display("Verification is failed");
      
    end
  endtask
  
endclass
