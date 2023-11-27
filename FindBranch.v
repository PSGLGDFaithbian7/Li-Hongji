`timescale 1ns / 1ps

module FindBranch(
        input       [15:0]  din,
        output      [3:0]   index,
  
    );

wire    [7:0]   tmp0;
wire    [3:0]   tmp1;
wire    [1:0]   tmp2;
wire    [3:0]   Index;


assign Index[3] = ~(|din[7:0]);
assign tmp0 = Index[3] ? din[15:8] : din[7:0];

assign Index[2] = ~(|tmp0[3:0]);
assign tmp1 = Index[2] ? tmp0[7:4] : tmp0[3:0];

assign Index[1] = ~(|tmp1[1:0]);
assign tmp2 = Index[1] ? tmp1[3:2] : tmp1[1:0];

assign Index[0] = ~tmp2[0]; 

assign index= (|din[15:0]) ? Index : 4'b1111;
endmodule

