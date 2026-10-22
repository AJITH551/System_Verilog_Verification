class scoreboard;
  transaction trans;
  logic [3:0]exp_count=0;
  mailbox mon2scb;
  
  
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  
  task run();
    repeat(10)begin
      mon2scb.get(trans);
      
    if(trans.rst==1'b1)
        exp_count=4'b0000;
      else if(trans.en)
        exp_count=exp_count+1;
      
      if(trans.count==exp_count)begin
        $display("[SCB] pass rst=%b count=%d",trans.rst,trans.count);
      end
      else
        $display("[SCB] fail rst=%b count=%d ex_count=%d",trans.rst,trans.count,exp_count);
    
    end
  endtask
endclass
