class driver;
  transaction trans;
  mailbox gen2drv;
  virtual ifc vif;
  
  function new(mailbox gen2drv, virtual ifc vif);
    this.gen2drv = gen2drv;
    this.vif = vif;
  endfunction
  
  task run();
    repeat(4) begin
      @negedge vif.clk;
      gen2drv.get(trans);
      vif.reset = trans.reset;
      vif.d = trans.d;
    end
  endtask
  
endclass
