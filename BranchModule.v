`timescale 1ns / 1ps

module BranchModule(
    input  wire [114:0] i_inst_115,    
    input  wire [31:0] i_addr_32,    
    
	input wire [31:0]  i_OprandL_32;
    input wire [31:0]  i_OprandR_32;

    output wire [31:0] o_branchPC_32,    
    output wire        o_isBranch_1      

);
//input oprand
    wire [31:0] w_rdata1_32=i_OprandL_32; 
    wire [31:0] w_rdata2_32=i_OprandR_32; 

    wire [6:0] w_opcode_10;
   
    //不用计算偏移量了，用立即数
    //opcode也不用了，直接用对应标志位

    //define B-type and J-type address
    wire [31:0] w_branchPC_32;
    wire [31:0] w_branchPC_B1_32;
    wire [31:0] w_branchPC_JALR_32;
    wire [31:0] w_branchPC_JAL_32;
 
    wire [4:0] w_rs1_5;
    wire [4:0] w_rs2_5;
    wire [31:0] w_offset_32;
    
    
    
    assign w_opcode_10  = i_inst_115[17:8];
    assign w_offset_32 = i_inst_115[74:43];

  
    //Is B-type branch
    wire w_branchPCflag_BEQ_1   =   (w_opcode_10[4])  & (w_rdata1_32 == w_rdata2_32);
    wire w_branchPCflag_BNE_1   =   (w_opcode_10[5])  & (w_rdata1_32 != w_rdata2_32);
    wire w_branchPCflag_BLT_1   =   (w_opcode_10[6])  & ($signed(w_rdata1_32) < $signed(w_rdata2_32)) ;
    wire w_branchPCflag_BGE_1   =   (w_opcode_10[7])  & ($signed(w_rdata1_32) >= $signed(w_rdata2_32));
    wire w_branchPCflag_BLTU_1  =   (w_opcode_10[8])  & (w_rdata1_32 < w_rdata2_32) ;
    wire w_branchPCflag_BGEU_1  =   (w_opcode_10[9])  & (w_rdata1_32 >= w_rdata2_32);
    wire w_branchflag = w_branchPCflag_BEQ_1 | w_branchPCflag_BNE_1 | w_branchPCflag_BLT_1 | 
                         w_branchPCflag_BGE_1 | w_branchPCflag_BLTU_1 | w_branchPCflag_BGEU_1;
    
   // Calculate isBranch
    assign w_BJ_1           = (((w_opcode_10[3] == 1) & w_branchflag ) | (w_opcode_10[2] == 1) | (w_opcode_10[1] == 1)) ;
    assign o_isBranch_1         = w_BJ_1;
  
   
   //Calculate BranchPC
    assign w_branchPC_B1_32 = i_addr_32 + w_offset_32;
    assign w_branchPC_JALR_32   = (w_rdata1_32 + w_offset_32) & ~1;
    assign w_branchPC_JAL_32    = i_addr_32 + w_offset_32;
    
   

    
    //Define BranchPC
    assign w_branchPC_32        = (w_opcode_10[3] == 1) ? w_branchPC_B1_32   :
                                  (w_opcode_10[2] == 1) ? w_branchPC_JALR_32 :
                                  (w_opcode_10[1] == 1 ) ? w_branchPC_JAL_32  :
                                                               i_addr_32;
    assign o_branchPC_32        = w_branchPC_32;
endmodule
