class transaction;
  rand bit a;
  rand bit b;
  rand bit c;
  
  bit sum;
  bit carry;
  
  function void display(string ak);
    $display("%s a=%b,b=%b,c=%b,sum=%b,carry=%b",ak,a,b,c,sum,carry);
  endfunction
  
endclass
