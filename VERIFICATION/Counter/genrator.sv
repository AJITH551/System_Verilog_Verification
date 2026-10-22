class generator;
  transaction trans;
  mailbox gen2driver;
  
  function new(mailbox gen2driver);
    this.gen2driver=gen2driver;
  endfunction
  
  task run();
    repeat(10)begin
      trans=new();
      trans.randomize();
      gen2driver.put(trans);
      $display("[GEN]rst=%b en=%b",trans.rst,trans.en);
    end
  endtask
endclass
