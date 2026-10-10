`include "interface.sv"
`include "transaction.sv"
`include "genrator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"

module tb_top;
  adder vif();
  full_adder dut(.a(vif.a),
                 .b(vif.b),
                 .c(vif.c),
                 .sum(vif.sum),
                 .carry(vif.carry)
                );
  environment env;
  
  initial begin
//    vif=intf;
    env=new(vif);
    
    env.run();
    
    #100;
    $finish;
  end
endmodule
