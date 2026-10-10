class monitor;
  transaction tr;
  virtual adder vif;
  mailbox m2;
  
  function new(virtual adder vif,mailbox m2);
    this.vif=vif;
    this.m2=m2;
  endfunction
  
  task run();
    forever begin
      repeat(10)begin 
       tr=new();
//       m1.get(tr);
      tr.a=vif.a;
      tr.b=vif.b;
      tr.c=vif.c;
      tr.sum=vif.sum;
      tr.carry=vif.carry;
      
      
        tr.display("result");
      end
      m2.put(tr);
      
    end
  endtask
endclass
