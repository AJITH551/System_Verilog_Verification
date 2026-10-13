class transaction;
  rand bit reset;
  rand bit d;
  bit q;
  
  function void display();
    $display("reset = %0b, d = %0b, q = %0b",reset, d, q);
  endfunction
  
endclass
