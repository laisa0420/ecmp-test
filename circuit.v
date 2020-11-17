`timescale 1ns / 1ps
`include "iob_lib.vh"

module circuit
  #(
  	parameter W=32
   )
  
  (
   `INPUT(rst,1),
   `INPUT(clk,1),
   `INPUT(en,1),
   `INPUT(X,W),
   `OUTPUT(Y,W)
   );

   `SIGNAL(new_max, W)
   `SIGNAL(max, W)
   `SIGNAL2OUT(Y, new_max)
   `SIGNAL(cnt,7)
   
   `REG_RE(clk,rst,1'b0,en & cnt!=99,max,new_max)
   
   `COUNTER_RE(clk, rst, cnt!=99, cnt)
   
   `COMB begin
   	if (X>max) new_max=X;
    end
   
   
   
endmodule
