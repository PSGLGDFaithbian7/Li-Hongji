`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/13 21:11:16
// Design Name: 
// Module Name: csr_eu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module csr_eu(
input        rstn,
input        i_driveFromIssue,
output       o_freeToIssue,
input [3:0]  i_controlFromIssue_4,//控制信号
input [5:0]  i_tagFromIssue_6,//指令编号+type
input [11:0] i_csraddrFromIssue_12,
input [31:0] i_oprand1FromIssue_32,//csrdata
input [31:0] i_oprand2FromIssue_32,
input [4:0]  i_areg_5,

output       o_driveToIssue,
input        i_freeFromIssue,
output [31:0]o_csrdataToIssue_32,
output [3:0] o_indexToIssue_4,
output       o_driveToMD,
input        i_freeFromMD,
output [31:0]o_csrdataToMD_32,
output [3:0] o_indexToMD_4,
output       o_driveToBranch,
input        i_freeFromBranch,
output [31:0]o_csrdataToBranch_32,
output [3:0] o_indexToBranch_4,
output       o_driveToWB,
input        i_freeFromWB,
output [31:0]o_csrdataToWB_32,
output [31:0]o_resultToWB_32,
output [3:0] o_indexToWB,
output       o_isEnvInst,
output       o_isMret,
output [4:0] o_areg_5,
output [11:0]o_csraddr_12
    );
reg [67:0]   r_resultAndCsrdataTag;
reg [4:0]    r_areg_5;
reg [11:0]   r_csraddrFromIssue_12;
reg [1:0]    r_tagFromIssue_2;
wire [67:0]  w_resultAndCsrdataTag;
reg [67:0]  w_resultAndCsrdataTag1;
reg [67:0]  w_resultAndCsrdataTag2;
reg [67:0]  w_resultAndCsrdataTag3;
reg [67:0]  w_resultAndCsrdataTag4;
wire         w_LUI;//1010,csrrw(i)
wire         w_AND;//0100,
wire         w_OR;//0101
wire [31:0]  w_luiResult_32;//csrrw(i)
wire [31:0]  w_andResult_32;
wire [31:0]  w_orResult_32;
wire [31:0]  w_aluResult_32;
wire         w_drive;
wire         w_free;
wire         w_aluFire;
wire         w_copyFire;
cFifo1  aluFifo(
        .rst(rstn),
        .i_drive(i_driveFromIssue),
        .o_free(o_freeToIssue),
        .o_driveNext(w_drive),
        .i_freeNext(w_free),
        .o_fire_1(w_aluFire)
    );
assign w_AND  = (i_controlFromIssue_4 == 4'b0100)?1'h1:1'h0;
assign w_OR   = (i_controlFromIssue_4 == 4'b0101)?1'h1:1'h0;
assign w_LUI  = (i_controlFromIssue_4 == 4'b1010)?1'h1:1'h0;
assign w_andResult_32   = i_oprand1FromIssue_32 & i_oprand2FromIssue_32;          // 与运算
assign w_orResult_32    = i_oprand1FromIssue_32 | i_oprand2FromIssue_32;          // 或运算
assign w_luiResult_32   = i_oprand2FromIssue_32;                                  //加载运算
assign w_aluResult_32= {{32{w_LUI          }}  & w_luiResult_32    }
                      |{{32{w_OR           }}  & w_orResult_32     }
                      |{{32{w_AND          }}  & w_andResult_32    };
always @(posedge w_aluFire or negedge rstn) begin
        if(!rstn) begin
            r_resultAndCsrdataTag   <=  68'h0;
            r_areg_5                <=   5'h0;
            r_csraddrFromIssue_12   <=  12'h0;
            r_tagFromIssue_2        <=   2'h0;
        end
        else begin
            r_resultAndCsrdataTag   <=  {w_aluResult_32,i_oprand1FromIssue_32,i_tagFromIssue_6[5:2]};
            r_areg_5                <=  i_areg_5;
            r_csraddrFromIssue_12   <=  i_csraddrFromIssue_12;
            r_tagFromIssue_2        <=  i_tagFromIssue_6[1:0];
            end
end
assign w_resultAndCsrdataTag=r_resultAndCsrdataTag;
cCopyFork4    cCopyFork0(
        .rst(rstn),
        .i_drive(w_drive),
        .o_free(w_free),
        .o_driveNext0(o_driveToIssue),
        .i_freeNext0(i_freeFromIssue),
        .o_driveNext1(o_driveToMD),
        .i_freeNext1(i_freeFromMD),
        .o_driveNext2(o_driveToBranch),
        .i_freeNext2(i_freeFromBranch),
        .o_driveNext3(o_driveToWB),
        .i_freeNext3(i_freeFromWB),
        .o_fire(w_copyFire)
    );
always @(posedge w_copyFire or negedge rstn) begin
        if(!rstn) begin
            w_resultAndCsrdataTag1   <=  68'h0;
            w_resultAndCsrdataTag2   <=  68'h0;
            w_resultAndCsrdataTag3   <=  68'h0;
            w_resultAndCsrdataTag4   <=  68'h0;
        end
        else begin
            w_resultAndCsrdataTag1   <=  w_resultAndCsrdataTag;
            w_resultAndCsrdataTag2   <=  w_resultAndCsrdataTag;
            w_resultAndCsrdataTag3   <=  w_resultAndCsrdataTag;
            w_resultAndCsrdataTag4   <=  w_resultAndCsrdataTag;
            end
end
assign o_csrdataToIssue_32=w_resultAndCsrdataTag1[35:4];
assign o_indexToIssue_4=w_resultAndCsrdataTag1[3:0];
assign o_csrdataToMD_32=w_resultAndCsrdataTag2[35:4];
assign o_indexToMD_4=w_resultAndCsrdataTag2[3:0];
assign o_csrdataToBranch_32=w_resultAndCsrdataTag3[35:4];
assign o_indexToBranch_4=w_resultAndCsrdataTag3[3:0];
assign o_csrdataToWB_32=w_resultAndCsrdataTag4[35:4];
assign o_resultToWB_32=w_resultAndCsrdataTag4[67:36];
assign o_indexToWB=w_resultAndCsrdataTag4[3:0];
assign o_areg_5=r_areg_5;
assign o_csraddr_12=r_csraddrFromIssue_12;
assign o_isEnvInst=r_tagFromIssue_2[0];
assign o_isMret=r_tagFromIssue_2[1];
endmodule
