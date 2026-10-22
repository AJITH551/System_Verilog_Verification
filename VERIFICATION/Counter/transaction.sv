class transaction;
  rand bit rst;
  rand bit en;
  logic [3:0]count;
  
  constraint reset_c{ rst dist{1:=3 ,0:=7};}
endclass
