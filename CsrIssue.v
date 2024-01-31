module CsrIssue (
       
    input wire rstn,
    input wire i_CSRCount_5;
    output wire o_FreeToIssue0_1,
    output wire o_FreeToIssue1_1            
    inout wire io_empty_1;
    inout wire io_IsFirst_1;
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
wire [3:0] w_CsrAddress_4 ;


cMutexMerge2_32b MutexMerge0(
        .i_drive0( w_DriveToMutexMerge0L_1),
        .i_drive1(w_DriveToMutexMerge0R_1),
        .i_data0_32(),
        .i_data1_32(),
        .i_freeNext(i_FreeBypassFifoToCsrIssue),
        .rst(rstn),
        .o_free0(w_FreeToPmtFifo0_1),
        .o_free1(w_FreeToMutexMerge_1),
        .o_driveNext(o_DriveCsrIssueToBypassFifo),
        .o_data_32()
);




 cFifo2 cFifo0(
     .i_drive(),
     .i_freeNext(),
     .rst(rstn),
     .o_free(),
     .o_driveNext( o_DriveToExe_1),
     .o_fire_1(w_fire0_2),
);


  reg [112:0] r_InstructionOut_113;
  output wire [112:0] o_InsrtuctionOut_113;
  
  always @(posedge w_fire00_1 or negedge rstn) begin
    if (!rst) begin
      r_InstructionOut_113 <= 113'b0;
      o_InsrtuctionOut_113 = r_InstructionOut_113;
     
    end
    else begin
      r_InstructionOut_113 <= i_InstructionToCsrIssue_113[w_CsrAddress_4];
  
      o_InsrtuctionOut_113 ={ ,r_InstructionOut_113};
      end
    end


  assign  w_CsrAddress_4    =  r_binnay_5[3:0]; 
  assign  w_binnarynext_5   =  r_binnay_5 + ~io_empty_1; 
  assign  w_graynext_5  =  (w_binnarynext_5>>1) ^ w_binnarynext_5; 
  assign   w_empty_1 =  (w_graynext_5 == i_CSRCount_5);



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




BypassBuffer BypassBuffer0{
     .(),
     .(),
     .(),
     .(),
     .(),
};

cPmtFifo1 cPmtFifo_FromBypassL(
        .i_drive(w_DriveToBypassPmtFifoL_1),
        .i_freeNext(w_FreeMutexMerge1LToBypassPmt_1), 
        .rst(rstn),
        .pmt(w_IsDriveWithDepL_1),
        .o_free(w_FreeFromBypassPmtFifoL_1),
        .o_driveNext(w_DriveBypassPmtToMutexMerge1L_1),
        .o_fire_1()
);



 cPmtFifo1 cPmtFifo_FromGRFL(
        .i_drive(w_DriveCopyForkToGRFPmtFifoL_1),
        .i_freeNext(w_FreeMutexMerge1LToGRFPmt_1), 
        .rst(rstn),
        .pmt(w_IsDriveWithGRFL_1),
        .o_free(w_FreeGRFPmtFifoToCopyFifoL_1),
        .o_driveNext(w_DriveGRFPmtToMutexMerge1L_1),
        .o_fire_1()
);


wire w_DriveWaitMergeToCFifo_1;
wire w_FreeCFifoToWaitMerge_1;

cWaitMerge2_32b  cWaitMerge0(
         .i_drive0(w_DriveMutexMergeLToWaitMerge_1),
         .i_drive1(w_DriveMutexMergeRToWaitMerge_1),
         .i_data0_32(),
         .i_data1_32(),
         .i_freeNext(w_FreeCFifoToWaitMerge_1),
         .rst(rstn),
         .o_free0( w_FreeWaitMergeToMutexMergeL_1),
         .o_free1(w_FreeWaitMergeToMutexMergeR_1),
         .o_driveNext( w_DriveWaitMergeToCFifo_1),
         .o_data_64()
);



wire w_IssueFifoFire_1;

cFifo1 IssueFifo(
        .i_drive(w_DriveWaitMergeToCFifo_1), 
        .i_freeNext(i_FreeFromExe_1),
        .rst(rstn),
        .o_free(w_FreeCFifoToWaitMerge_1), 
        .o_driveNext(o_DriveFromIssueToExe),
        .o_fire_1(w_IssueFifoFire_1),
);




    wire [31:0] w_bypass_oprandL_32;
    wire [31:0] w_bypass_oprandR_32;


   wire [31:0]  w_final_oprandL_32;
   wire [31:0]  w_final_oprandR_32;
   


   assign w_final_oprandL_32=   (w_Rs1Valid_1==1'b1) ? w_immediate_32  : ((w_dep1_4==4'b1111)?  w_bypass_oprandL_32 : i_OprandFromGrfL_32);
   assign w_final_oprandR_32=   (w_Rs1Valid_1==1'b1) ? w_immediate_32  : ((w_dep1_4==4'b1111)?  w_bypass_oprandL_32 : i_OprandFromGrfL_32);
    
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
       o_InstructionToExe_177={i_InstructionToAluIssue_113,r_final_oprandL_32,r_final_oprandR_32};
    end
    end



output wire  _DriveToExe_1;
input  wire i_FreeToCsrFifo_1;
endmodule



