`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: South Korea Telecom
// Engineer: Oner
// Create Date: 2023/10/26 18:06:20
// Design Name: 
// Module Name: 
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
//lsu再加一条一样的

//csr指令先写回

module BypassBuffer(
  rstn, 
 //发射缓冲
 //读端口1       1-2  发射缓冲
input wire i_CsrDep_4; 
input  [17:0]    i_drive_fromExe_18;
input            i_drive_fromMdu1_1;
input            i_drive_fromMdu1_2;
input  [575:0]   i_resultExetogrf_575;
input  [35:0]    i_resultMDU1togrf1_36;
input  [35:0]    i_resultMDU1togrf2_36;
//发射缓冲 读端口1
input wire i_drive_FromCSR_1;
input wire [3:0] i_CsrDep_4;
input wire [3:0]  i_IndexFromLSU;
input wire [3:0]  i_IndexFromCSR;
input wire [3:0]  i_IndexFromMul;
input wire [3:0]  i_IndexFromDiv;
input  wire [19:0]  i_DriveFromBypassCsr_20;
input  wire i_FreeToCsrIssue_1;
//发射缓冲 读端口2
input wire i_drive_FromLsaL_1;
input wire [3:0] i_LsaLDep_4;
input  wire [19:0]  i_DriveFromBypassLsaL_20;
input  wire i_FreeToLsaLIssue_1;
input wire i_drive_FromLsaR_1;
input wire [3:0] i_LsaRDep_4;
input  wire [19:0]  i_DriveFromBypassLsaR_20;
input  wire i_FreeToLsaRIssue_1;
//跳转判断模块 读端口1
input wire i_drive_FromBranchL_1;
input wire [3:0] i_BranchLDep_4;
input wire [3:0]  i_IndexFromLSU;
input wire [3:0]  i_IndexFromBranchL;
input wire [3:0]  i_IndexFromMul;
input wire [3:0]  i_IndexFromDiv;
input  wire [19:0]  i_DriveFromBypassBranchL_20;
input  wire i_FreeToBranchLIssue_1;
//跳转判断模块 读端口2
input wire i_drive_FromBranchR_1;
input wire [3:0] i_BranchRDep_4;
input wire [3:0]  i_IndexFromLSU;
input wire [3:0]  i_IndexFromBranchR;
input wire [3:0]  i_IndexFromMul;
input wire [3:0]  i_IndexFromDiv;
input  wire [19:0]  i_DriveFromBypassBranchR_20;
input  wire i_FreeToBranchRIssue_1;



output          o_free_toJump;
output [31:0]   o_grftoJump_32;
output          o_drive_toJump;
output           o_free_toMDU1_1;
output          o_free_toMDU2_1;
output [17:0]   o_free_toExe_18;
//发射缓冲 读端口1
output wire o_free_ToCsr_1;
output wire [31:0] o_CsrOperand_32 ;
output wire [19:0]  o_FreeToBypassCsr_20;
output wire [31:0] o_final_operandCsr_32;
output wire o_DriveToCsrIssue_1;
//发射缓冲 读端口2
output wire o_free_ToLsaL_1;
output wire [31:0] o_LsaLOperand_32 ;
output wire [19:0]  o_FreeToBypassLsaL_20;
output wire o_DriveToLsaLIssue_1;
output wire o_free_ToLsaR_1;
output wire [31:0] o_LsaROperand_32 ;
output wire [19:0]  o_FreeToBypassLsaR_20;
output wire o_DriveToLsaRIssue_1;
//跳转判断模块 读端口1
output wire o_free_ToBranchL_1;
output wire [31:0] o_BranchLOperand_32 ;
output wire [19:0]  o_FreeToBypassBranchL_20;
output wire [19:0]  o_FreeToBypassBranchL_20;
output wire [31:0] o_final_operandBranchL_32;
output wire o_DriveToBranchLIssue_1;
//跳转判断模块 读端口2
output wire o_free_ToBranchR_1;
output wire [31:0] o_BranchROperand_32 ;
output wire [19:0]  o_FreeToBypassBranchR_20;
output wire [31:0] o_final_operandBranchR_32;
output wire o_DriveToBranchRIssue_1;
//LSU读端口1
output wire [31:0] o_final_operandLsaL_32;
//LSU读端口2
output wire [31:0] o_final_operandLsaR_32;

);
 



 

 

 

 
  

    
/**************** inputData ******************/

//寄存器号打包
 reg    [4:0]    r_TransR1togrf_5;
 reg    [4:0]    r_TransR2togrf_5;

 

 reg    [4:0]    r_Jumptogrf_5;

 reg    [9:0]    r_MDU1togrf_10;
 reg    [9:0]    r_MDU2togrf_10;

//结果暂存寄存器组
 reg  [19:0]  r_Result_32 [0:31];
 reg  [19:0]  r_Ready_1;
 
/**************** outputData ******************/

//32位数据打包
 reg    [31:0]   r_grftoTransR1_32;
 reg    [31:0]   r_grftoTransR2_32;
 
 reg    [31:0]   r_grftoJump_32;

 reg    [63:0]   r_grftoMDU1_64;
 reg    [63:0]   r_grftoMDU2_64;

/**************** control ******************/

 reg	[19:0] regs [0:31];



 //发射缓冲
 //读端口1


wire w_fire_Csr_2;
wire w_fire0_Csr_1;
wire w_fire1_Csr_1;

reg [3:0] r_CsrDep_4;
wire [3:0] w_CsrDep_4; 
reg [31:0] r_CsrOperand_32 ;  
wire [31:0] w_CsrOperand_32;


wire w_CsrDrive_FifoToPmt_1;
wire w_CsrFree_PmtTofifo_1;
wire w_CsrPmt_1;

wire [19:0]  w_BypassSelectCsr_20;
wire [19:0]  w_DriveToMutexMergeCsr_20;


wire [19:0] w_FreeFromMutexMergeCsr_20 ;
wire [19:0] w_FreeFromMutexMergeCsr_20[i] ;
wire w_DriveToBypassPmtFifoCsr_1;
wire w_FreeMutexMergeCsrToBypassCsrPmt_1;


wire [31:0] w_finalOperandCsr_32;
reg [31:0]  r_final_oprandCsr_32;


wire   w_isDriveWithBypassCsr_1=!(w_CsrPmt_1);
wire   w_FreeMutexMergeCsrToBypassCsrPmt_1;
wire   w_DriveBypassCsrPmtToMutexMergeCsr_1;
wire   w_FreeMutexMergeCsrToCsrPmt_1;
wire   w_DriveCsrPmtToMutexMergeCsr_1;
wire   w_CsrPmtFifo_fire_1;

wire  w_DriveMutexMergeToIssueFifoCsr_1;
wire  w_FreeIssueFifoToMutexMergeCsr_1;

wire w_CsrIssueFifoFire_1;
wire  w_bypassOperandCsr_32;
 //读端口2
//L
wire w_fire_LsaL_2;
wire w_fire0_LsaL_1;
wire w_fire1_LsaL_1;

reg [3:0] r_CsrDep_4;
wire [3:0] w_LsaLDep_4; 
reg [31:0] r_LsaLOperand_32 ;  
wire [31:0] w_LsaLOperand_32;


wire w_LsaLDrive_FifoToPmt_1;
wire w_LsaLFree_PmtTofifo_1;
wire w_LsaLPmt_1;
wire [3:0] w_dep2_4 = i_LsaLDep_4 ;

wire [19:0]  w_BypassSelectLsaL_20;
wire [19:0]  w_DriveToMutexMergeLsaL_20;


wire [19:0] w_FreeFromMutexMergeLsaL_20 ;

wire  w_DriveToBypassPmtFifoLsaL_1;
wire  w_FreeFromBypassPmtFifoLsaL_1;


wire   w_isDriveWithBypassLsaL_1=!(w_LsaLPmt_1);
wire   w_FreeMutexMergeLsaLToBypassLsaLPmt_1;
wire   w_DriveBypassLsaLPmtToMutexMergeLsaL_1;
wire   w_FreeMutexMergeLsaLToLsaLPmt_1;
wire   w_DriveLsaLPmtToMutexMergeLsaL_1;
wire   w_LsaLPmtFifo_fire_1;


wire  w_DriveMutexMergeToIssueFifoLsaL_1;
wire  w_FreeIssueFifoToMutexMergeLsaL_1;

wire w_LsaLIssueFifoFire_1;
wire  w_bypassOperandLsaL_32;

//R
wire w_fire_LsaR_2;
wire w_fire0_LsaR_1;
wire w_fire1_LsaR_1;

reg [3:0] r_CsrDep_4;
wire [3:0] w_LsaRDep_4; 
reg [31:0] r_LsaROperand_32 ;  
wire [31:0] w_LsaROperand_32;


wire w_LsaRDrive_FifoToPmt_1;
wire w_LsaRFree_PmtTofifo_1;
wire w_LsaRPmt_1;
wire [3:0] w_dep2_4 = i_LsaRDep_4 ;

wire [19:0]  w_BypassSelectLsaR_20;
wire [19:0]  w_DriveToMutexMergeLsaR_20;


wire [19:0] w_FreeFromMutexMergeLsaR_20 ;

wire  w_DriveToBypassPmtFifoLsaR_1;
wire  w_FreeFromBypassPmtFifoLsaR_1;


wire   w_isDriveWithBypassLsaR_1=!(w_LsaRPmt_1);
wire   w_FreeMutexMergeLsaRToBypassLsaRPmt_1;
wire   w_DriveBypassLsaRPmtToMutexMergeLsaR_1;
wire   w_FreeMutexMergeLsaRToLsaRPmt_1;
wire   w_DriveLsaRPmtToMutexMergeLsaR_1;
wire   w_LsaRPmtFifo_fire_1;


wire  w_DriveMutexMergeToIssueFifoLsaR_1;
wire  w_FreeIssueFifoToMutexMergeLsaR_1;

wire w_LsaRIssueFifoFire_1;
wire  w_bypassOperandLsaR_32;

 //跳转判断模块
 //读端口1

wire w_fire_BranchL_2;
wire w_fire0_BranchL_1;
wire w_fire1_BranchL_1;

reg [3:0] r_BranchLDep_4;
wire [3:0] w_BranchLDep_4; 
reg [31:0] r_BranchLOperand_32 ;  
wire [31:0] w_BranchLOperand_32;


wire w_BranchLDrive_FifoToPmt_1;
wire w_BranchLFree_PmtTofifo_1;
wire w_BranchLPmt_1;

wire [19:0]  w_BypassSelectBranchL_20;
wire [19:0]  w_DriveToMutexMergeBranchL_20;



wire [19:0] w_FreeFromMutexMergeBranchL_20 ;
wire [19:0] w_FreeFromMutexMergeBranchL_20[i] ;
wire w_DriveToBypassPmtFifoBranchL_1;
wire w_FreeMutexMergeBranchLToBypassBranchLPmt_1;


wire [31:0] w_finalOperandBranchL_32;
reg [31:0]  r_final_oprandBranchL_32;


wire   w_isDriveWithBypassBranchL_1=!(w_BranchLPmt_1);
wire   w_FreeMutexMergeBranchLToBypassBranchLPmt_1;
wire   w_DriveBypassBranchLPmtToMutexMergeBranchL_1;
wire   w_FreeMutexMergeBranchLToBranchLPmt_1;
wire   w_DriveBranchLPmtToMutexMergeBranchL_1;
wire   w_BranchLPmtFifo_fire_1;

wire  w_DriveMutexMergeToIssueFifoBranchL_1;
wire  w_FreeIssueFifoToMutexMergeBranchL_1;


wire w_BranchLIssueFifoFire_1;
wire  w_bypassOperandBranchL_32;  
 
 //读端口2

wire w_fire_BranchR_2;
wire w_fire0_BranchR_1;
wire w_fire1_BranchR_1;

reg [3:0] r_BranchRDep_4;
wire [3:0] w_BranchRDep_4; 
reg [31:0] r_BranchROperand_32 ;  
wire [31:0] w_BranchROperand_32;


wire w_BranchRDrive_FifoToPmt_1;
wire w_BranchRFree_PmtTofifo_1;
wire w_BranchRPmt_1;

wire [19:0]  w_BypassSelectBranchR_20;
wire [19:0]  w_DriveToMutexMergeBranchR_20;


wire [19:0] w_FreeFromMutexMergeBranchR_20 ;
wire [19:0] w_FreeFromMutexMergeBranchR_20[i] ;
wire w_DriveToBypassPmtFifoBranchR_1;
wire w_FreeMutexMergeBranchRToBypassBranchRPmt_1;


wire [31:0] w_finalOperandBranchR_32;
reg [31:0]  r_final_oprandBranchR_32;


wire   w_isDriveWithBypassBranchR_1=!(w_BranchRPmt_1);
wire   w_FreeMutexMergeBranchRToBypassBranchRPmt_1;
wire   w_DriveBypassBranchRPmtToMutexMergeBranchR_1;
wire   w_FreeMutexMergeBranchRToBranchRPmt_1;
wire   w_DriveBranchRPmtToMutexMergeBranchR_1;
wire   w_BranchRPmtFifo_fire_1;

wire  w_DriveMutexMergeToIssueFifoBranchR_1;
wire  w_FreeIssueFifoToMutexMergeBranchR_1;


wire w_BranchRIssueFifoFire_1;
wire  w_bypassOperandBranchR_32;  



 
 //写端口


 wire  [575:0]   w_wdata_576;



//用Cfifo产生fire信号  


wire  [17:0] w_fire0_WriteBack_18;
wire  [17:0] w_fire1_WriteBack_18;
wire  [35:0] w_fire_WriteBack_36;

wire  w_fire0_Mdu1_1;
wire  w_fire1_Mdu1_1;
wire  [1:0] w_fire_Mdu1_2;
wire  w_fire0_Mdu2_1;
wire  w_fire0_Mdu2_1;
wire [1:0] w_fire_Mdu2_2;
wire [3:0] w_dep1_4 = i_CsrDep_4;

generate
genvar  i;
for(i=0;i<17;i=i+1)    begin
{
    cLastFifo2 cLastFifo2fromWriteBack(
                        .i_drive(i_drive_fromExe_18[i]),
                        .o_free(o_free_toExe_18[i]),
                        .o_fire_2( w_fire_WriteBack_36[1+2*i:i]),
                        .rst(rstn));
   assign  {w_fire0_WriteBack_18[i],  w_fire1_WriteBack_18[i]} = w_fire_WriteBack_36[1+2*i:i];
} 
end               
endgenerate                        


 cLastFifo2 cLastFifo2fromMDU1(
                        .i_drive(i_drive_fromMdu1_1),
                        .o_free(o_free_toMDU1_1),
                        .o_fire_2(w_fire_Mdu1_2),
                        .rst(rstn));
   assign  { w_fire0_Mdu1_1, w_fire1_Mdu1_1} = w_fire_Mdu1_2;

 cLastFifo2 cLastFifo2fromMDU2(
                        .i_drive(i_drive_fromMdu2_1),
                        .o_free(o_free_toMDU2_1),
                        .o_fire_2(w_fire_Mdu2_2),
                        .rst(rstn));
   assign  { w_fire0_Mdu2_1, w_fire1_Mdu2_1} = w_fire_Mdu2_2;


//发射缓冲
//读端口1  
//Before Instruction Input
 cFifo1 CSRList(
    .i_drive(i_drive_FromCSR_1),
    .i_freeNext(w_CsrFree_PmtTofifo_1),
    .rst(rstn),
   .o_free(o_free_ToCsr_1),
   .o_driveNext(w_CsrDrive_FifoToPmt_1),
   .o_fire_1(w_fire_Csr_2)
);

assign  {w_fire0_Csr_1,  w_fire1_Csr_1} = w_fire_Csr_1;


always@(posedge w_fire0_Csr_1 or negedge rstn) begin
       if(!rstn) begin
           r_CsrDep_4 <= 4'b0;
       end 
       else begin 
           r_CsrDep_4  <=  i_CsrDep_4;
           w_CsrDep_4 = r_CsrDep_4;
       end
end

     


always@(posedge w_fire1_Csr_1 or negedge rstn) begin
       if(!rstn) begin
          r_CsrOperand_32  <=  32'b0;
             end
       else begin
          r_CsrOperand_32  <=  regs[w_CsrDep_4];
          w_CsrPmt_1 = r_Ready_1[w_CsrDep_4];
          w_CsrOperand_32 = r_CsrOperand_32;
       end
end


//After Instruction Input


generate
    genvar j;
    for(j=0;i<16;i=i+1) begin:SelectData1
          assign w_BypassSelectCsr_20[i]=  (w_dep1_4 ==i) ? 1'b1 : 1'b0;
    end
endgenerate
    assign w_BypassSelectCsr_20[16]=  (w_dep1_4 ==i_IndexFromLSU) ? 1'b1 : 1'b0;
    assign w_BypassSelectCsr_20[17]=  (w_dep1_4 ==i_IndexFromCSR) ? 1'b1 : 1'b0;
    assign w_BypassSelectCsr_20[20]=  (w_dep1_4 ==i_IndexFromMul) ? 1'b1 : 1'b0;
    assign w_BypassSelectCsr_20[19]=  (w_dep1_4 ==i_IndexFromDiv) ? 1'b1 : 1'b0;


  generate
        genvar i; 
        for(i=0; i<16; i=i+1) begin:Bypass_FIFO_Csr
            cPmtFifo1 BypassFifoCsr (
            .i_drive(i_DriveFromBypassCsr_20[i]),
            .i_freeNext(w_FreeFromMutexMergeCsr_20[i]), 
            .rst(rstn),
            .pmt(w_BypassSelectCsr_20[i]),
            .o_free(o_FreeToBypassCsr_20[i]),
            .o_driveNext(w_DriveToMutexMergeCsr_20[i]),
            .o_fire_1()
        );
        end
    endgenerate


 cPmtFifo1 BypassFifo_LSU_Csr (
            .i_drive(i_DriveFromBypassCsr_20[16]),
            .i_freeNext(w_FreeFromMutexMergeCsr_20[16]), 
            .rst(rstn),
            .pmt(w_BypassSelectCsr_20[16]),
            .o_free(o_FreeToBypassCsr_20[16]),
            .o_driveNext(w_DriveToMutexMergeCsr_20[16]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_CSR_Csr (
            .i_drive(i_DriveFromBypassCsr_20[17]),
            .i_freeNext(w_FreeFromMutexMergeCsr_20[17]), 
            .rst(rstn),
            .pmt(w_BypassSelectCsr_20[17]),
            .o_free(o_FreeToBypassCsr_20[17]),
            .o_driveNext(w_DriveToMutexMergeCsr_20[17]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_Div_Csr (
            .i_drive(i_DriveFromBypassCsr_20[18]),
            .i_freeNext(w_FreeFromMutexMergeCsr_20[18]), 
            .rst(rstn),
            .pmt(w_BypassSelectCsr_20[18]),
            .o_free(o_FreeToBypassCsr_20[18]),
            .o_driveNext(w_DriveToMutexMergeCsr_20[18]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_Mul_Csr (
            .i_drive(i_DriveFromBypassCsr_20[19]),
            .i_freeNext(w_FreeFromMutexMergeCsr_20[19]), 
            .rst(rstn),
            .pmt(w_BypassSelectCsr_20[19]),
            .o_free(o_FreeToBypassCsr_20[19]),
            .o_driveNext(w_DriveToMutexMergeCsr_20[19]),
            .o_fire_1()
        );

//该模块目前不存在
   cMutexMerge20_32b MutexMergeCsr(
        .i_drive0(w_DriveToMutexMergeCsr_20[0]),
        .i_drive1(w_DriveToMutexMergeCsr_20[1]),
        .i_drive2(w_DriveToMutexMergeCsr_20[2]),
        .i_drive3(w_DriveToMutexMergeCsr_20[3]),
        .i_drive4(w_DriveToMutexMergeCsr_20[4]),
        .i_drive5(w_DriveToMutexMergeCsr_20[5]),
        .i_drive6(w_DriveToMutexMergeCsr_20[6]),
        .i_drive7(w_DriveToMutexMergeCsr_20[7]),
        .i_drive8(w_DriveToMutexMergeCsr_20[8]),
        .i_drive9(w_DriveToMutexMergeCsr_20[9]),
        .i_drive10(w_DriveToMutexMergeCsr_20[10]),
        .i_drive11(w_DriveToMutexMergeCsr_20[11]),
        .i_drive12(w_DriveToMutexMergeCsr_20[12]),
        .i_drive13(w_DriveToMutexMergeCsr_20[13]),
        .i_drive14(w_DriveToMutexMergeCsr_20[14]),
        .i_drive15(w_DriveToMutexMergeCsr_20[15]),
        .i_drive16(w_DriveToMutexMergeCsr_20[16]),
        .i_drive17(w_DriveToMutexMergeCsr_20[17]),
        .i_drive18(w_DriveToMutexMergeCsr_20[18]),
        .i_drive19(w_DriveToMutexMergeCsr_20[19]),
       
        .i_data0_32(),
        .i_data1_32(),
        .i_data2_32(),
        .i_data3_32(),
        .i_data4_32(),
        .i_data5_32(),
        .i_data6_32(),
        .i_data7_32(),
        .i_data8_32(),
        .i_data9_32(),
        .i_data10_32(),
        .i_data11_32(),
        .i_data12_32(),
        .i_data13_32(),
        .i_data14_32(),
        .i_data15_32(),
        .i_data16_32(),
        .i_data17_32(),
        .i_data18_32(),
        .i_data19_32(),

        .i_freeNext(w_FreeFromBypassPmtFifoCsr_1),
        .rst(rstn),

        .o_free0(w_FreeFromMutexMergeCsr_20[0]),
        .o_free1(w_FreeFromMutexMergeCsr_20[1]),
        .o_free2(w_FreeFromMutexMergeCsr_20[2]),
        .o_free3(w_FreeFromMutexMergeCsr_20[3]),
        .o_free4(w_FreeFromMutexMergeCsr_20[4]),
        .o_free5(w_FreeFromMutexMergeCsr_20[5]),
        .o_free6(w_FreeFromMutexMergeCsr_20[6]),
        .o_free7(w_FreeFromMutexMergeCsr_20[7]),
        .o_free8(w_FreeFromMutexMergeCsr_20[8]),
        .o_free9(w_FreeFromMutexMergeCsr_20[9]),
        .o_free10(w_FreeFromMutexMergeCsr_20[10]),
        .o_free11(w_FreeFromMutexMergeCsr_20[11]),
        .o_free12(w_FreeFromMutexMergeCsr_20[12]),
        .o_free13(w_FreeFromMutexMergeCsr_20[13]),
        .o_free14(w_FreeFromMutexMergeCsr_20[14]),
        .o_free15(w_FreeFromMutexMergeCsr_20[15]),
        .o_free16(w_FreeFromMutexMergeCsr_20[16]),
        .o_free17(w_FreeFromMutexMergeCsr_20[17]),
        .o_free18(w_FreeFromMutexMergeCsr_20[18]),
        .o_free19(w_FreeFromMutexMergeCsr_20[19]),



        .o_driveNext(w_DriveToBypassPmtFifoCsr_1),
        .o_data_32()
    );

//Merge





cPmtFifo1 CsrPmtFifo(
     .i_drive(w_CsrDrive_FifoToPmt_1),
     .i_freeNext(w_FreeMutexMergeCsrToCsrPmt_1),
     .rst(rstn),
     .pmt(w_CsrPmt_1),
     .o_free(w_CsrFree_PmtTofifo_1),
     .o_driveNext(w_DriveCsrPmtToMutexMergeCsr_1),
     .o_fire_1(w_CsrPmtFifo_fire_1)
);



     cPmtFifo1 cPmtFifo_FromBypassCsr(
        .i_drive(w_DriveToBypassPmtFifoCsr_1),
        .i_freeNext(w_FreeMutexMergeCsrToBypassCsrPmt_1), 
        .rst(rstn),
        .pmt( w_isDriveWithBypassCsr_1),
        .o_free(w_FreeFromBypassPmtFifoCsr_1),
        .o_driveNext(w_DriveBypassCsrPmtToMutexMergeCsr_1),
        .o_fire_1()
);




cMutexMerge2_32b  cMutexMergeCsr(
         .i_drive0(w_DriveBypassCsrPmtToMutexMergeCsr_1),
         .i_drive1(w_DriveCsrPmtToMutexMergeCsr_1),
         .i_data0_32(),
         .i_data1_32(),
         .i_freeNext(w_FreeIssueFifoToMutexMergeCsr_1),
         .rst(rstn),
         .o_free0(w_FreeMutexMergeCsrToBypassCsrPmt_1),
         .o_free1(w_FreeMutexMergeCsrToCsrPmt_1),
         .o_driveNext(w_DriveMutexMergeToIssueFifoCsr_1),
         .o_data_32(),
);


cFifo1 IssueFifoCsr(
        .i_drive(w_DriveMutexMergeToIssueFifoCsr_1), 
        .i_freeNext(i_FreeToCsrIssue_1),
        .rst(rstn),
        .o_free(w_FreeIssueFifoToMutexMergeCsr_1), 
        .o_driveNext(o_DriveToCsrIssue_1),
        .o_fire_1(w_CsrIssueFifoFire_1),
);


 case(w_BypassSelectCsr_20)
    20'b00000000000000000001:begin assign w_bypassOperandCsr_32=i_OprandFromBypass0_32 ;end
    20'b00000000000000000010:begin assign w_bypassOperandCsr_32=i_OprandFromBypass1_32 ;end
    20'b00000000000000000100:begin assign w_bypassOperandCsr_32=i_OprandFromBypass2_32 ;end
    20'b00000000000000001000:begin assign w_bypassOperandCsr_32=i_OprandFromBypass3_32 ;end
    20'b00000000000000010000:begin assign w_bypassOperandCsr_32=i_OprandFromBypass4_32 ;end
    20'b00000000000000100000:begin assign w_bypassOperandCsr_32=i_OprandFromBypass5_32 ;end
    20'b00000000000001000000:begin assign w_bypassOperandCsr_32=i_OprandFromBypass6_32 ;end
    20'b00000000000010000000:begin assign w_bypassOperandCsr_32=i_OprandFromBypass7_32 ;end
    20'b00000000000100000000:begin assign w_bypassOperandCsr_32=i_OprandFromBypass8_32 ;end
    20'b00000000001000000000:begin assign w_bypassOperandCsr_32=i_OprandFromBypass9_32 ;end
    20'b00000000010000000000:begin assign w_bypassOperandCsr_32=i_OprandFromBypass10_32; end
    20'b00000000100000000000:begin assign w_bypassOperandCsr_32=i_OprandFromBypass11_32; end
    20'b00000001000000000000:begin assign w_bypassOperandCsr_32=i_OprandFromBypass12_32; end
    20'b00000010000000000000:begin assign w_bypassOperandCsr_32=i_OprandFromBypass13_32; end
    20'b00000100000000000000:begin assign w_bypassOperandCsr_32=i_OprandFromBypass14_32; end
    20'b00001000000000000000:begin assign w_bypassOperandCsr_32=i_OprandFromBypass15_32; end
    20'b00010000000000000000:begin assign w_bypassOperandCsr_32=i_OprandFromBypassLSU_32; end
    20'b00100000000000000000:begin assign w_bypassOperandCsr_32=i_OprandFromBypassCSR_32;end
    20'b01000000000000000000:begin assign w_bypassOperandCsr_32=i_OprandFromBypassMul_32; end
    20'b10000000000000000000:begin assign w_bypassOperandCsr_32=i_OprandFromBypassDiv_32; end
    
    default:assign w_bypassOperandCsr_32=32'b0;
endcase

   assign w_finalOperandCsr_32=   (w_CsrPmt_1==1'b1) ? w_CsrOperand_32:w_bypassOperandCsr_32;
    


    always @(posedge w_CsrIssueFifoFire_1 or negedge rstn) begin
       if (!rstn) begin
       r_final_oprandCsr_32 <= 32'b0 ;
    end 
    else begin
       o_final_operandcsr_32 <=w_finalOperandCsr_32 ;
       
    end
    end




//Lsu读端口1

cFifo LsaLFifo (
    .i_drive(i_drive_FromLsaL_1),
    .i_freeNext(w_LsaLFree_PmtTofifo_1),
    .rst(rstn),
   .o_free(o_free_ToLsaL_1),
   .o_driveNext(w_LsaLDrive_FifoToPmt_1),
   .o_fire(w_fire_LsaL_2),
);

assign {w_fire0_LsaL_1,w_fire1_LsaL_1} = w_fire_LsaL_1;

//语法错误
always@(posedge w_fire0_LsaL_1 or negedge rstn) begin
       if(!rstn) begin
           r_LsaLDep_4 <= 4'b0;
       end 
       else begin 
           r_LsaLDep_4  <=  i_LsaLDep_4;
           w_LsaLDep_4 = r_LsaLDep_4;
       end
end

     


always@(posedge w_fire1_LsaL_1 or negedge rstn) begin
       if(!rstn) begin
          r_LsaLOperand_32  <=  32'b0;
             end
       else begin
          r_LsaLOperand_32  <=  regs[w_LsaLDep_4];
          w_LsaLPmt_1 = r_Ready_1[w_LsaLDep_4];
          w_LsaLOperand_32 = r_LsaLOperand_32;
       end
end


//After Instruction Input


generate
    genvar j;
    for(j=0;i<16;i=i+1) begin:SelectData2
          assign w_BypassSelectLsaL_20[i]=  (w_dep2_4 ==i) ? 1'b1 : 1'b0;
    end
endgenerate
    assign w_BypassSelectLsaL_20[16]=  (w_dep2_4 ==i_IndexFromLSU) ? 1'b1 : 1'b0;
    assign w_BypassSelectLsaL_20[17]=  (w_dep2_4 ==i_IndexFromCSR) ? 1'b1 : 1'b0;
    assign w_BypassSelectLsaL_20[20]=  (w_dep2_4 ==i_IndexFromMul) ? 1'b1 : 1'b0;
    assign w_BypassSelectLsaL_20[19]=  (w_dep2_4 ==i_IndexFromDiv) ? 1'b1 : 1'b0;


  generate
        genvar i; 
        for(i=0; i<16; i=i+1) begin:Bypass_FIFO_LsaL
            cPmtFifo1 BypassFifoLsaL (
            .i_drive(i_DriveFromBypassLsaL_20[i]),
            .i_freeNext(w_FreeFromMutexMergeLsaL_20[i]), 
            .rst(rstn),
            .pmt(w_BypassSelectLsaL_20[i]),
            .o_free(o_FreeToBypassLsaL_20[i]),
            .o_driveNext(w_DriveToMutexMergeLsaL_20[i]),
            .o_fire_1()
        );
        end
    endgenerate


 cPmtFifo1 BypassFifo_LSU_LsaL (
            .i_drive(i_DriveFromBypassLsaL_20[16]),
            .i_freeNext(w_FreeFromMutexMergeLsaL_20[16]), 
            .rst(rstn),
            .pmt(w_BypassSelectLsaL_20[16]),
            .o_free(o_FreeToBypassLsaL_20[16]),
            .o_driveNext(w_DriveToMutexMergeLsaL_20[16]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_CSR_LsaL (
            .i_drive(i_DriveFromBypassLsaL_20[17]),
            .i_freeNext(w_FreeFromMutexMergeLsaL_20[17]), 
            .rst(rstn),
            .pmt(w_BypassSelectLsaL_20[17]),
            .o_free(o_FreeToBypassLsaL_20[17]),
            .o_driveNext(w_DriveToMutexMergeLsaL_20[17]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_Div_LsaL (
            .i_drive(i_DriveFromBypassLsaL_20[18]),
            .i_freeNext(w_FreeFromMutexMergeLsaL_20[18]), 
            .rst(rstn),
            .pmt(w_BypassSelectLsaL_20[18]),
            .o_free(o_FreeToBypassLsaL_20[18]),
            .o_driveNext(w_DriveToMutexMergeLsaL_20[18]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_Mul_LsaL (
            .i_drive(i_DriveFromBypassLsaL_20[19]),
            .i_freeNext(w_FreeFromMutexMergeLsaL_20[19]), 
            .rst(rstn),
            .pmt(w_BypassSelectLsaL_20[19]),
            .o_free(o_FreeToBypassLsaL_20[19]),
            .o_driveNext(w_DriveToMutexMergeLsaL_20[19]),
            .o_fire_1()
        );


   cMutexMerge20_32b MutexMergeCsr(
        .i_drive0(w_DriveToMutexMergeLsaL_20[0]),
        .i_drive1(w_DriveToMutexMergeLsaL_20[1]),
        .i_drive2(w_DriveToMutexMergeLsaL_20[2]),
        .i_drive3(w_DriveToMutexMergeLsaL_20[3]),
        .i_drive4(w_DriveToMutexMergeLsaL_20[4]),
        .i_drive5(w_DriveToMutexMergeLsaL_20[5]),
        .i_drive6(w_DriveToMutexMergeLsaL_20[6]),
        .i_drive7(w_DriveToMutexMergeLsaL_20[7]),
        .i_drive8(w_DriveToMutexMergeLsaL_20[8]),
        .i_drive9(w_DriveToMutexMergeLsaL_20[9]),
        .i_drive10(w_DriveToMutexMergeLsaL_20[10]),
        .i_drive11(w_DriveToMutexMergeLsaL_20[11]),
        .i_drive12(w_DriveToMutexMergeLsaL_20[12]),
        .i_drive13(w_DriveToMutexMergeLsaL_20[13]),
        .i_drive14(w_DriveToMutexMergeLsaL_20[14]),
        .i_drive15(w_DriveToMutexMergeLsaL_20[15]),
        .i_drive16(w_DriveToMutexMergeLsaL_20[16]),
        .i_drive17(w_DriveToMutexMergeLsaL_20[17]),
        .i_drive18(w_DriveToMutexMergeLsaL_20[18]),
        .i_drive19(w_DriveToMutexMergeLsaL_20[19]),
       
        .i_data0_32(),
        .i_data1_32(),
        .i_data2_32(),
        .i_data3_32(),
        .i_data4_32(),
        .i_data5_32(),
        .i_data6_32(),
        .i_data7_32(),
        .i_data8_32(),
        .i_data9_32(),
        .i_data10_32(),
        .i_data11_32(),
        .i_data12_32(),
        .i_data13_32(),
        .i_data14_32(),
        .i_data15_32(),
        .i_data16_32(),
        .i_data17_32(),
        .i_data18_32(),
        .i_data19_32(),

        .i_freeNext(w_FreeFromBypassPmtFifoLsaL_1),
        .rst(rstn),

       .o_free0(w_FreeFromMutexMergeLsaL_20[0]),
        .o_free1(w_FreeFromMutexMergeLsaL_20[1]),
        .o_free2(w_FreeFromMutexMergeLsaL_20[2]),
        .o_free3(w_FreeFromMutexMergeLsaL_20[3]),
        .o_free4(w_FreeFromMutexMergeLsaL_20[4]),
        .o_free5(w_FreeFromMutexMergeLsaL_20[5]),
        .o_free6(w_FreeFromMutexMergeLsaL_20[6]),
        .o_free7(w_FreeFromMutexMergeLsaL_20[7]),
        .o_free8(w_FreeFromMutexMergeLsaL_20[8]),
        .o_free9(w_FreeFromMutexMergeLsaL_20[9]),
        .o_free10(w_FreeFromMutexMergeLsaL_20[10]),
        .o_free11(w_FreeFromMutexMergeLsaL_20[11]),
        .o_free12(w_FreeFromMutexMergeLsaL_20[12]),
        .o_free13(w_FreeFromMutexMergeLsaL_20[13]),
        .o_free14(w_FreeFromMutexMergeLsaL_20[14]),
        .o_free15(w_FreeFromMutexMergeLsaL_20[15]),
        .o_free16(w_FreeFromMutexMergeLsaL_20[16]),
        .o_free17(w_FreeFromMutexMergeLsaL_20[17]),
        .o_free18(w_FreeFromMutexMergeLsaL_20[18]),
        .o_free19(w_FreeFromMutexMergeLsaL_20[19]),


        .o_driveNext(w_DriveToBypassPmtFifoLsaL_1),
        .o_data_32()
    );
//Merge


cPmtFifo1 LsaLPmtFifo(
     .i_drive(w_LsaLDrive_FifoToPmt_1),
     .i_freeNext(w_FreeMutexMergeLsaLToLsaLPmt_1),
     .rst(rstn),
     .pmt(w_LsaLPmt_1),
     .o_free(w_LsaLFree_PmtTofifo_1),
     .o_driveNext(w_DriveLsaLPmtToMutexMergeLsaL_1),
     .o_fire_1(w_LsaLPmtFifo_fire_1)
);



     cPmtFifo1 cPmtFifo_FromBypassLsaL(
        .i_drive(w_DriveToBypassPmtFifoLsaL_1),
        .i_freeNext(w_FreeMutexMergeLsaLToBypassLsaLPmt_1), 
        .rst(rstn),
        .pmt( w_isDriveWithBypassLsaL_1),
        .o_free(w_FreeFromBypassPmtFifoLsaL_1),
        .o_driveNext(w_DriveBypassLsaLPmtToMutexMergeLsaL_1),
        .o_fire_1()
);



cMutexMerge2_32b  cMutexMergeLsaL(
         .i_drive0(w_DriveBypassLsaLPmtToMutexMergeLsaL_1),
         .i_drive1(w_DriveLsaLPmtToMutexMergeLsaL_1),
         .i_data0_32(),
         .i_data1_32(),
         .i_freeNext(w_FreeIssueFifoToMutexMergeLsaL_1),
         .rst(rstn),
         .o_free0(w_FreeMutexMergeLsaLToBypassLsaLPmt_1),
         .o_free1(w_FreeMutexMergeCsrToCsrPmt_1),
         .o_driveNext(w_DriveMutexMergeToIssueFifoLsaL_1),
         .o_data_32(),
);


cFifo1 IssueFifoLsaL(
        .i_drive(w_DriveMutexMergeToIssueFifoLsaL_1), 
        .i_freeNext(i_FreeToLsaLIssue_1),
        .rst(rstn),
        .o_free(w_FreeIssueFifoToMutexMergeLsaL_1), 
        .o_driveNext(o_DriveToLsaLIssue_1),
        .o_fire_1(w_LsaLIssueFifoFire_1),
);


 case(w_BypassSelectLsaL_20)
    20'b00000000000000000001:begin assign w_bypassOperandLsaL_32=i_OprandFromBypass0_32 ;end
    20'b00000000000000000010:begin assign w_bypassOperandLsaL_32=i_OprandFromBypass1_32 ;end
    20'b00000000000000000100:begin assign w_bypassOperandLsaL_32=i_OprandFromBypass2_32 ;end
    20'b00000000000000001000:begin assign w_bypassOperandLsaL_32=i_OprandFromBypass3_32 ;end
    20'b00000000000000010000:begin assign w_bypassOperandLsaL_32=i_OprandFromBypass4_32 ;end
    20'b00000000000000100000:begin assign w_bypassOperandLsaL_32=i_OprandFromBypass5_32 ;end
    20'b00000000000001000000:begin assign w_bypassOperandLsaL_32=i_OprandFromBypass6_32 ;end
    20'b00000000000010000000:begin assign w_bypassOperandLsaL_32=i_OprandFromBypass7_32 ;end
    20'b00000000000100000000:begin assign w_bypassOperandLsaL_32=i_OprandFromBypass8_32 ;end
    20'b00000000001000000000:begin assign w_bypassOperandLsaL_32=i_OprandFromBypass9_32 ;end
    20'b00000000010000000000:begin assign w_bypassOperandLsaL_32=i_OprandFromBypass10_32; end
    20'b00000000100000000000:begin assign w_bypassOperandLsaL_32=i_OprandFromBypass11_32; end
    20'b00000001000000000000:begin assign w_bypassOperandLsaL_32=i_OprandFromBypass12_32; end
    20'b00000010000000000000:begin assign w_bypassOperandLsaL_32=i_OprandFromBypass13_32; end
    20'b00000100000000000000:begin assign w_bypassOperandLsaL_32=i_OprandFromBypass14_32; end
    20'b00001000000000000000:begin assign w_bypassOperandLsaL_32=i_OprandFromBypass15_32; end
    20'b00010000000000000000:begin assign w_bypassOperandLsaL_32=i_OprandFromBypassLSU_32; end
    20'b00100000000000000000:begin assign w_bypassOperandLsaL_32=i_OprandFromBypassCSR_32;end
    20'b01000000000000000000:begin assign w_bypassOperandLsaL_32=i_OprandFromBypassMul_32; end
    20'b10000000000000000000:begin assign w_bypassOperandLsaL_32=i_OprandFromBypassDiv_32; end
    
    default:assign w_bypassOperandLsaL_32=32'b0;
endcase

   wire [31:0] w_finalOperandLsaL_32;

   assign w_finalOperandLsaL_32=   (w_LsaLPmt_1==1'b1) ? w_LsaLOperand_32:w_bypassOperandLsaL_32;
    
   reg [31:0]  r_final_oprandLsaL_32;
   

    always @(posedge w_LsaLIssueFifoFire_1 or negedge rstn) begin
       if (!rstn) begin
       r_final_oprandLsaL_32 <= 32'b0 ;
    end 
    else begin
       o_final_operandLsaL_32 <=w_finalOperandLsaL_32 ;
       
    end
    end

//Lsu读端口2

cFifo LsaRFifo (
    .i_drive(i_drive_FromLsaR_1),
    .i_freeNext(w_LsaRFree_PmtTofifo_1),
    .rst(rstn),
   .o_free(o_free_ToLsaR_1),
   .o_driveNext(w_LsaRDrive_FifoToPmt_1),
   .o_fire(w_fire_LsaR_2),
);

assign {w_fire0_LsaR_1,w_fire1_LsaR_1} = w_fire_LsaR_1;


always@(posedge w_fire0_LsaR_1 or negedge rstn) begin
       if(!rstn) begin
           r_LsaRDep_4 <= 4'b0;
       end 
       else begin 
           r_LsaRDep_4  <=  i_LsaRDep_4;
           w_LsaRDep_4 = r_LsaRDep_4;
       end
end

     
//

always@(posedge w_fire1_LsaR_1 or negedge rstn) begin
       if(!rstn) begin
          r_LsaROperand_32  <=  32'b0;
             end
       else begin
          r_LsaROperand_32  <=  regs[w_LsaRDep_4];
          w_LsaRPmt_1 = r_Ready_1[w_LsaRDep_4];
          w_LsaROperand_32 = r_LsaROperand_32;
       end
end


//After Instruction Input


generate
    genvar j;
    for(j=0;i<16;i=i+1) begin:SelectData2
          assign w_BypassSelectLsaR_20[i]=  (w_dep2_4 ==i) ? 1'b1 : 1'b0;
    end
endgenerate
    assign w_BypassSelectLsaR_20[16]=  (w_dep2_4 ==i_IndexFromLSU) ? 1'b1 : 1'b0;
    assign w_BypassSelectLsaR_20[17]=  (w_dep2_4 ==i_IndexFromCSR) ? 1'b1 : 1'b0;
    assign w_BypassSelectLsaR_20[20]=  (w_dep2_4 ==i_IndexFromMul) ? 1'b1 : 1'b0;
    assign w_BypassSelectLsaR_20[19]=  (w_dep2_4 ==i_IndexFromDiv) ? 1'b1 : 1'b0;


  generate
        genvar i; 
        for(i=0; i<16; i=i+1) begin:Bypass_FIFO_LsaR
            cPmtFifo1 BypassFifoLsaR (
            .i_drive(i_DriveFromBypassLsaR_20[i]),
            .i_freeNext(w_FreeFromMutexMergeLsaR_20[i]), 
            .rst(rstn),
            .pmt(w_BypassSelectLsaR_20[i]),
            .o_free(o_FreeToBypassLsaR_20[i]),
            .o_driveNext(w_DriveToMutexMergeLsaR_20[i]),
            .o_fire_1()
        );
        end
    endgenerate


 cPmtFifo1 BypassFifo_LSU_LsaR (
            .i_drive(i_DriveFromBypassLsaR_20[16]),
            .i_freeNext(w_FreeFromMutexMergeLsaR_20[16]), 
            .rst(rstn),
            .pmt(w_BypassSelectLsaR_20[16]),
            .o_free(o_FreeToBypassLsaR_20[16]),
            .o_driveNext(w_DriveToMutexMergeLsaR_20[16]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_CSR_LsaR (
            .i_drive(i_DriveFromBypassLsaR_20[17]),
            .i_freeNext(w_FreeFromMutexMergeLsaR_20[17]), 
            .rst(rstn),
            .pmt(w_BypassSelectLsaR_20[17]),
            .o_free(o_FreeToBypassLsaR_20[17]),
            .o_driveNext(w_DriveToMutexMergeLsaR_20[17]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_Div_LsaR (
            .i_drive(i_DriveFromBypassLsaR_20[18]),
            .i_freeNext(w_FreeFromMutexMergeLsaR_20[18]), 
            .rst(rstn),
            .pmt(w_BypassSelectLsaR_20[18]),
            .o_free(o_FreeToBypassLsaR_20[18]),
            .o_driveNext(w_DriveToMutexMergeLsaR_20[18]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_Mul_LsaR (
            .i_drive(i_DriveFromBypassLsaR_20[19]),
            .i_freeNext(w_FreeFromMutexMergeLsaR_20[19]), 
            .rst(rstn),
            .pmt(w_BypassSelectLsaR_20[19]),
            .o_free(o_FreeToBypassLsaR_20[19]),
            .o_driveNext(w_DriveToMutexMergeLsaR_20[19]),
            .o_fire_1()
        );


   cMutexMerge20_32b MutexMergeCsr(
        .i_drive0(w_DriveToMutexMergeLsaR_20[0]),
        .i_drive1(w_DriveToMutexMergeLsaR_20[1]),
        .i_drive2(w_DriveToMutexMergeLsaR_20[2]),
        .i_drive3(w_DriveToMutexMergeLsaR_20[3]),
        .i_drive4(w_DriveToMutexMergeLsaR_20[4]),
        .i_drive5(w_DriveToMutexMergeLsaR_20[5]),
        .i_drive6(w_DriveToMutexMergeLsaR_20[6]),
        .i_drive7(w_DriveToMutexMergeLsaR_20[7]),
        .i_drive8(w_DriveToMutexMergeLsaR_20[8]),
        .i_drive9(w_DriveToMutexMergeLsaR_20[9]),
        .i_drive10(w_DriveToMutexMergeLsaR_20[10]),
        .i_drive11(w_DriveToMutexMergeLsaR_20[11]),
        .i_drive12(w_DriveToMutexMergeLsaR_20[12]),
        .i_drive13(w_DriveToMutexMergeLsaR_20[13]),
        .i_drive14(w_DriveToMutexMergeLsaR_20[14]),
        .i_drive15(w_DriveToMutexMergeLsaR_20[15]),
        .i_drive16(w_DriveToMutexMergeLsaR_20[16]),
        .i_drive17(w_DriveToMutexMergeLsaR_20[17]),
        .i_drive18(w_DriveToMutexMergeLsaR_20[18]),
        .i_drive19(w_DriveToMutexMergeLsaR_20[19]),
       
        .i_data0_32(),
        .i_data1_32(),
        .i_data2_32(),
        .i_data3_32(),
        .i_data4_32(),
        .i_data5_32(),
        .i_data6_32(),
        .i_data7_32(),
        .i_data8_32(),
        .i_data9_32(),
        .i_data10_32(),
        .i_data11_32(),
        .i_data12_32(),
        .i_data13_32(),
        .i_data14_32(),
        .i_data15_32(),
        .i_data16_32(),
        .i_data17_32(),
        .i_data18_32(),
        .i_data19_32(),

        .i_freeNext(w_FreeFromBypassPmtFifoLsaR_1),
        .rst(rstn),

       .o_free0(w_FreeFromMutexMergeLsaR_20[0]),
        .o_free1(w_FreeFromMutexMergeLsaR_20[1]),
        .o_free2(w_FreeFromMutexMergeLsaR_20[2]),
        .o_free3(w_FreeFromMutexMergeLsaR_20[3]),
        .o_free4(w_FreeFromMutexMergeLsaR_20[4]),
        .o_free5(w_FreeFromMutexMergeLsaR_20[5]),
        .o_free6(w_FreeFromMutexMergeLsaR_20[6]),
        .o_free7(w_FreeFromMutexMergeLsaR_20[7]),
        .o_free8(w_FreeFromMutexMergeLsaR_20[8]),
        .o_free9(w_FreeFromMutexMergeLsaR_20[9]),
        .o_free10(w_FreeFromMutexMergeLsaR_20[10]),
        .o_free11(w_FreeFromMutexMergeLsaR_20[11]),
        .o_free12(w_FreeFromMutexMergeLsaR_20[12]),
        .o_free13(w_FreeFromMutexMergeLsaR_20[13]),
        .o_free14(w_FreeFromMutexMergeLsaR_20[14]),
        .o_free15(w_FreeFromMutexMergeLsaR_20[15]),
        .o_free16(w_FreeFromMutexMergeLsaR_20[16]),
        .o_free17(w_FreeFromMutexMergeLsaR_20[17]),
        .o_free18(w_FreeFromMutexMergeLsaR_20[18]),
        .o_free19(w_FreeFromMutexMergeLsaR_20[19]),


        .o_driveNext(w_DriveToBypassPmtFifoLsaR_1),
        .o_data_32()
    );
//Merge


cPmtFifo1 LsaRPmtFifo(
     .i_drive(w_LsaRDrive_FifoToPmt_1),
     .i_freeNext(w_FreeMutexMergeLsaRToLsaRPmt_1),
     .rst(rstn),
     .pmt(w_LsaRPmt_1),
     .o_free(w_LsaRFree_PmtTofifo_1),
     .o_driveNext(w_DriveLsaRPmtToMutexMergeLsaR_1),
     .o_fire_1(w_LsaRPmtFifo_fire_1)
);



     cPmtFifo1 cPmtFifo_FromBypassLsaR(
        .i_drive(w_DriveToBypassPmtFifoLsaR_1),
        .i_freeNext(w_FreeMutexMergeLsaRToBypassLsaRPmt_1), 
        .rst(rstn),
        .pmt( w_isDriveWithBypassLsaR_1),
        .o_free(w_FreeFromBypassPmtFifoLsaR_1),
        .o_driveNext(w_DriveBypassLsaRPmtToMutexMergeLsaR_1),
        .o_fire_1()
);



cMutexMerge2_32b  cMutexMergeLsaR(
         .i_drive0(w_DriveBypassLsaRPmtToMutexMergeLsaR_1),
         .i_drive1(w_DriveLsaRPmtToMutexMergeLsaR_1),
         .i_data0_32(),
         .i_data1_32(),
         .i_freeNext(w_FreeIssueFifoToMutexMergeLsaR_1),
         .rst(rstn),
         .o_free0(w_FreeMutexMergeLsaRToBypassLsaRPmt_1),
         .o_free1(w_FreeMutexMergeCsrToCsrPmt_1),
         .o_driveNext(w_DriveMutexMergeToIssueFifoLsaR_1),
         .o_data_32(),
);


cFifo1 IssueFifoLsaR(
        .i_drive(w_DriveMutexMergeToIssueFifoLsaR_1), 
        .i_freeNext(i_FreeToLsaRIssue_1),
        .rst(rstn),
        .o_free(w_FreeIssueFifoToMutexMergeLsaR_1), 
        .o_driveNext(o_DriveToLsaRIssue_1),
        .o_fire_1(w_LsaRIssueFifoFire_1),
);


 case(w_BypassSelectLsaR_20)
    20'b00000000000000000001:begin assign w_bypassOperandLsaR_32=i_OprandFromBypass0_32 ;end
    20'b00000000000000000010:begin assign w_bypassOperandLsaR_32=i_OprandFromBypass1_32 ;end
    20'b00000000000000000100:begin assign w_bypassOperandLsaR_32=i_OprandFromBypass2_32 ;end
    20'b00000000000000001000:begin assign w_bypassOperandLsaR_32=i_OprandFromBypass3_32 ;end
    20'b00000000000000010000:begin assign w_bypassOperandLsaR_32=i_OprandFromBypass4_32 ;end
    20'b00000000000000100000:begin assign w_bypassOperandLsaR_32=i_OprandFromBypass5_32 ;end
    20'b00000000000001000000:begin assign w_bypassOperandLsaR_32=i_OprandFromBypass6_32 ;end
    20'b00000000000010000000:begin assign w_bypassOperandLsaR_32=i_OprandFromBypass7_32 ;end
    20'b00000000000100000000:begin assign w_bypassOperandLsaR_32=i_OprandFromBypass8_32 ;end
    20'b00000000001000000000:begin assign w_bypassOperandLsaR_32=i_OprandFromBypass9_32 ;end
    20'b00000000010000000000:begin assign w_bypassOperandLsaR_32=i_OprandFromBypass10_32; end
    20'b00000000100000000000:begin assign w_bypassOperandLsaR_32=i_OprandFromBypass11_32; end
    20'b00000001000000000000:begin assign w_bypassOperandLsaR_32=i_OprandFromBypass12_32; end
    20'b00000010000000000000:begin assign w_bypassOperandLsaR_32=i_OprandFromBypass13_32; end
    20'b00000100000000000000:begin assign w_bypassOperandLsaR_32=i_OprandFromBypass14_32; end
    20'b00001000000000000000:begin assign w_bypassOperandLsaR_32=i_OprandFromBypass15_32; end
    20'b00010000000000000000:begin assign w_bypassOperandLsaR_32=i_OprandFromBypassLSU_32; end
    20'b00100000000000000000:begin assign w_bypassOperandLsaR_32=i_OprandFromBypassCSR_32;end
    20'b01000000000000000000:begin assign w_bypassOperandLsaR_32=i_OprandFromBypassMul_32; end
    20'b10000000000000000000:begin assign w_bypassOperandLsaR_32=i_OprandFromBypassDiv_32; end
    
    default:assign w_bypassOperandLsaR_32=32'b0;
endcase

   wire [31:0] w_finalOperandLsaR_32;

   assign w_finalOperandLsaR_32=   (w_LsaRPmt_1==1'b1) ? w_LsaROperand_32:w_bypassOperandLsaR_32;
    
   reg [31:0]  r_final_oprandLsaR_32;
   

    always @(posedge w_LsaRIssueFifoFire_1 or negedge rstn) begin
       if (!rstn) begin
       r_final_oprandLsaR_32 <= 32'b0 ;
    end 
    else begin
       o_final_operandLsaR_32 <=w_finalOperandLsaR_32 ;
       
    end
    end



//跳转判断模块  
//BranchL


cFifo1 BranchLList(
    .i_drive(i_drive_FromBranchL_1),
    .i_freeNext(w_BranchLFree_PmtTofifo_1),
    .rst(rstn),
   .o_free(o_free_ToBranchL_1),
   .o_driveNext(w_BranchLDrive_FifoToPmt_1),
   .o_fire_1(w_fire_BranchL_2)
);

assign  {w_fire0_BranchL_1,  w_fire1_BranchL_1} = w_fire_BranchL_1;


always@(posedge w_fire0_BranchL_1 or negedge rstn) begin
       if(!rstn) begin
           r_BranchLDep_4 <= 4'b0;
       end 
       else begin 
           r_BranchLDep_4  <=  i_BranchLDep_4;
           w_BranchLDep_4 = r_BranchLDep_4;
       end
end

     


always@(posedge w_fire1_BranchL_1 or negedge rstn) begin
       if(!rstn) begin
          r_BranchLOperand_32  <=  32'b0;
             end
       else begin
          r_BranchLOperand_32  <=  regs[w_BranchLDep_4];
          w_BranchLPmt_1 = r_Ready_1[w_BranchLDep_4];
          w_BranchLOperand_32 = r_BranchLOperand_32;
       end
end


//After Instruction Input


generate
    genvar j;
    for(j=0;i<16;i=i+1) begin:SelectData1
          assign w_BypassSelectBranchL_20[i]=  (w_dep1_4 ==i) ? 1'b1 : 1'b0;
    end
endgenerate
    assign w_BypassSelectBranchL_20[16]=  (w_dep1_4 ==i_IndexFromLSU) ? 1'b1 : 1'b0;
    assign w_BypassSelectBranchL_20[17]=  (w_dep1_4 ==i_IndexFromBranchL) ? 1'b1 : 1'b0;
    assign w_BypassSelectBranchL_20[20]=  (w_dep1_4 ==i_IndexFromMul) ? 1'b1 : 1'b0;
    assign w_BypassSelectBranchL_20[19]=  (w_dep1_4 ==i_IndexFromDiv) ? 1'b1 : 1'b0;


  generate
        genvar i; 
        for(i=0; i<16; i=i+1) begin:Bypass_FIFO_BranchL
            cPmtFifo1 BypassFifoBranchL (
            .i_drive(i_DriveFromBypassBranchL_20[i]),
            .i_freeNext(w_FreeFromMutexMergeBranchL_20[i]), 
            .rst(rstn),
            .pmt(w_BypassSelectBranchL_20[i]),
            .o_free(o_FreeToBypassBranchL_20[i]),
            .o_driveNext(w_DriveToMutexMergeBranchL_20[i]),
            .o_fire_1()
        );
        end
    endgenerate


 cPmtFifo1 BypassFifo_LSU_BranchL (
            .i_drive(i_DriveFromBypassBranchL_20[16]),
            .i_freeNext(w_FreeFromMutexMergeBranchL_20[16]), 
            .rst(rstn),
            .pmt(w_BypassSelectBranchL_20[16]),
            .o_free(o_FreeToBypassBranchL_20[16]),
            .o_driveNext(w_DriveToMutexMergeBranchL_20[16]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_BranchL_BranchL (
            .i_drive(i_DriveFromBypassBranchL_20[17]),
            .i_freeNext(w_FreeFromMutexMergeBranchL_20[17]), 
            .rst(rstn),
            .pmt(w_BypassSelectBranchL_20[17]),
            .o_free(o_FreeToBypassBranchL_20[17]),
            .o_driveNext(w_DriveToMutexMergeBranchL_20[17]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_Div_BranchL (
            .i_drive(i_DriveFromBypassBranchL_20[18]),
            .i_freeNext(w_FreeFromMutexMergeBranchL_20[18]), 
            .rst(rstn),
            .pmt(w_BypassSelectBranchL_20[18]),
            .o_free(o_FreeToBypassBranchL_20[18]),
            .o_driveNext(w_DriveToMutexMergeBranchL_20[18]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_Mul_BranchL (
            .i_drive(i_DriveFromBypassBranchL_20[19]),
            .i_freeNext(w_FreeFromMutexMergeBranchL_20[19]), 
            .rst(rstn),
            .pmt(w_BypassSelectBranchL_20[19]),
            .o_free(o_FreeToBypassBranchL_20[19]),
            .o_driveNext(w_DriveToMutexMergeBranchL_20[19]),
            .o_fire_1()
        );


   cMutexMerge20_32b MutexMergeBranchL(
        .i_drive0(w_DriveToMutexMergeBranchL_20[0]),
        .i_drive1(w_DriveToMutexMergeBranchL_20[1]),
        .i_drive2(w_DriveToMutexMergeBranchL_20[2]),
        .i_drive3(w_DriveToMutexMergeBranchL_20[3]),
        .i_drive4(w_DriveToMutexMergeBranchL_20[4]),
        .i_drive5(w_DriveToMutexMergeBranchL_20[5]),
        .i_drive6(w_DriveToMutexMergeBranchL_20[6]),
        .i_drive7(w_DriveToMutexMergeBranchL_20[7]),
        .i_drive8(w_DriveToMutexMergeBranchL_20[8]),
        .i_drive9(w_DriveToMutexMergeBranchL_20[9]),
        .i_drive10(w_DriveToMutexMergeBranchL_20[10]),
        .i_drive11(w_DriveToMutexMergeBranchL_20[11]),
        .i_drive12(w_DriveToMutexMergeBranchL_20[12]),
        .i_drive13(w_DriveToMutexMergeBranchL_20[13]),
        .i_drive14(w_DriveToMutexMergeBranchL_20[14]),
        .i_drive15(w_DriveToMutexMergeBranchL_20[15]),
        .i_drive16(w_DriveToMutexMergeBranchL_20[16]),
        .i_drive17(w_DriveToMutexMergeBranchL_20[17]),
        .i_drive18(w_DriveToMutexMergeBranchL_20[18]),
        .i_drive19(w_DriveToMutexMergeBranchL_20[19]),
       
        .i_data0_32(),
        .i_data1_32(),
        .i_data2_32(),
        .i_data3_32(),
        .i_data4_32(),
        .i_data5_32(),
        .i_data6_32(),
        .i_data7_32(),
        .i_data8_32(),
        .i_data9_32(),
        .i_data10_32(),
        .i_data11_32(),
        .i_data12_32(),
        .i_data13_32(),
        .i_data14_32(),
        .i_data15_32(),
        .i_data16_32(),
        .i_data17_32(),
        .i_data18_32(),
        .i_data19_32(),

        .i_freeNext(w_FreeFromBypassPmtFifoBranchL_1),
        .rst(rstn),

.o_free0(w_FreeFromMutexMergeBranchL_20[0]),
        .o_free1(w_FreeFromMutexMergeBranchL_20[1]),
        .o_free2(w_FreeFromMutexMergeBranchL_20[2]),
        .o_free3(w_FreeFromMutexMergeBranchL_20[3]),
        .o_free4(w_FreeFromMutexMergeBranchL_20[4]),
        .o_free5(w_FreeFromMutexMergeBranchL_20[5]),
        .o_free6(w_FreeFromMutexMergeBranchL_20[6]),
        .o_free7(w_FreeFromMutexMergeBranchL_20[7]),
        .o_free8(w_FreeFromMutexMergeBranchL_20[8]),
        .o_free9(w_FreeFromMutexMergeBranchL_20[9]),
        .o_free10(w_FreeFromMutexMergeBranchL_20[10]),
        .o_free11(w_FreeFromMutexMergeBranchL_20[11]),
        .o_free12(w_FreeFromMutexMergeBranchL_20[12]),
        .o_free13(w_FreeFromMutexMergeBranchL_20[13]),
        .o_free14(w_FreeFromMutexMergeBranchL_20[14]),
        .o_free15(w_FreeFromMutexMergeBranchL_20[15]),
        .o_free16(w_FreeFromMutexMergeBranchL_20[16]),
        .o_free17(w_FreeFromMutexMergeBranchL_20[17]),
        .o_free18(w_FreeFromMutexMergeBranchL_20[18]),
        .o_free19(w_FreeFromMutexMergeBranchL_20[19]),



        .o_driveNext(w_DriveToBypassPmtFifoBranchL_1),
        .o_data_32()
    );
//Merge

cPmtFifo1 BranchLPmtFifo(
     .i_drive(w_BranchLDrive_FifoToPmt_1),
     .i_freeNext(w_FreeMutexMergeBranchLToBranchLPmt_1),
     .rst(rstn),
     .pmt(w_BranchLPmt_1),
     .o_free(w_BranchLFree_PmtTofifo_1),
     .o_driveNext(w_DriveBranchLPmtToMutexMergeBranchL_1),
     .o_fire_1(w_BranchLPmtFifo_fire_1)
);



     cPmtFifo1 cPmtFifo_FromBypassBranchL(
        .i_drive(w_DriveToBypassPmtFifoBranchL_1),
        .i_freeNext(w_FreeMutexMergeBranchLToBypassBranchLPmt_1), 
        .rst(rstn),
        .pmt( w_isDriveWithBypassBranchL_1),
        .o_free(w_FreeFromBypassPmtFifoBranchL_1),
        .o_driveNext(w_DriveBypassBranchLPmtToMutexMergeBranchL_1),
        .o_fire_1()
);




cMutexMerge2_32b  cMutexMergeBranchL(
         .i_drive0(w_DriveBypassBranchLPmtToMutexMergeBranchL_1),
         .i_drive1(w_DriveBranchLPmtToMutexMergeBranchL_1),
         .i_data0_32(),
         .i_data1_32(),
         .i_freeNext(w_FreeIssueFifoToMutexMergeBranchL_1),
         .rst(rstn),
         .o_free0(w_FreeMutexMergeBranchLToBypassBranchLPmt_1),
         .o_free1(w_FreeMutexMergeBranchLToBranchLPmt_1),
         .o_driveNext(w_DriveMutexMergeToIssueFifoBranchL_1),
         .o_data_32(),
);


cFifo1 IssueFifoBranchL(
        .i_drive(w_DriveMutexMergeToIssueFifoBranchL_1), 
        .i_freeNext(i_FreeToBranchLIssue_1),
        .rst(rstn),
        .o_free(w_FreeIssueFifoToMutexMergeBranchL_1), 
        .o_driveNext(o_DriveToBranchLIssue_1),
        .o_fire_1(w_BranchLIssueFifoFire_1),
);


 case(w_BypassSelectBranchL_20)
    20'b00000000000000000001:begin assign w_bypassOperandBranchL_32=i_OprandFromBypass0_32 ;end
    20'b00000000000000000010:begin assign w_bypassOperandBranchL_32=i_OprandFromBypass1_32 ;end
    20'b00000000000000000100:begin assign w_bypassOperandBranchL_32=i_OprandFromBypass2_32 ;end
    20'b00000000000000001000:begin assign w_bypassOperandBranchL_32=i_OprandFromBypass3_32 ;end
    20'b00000000000000010000:begin assign w_bypassOperandBranchL_32=i_OprandFromBypass4_32 ;end
    20'b00000000000000100000:begin assign w_bypassOperandBranchL_32=i_OprandFromBypass5_32 ;end
    20'b00000000000001000000:begin assign w_bypassOperandBranchL_32=i_OprandFromBypass6_32 ;end
    20'b00000000000010000000:begin assign w_bypassOperandBranchL_32=i_OprandFromBypass7_32 ;end
    20'b00000000000100000000:begin assign w_bypassOperandBranchL_32=i_OprandFromBypass8_32 ;end
    20'b00000000001000000000:begin assign w_bypassOperandBranchL_32=i_OprandFromBypass9_32 ;end
    20'b00000000010000000000:begin assign w_bypassOperandBranchL_32=i_OprandFromBypass10_32; end
    20'b00000000100000000000:begin assign w_bypassOperandBranchL_32=i_OprandFromBypass11_32; end
    20'b00000001000000000000:begin assign w_bypassOperandBranchL_32=i_OprandFromBypass12_32; end
    20'b00000010000000000000:begin assign w_bypassOperandBranchL_32=i_OprandFromBypass13_32; end
    20'b00000100000000000000:begin assign w_bypassOperandBranchL_32=i_OprandFromBypass14_32; end
    20'b00001000000000000000:begin assign w_bypassOperandBranchL_32=i_OprandFromBypass15_32; end
    20'b00010000000000000000:begin assign w_bypassOperandBranchL_32=i_OprandFromBypassLSU_32; end
    20'b00100000000000000000:begin assign w_bypassOperandBranchL_32=i_OprandFromBypassBranchL_32;end
    20'b01000000000000000000:begin assign w_bypassOperandBranchL_32=i_OprandFromBypassMul_32; end
    20'b10000000000000000000:begin assign w_bypassOperandBranchL_32=i_OprandFromBypassDiv_32; end
    
    default:assign w_bypassOperandBranchL_32=32'b0;
endcase

   assign w_finalOperandBranchL_32=   (w_BranchLPmt_1==1'b1) ? w_BranchLOperand_32:w_bypassOperandBranchL_32;
    


    always @(posedge w_BranchLIssueFifoFire_1 or negedge rstn) begin
       if (!rstn) begin
       r_final_oprandBranchL_32 <= 32'b0 ;
    end 
    else begin
       o_final_operandBranchL_32 <=w_finalOperandBranchL_32 ;
       
    end
    end

//BranchR

cFifo1 BranchRList(
    .i_drive(i_drive_FromBranchR_1),
    .i_freeNext(w_BranchRFree_PmtTofifo_1),
    .rst(rstn),
   .o_free(o_free_ToBranchR_1),
   .o_driveNext(w_BranchRDrive_FifoToPmt_1),
   .o_fire_1(w_fire_BranchR_2)
);

assign  {w_fire0_BranchR_1,  w_fire1_BranchR_1} = w_fire_BranchR_1;


always@(posedge w_fire0_BranchR_1 or negedge rstn) begin
       if(!rstn) begin
           r_BranchRDep_4 <= 4'b0;
       end 
       else begin 
           r_BranchRDep_4  <=  i_BranchRDep_4;
           w_BranchRDep_4 = r_BranchRDep_4;
       end
end

     


always@(posedge w_fire1_BranchR_1 or negedge rstn) begin
       if(!rstn) begin
          r_BranchROperand_32  <=  32'b0;
             end
       else begin
          r_BranchROperand_32  <=  regs[w_BranchRDep_4];
          w_BranchRPmt_1 = r_Ready_1[w_BranchRDep_4];
          w_BranchROperand_32 = r_BranchROperand_32;
       end
end


//After Instruction Input


generate
    genvar j;
    for(j=0;i<16;i=i+1) begin:SelectData1
          assign w_BypassSelectBranchR_20[i]=  (w_dep1_4 ==i) ? 1'b1 : 1'b0;
    end
endgenerate
    assign w_BypassSelectBranchR_20[16]=  (w_dep1_4 ==i_IndexFromLSU) ? 1'b1 : 1'b0;
    assign w_BypassSelectBranchR_20[17]=  (w_dep1_4 ==i_IndexFromBranchR) ? 1'b1 : 1'b0;
    assign w_BypassSelectBranchR_20[20]=  (w_dep1_4 ==i_IndexFromMul) ? 1'b1 : 1'b0;
    assign w_BypassSelectBranchR_20[19]=  (w_dep1_4 ==i_IndexFromDiv) ? 1'b1 : 1'b0;


  generate
        genvar i; 
        for(i=0; i<16; i=i+1) begin:Bypass_FIFO_BranchR
            cPmtFifo1 BypassFifoBranchR (
            .i_drive(i_DriveFromBypassBranchR_20[i]),
            .i_freeNext(w_FreeFromMutexMergeBranchR_20[i]), 
            .rst(rstn),
            .pmt(w_BypassSelectBranchR_20[i]),
            .o_free(o_FreeToBypassBranchR_20[i]),
            .o_driveNext(w_DriveToMutexMergeBranchR_20[i]),
            .o_fire_1()
        );
        end
    endgenerate


 cPmtFifo1 BypassFifo_LSU_BranchR (
            .i_drive(i_DriveFromBypassBranchR_20[16]),
            .i_freeNext(w_FreeFromMutexMergeBranchR_20[16]), 
            .rst(rstn),
            .pmt(w_BypassSelectBranchR_20[16]),
            .o_free(o_FreeToBypassBranchR_20[16]),
            .o_driveNext(w_DriveToMutexMergeBranchR_20[16]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_BranchR_BranchR (
            .i_drive(i_DriveFromBypassBranchR_20[17]),
            .i_freeNext(w_FreeFromMutexMergeBranchR_20[17]), 
            .rst(rstn),
            .pmt(w_BypassSelectBranchR_20[17]),
            .o_free(o_FreeToBypassBranchR_20[17]),
            .o_driveNext(w_DriveToMutexMergeBranchR_20[17]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_Div_BranchR (
            .i_drive(i_DriveFromBypassBranchR_20[18]),
            .i_freeNext(w_FreeFromMutexMergeBranchR_20[18]), 
            .rst(rstn),
            .pmt(w_BypassSelectBranchR_20[18]),
            .o_free(o_FreeToBypassBranchR_20[18]),
            .o_driveNext(w_DriveToMutexMergeBranchR_20[18]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_Mul_BranchR (
            .i_drive(i_DriveFromBypassBranchR_20[19]),
            .i_freeNext(w_FreeFromMutexMergeBranchR_20[19]), 
            .rst(rstn),
            .pmt(w_BypassSelectBranchR_20[19]),
            .o_free(o_FreeToBypassBranchR_20[19]),
            .o_driveNext(w_DriveToMutexMergeBranchR_20[19]),
            .o_fire_1()
        );


   cMutexMerge20_32b MutexMergeBranchR(
        .i_drive0(w_DriveToMutexMergeBranchR_20[0]),
        .i_drive1(w_DriveToMutexMergeBranchR_20[1]),
        .i_drive2(w_DriveToMutexMergeBranchR_20[2]),
        .i_drive3(w_DriveToMutexMergeBranchR_20[3]),
        .i_drive4(w_DriveToMutexMergeBranchR_20[4]),
        .i_drive5(w_DriveToMutexMergeBranchR_20[5]),
        .i_drive6(w_DriveToMutexMergeBranchR_20[6]),
        .i_drive7(w_DriveToMutexMergeBranchR_20[7]),
        .i_drive8(w_DriveToMutexMergeBranchR_20[8]),
        .i_drive9(w_DriveToMutexMergeBranchR_20[9]),
        .i_drive10(w_DriveToMutexMergeBranchR_20[10]),
        .i_drive11(w_DriveToMutexMergeBranchR_20[11]),
        .i_drive12(w_DriveToMutexMergeBranchR_20[12]),
        .i_drive13(w_DriveToMutexMergeBranchR_20[13]),
        .i_drive14(w_DriveToMutexMergeBranchR_20[14]),
        .i_drive15(w_DriveToMutexMergeBranchR_20[15]),
        .i_drive16(w_DriveToMutexMergeBranchR_20[16]),
        .i_drive17(w_DriveToMutexMergeBranchR_20[17]),
        .i_drive18(w_DriveToMutexMergeBranchR_20[18]),
        .i_drive19(w_DriveToMutexMergeBranchR_20[19]),
       
        .i_data0_32(),
        .i_data1_32(),
        .i_data2_32(),
        .i_data3_32(),
        .i_data4_32(),
        .i_data5_32(),
        .i_data6_32(),
        .i_data7_32(),
        .i_data8_32(),
        .i_data9_32(),
        .i_data10_32(),
        .i_data11_32(),
        .i_data12_32(),
        .i_data13_32(),
        .i_data14_32(),
        .i_data15_32(),
        .i_data16_32(),
        .i_data17_32(),
        .i_data18_32(),
        .i_data19_32(),

        .i_freeNext(w_FreeFromBypassPmtFifoBranchR_1),
        .rst(rstn),

.o_free0(w_FreeFromMutexMergeBranchR_20[0]),
        .o_free1(w_FreeFromMutexMergeBranchR_20[1]),
        .o_free2(w_FreeFromMutexMergeBranchR_20[2]),
        .o_free3(w_FreeFromMutexMergeBranchR_20[3]),
        .o_free4(w_FreeFromMutexMergeBranchR_20[4]),
        .o_free5(w_FreeFromMutexMergeBranchR_20[5]),
        .o_free6(w_FreeFromMutexMergeBranchR_20[6]),
        .o_free7(w_FreeFromMutexMergeBranchR_20[7]),
        .o_free8(w_FreeFromMutexMergeBranchR_20[8]),
        .o_free9(w_FreeFromMutexMergeBranchR_20[9]),
        .o_free10(w_FreeFromMutexMergeBranchR_20[10]),
        .o_free11(w_FreeFromMutexMergeBranchR_20[11]),
        .o_free12(w_FreeFromMutexMergeBranchR_20[12]),
        .o_free13(w_FreeFromMutexMergeBranchR_20[13]),
        .o_free14(w_FreeFromMutexMergeBranchR_20[14]),
        .o_free15(w_FreeFromMutexMergeBranchR_20[15]),
        .o_free16(w_FreeFromMutexMergeBranchR_20[16]),
        .o_free17(w_FreeFromMutexMergeBranchR_20[17]),
        .o_free18(w_FreeFromMutexMergeBranchR_20[18]),
        .o_free19(w_FreeFromMutexMergeBranchR_20[19]),



        .o_driveNext(w_DriveToBypassPmtFifoBranchR_1),
        .o_data_32()
    );
//Merge

cPmtFifo1 BranchRPmtFifo(
     .i_drive(w_BranchRDrive_FifoToPmt_1),
     .i_freeNext(w_FreeMutexMergeBranchRToBranchRPmt_1),
     .rst(rstn),
     .pmt(w_BranchRPmt_1),
     .o_free(w_BranchRFree_PmtTofifo_1),
     .o_driveNext(w_DriveBranchRPmtToMutexMergeBranchR_1),
     .o_fire_1(w_BranchRPmtFifo_fire_1)
);



     cPmtFifo1 cPmtFifo_FromBypassBranchR(
        .i_drive(w_DriveToBypassPmtFifoBranchR_1),
        .i_freeNext(w_FreeMutexMergeBranchRToBypassBranchRPmt_1), 
        .rst(rstn),
        .pmt( w_isDriveWithBypassBranchR_1),
        .o_free(w_FreeFromBypassPmtFifoBranchR_1),
        .o_driveNext(w_DriveBypassBranchRPmtToMutexMergeBranchR_1),
        .o_fire_1()
);




cMutexMerge2_32b  cMutexMergeBranchR(
         .i_drive0(w_DriveBypassBranchRPmtToMutexMergeBranchR_1),
         .i_drive1(w_DriveBranchRPmtToMutexMergeBranchR_1),
         .i_data0_32(),
         .i_data1_32(),
         .i_freeNext(w_FreeIssueFifoToMutexMergeBranchR_1),
         .rst(rstn),
         .o_free0(w_FreeMutexMergeBranchRToBypassBranchRPmt_1),
         .o_free1(w_FreeMutexMergeBranchRToBranchRPmt_1),
         .o_driveNext(w_DriveMutexMergeToIssueFifoBranchR_1),
         .o_data_32(),
);


cFifo1 IssueFifoBranchR(
        .i_drive(w_DriveMutexMergeToIssueFifoBranchR_1), 
        .i_freeNext(i_FreeToBranchRIssue_1),
        .rst(rstn),
        .o_free(w_FreeIssueFifoToMutexMergeBranchR_1), 
        .o_driveNext(o_DriveToBranchRIssue_1),
        .o_fire_1(w_BranchRIssueFifoFire_1),
);


 case(w_BypassSelectBranchR_20)
    20'b00000000000000000001:begin assign w_bypassOperandBranchR_32=i_OprandFromBypass0_32 ;end
    20'b00000000000000000010:begin assign w_bypassOperandBranchR_32=i_OprandFromBypass1_32 ;end
    20'b00000000000000000100:begin assign w_bypassOperandBranchR_32=i_OprandFromBypass2_32 ;end
    20'b00000000000000001000:begin assign w_bypassOperandBranchR_32=i_OprandFromBypass3_32 ;end
    20'b00000000000000010000:begin assign w_bypassOperandBranchR_32=i_OprandFromBypass4_32 ;end
    20'b00000000000000100000:begin assign w_bypassOperandBranchR_32=i_OprandFromBypass5_32 ;end
    20'b00000000000001000000:begin assign w_bypassOperandBranchR_32=i_OprandFromBypass6_32 ;end
    20'b00000000000010000000:begin assign w_bypassOperandBranchR_32=i_OprandFromBypass7_32 ;end
    20'b00000000000100000000:begin assign w_bypassOperandBranchR_32=i_OprandFromBypass8_32 ;end
    20'b00000000001000000000:begin assign w_bypassOperandBranchR_32=i_OprandFromBypass9_32 ;end
    20'b00000000010000000000:begin assign w_bypassOperandBranchR_32=i_OprandFromBypass10_32; end
    20'b00000000100000000000:begin assign w_bypassOperandBranchR_32=i_OprandFromBypass11_32; end
    20'b00000001000000000000:begin assign w_bypassOperandBranchR_32=i_OprandFromBypass12_32; end
    20'b00000010000000000000:begin assign w_bypassOperandBranchR_32=i_OprandFromBypass13_32; end
    20'b00000100000000000000:begin assign w_bypassOperandBranchR_32=i_OprandFromBypass14_32; end
    20'b00001000000000000000:begin assign w_bypassOperandBranchR_32=i_OprandFromBypass15_32; end
    20'b00010000000000000000:begin assign w_bypassOperandBranchR_32=i_OprandFromBypassLSU_32; end
    20'b00100000000000000000:begin assign w_bypassOperandBranchR_32=i_OprandFromBypassBranchR_32;end
    20'b01000000000000000000:begin assign w_bypassOperandBranchR_32=i_OprandFromBypassMul_32; end
    20'b10000000000000000000:begin assign w_bypassOperandBranchR_32=i_OprandFromBypassDiv_32; end
    
    default:assign w_bypassOperandBranchR_32=32'b0;
endcase

   assign w_finalOperandBranchR_32=   (w_BranchRPmt_1==1'b1) ? w_BranchROperand_32:w_bypassOperandBranchR_32;
    


    always @(posedge w_BranchRIssueFifoFire_1 or negedge rstn) begin
       if (!rstn) begin
       r_final_oprandBranchR_32 <= 32'b0 ;
    end 
    else begin
       o_final_operandBranchR_32 <=w_finalOperandBranchR_32 ;
       
    end
    end

//写端口
//ALU
generate
genvar j;
for(j=0;j<17;j=j+1) begin

always@(posedge w_fire0_WriteBack_18[i] or negedge rstn) begin
	  if(!rstn) begin
		r_Result_32[i]	<=	32'b0;

	  end
	  else begin
		r_Result_32[i]	<=	i_resultExetogrf_575[31+32*i:32*i];
      w_wdata_576[31+32*i:32*i] = r_Result_32[i];
     
	  end
end


always@(posedge w_fire1_WriteBack_18[i] or negedge rstn) begin
	  if(!rstn) begin
		regs[i]	<=	32'b0;      
      r_Ready_1[i] <= 1'b0;

	  end
	  else  begin
		regs[i]	<=	w_wdata_32[31+32*i:32*i];
       r_Ready_1[i] <= 1'b1;
	  end
end

end

endgenerate

wire  w_Index1_4 = i_resultMDU1togrf1_36[3:0];
wire  w_Index0_4 = i_resultMDU1togrf2_36[3:0];

wire [31:0] w_MDUdata1_32;
wire [31:0] w_MDUdata0_32;
//MDU

always@(posedge w_fire0_Mdu1_1 ) begin
		r_Result_32[w_Index0_4]	<= i_resultMDU1togrf1_36[33:0];
      w_MDUdata0_32 = r_Result_32[w_Index0_4];
end


always@(posedge w_fire1_Mdu1_1 ) begin
		regs[w_Index0_4]	<= w_MDUdata0_32;
end





always@(posedge w_fire0_Mdu2_1 ) begin
		r_Result_32[w_Index1_4]	<= i_resultMDU1togrf2_36[33:0];
      w_MDUdata1_32 = r_Result_32[w_Index1_4];
end


always@(posedge w_fire1_Mdu2_1 ) begin
		regs[w_Index1_4]	<= w_MDUdata1_32;
end



endmodule


