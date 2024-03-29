//针对Csr寄存器位宽做修改

module CsrIssue (
       
    input wire rstn,
    input wire i_CsrCount_5;
    output wire o_FreeToIssue0_1,
    output wire o_FreeToIssue1_1            
    input wire i_CsrEmpty;

    input wire [1807:0] i_InstructionToCsrIssue_113; 

    input  wire  i_DriveFromWriteBack_1;
    output wire  o_FreeToWriteBack_1;
    input  wire  i_DriveFromIssue_1 ;
    output wire  o_FreeToIssue_1;

    
    input wire i_FreeBypassFifoToCsrIssue;
    output wire o_DriveCsrIssueToBypassFifo;

    input wire i_DriveBypassFifoToCsrIssue;
    output wire o_FreeCsrIssueToBypassBuffer;

    input wire [32:0] i_OperandFromBypassBuffer_32;
);



wire  w_DriveToMutexMerge0L_1;
wire  w_FreeToPmtFifo0_1;
wire  w_DriveToMutexMerge0R_1;
wire  w_FreeToPmtFifo1_1;


wire w_permit0_1;
wire w_permit1_1;

wire w_CsrEmpty;

assign w_permit0_1 = !w_CsrEmpty;
assign w_permit1_1 = w_CsrEmpty;



 cPmtFifo1 cPmtFifo0(
      .i_drive(i_DriveFromWriteBack_1),
      .i_freeNext(w_FreeToPmtFifo0_1), 
      .rst(rstn),
      .pmt(w_permit0_1),
      .o_free(o_FreeToWriteBack_1),
      .o_driveNext(w_DriveToMutexMerge0L_1),
      .o_fire_1()
);


wire w_fireRestart;
cFifo1 cPmtFifo1(
      .i_drive(i_DriveFromIssue_1 ),
      .i_freeNext(w_FreeToPmtFifo1_1), 
      .rst(rstn),
      .o_free(o_FreeToIssue_1),
      .o_driveNext(w_DriveToMutexMerge0R_1),
      .o_fire_1(w_fireRestart)
);



wire w_DriveToCfifo_1;
wire w_FreeToMutexMerge0_1;
wire [1:0] w_fire0_2;
wire w_fire00_1;
wire w_fire01_1;

reg  [4:0] r_pointer_5;
wire [4:0] w_graynext_5;
wire [4:0] w_binnarynext_5;
reg  [4:0] r_binnay_5;
wire w_empty_1;
wire [3:0] w_CsrAddress_4 ;


cMutexMerge2_32b MutexMerge0(
        .i_drive0(w_DriveToMutexMerge0L_1),
        .i_drive1(w_DriveToMutexMerge0R_1),
        .i_data0_32(),
        .i_data1_32(),
        .i_freeNext(w_FreecFifo0ToMutexMerge0_1),
        .rst(rstn),
        .o_free0(w_FreeToPmtFifo0_1),
        .o_free1(w_FreeToMutexMerge_1),
        .o_driveNext(w_DriveMutexMerge0TocFifo0_1),
        .o_data_32()
);

wire w_DriveMutexMerge0TocFifo0_1;
wire w_FreecFifo0ToMutexMerge0_1;

output wire  o_DriveToExe_1;
input  wire i_FreeToCsrFifo_1;

wire w_Drive_cFifo0ToCopyFork0_1;
wire w_Free_cCopyFork0TocFifo0_1;

reg  [115:0]  r_InstructionOut_115;
wire [115:0]  w_InsrtuctionOut_115;

cFifo2 cFifo0(
     .i_drive(w_DriveMutexMerge0TocFifo0_1),
     .i_freeNext(w_Free_CopyFork0TocFifo0_1),
     .rst(rstn),
     .o_free(w_FreecFifo0ToMutexMerge0_1),
     .o_driveNext(w_Drive_cFifo0ToCopyFork0_1),
     .o_fire_1(w_fire0_2),
);

  
always @(posedge w_fire00_1 or negedge rstn) begin
    if (!rst) begin
    r_InstructionOut_115 <= 115'b0;
    end
    else begin
    r_InstructionOut_115 <= i_InstructionToCsrIssue_113[w_CsrAddress_4];
    end
    end
assign  w_InsrtuctionOut_115 = r_InstructionOut_115;

always @(*) begin
w_CsrAddress_4   =  r_binnay_5[3:0]; 
w_binnarynext_5  =  r_binnay_5 + ~w_CsrEmpty; 
w_graynext_5  =  (w_binnarynext_5>>1) ^ w_binnarynext_5; 
w_CsrEmpty =  (w_graynext_5 == i_CsrGray);
end



always@(posedge w_fire01_1 or negedge rstn)begin
     if (!rstn) begin
     r_binnay_5 <=  5'b0;
     r_pointer_5 <= 5'b0;
    end  
    else begin        
    r_binnay_5 <=   w_binnarynext_5;
    r_pointer_5 <=  w_graynext_5;
    end


  always @(posedge w_fire01_1 or negedge rstn) 
      if (!rstn) begin
      r_CsrEmpty <= 1'b1; 
        end
      else  begin
      r_CsrEmpty <= w_CsrEmpty;
      end
end

output wire o_CsrEmpty;

assign o_CsrEmpty = r_CsrEmpty;
//把empty输到issue中

output wire o_Drive_CsrIssueToIssueCsrEmpty;
input wire i_Free_IssueCsrEmptyToCsrIssue;
cCopyFork2_32b cCopyFork0(
    i_drive(w_Drive_cFifo0ToCopyFork0_1),
    i_freeNext0(i_Free_IssueCsrEmptyToCsrIssue),
    i_freeNext1(w_Free_CopyFork02ToCopyFork0_1),
    rst(rstn),
    i_data_32(),
    o_free(w_Free_CopyFork0TocFifo0_1),
    o_driveNext0(o_Drive_CsrIssueToIssueCsrEmpty),
    o_driveNext1(o_Drive_FromCopyFork0ToCopyFork02_1),
    o_data0(),
    o_data1(),
);
//启动旁路与GRF
wire w_FreeFromGRFandCsrPmtToCsrIssue_1;
wire w_Drive_FromCsrLssueToGRFandCsrPmt_1;
wire w_FreeFromBypassBufferPmtToCsrIssue_1;
wire w_Drive_FromCsrLssueToBypassBufferPmt_1;

cCopyFork2_32b cCopyFork02(
    i_drive(o_Drive_FromCopyFork0ToCopyFork02_1),
    i_freeNext0(w_FreeFromGRFandCsrPmtToCsrIssue_1),
    i_freeNext1(w_FreeFromBypassBufferPmtToCsrIssue_1),
    rst(rstn),
    i_data_32(w_CsrOutputData2_32),
    o_free(w_Free_CopyFork02ToCopyFork0_1),
    o_driveNext0(w_Drive_FromCsrLssueToGRFandCsrPmt_1),
    o_driveNext1(w_Drive_FromCsrLssueToBypassBufferPmt_1),
    o_data0(),
    o_data1(),
);

//
wire w_immediate_32;
wire w_Rs1Valid_1;
wire w_Rs2Valid_1;

always @(*) begin
      w_dep1_4 = w_InsrtuctionOut_115[110:107];
      w_CsrInstruction_115 = w_InsrtuctionOut_115;
      w_immediate_32 = w_InsrtuctionOut_115[74:13];
      w_Rs1Valid_1 = w_InsrtuctionOut_115[24];
      w_Rs2Valid_1 = ~w_InsrtuctionOut_115[8];
end

output wire o_Drive_BypassPmtToBypass;
output wire o_Drive_GrfPmtToGrf;
input  wire i_Free_BypassToBypassPmt;
input  wire i_Free_GrfToGrfPmt;

wire w_fireBypassPmt;
wire w_fireGrfPmt;

output wire [4:0] o_CsrRs1_5;
output wire [11:0] o_CsrRs2_12;

reg [4:0] r_CsrRs1_5;
reg [11:0] r_CsrRs2_12;

reg [3:0] r_CsrDepL_4;


output wire [3:0] o_CsrDepL_4;


cPmtFifo1 cPmtFifo_ToBypass(
        .i_drive(w_Drive_FromCsrLssueToBypassBufferPmt_1),
        .i_freeNext(i_Free_BypassToBypassPmt), 
        .rst(rstn),
        .pmt(w_IsDriveWithDep_1),
        .o_free(w_FreeFromBypassBufferPmtToCsrIssue_1),
        .o_driveNext(o_Drive_BypassPmtToBypass),
        .o_fire_1(),
);

always @(posedge w_fireBypassPmt or negedge rstn ) begin
        if(!rstn) begin
        r_CsrDepL_4 <= 4'b0;
        end
        else begin
        r_CsrDepL_4 <= w_dep1_4;
        end
end     

assign o_CsrDepL_4 = r_CsrDepL_4;

 cPmtFifo1 cPmtFifo_ToGRFandCsr(
        .i_drive(w_Drive_FromCsrLssueToGRFandCsrPmt_1),
        .i_freeNext(i_Free_GrfToGrfPmt), 
        .rst(rstn),
        .pmt(w_IsDriveWithGRF_1),
        .o_free(w_FreeFromGRFandCsrPmtToCsrIssue_1),
        .o_driveNext(o_Drive_GrfPmtToGrf),
        .o_fire_1(),
);

always @(posedge w_fireGrfPmt or negedge rstn ) begin
        if(!rstn) begin
        r_CsrRs1_5 <= 5'b0;
        r_CsrRs2_12 <= 12'b0;
        end
        else begin
        r_CsrRs1_5 <= w_InsrtuctionOut_115[29:24];
        r_CsrRs2_12 <= w_InsrtuctionOut_115[33:12];
        end
end     

assign o_CsrRs1_5 = r_CsrRs1_5;
assign o_CsrRs2_12 = r_CsrRs2_12;


wire w_Drive_CsrGrfPmtToCopyfork03;
wire w_Free_Copyfork03ToCsrGrfPmt;

input wire i_Free_CsrToCsrIssue;
input wire i_Free_GrfToCsrIssue;
output wire o_Drive_CsrIssueToCsr;
output wire o_Drive_CsrIssueToGrf;



cCopyFork2_32b cCopyFork03(
    i_drive(w_Drive_CsrGrfPmtToCopyfork03),
    i_freeNext0(i_Free_CsrToCsrIssue),
    i_freeNext1(i_Free_GrfToCsrIssue),
    rst(rstn),
    i_data_32(),
    o_free(w_Free_Copyfork03ToCsrGrfPmt),
    o_driveNext0(o_Drive_CsrIssueToCsr),
    o_driveNext1(o_Drive_CsrIssueToGrf),
    o_data0(),
    o_data1(),
);

//
input wire [31:0] i_CsrOperandFromGrf_32;
input wire [31:0] i_CsrOperandFromBypassBuffer_32;
input wire [31:0] i_CsrOperandFromCsr_32;


wire  [3:0] w_CsrDep_4 = w_dep1_4;
wire   w_IsDriveWithDepL_1 = (w_dep1_4==4'b1111) ? 1'b0: 1'b1;
wire   w_IsDriveWithGRFL_1=~(w_IsDriveWithDepL_1);
wire   w_FreeMutexMerge1LToBypassPmt_1;
wire   w_FreeMutexMerge1LToGRFPmt_1;
wire   w_DriveGRFPmtToMutexMerge1L_1;
wire   w_DriveBypassPmtToMutexMerge1L_1;


input wire i_Drive_GRF_To_CsrIssueL_1;
input wire i_Drive_CSR_To_CsrIssueR_1;
input wire i_Drive_BypassBuffer_To_CsrIssueL_1;


output wire o_Free_CsrIssueL_To_GRF_1;
output wire o_Free_CsrIssueR_To_CSR_1;
output wire o_Free_CsrIssueL_To_BypassBuffer_1;


wire w_DriveWaitMergeToIssueFifo_1;
wire w_FreeIssueFifoToWaitMerge_1;
wire w_IssueFifoFire_1;

wire w_Drive_CsrOpeToWaitMerge;
wire w_Free_WaitMergeToCsrope;

cPmtFifo1 cPmtFifo_FromBypassL(
        .i_drive(i_Drive_GRF_To_CsrIssueL_1),
        .i_freeNext(w_FreeMutexMerge1LToBypassPmt_1), 
        .rst(rstn),
        .pmt(w_IsDriveWithDepL_1),
        .o_free(o_Free_CsrIssueL_To_GRF_1),
        .o_driveNext(w_DriveBypassPmtToMutexMerge1L_1),
        .o_fire_1()
);



 cPmtFifo1 cPmtFifo_FromGRFL(
        .i_drive(i_Drive_BypassBuffer_To_CsrIssueL_1),
        .i_freeNext(w_FreeMutexMerge1LToGRFPmt_1), 
        .rst(rstn),
        .pmt(w_IsDriveWithGRFL_1),
        .o_free(o_Free_CsrIssueL_To_BypassBuffer_1),
        .o_driveNext(w_DriveGRFPmtToMutexMerge1L_1),
        .o_fire_1()
);



cMutexMerge2_32b  cMutexMerge1L(
         .i_drive0(w_DriveBypassPmtToMutexMerge1L_1),
         .i_drive1(w_DriveGRFPmtToMutexMerge1L_1),
         .i_data0_32(),
         .i_data1_32(),
         .i_freeNext(w_FreeWaitMergeToMutexMergeL_1),
         .rst(rstn),
         .o_free0(w_FreeMutexMerge1LToBypassPmt_1),
         .o_free1(w_FreeMutexMerge1LToGRFPmt_1),
         .o_driveNext(w_DriveMutexMergeLToWaitMerge_1),
         .o_data_32(),
);


 cFifo1 cPmtFifo_FromCsrR(
        .i_drive(i_Drive_Csr_To_CsrIssueR_1),
        .i_freeNext(w_Free_WaitMergeToCsrope), 
        .rst(rstn),
        .o_free(o_Free_CsrIssueR_To_Csr_1),
        .o_driveNext(w_Drive_CsrOpeToWaitMerge),
        .o_fire_1()
);



cWaitMerge2_32b  cWaitMerge0(
         .i_drive0(w_DriveMutexMergeLToWaitMerge_1),
         .i_drive1(w_Drive_CsrOpeToWaitMerge),
         .i_data0_32(),
         .i_data1_32(),
         .i_freeNext(w_FreeIssueFifoToWaitMerge_1),
         .rst(rstn),
         .o_free0(w_FreeWaitMergeToMutexMergeL_1),
         .o_free1(w_Free_WaitMergeToCsrope),
         .o_driveNext(w_DriveWaitMergeToIssueFifo_1),
         .o_data_64()
);


cFifo1 IssueFifo(
        .i_drive(w_DriveWaitMergeToIssueFifo_1), 
        .i_freeNext(i_FreeFromExe_1),
        .rst(rstn),
        .o_free(w_FreeIssueFifoToWaitMerge_1), 
        .o_driveNext(o_DriveFromIssueToExe),
        .o_fire_1(w_IssueFifoFire_1),
);




input wire [31:0] i_bypass_operandL_32;
input wire [31:0] i_bypass_operandR_32;
input wire [31:0] i_OeprandFromGrfL_32;
input wire [31:0] i_OeprandFromCsrR_32;

wire [31:0]  w_final_oprandL_32;
wire [31:0]  w_final_oprandR_32;
   


assign w_final_oprandL_32 = (w_Rs1Valid_1==1'b1) ? w_immediate_32  : ((w_dep1_4==4'b1111)?  i_bypass_operandL_32 : i_OeprandFromGrfL_32);
assign w_final_oprandR_32 = (w_Rs2Valid_1==1'b1) ? w_immediate_32  :i_OeprandFromCsrR_32;
    
reg  [31:0]  r_final_oprandL_32;
reg  [31:0]  r_final_oprandR_32;


always @(posedge w_IssueFifoFire_1 or negedge rstn) begin
    if (!rstn) begin
       r_final_oprandL_32 <= 32'b0 ;
       r_final_oprandR_32 <= 32'b0 ;
    end 
    else begin
       r_final_oprandL_32 <= w_final_oprandL_32 ;
       r_final_oprandR_32 <= w_final_oprandR_32 ;

    end
    end
assign  o_InstructionToExe_177={w_InsrtuctionOut_113,r_final_oprandL_32,r_final_oprandR_32};

endmodule

