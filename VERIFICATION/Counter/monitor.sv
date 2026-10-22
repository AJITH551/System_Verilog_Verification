class monitor;
  transaction trans;
  mailbox mon2scb;
  virtual intf vif;
  
  function new(virtual intf vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
  
  task run();
    @(posedge vif.clk);
    
    repeat(10)begin
      @(posedge vif.clk);
      #1;
      trans=new();
      trans.rst=vif.rst;
      trans.en=vif.en;
      trans.count=vif.count;
      mon2scb.put(trans);
      
      $display("[MON] rst=%b en=%b count=%d",trans.rst,trans.en,trans.count);
    end
  endtask
endclass
      
