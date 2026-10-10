class scoreboard;
  transaction tr;
  mailbox m2;
  
  function new (mailbox m2);
    this.m2=m2;
  endfunction
  
  task run();
    bit expected_sum;
    //bit expected means actual value expected value same pass or fail
    bit expected_carry;
    
    forever begin
      repeat(10)begin 
        tr=new();
        
      m2.get(tr);
      expected_sum=tr.a^tr.b^tr.c;
      expected_carry=tr.a&tr.b|tr.b&tr.c|tr.a&tr.c;
      
      if((tr.sum==expected_sum)&&(tr.carry==expected_carry))
        begin
          $display("pass");
        end
      
      else begin 
        $display("failed");
      end
      tr.display("scoreboard");
      end
    end
  endtask
endclass
