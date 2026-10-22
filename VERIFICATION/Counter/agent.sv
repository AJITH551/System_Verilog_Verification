class agent;
  
  generator gen;
  driver drive;
  monitor mon;
  
  mailbox gen2driver;
  mailbox mon2scb;
  
  virtual intf vif;
  
  function new(virtual intf vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
    
    gen2driver=new();
    gen=new(gen2driver);
    drive=new(gen2driver,vif);
    mon=new(vif,mon2scb);
    
    endfunction
  
  task run();
    
    fork 
      gen.run();
      drive.run();
      mon.run();
    join
  endtask
endclass
    
