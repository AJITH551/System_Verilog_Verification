class environment;
  
  genrator gen;
  driver drv;
  monitor mon;
  scoreboard sb;
  
  virtual adder vif;
  
  mailbox m1;
  mailbox m2;
  
  function new(virtual adder vif );
    this.vif=this.vif;
    
    
    m1=new();
    
    m2=new();
    
    gen=new(m1);
    drv=new(vif,m1);
    sb=new(m2);
    mon =new(vif,m2);
  endfunction
    
    
    task run();
      fork
        gen.run();
        drv.run();
        mon.run();
        sb.run();
      join
      
    endtask 
    
endclass
