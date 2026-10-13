class environment;
  agent ag;
  scoreboard scr;
  mailbox mon2scr;
  
  function new(virtual ifc vif);
    mon2scr = new();
    
    ag = new(vif,mon2scr);
    scr = new(mon2scr);
  endfunction
  
  task run();
    fork 
      ag.run();
      scr.run();
    join
  endtask
  
endclass
