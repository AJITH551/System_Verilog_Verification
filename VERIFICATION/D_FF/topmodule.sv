`include "interface"
`include "transaction"
`include "generator"
`include "driver"
`include "monitor"
`include "agent"
`include "scoreboard"
`include "environment"

module tb;
  environment env;
  ifc vif();

  d_ff d1(
    .clk(vif.clk),
    .reset(vif.reset),
    .d(vif.d),
    .q(vif.q)
  );

  initial vif.clk = 0;
  always #5 vif.clk = ~vif.clk;

  initial begin
    env = new(vif);
    env.run();

    $display("All transactions completed");
    $finish;
  end
  
endmodule
