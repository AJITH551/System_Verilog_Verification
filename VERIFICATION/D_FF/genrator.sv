class generator;
  transaction trans;
  mailbox gen2drv;
  
  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  
  task run();
    repeat(4) begin
      trans = new();
      
      if(!trans.randomize())
        $fatal("Randomization is failed");
      
      $display("trans.reset = %0b, trans.d = %0d",trans.reset, trans.d);
      $display("RAndomization is passed");
      gen2drv.put(trans);
    end
  endtask
  
endclass
