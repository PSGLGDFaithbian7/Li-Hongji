`timescale 1ns / 1ps
`include "head.v"
//指令包信息待定
//跳转时指令数据复位
//旁路仍然存在有问题
//always块里语句赋值


module BranchDetect
#(parameter INSTRUCTION_WIDTH = 115 ;
  parameter OPERAND_WIDTH = 32 ;
  parameter INDEX_WIDTH = 4;
  parameter INSTRUCTION_NUMBER = 16;
  parameter DEP_WIDTH = INDEX_WIDTH;
)
(
    input rstn,
//CFifo1
//from decode
input  wire  [3:0]   i_BranchCount_4;        
//from dep check
//data
  input wire [INSTRUCTION_WIDTH-1:0]  i_instFromDependenceCheck0_115, 
  input wire [INSTRUCTION_WIDTH-1:0]  i_instFromDependenceCheck1_115,
  input wire [INSTRUCTION_WIDTH-1:0]  i_instFromDependenceCheck2_115,
  input wire [INSTRUCTION_WIDTH-1:0]  i_instFromDependenceCheck3_115,
  input wire [INSTRUCTION_WIDTH-1:0]  i_instFromDependenceCheck4_115,
  input wire [INSTRUCTION_WIDTH-1:0]  i_instFromDependenceCheck5_115,
  input wire [INSTRUCTION_WIDTH-1:0]  i_instFromDependenceCheck6_115,
  input wire [INSTRUCTION_WIDTH-1:0]  i_instFromDependenceCheck7_115,
  input wire [INSTRUCTION_WIDTH-1:0]  i_instFromDependenceCheck8_115, 
  input wire [INSTRUCTION_WIDTH-1:0]  i_instFromDependenceCheck9_115,
  input wire [INSTRUCTION_WIDTH-1:0]  i_instFromDependenceCheck10_115,
  input wire [INSTRUCTION_WIDTH-1:0]  i_instFromDependenceCheck11_115,
  input wire [INSTRUCTION_WIDTH-1:0]  i_instFromDependenceCheck12_115,
  input wire [INSTRUCTION_WIDTH-1:0]  i_instFromDependenceCheck13_115,
  input wire [INSTRUCTION_WIDTH-1:0]  i_instFromDependenceCheck14_115,
  input wire [INSTRUCTION_WIDTH-1:0]  i_instFromDependenceCheck15_115,

  output wire [INSTRUCTION_WIDTH-1:0]  o_instToIssue0_115, 
  output wire [INSTRUCTION_WIDTH-1:0]  o_instToIssue1_115, 
  output wire [INSTRUCTION_WIDTH-1:0]  o_instToIssue2_115, 
  output wire [INSTRUCTION_WIDTH-1:0]  o_instToIssue3_115, 
  output wire [INSTRUCTION_WIDTH-1:0]  o_instToIssue4_115, 
  output wire [INSTRUCTION_WIDTH-1:0]  o_instToIssue5_115, 
  output wire [INSTRUCTION_WIDTH-1:0]  o_instToIssue6_115, 
  output wire [INSTRUCTION_WIDTH-1:0]  o_instToIssue7_115, 
  output wire [INSTRUCTION_WIDTH-1:0]  o_instToIssue8_115, 
  output wire [INSTRUCTION_WIDTH-1:0]  o_instToIssue9_115, 
  output wire [INSTRUCTION_WIDTH-1:0]  o_instToIssue10_115, 
  output wire [INSTRUCTION_WIDTH-1:0]  o_instToIssue11_115, 
  output wire [INSTRUCTION_WIDTH-1:0]  o_instToIssue12_115, 
  output wire [INSTRUCTION_WIDTH-1:0]  o_instToIssue13_115, 
  output wire [INSTRUCTION_WIDTH-1:0]  o_instToIssue14_115, 
  output wire [INSTRUCTION_WIDTH-1:0]  o_instToIssue15_115, 
//signal
  input wire         i_DriveFromDependenceCheck,
  



  output wire        o_FreeToDepdenceCheck,


// CFifo 2

    //Branch
    //signal
    input wire        i_DriveFromGRF;
    input wire       i_FreeFromIF;
    //data
    input wire [31:0] i_OprandFromGrfL_32;
    input wire [31:0] i_OprandFromGrfR_32;


    // output data
    





    //output signal

    
)
//

//cFifo1 part
   wire  [3:0]       w_count_4;
   
   wire              w_DriveCFifo2ToMutexMerge0_1;
   //wire              w_StopEventSource_1;
   wire              w_FreecFifo0ToMutexMerge0_1;
   //wire              w_DriveContapFromMutexMerge_1;
  // wire              w_DriveCondForkFromMutexMerge_1;
   //wire              w_DriveContapToEventSource _1;


  wire              w_DriveMutexMerge0TocPmtFifo2_1;
  wire              w_FreecPmtFifo2ToMutexMerge0_1;
  wire              w_PmtcPmtFifo2_1;
  wire              w_DrivecPmtFifo2TocFifo0_1;
  wire              w_FreecFifo0TocPmtFifo2_1;


  //wire              w_DriveMutexMerge0TocFifo0;
  reg   [INSTRUCTION_NUMBER:0]      r_BranchListInitial_16;
  reg   [INDEX_WIDTH:0]       r_BranchFirst_4;
  reg   [2:0]       r_AllOpcode[0:INSTRUCTION_NUMBER-1];
  reg   [DEP_WIDTH:0]       r_AllDepL[0:INSTRUCTION_NUMBER-1];
  reg   [DEP_WIDTH:0]       r_AllDepR[0:INSTRUCTION_NUMBER-1];
  reg   [101:0]     r_AllIncInfo[0:INSTRUCTION_NUMBER-1];

  wire  [1146:0]    w_InstructionOutput_1147;


  wire [1:0] w_fire0_2 ;
  wire w_fire00;
  wire w_fire01;
  assign w_fire0_2={w_fire00,w_fire01};

  wire w_Drive_BDfifoToMutexMerge;
  wire w_Free_MutexMerge0ToBDfifo;


 cfifo2 BracnchDetectcFifo0(
  .i_drive(i_DriveFromDependenceCheck), 
  .i_freeNext(w_Free_BDfifo1ToBDfifo0), 
  .rst(rstn)
  .o_free(o_FreeToDepdenceCheck), 
  .o_driveNext(w_Drive_BDfifo0ToBDfifo1),
  .o_fire_2(w_fire0_2)
);

always @(*) begin
  
end


always @(posedge w_fire00 or negedge rstn) begin
    if(!rstn) begin
    r_AllOpcode <= 48'b0;
    r_AllIncInfo <= 1632'b0;
    r_AllDepL <= 64'b0;
    r_AllDepR <= 64'b0;
    end
    else begin
    r_AllOpcode <= { i_instFromDependenceCheck0_73[7:5], i_instFromDependenceCheck1_73[7:5],i_instFromDependenceCheck2_73[7:5],i_instFromDependenceCheck3_73[7:5],
                                i_instFromDependenceCheck4_73[7:5],i_instFromDependenceCheck5_73[7:5],i_instFromDependenceCheck6_73[7:5],i_instFromDependenceCheck7_73[7:5],
                                i_instFromDependenceCheck8_73[7:5], i_instFromDependenceCheck9_73[7:5],i_instFromDependenceCheck10_73[7:5],i_instFromDependenceCheck11_73[7:5],
                                i_instFromDependenceCheck12_73[7:5],i_instFromDependenceCheck13_73[7:5],i_instFromDependenceCheck14_73[7:5],i_instFromDependenceCheck15_73[7:5]};

    r_AllIncInfo <= { i_instFromDependenceCheck0_107[106:5], i_instFromDependenceCheck1_107[106:5],i_instFromDependenceCheck2_107[106:5],i_instFromDependenceCheck3_107[106:5],
                                i_instFromDependenceCheck4_107[106:5],i_instFromDependenceCheck5_107[106:5],i_instFromDependenceCheck6_107[106:5],i_instFromDependenceCheck7_107[106:5],
                                i_instFromDependenceCheck8_107[106:5], i_instFromDependenceCheck9_107[106:5],i_instFromDependenceCheck10_107[106:5],i_instFromDependenceCheck11_107[106:5],
                                i_instFromDependenceCheck12_107[106:5],i_instFromDependenceCheck13_107[106:5],i_instFromDependenceCheck14_107[106:5],i_instFromDependenceCheck15_107[106:5]};

    r_AllDepL <= { i_instFromDependenceCheck0_73[107+DEP_WIDTH-1:107], i_instFromDependenceCheck1_73[107+DEP_WIDTH-1:107],i_instFromDependenceCheck2_73[107+DEP_WIDTH-1:107],i_instFromDependenceCheck3_73[107+DEP_WIDTH-1:107],
                                i_instFromDependenceCheck4_73[107+DEP_WIDTH-1:107],i_instFromDependenceCheck5_73[107+DEP_WIDTH-1:107],i_instFromDependenceCheck6_73[107+DEP_WIDTH-1:107],i_instFromDependenceCheck7_73[107+DEP_WIDTH-1:107],
                                i_instFromDependenceCheck8_73[107+DEP_WIDTH-1:107], i_instFromDependenceCheck9_73[107+DEP_WIDTH-1:107],i_instFromDependenceCheck10_73[107+DEP_WIDTH-1:107],i_instFromDependenceCheck11_73[107+DEP_WIDTH-1:107],
                                i_instFromDependenceCheck12_73[107+DEP_WIDTH-1:107],i_instFromDependenceCheck13_73[107+DEP_WIDTH-1:107],i_instFromDependenceCheck14_73[107+DEP_WIDTH-1:107],i_instFromDependenceCheck15_73[107+DEP_WIDTH-1:107]};




    r_AllDepR <= { i_instFromDependenceCheck0_73[107+2*DEP_WIDTH-1:107+DEP_WIDTH], i_instFromDependenceCheck1_73[107+2*DEP_WIDTH-1:107+DEP_WIDTH],i_instFromDependenceCheck2_73[107+2*DEP_WIDTH-1:107+DEP_WIDTH],i_instFromDependenceCheck3_73[107+2*DEP_WIDTH-1:107+DEP_WIDTH],
                                i_instFromDependenceCheck4_73[107+2*DEP_WIDTH-1:107+DEP_WIDTH],i_instFromDependenceCheck5_73[107+2*DEP_WIDTH-1:107+DEP_WIDTH],i_instFromDependenceCheck6_73[107+2*DEP_WIDTH-1:107+DEP_WIDTH],i_instFromDependenceCheck7_73[107+2*DEP_WIDTH-1:107+DEP_WIDTH],
                                i_instFromDependenceCheck8_73[107+2*DEP_WIDTH-1:107+DEP_WIDTH], i_instFromDependenceCheck9_73[107+2*DEP_WIDTH-1:107+DEP_WIDTH],i_instFromDependenceCheck10_73[107+2*DEP_WIDTH-1:107+DEP_WIDTH],i_instFromDependenceCheck11_73[107+2*DEP_WIDTH-1:107+DEP_WIDTH],
                                i_instFromDependenceCheck12_73[107+2*DEP_WIDTH-1:107+DEP_WIDTH],i_instFromDependenceCheck13_73[107+2*DEP_WIDTH-1:107+DEP_WIDTH],i_instFromDependenceCheck14_73[107+2*DEP_WIDTH-1:107+DEP_WIDTH],i_instFromDependenceCheck15_73[107+2*DEP_WIDTH-1:107+DEP_WIDTH]};

    end
end
  




integer i;
always @(posedge w_fire00_1 or negedge rstn) begin
    if(!rstn) begin
      r_BranchListInitial_16<= INSTRUCTION_NUMBER'b0;
    end
    else begin
      for(i=0;i<INSTRUCTION_NUMBER;i=i+1) begin 
          r_BranchListInitial_16[i]<=(r_AllOpcode[2+3*i,3*i]==`BjpType);
        end
    end    
end

wire [15:0] w_BranchListInitial_16;
wire [3:0]  w_BranchIndexFirst_4;
wire [3:0]  w_BranchCount_4;


always @(*) begin
   w_BranchListInitial_16 = r_BranchListInitial_16;
   w_BranchIndexFirst_4 = BranchIndexFirst(w_BranchListInitial_16);
   w_BranchCount_4 = BranchCount(w_BranchListInitial_16);
end


function wire [3:0] BranchIndexFirst;
  input [15:0]  din;
  wire    [7:0]   tmp0;
  wire    [3:0]   tmp1;
  wire    [1:0]   tmp2;
  wire    [3:0]   Index;
  Index[3] = ~(|din[7:0]);
  tmp0 = Index[3] ? din[15:8] : din[7:0];
  Index[2] = ~(|tmp0[3:0]);
  tmp1 = Index[2] ? tmp0[7:4] : tmp0[3:0];
  Index[1] = ~(|tmp1[1:0]);
  tmp2 = Index[1] ? tmp1[3:2] : tmp1[1:0];
  Index[0] = ~tmp2[0]; 
  index= (|din[15:0]) ? Index : 4'b1111;
  BranchIndexFirst = index;
endfunction

function  wire [3:0] BranchCount;
input [15:0] data;
wire  [3:0]  count_ones;
count_ones = 4'b0;
integer i;
        for (i = 0; i < 16; i = i + 1) begin
            if(data[i]==1)begin
              count_ones=count_ones+1'b1;
            end
        end
    BranchCount=count_ones;    
endfunction

cfifo2 BracnchDetectcFifo1(
  .i_drive(w_Drive_BDfifo0ToBDfifo1), 
  .i_freeNext(w_Free_MutexMerge0ToBDfifo1), 
  .rst(rstn)
  .o_free(w_Free_BDfifo1ToBDfifo0), 
  .o_driveNext(w_Drive_BDfifo1ToMutexMerge),
  .o_fire_2(w_fire1_1)
);


reg [3:0]  r_BranchIndexFirst_4;
reg [3:0]  r_BranchCount_4;
wire w_fire1_1 ;


always @(posedge w_fire1_1 or negedge rstn ) begin
    if(!rstn) begin
       r_BranchIndexFirst_4 <= 4'b0;
       r_BranchCount_4 <= 4'b0;
    end  
    else begin
       r_BranchIndexFirst_4 <= w_BranchIndexFirst_4;
       r_BranchCount_4 <= w_BranchCount_4;
    end
end


//问学长
cMutexMerge2_32b  MutexMerge0(
       .i_drive0(w_Drive_BDfifo1ToMutexMerge),
       .i_drive1(w_DriveCFifo2ToMutexMerge0_1),
       .i_data0_32(),
       .i_data1_32(),
       .i_freeNext(w_FreecPmtFifo2ToMutexMerge0_1),
       .rst(rstn),
       .o_free0(w_Free_MutexMerge0ToBDfifo1),
       .o_free1()
       .o_driveNext(w_DriveMutexMerge0TocPmtFifo2_1),
       .o_data_32(),
);
 
assign w_PmtcPmtFifo2_1=(r_BranchCount_4 <= r_count_4) && (~IsBranch);

cPmtFifo1 CPmtFifo2(
        .i_drive(w_DriveMutexMerge0TocPmtFifo2_1),
        .i_freeNext(w_FreecFifo0TocPmtFifo2_1), 
        .rst(rstn),
        .pmt( w_PmtcPmtFifo2_1),
        .o_free(w_FreecPmtFifo2ToMutexMerge0_1),
        .o_driveNext(w_DrivecPmtFifo2TocFifo0_1),
        .o_fire_1()
);



  wire    w_FreeCFifo1LToCondFork_1;
  wire    w_FreeCFifo1RToCondFork_1;
  wire    w_DriveCondForkToCFifo1L_1;
  wire    w_DriveCondForkToCFifo1R_1;

  wire    w_valid0_1;
  wire    w_valid1_1;
  wire    w_cFifo1LFire_1;
  wire   [1:0] w_cFifo1RFire_2;

  reg    [3:0]   r_BranchDepL_4;
  reg    [3:0]   r_BranchDepR_4;



  reg  [3:0] r_count_4;
  reg  [15:0] r_BranchList_16;
  reg  [3:0] r_BranchIndex_4;
  reg  [15:0] r_BranchListNext_16;
  wire [3:0] w_BranchIndexSelfLoop_4;
  wire [16:0] w_BranchListSelfLoop_16;
  wire       w_DrivecFifo0ToCondFork0_1;
  wire       w_cFifo0Fire_1;
  wire       w_FreecCondFork0TocFifo0_1;

  wire       w_FreecFifo0ToMutexMerge0_1;     



always @(*) begin
   w_BranchList_16= r_BranchList_16;
   w_BranchIndex_4 = BranchIndex(w_BranchList_16);
end

function wire [3:0] BranchIndex;
  input [15:0]  din;
  wire    [7:0]   tmp0;
  wire    [3:0]   tmp1;
  wire    [1:0]   tmp2;
  wire    [3:0]   Index;
  Index[3] = ~(|din[7:0]);
  tmp0 = Index[3] ? din[15:8] : din[7:0];
  Index[2] = ~(|tmp0[3:0]);
  tmp1 = Index[2] ? tmp0[7:4] : tmp0[3:0];
  Index[1] = ~(|tmp1[1:0]);
  tmp2 = Index[1] ? tmp1[3:2] : tmp1[1:0];
  Index[0] = ~tmp2[0]; 
  index= (|din[15:0]) ? Index : 4'b1111;
  BranchIndex = index;
endfunction

cFifo1 cFIFO0(
    .i_drive(w_DrivecPmtFifo2TocFifo0_1),
    .i_freeNext(w_FreecCondFork0TocFifo0_1),
    .rst(rstn),
    .o_free(w_FreecFifo0TocPmtFifo2_1),
    .o_driveNext(w_DrivecFifo0ToCondFork0_1),
    .o_fire_1(w_cFifo0Fire_1)
);





 always @(posedge w_cFifo0Fire_1 or negedge rstn) begin 
    if(!rstn) begin
        r_count_4 <= 4'b0;
        r_BranchList_16 <= 16'b0;
        r_BranchIndex_4 <= 4'b0;
    end
  else begin
  if(IsBranch==1) begin
        r_count_4 <= 4'b0;
        r_BranchList_16 <= 16'b0;
        r_BranchIndex_4 <= 4'b0;
  end 
  else begin 
    if (r_count_4==0) begin
         r_count_4 <= r_count_4 + 4'b0001;
         r_BranchIndex_4 <= r_BranchIndexFirst_4;
         r_BranchDepL_4 <= r_AllDepL[3+r_BranchIndexFirst_4*4,0+r_BranchIndexFirst_4*4];
         r_BranchDepR_4 <= r_AllDepR[3+r_BranchIndexFirst_4*4,0+r_BranchIndexFirst_4*4];
        for(i=0;i<16;i=i+1) begin 
            if(i==r_BranchIndexFirst_4) begin
            r_BranchList_16[i] <=  4'b0000;
            end
            else begin
            r_BranchList_16[i] <= r_BranchListInitial_16[i];
            end
        end
   end
  
   else if((r_count_4>0) && (r_count_4 < r_BranchCount_4-1)) begin
        r_count_4 <= r_count_4 + 4'b0001; 
        r_BranchIndex_4 <= w_BranchIndex_4;    
        r_BranchDepL_4 <= r_AllDepL[3+w_BranchIndex_4*4,w_BranchIndex_4*4];
        r_BranchDepR_4 <= r_AllDepR[3+w_BranchIndex_4*4,w_BranchIndex_4*4];
         for(i=0;i<16;i=i+1) begin 
            if(i==w_BranchIndex_4) begin
            r_BranchList_16[i] <=  4'b0000;
            end
            else begin
            r_BranchList_16[i] <= r_BranchList_16[i];
            end
        end
   end
   else begin
        r_count_4 <= 4'b0;
        r_BranchList_16 <= 16'b0;
        r_BranchIndex_4 <= 4'b0;
   end
  end
end
end


assign w_valid0_1= ~(r_BranchList_16[0]);
assign w_valid1_1=(~(r_BranchDepL_4==4'b1111 && r_BranchDepR_4==4'b1111)) && (r_BranchList_16[r_BranchIndex_4]);


     cCondFork2_32b cCondFork0(
        .i_drive(w_DrivecFifo0ToCondFork0_1),
        .i_freeNext0(w_FreeCFifo1LToCondFork_1),
        .i_freeNext1(w_FreeCFifo1RToCondFork_1),
        .valid0(w_valid0_1),
        .valid1(w_valid1_1),
        .rst(rst),
        .i_data_32(),
        .o_free(w_FreecCondFork0TocFifo0_1),
        .o_driveNext0(w_DriveCondForkToCFifo1L_1),
        .o_driveNext1(w_DriveCondForkToCFifo1R_1),
        .o_data0_32(),
        .o_data1_32() );

    cFifo1 CFifo1L(
        .i_drive(w_DriveCondForkToCFifo1L_1),
        .i_freeNext(i_freeFromIssue),
        .rst(rstn),
        .o_free(w_FreeCFifo1LToCondFork_1),
        .o_driveNext(o_driveToIssue),
        .o_fire_1(w_cFifo1LFire_1),
    );
 

  reg [INSTRUCTION_WIDTH-1:0] r_Instruction[0:INSTRUCTION_NUMBER-1];

  always @(posedge w_cFifo1LFire_1 or negedge rstn) begin
        if(!rstn) begin
            r_Instruction <=  1147'h0;
            r_BranchInstuction <= 73'b0;
        end
        else begin
            for(i=0;i<16;i=i+1) begin
            {
                if(i<r_BranchIndex_4) begin
                r_Instruction[72+73*i,0+73*i] <= w_AllInstruction_1443[72+73*i,0+73*i];
                w_InstructionOutput_1147[72+73*i,0+73*i]=r_Instruction[72+73*i,0+73*i];
                end
                else begin
                r_Instruction[72+73*i,0+73*i] <= `nop;     
                w_InstructionOutput_1147[72+73*i,0+73*i]=r_Instruction[72+73*i,0+73*i];
                end
            }
            end
        end
      end

  always @(*) begin
     for(i=0;i<16;i=i+1) begin
            {
                if(i<r_BranchIndex_4) begin
                w_InstructionOutput_1147[72+73*i,0+73*i]=r_Instruction[72+73*i,0+73*i];
                end
                else begin 
                w_InstructionOutput_1147[72+73*i,0+73*i]=r_Instruction[72+73*i,0+73*i];
                end
            }
            end
      {o_instToIssue0_73, o_instToIssue1_73, o_instToIssue2_73, o_instToIssue3_73, o_instToIssue4_73, o_instToIssue5_73, o_instToIssue6_73, 
      o_instToIssue7_73, o_instToIssue8_73, o_instToIssue9_73, o_instToIssue10_73, o_instToIssue11_73, o_instToIssue12_73, o_instToIssue13_73, 
      o_instToIssue14_73, o_instToIssue15_73}  =  w_InstructionOutput_1147;
  end  


 cFifo1 CFifo1R(
        .i_drive(w_driveNext0),
        .i_freeNext(i_freeFromIssue),
        .rst(rstn),
        .o_free(w_freeNext0),
        .o_driveNext(o_driveToIssue),
        .o_fire_2(w_cFifo1RFire_1),
    );


    wire [72:0]  w_BranchInstruction_73;   
    reg  [72:0]  r_BranchInstuction_73;
    wire [31:0]  w_BranchInstructionPC_32;

 always @(posedge w_cFifo1RFire_1 or negedge rstn) begin
     if(!rstn) begin
      r_BranchInstuction_73 <=`nop;
      w_dep1_4 = r_BranchInstuction_73[36:33];
      w_dep2_4 = r_BranchInstuction_73[40:37];
      w_BranchInstruction_73 =r_BranchInstuction_73;
      w_BranchInstructionPC_32 = r_BranchInstuction_73[72:41]
    end
    else begin
      r_BranchInstuction_73 <= w_AllInstruction_1147[72+r_BranchIndex_4*73,0+r_BranchIndex_4*73];
      w_dep1_4 = r_BranchInstuction_73[36:33];
      w_dep2_4 = r_BranchInstuction_73[40:37];
      w_BranchInstructionPC_32 = r_BranchInstuction_73[72:41]
      w_BranchInstruction_73 =r_BranchInstuction_73;
    end
 end



//cfifo2 part
   wire         w_FreeFromMutexMerge0L_1;
   wire         w_FreeFromMutexMerge0R_1;
   wire         w_DriveToMutexMerge0L_1;
   wire         w_DriveToMutexMerge1R_1;
   wire         w_DriveToMutexMerge1R_1;
   wire         w_FreeFromMutexMerge1L_1;
   wire         w_FreeFromMutexMerge1R_1;
   wire         w_FreeToMutexMerge1A_1;
   wire         w_FreeToMutexMerge1B_1;
   wire        w_DriveTocPmtFifoFromBypass_1;
   wire        w_DriveToMutexMerge2_1;
   wire        w_FreeFromMutexMerge2_1;


   wire w_dep1_4;
   wire w_dep2_4;

   wire w_DriveWithDep_1;
   wire w_IsDriveWithDep_1;

    wire [3:0]  w_countD_4;
    wire [31:0] w_BranchPC_32;
    wire        w_IsBranch_1;


    wire [3:0]  w_countQ_4;
    wire [31:0] o_BranchPC_32;
    wire        o_IsBranch_1;
 
    reg [3:0]   r_count_4;
    reg [31:0]  r_BranchPC_32;
    reg         r_IsBranch_1;


  
assign w_IsDriveWithDep_1=(w_dep1_4==4'b0|w_dep2_4==4'b0) ? 1'b1: 1'b0 ;
assign w_IsDriveWithGRF_1=~(w_IsDriveWithDep_1);
wire   w_FreeMutexMerge2ToBypassPmt_1;
wire   w_FreeMutexMerge2ToGRFPmt_1;
wire   w_DriveGRFPmtToMutexMerge2_1;
wire   w_DriveBypassPmtToMutexMerge2_1;
output wire o_FreeToGRF_1;


cPmtFifo1 cPmtFifo_FromBypass(
        .i_drive(w_DriveTocPmtFifoFromBypass_1),
        .i_freeNext(w_FreeMutexMerge2ToBypassPmt_1), 
        .rst(rstn),
        .pmt(w_IsDriveWithDep_1),
        .o_free(w_FreeToMutexMerge1),
        .o_driveNext(w_DriveBypassPmtToMutexMerge2_1),
        .o_fire_1(),
);

     
 cPmtFifo1 cPmtFifo_FromGRF(
        .i_drive(i_DriveFromGRF_1),
        .i_freeNext(w_FreeMutexMerge2ToGRFPmt), 
        .rst(rstn),
        .pmt(w_IsDriveWithGRF_1),
        .o_free(o_FreeToGRF_1),
        .o_driveNext(w_DriveGRFPmtToMutexMerge2_1),
        .o_fire_1(),
);

 cMutexMerge2_32b MutexMerge2(
        .i_drive0(w_DriveBypassPmtToMutexMerge2_1),
        .i_drive1(w_DriveGRFPmtToMutexMerge2_1),
        .i_data0_32(),
        .i_data1_32(),
        .i_freeNext( w_FreeBranchFifoToMutexMerge2_1),
        .rst(rstn),
        .o_free0(w_FreeMutexMerge2ToBypassPmt_1),
        .o_free1(w_FreeMutexMerge2ToGRFPmt),
        .o_driveNext(w_DriveMutexMerge2ToBranchFifo_1),
        .o_data_32(),
    );
//Branch
wire w_DriveMutexMerge2ToBranchFifo_1;
wire w_FreeBranchFifoToMutexMerge2_1;
wire w_DriveBranchFifoToCopyFork0_1;
wire w_FreeCopyFork0ToBranchFifo_1;
wire w_BranchFifoFire_1;

cFifo1 BranchFifo(
        .i_drive(w_DriveMutexMerge2ToBranchFifo_1), 
        .i_freeNext(w_FreeCopyFork0ToBranchFifo_1),
        .rst(rstn),
        .o_free(w_FreeBranchFifoToMutexMerge2_1), 
        .o_driveNext(w_DriveBranchFifoToCopyFork0_1),
        .o_fire_1(w_BranchFifoFire_1),
);

    wire [31:0] w_bypass_oprandL_32;
    wire [31:0] w_bypass_oprandR_32;
    wire [31:0] w_final_oprandL_32;
    wire [31:0] w_final_oprandR_32;
    




   wire [31:0]  w_final_oprandL_32;
   wire  [31:0]  w_final_oprandR_32;


   if(w_dep1_4==4'b1111) begin
    assign w_final_oprandL_32=i_OprandFromGrfL_32;
    else
      assign  w_final_oprandL_32=w_bypass_oprandL_32;
    end

    if(w_dep2_4==4'b1111) begin
    assign w_final_oprandR_32=i_OprandFromGrfR_32;
    else
      assign  w_final_oprandR_32=w_bypass_oprandR_32;
    end


BranchModule  BranchModule (  
      .i_inst_32(w_BranchInstruction_73),    
      .i_addr_32(w_BranchInstructionPC_32),    
	  .i_OprandL_32(w_final_oprandL_32),
      .i_OprandR_32(w_final_oprandR_32),
      .o_branchPC_32(w_BranchPC_32),    
      .o_isBranch_1 (w_IsBranch_1)     
);
      
     
     reg [3:0] r_CountBranch_4;
       always @(posedge w_fireCfifo2_1 or negedge rstn)  begin
        if(!rstn) begin
           r_CountBranch_4 <= 4'b0;
        end
        else begin
        r_CountBranch_4<=r_CountBranch_4 + 4'b0001 ;
        r_BranchPC_3  <= w_BranchPC_32;
        r_IsBranch_1 <= w_IsBranch_1;
        end
       end

  
   wire w_DriveCopyForkToIssueFifo_1;
   wire w_DriveCopyForkToIFFifo_1;
   wire w_FreeIssueFifoToCopyFork_1;
   wire w_FreeIFFifoCopyToFork_1;

    cCopyFork2_32b CopyFork0(
              i_drive(w_DriveBranchFifoToCopyFork0_1),
              i_freeNext0(w_FreeCopyForkToIssueFifo_1),
              i_freeNext1(w_FreeCopyForkToIFFifo_1),
              rst(rstn),
              i_data_32(),
              o_free(w_FreeCopyFork0ToBranchFifo_1),
              o_driveNext0(w_DriveCopyForkToIssueFifo_1),
              o_driveNext1(w_DriveCopyForkToIFFifo_1),
              o_data0(),
              o_data1()
              );


wire   w_PmtIFFifo_1;
reg   [31:0] r_OutputBranchPC_32;
wire   w_cPmtFifo1Fire_1;
output wire [31:0] o_BranchPC_32;

assign w_PmtIFFifo_1=(i_BranchCount_4 >= w_count_4) && (w_IsBranch_1==1);

cPmtFifo1 cPmtFifo_ToIF(
        .i_drive(w_DriveCopyForkToIFFifo_1),
        .i_freeNext(i_FreeFromIF_1), 
        .rst(rstn),
        .pmt(w_PmtIFFifo_1),
        .o_free(w_FreeIFFifoCopyToFork_1),
        .o_driveNext(o_DriveToIssue_1),
        .o_fire_1(w_cPmtFifo1Fire_1)
);
 

 always @(posedge w_cPmtFifo1Fire_1 or negedge rstn)  begin
        if(!rstn) begin
           r_OutputBranchPC_32 <= 32'b0;
        end
        else begin
        r_OutputBranchPC_32 <= r_BranchPC_32;
        o_BranchPC_32=r_OutputBranchPC_32;
        end
       end



wire w_BranchListNext_16;
wire w_BranchIndexNext_4;
wire w_BranchIndexNow_4;
wire w_IssueFifoFire_1;
wire w_PmtIssueFifo_1;
wire w_DriveIssueFifoTocCopyFork_1;
wire w_FreeIssueToIsueeFifo_1;

assign w_PmtIssueFifo_1=~(w_IsBranch_1);

input wire i_freeFromIssue_1;
output wire o_driveToIssue_1;

cPmtFifo1 cPmtFifo_ToIssue(
        .i_drive(w_DriveCopyForkToIssueFifo_1),
        .i_freeNext(i_freeFromIssue), 
        .rst(rstn),
        .pmt(w_IsBranch_1),
        .o_free(),
        .o_driveNext(o_driveToIssue),
        .o_fire_1(w_IssueFifoFire_1)
);




  always @(posedge w_IssueFifoFire_1 or negedge rstn) begin
        if(!rstn) begin
            r_Instruction <=  1147'h0;
            r_BranchInstuction <= 73'b0;
        end
        else begin
            w_BranchListNext_16=r_BranchListNext_16;
            w_BranchIndexNow_4=r_BranchIndex_4;
            
      FindBranch FindBranch2(
            .din(w_BranchListNext_16),
            .index(w_BranchIndexNext_4)
    );
            for(integer i=0 ;i<16;i++) begin
            {
                if ((i>w_BranchIndexNow_4) && (i<w_BranchIndexNext_4)) begin
                r_Instruction[72+73*i,0+73*i] <= w_AllInstruction_1443[72+73*i,0+73*i];
                w_InstructionOutput_1147[72+73*i,0+73*i]=r_Instruction[72+73*i,0+73*i];
                end
                else begin
                r_Instruction[72+73*i,0+73*i] <= `nop;     
                w_InstructionOutput_1147[72+73*i,0+73*i]=r_Instruction[72+73*i,0+73*i];
                end
            }
            end
           

               {o_instToIssue0_73, o_instToIssue1_73, o_instToIssue2_73, o_instToIssue3_73, o_instToIssue4_73, o_instToIssue5_73, o_instToIssue6_73, 
              o_instToIssue7_73, o_instToIssue8_73, o_instToIssue9_73, o_instToIssue10_73, o_instToIssue11_73, o_instToIssue12_73, o_instToIssue13_73, 
              o_instToIssue14_73, o_instToIssue15_73}  =  w_InstructionOutput_1147;

              o_BranchIndexNow_4=w_BranchIndexNow_4;
              o_BranchIndexNext_4=w_BranchIndexNext_4;
        end
            end
      //十六条结束以后复位成空指令

endmodule