class monitor;
  transaction trans;
  mailbox mon2scr;
  virtual ifc vif;
  
  function new(virtual ifc vif, mailbox mon2scr);
    this.vif = vif;
    this.mon2scr = mon2scr;
  endfunction
  
  task run();
    @negedge vif.clk;
    repeat(4) begin
      @posedge vif.clk;
      #1;
      trans = new();
      trans.reset = vif.reset;
      trans.d = vif.d;
      trans.q = vif.q;
      mon2scr.put(trans);
    end
  endtask
  
endclass
