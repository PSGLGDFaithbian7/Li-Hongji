module LsuIssue (
       
    input wire rstn,
    input wire i_LSUCount_5;
    output wire o_FreeToIssue0_1,
    output wire o_FreeToIssue1_1            
    inout reg io_empty_1;
    inout reg io_IsFirst_1;
    input reg [15:0] i_InstructionToLSUIssue_113 [0:112];

    input  wire  i_DriveFromWriteBack_1;
    output wire  o_FreeToWriteBack_1;
    input  wire  i_DriveFromIssue_1 ;
    output wire  o_FreeToIssue_1;

    
    input wire i_FreeBypassFifoToLSUIssue;
    output wire o_DriveLSUIssueToBypassFifo;

    input wire i_DriveBypassFifoToLSUIssue;
    output wire o_FreeLSUIssueToBypassBuffer;

    input wire [32:0] i_OperandFromBypassBuffer_32;
);



wire  w_DriveToMutexMerge0L_1;
wire  w_FreeToPmtFifo0_1;
wire  w_DriveToMutexMerge0R_1;
wire  w_FreeToPmtFifo1_1;


wire w_permit0_1;
wire w_permit1_1;

assign w_permit0_1 = ! (io_empty_1 | io_IsFirst_1);
assign w_permit1_1 = io_empty_1 | io_IsFirst_1;



 cPmtFifo1 cPmtFifo0(
      .i_drive(i_DriveFromWriteBack_1),
      .i_freeNext(w_FreeToPmtFifo0_1), 
      .rst(rstn),
      .pmt(w_permit0_1),
      .o_free(o_FreeToWriteBack_1),
      .o_driveNext(w_DriveToMutexMerge0L_1),
      .o_fire_1()
);

cPmtFifo1 cPmtFifo1(
      .i_drive(i_DriveFromIssue_1 ),
      .i_freeNext(w_FreeToPmtFifo1_1), 
      .rst(rstn),
      .pmt(w_permit1_1),
      .o_free(o_FreeToIssue_1),
      .o_driveNext(w_DriveToMutexMerge0R_1),
      .o_fire_1()
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
wire [3:0] w_LSUAddress_4 ;


cMutexMerge2_32b MutexMerge0(
        .i_drive0( w_DriveToMutexMerge0L_1),
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
input  wire i_FreeToLSUFifo_1;

wire w_Drive_cFifo0ToCopyFork0_1;
wire w_Free_cCopyFork0TocFifo0_1;




  reg [112:0] r_InstructionOut_113;
  wire [112:0] w_InsrtuctionOut_113;
  
  always @(posedge w_fire00_1 or negedge rstn) begin
    if (!rst) begin
      r_InstructionOut_113 <= 113'b0;
      w_InsrtuctionOut_113 = r_InstructionOut_113;
     
    end
    else begin
      r_InstructionOut_113 <= i_InstructionToLSUIssue_113[w_LSUAddress_4];
      w_InsrtuctionOut_113 = r_InstructionOut_113;
      end
    end


  assign  w_LSUAddress_4        =  r_binnay_5[3:0]; 
  assign  w_binnarynext_5    =  r_binnay_5 + ~io_empty_1; 
  assign  w_graynext_5  =  (w_binnarynext_5>>1) ^ w_binnarynext_5; 
  assign   w_empty_1 =  (w_graynext_5 == i_LSUCount_5);



always@(posedge w_fire01_1 or negedge rstn)begin
if (!rstn) begin

          r_binnay_5 <=  5'b0;
          r_pointer_5 <= 5'b0;

      end  
      else begin        
          r_binnay_5 <=   r_binnay_5 + ~io_empty_1;
          r_pointer_5 =   (w_binnarynext_5>>1) ^ w_binnarynext_5;
      end


  always @(posedge w_fire01_1 or negedge rstn) 
      if (!rstn)
          rempty <= 1'b1; 
      else     
          rempty <= w_empty_1;
end


wire w_Rs1Valid_1 = w_InsrtuctionOut_113[68];
wire w_Rs2Valid_1 = w_InsrtuctionOut_113[68];
wire [3:0] w_dep1_4 = w_InsrtuctionOut_113[107:103];
wire [3:0] w_dep2_4 = w_InsrtuctionOut_113[112:108];
wire [31:0] w_immediate_32 = w_InsrtuctionOut_113[53:22];
wire [4:0] w_Rs1_5 = w_InsrtuctionOut_113[68:64];
wire [4:0] w_Rs2_5 =  w_InsrtuctionOut_113[63:59];

input wire i_LsuOperandFromGrf_32;
wire [4:0] w_LsuAddress_5 = w_Rs1_5;
input wire i_FreeFromGRFToLsuIssue_1;
output wire o_Drive_FromLsuLssueToGRf_1;



input wire i_LsuOperandFromBypassBuffer_32;
wire  [3:0] w_LsuDep_4 = w_dep1_4;
input wire i_FreeFromBypassBufferToLsuIssue_1;
output wire o_Drive_FromLsuLssueToBypassBuffer_1;
wire [31:0] w_LsuOutputData_32 ={w_LsuAddress_5,w_LsuDep_4} ;



//已连接，数据修改未完成
 cFifo2 cFifo0(
     .i_drive(w_DriveMutexMerge0TocFifo0_1),
     .i_freeNext(w_Free_CopyFork0TocFifo0_1),
     .rst(rstn),
     .o_free(w_FreecFifo0ToMutexMerge0_1),
     .o_driveNext(w_Drive_cFifo0ToCopyFork0_1),
     .o_fire_1(w_fire0_2),
);






cCopyFork2_32b cCopyFork0(
    i_drive(w_Drive_cFifo0ToCopyFork0_1),
    i_freeNext0(w_Free_CopyFork01ToCopyFork0_1),
    i_freeNext1(w_Free_cCopyFork0TocFifo0_1),
    rst(rstn),
    i_data_32(w_LsuOutputData0_32),
    o_free(w_Free_CopyFork0TocFifo0_1),
    o_driveNext0(o_Drive_FromCopyFork0ToCopyFork01_1),
    o_driveNext1(o_Drive_FromCopyFork0ToCopyFork02_1),
    o_data0(w_LsuOutputData1_32[8:4]),
    o_data1(w_LsuOutputData2_32[3:0]),
);

cCopyFork2_32b cCopyFork01(
    i_drive(o_Drive_FromCopyFork0ToCopyFork01_1),
    i_freeNext0(i_FreeFromBypassBufferToCopyFork01_1),
    i_freeNext1(i_FreeFromGRFToCopyFork01_1),
    rst(rstn),
    i_data_32(w_LsuOutputData1_32),
    o_free(w_Free_CopyFork01ToCopyFork0_1),
    o_driveNext0(o_Drive_FromCopyFork01ToBypassBuffer_1),
    o_driveNext1(o_Drive_FromCopyFork01ToGRF_1),
    o_data0(w_LsuOutputData11_32[8:4]),
    o_data1(w_LsuOutputData12_32[3:0]),
);

cCopyFork2_32b cCopyFork02(
    i_drive(o_Drive_FromCopyFork0ToCopyFork02_1),
    i_freeNext0(i_FreeFromBypassBufferToCopyFork02_1),
    i_freeNext1(i_FreeFromGRFToCopyFork02_1),
    rst(rstn),
    i_data_32(w_LsuOutputData2_32),
    o_free(w_Free_cCopyFork0TocFifo0_1),
    o_driveNext0(o_Drive_FromLsuLssueToGRf_1),
    o_driveNext1(o_Drive_FromLsuLssueToBypassBuffer_1),
    o_data0(w_LsuOutputData21_32[8:4]),
    o_data1(w_LsuOutputData22_32[3:0]),
);


//

BypassBuffer BypassBuffer0{
     .(),
     .(),
     .(),
     .(),
     .(),
};


wire   w_IsDriveWithDepL_1 = (w_dep1_4==4'b1111) ? 1'b0: 1'b1;
wire   w_IsDriveWithGRFL_1=~(w_IsDriveWithDepL_1);
wire   w_FreeMutexMerge1LToBypassPmt_1;
wire   w_FreeMutexMerge1LToGRFPmt_1;
wire   w_DriveGRFPmtToMutexMerge1L_1;
wire   w_DriveBypassPmtToMutexMerge1L_1;


wire   w_IsDriveWithDepR_1 = (w_dep2_4==4'b1111) ? 1'b0: 1'b1;
wire   w_IsDriveWithGRFR_1=~(w_IsDriveWithDepR_1);
wire   w_FreeMutexMerge1RToBypassPmt_1;
wire   w_FreeMutexMerge1RToGRFPmt_1;
wire   w_DriveGRFPmtToMutexMerge1R_1;
wire   w_DriveBypassPmtToMutexMerge1R_1;

wire w_FreeWaitMergeToMutexMergeR_1;
wire w_DriveMutexMergeRToWaitMerge_1;

input wire i_Drive_GRF_To_LsuIssueL_1;
input wire i_Drive_GRF_To_LsuIssueR_1;
input wire i_Drive_BypassBuffer_To_LsuIssueL_1;
input wire i_Drive_BypassBuffer_To_LsuIssueR_1;

output wire o_Free_LsuIssueL_To_GRF_1;
output wire o_Free_LsuIssueR_To_GRF_1;
output wire o_Free_LsuIssueL_To_BypassBuffer_1;
output wire o_Free_LsuIssueR_To_BypassBuffer_1;

wire w_DriveWaitMergeToIssueFifo_1;
wire w_FreeIssueFifoToWaitMerge_1;
wire w_IssueFifoFire_1;


cPmtFifo1 cPmtFifo_FromBypassL(
        .i_drive(i_Drive_GRF_To_LsuIssueL_1),
        .i_freeNext(w_FreeMutexMerge1LToBypassPmt_1), 
        .rst(rstn),
        .pmt(w_IsDriveWithDepL_1),
        .o_free(o_Free_LsuIssueL_To_GRF_1),
        .o_driveNext(w_DriveBypassPmtToMutexMerge1L_1),
        .o_fire_1()
);



 cPmtFifo1 cPmtFifo_FromGRFL(
        .i_drive(i_Drive_BypassBuffer_To_LsuIssueL_1),
        .i_freeNext(w_FreeMutexMerge1LToGRFPmt_1), 
        .rst(rstn),
        .pmt(w_IsDriveWithGRFL_1),
        .o_free(o_Free_LsuIssueL_To_BypassBuffer_1),
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




 cPmtFifo1 cPmtFifo_FromBypassR(
        .i_drive(i_Drive_BypassBuffer_To_LsuIssueR_1),
        .i_freeNext(w_FreeMutexMerge1RToBypassPmt_1), 
        .rst(rstn),
        .pmt(w_IsDriveWithDepR_1),
        .o_free(o_Free_LsuIssueL_To_BypassBuffer_1),
        .o_driveNext(w_DriveBypassPmtToMutexMerge1R_1),
        .o_fire_1()
);



 cPmtFifo1 cPmtFifo_FromGRFR(
        .i_drive(i_Drive_GRF_To_LsuIssueR_1),
        .i_freeNext(w_FreeMutexMerge1RToGRFPmt_1), 
        .rst(rstn),
        .pmt(w_IsDriveWithGRFR_1),
        .o_free(o_Free_LsuIssueR_To_GRF_1),
        .o_driveNext(w_DriveGRFPmtToMutexMerge1R_1),
        .o_fire_1()
);





cMutexMerge2_32b  cMutexMerge1R(
         .i_drive0(w_DriveBypassPmtToMutexMerge1R_1),
         .i_drive1(w_DriveGRFPmtToMutexMerge1R_1),
         .i_data0_32(),
         .i_data1_32(),
         .i_freeNext(w_FreeWaitMergeToMutexMergeR_1),
         .rst(rstn),
         .o_free0(w_FreeMutexMerge1RToBypassPmt_1),
         .o_free1(w_FreeMutexMerge1RToGRFPmt_1),
         .o_driveNext(w_DriveMutexMergeRToWaitMerge_1),
         .o_data_32(),
);



cWaitMerge2_32b  cWaitMerge0(
         .i_drive0(),
         .i_drive1(),
         .i_data0_32(),
         .i_data1_32(),
         .i_freeNext(w_FreeIssueFifoToWaitMerge_1),
         .rst(rstn),
         .o_free0( w_FreeWaitMergeToMutexMergeL_1),
         .o_free1(w_FreeWaitMergeToMutexMergeR_1),
         .o_driveNext( w_DriveWaitMergeToIssueFifo_1),
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
input wire [31:0] i_OeprandFromGrfR_32;

wire [31:0]  w_final_oprandL_32;
wire [31:0]  w_final_oprandR_32;
   


assign w_final_oprandL_32=   (w_Rs1Valid_1==1'b1) ? w_immediate_32  : ((w_dep1_4==4'b1111)?  i_bypass_operandL_32 : i_OeprandFromGrfL_32);
assign w_final_oprandR_32=   (w_Rs1Valid_1==1'b1) ? w_immediate_32  : ((w_dep2_4==4'b1111)?  i_bypass_operandR_32 : i_OeprandFromGrfR_32);
    
reg [31:0]  r_final_oprandL_32;
reg  [31:0] r_final_oprandR_32;


always @(posedge w_IssueFifoFire_1 or negedge rstn) begin
    if (!rstn) begin
       r_final_oprandL_32 <= 32'b0 ;
       r_final_oprandR_32 <= 32'b0 ;
    end 
    else begin
       r_final_oprandL_32 <= w_final_oprandL_32 ;
       r_final_oprandR_32 <= w_final_oprandR_32 ;
       o_InstructionToExe_177={w_InsrtuctionOut_113,r_final_oprandL_32,r_final_oprandR_32};
    end
    end


endmodule

