module counter(intf vif);
  
  always_ff@(posedge vif.clk)begin
    if(vif.rst)
      vif.count<=4'b0000;
    else if(vif.en)
      vif.count<=vif.count+1;
  end
endmodule
