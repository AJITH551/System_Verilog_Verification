class genrator;
  transaction tr;
  mailbox m1;
  
  function new (mailbox m1);
    this.m1=m1;
  endfunction
  
  
  task run();
    repeat(10)begin
      tr=new();
      void'(tr.randomize());
      
      //display ("randomized failed");
      //tr.display();
      
      m1.put(tr);
      tr.display("generator");
      
    end 
  endtask
  endclass
