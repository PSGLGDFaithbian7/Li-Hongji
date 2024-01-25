`timescale 1ns / 1ps

module Issue(
        input rstn,
//jump flag
      input wire  ;
// data
        input wire [72:0] o_instToIssue0_73,
        input wire [72:0] o_instToIssue1_73,
        input wire [72:0] o_instToIssue2_73,
        input wire [72:0] o_instToIssue3_73, 
        input wire [72:0] o_instToIssue4_73, 
        input wire [72:0] o_instToIssue5_73,
        input wire [72:0] o_instToIssue6_73, 
        input wire [72:0] o_instToIssue7_73,
        input wire [72:0] o_instToIssue8_73, 
        input wire [72:0] o_instToIssue9_73, 
        input wire [72:0] o_instToIssue10_73, 
        input wire [72:0] o_instToIssue11_73, 
        input wire [72:0] o_instToIssue12_73, 
        input wire [72:0] o_instToIssue13_73, 
        input wire [72:0] o_instToIssue14_73, 
        input wire [72:0] o_instToIssue15_73,

        input wire [3:0] o_FirstBranchIndex_4;
//signal
        input wire   o_DriveToIssue_1
//ALUISSUE
input wire  i_DriveFromGRF_1,
input wire  rstn,
input wire  i_DriveToAluIssue_1,
input wire [112:0] i_InstructionToAluIssue_113,
input wire  i_DriveFromIssueTop_1,
input wire  i_FreeFromGRF_1,
input wire  i_FreeFromExe_1,
//dkkfldsssldl

output wire o_FreeToIssueTop_1,
output wire o_DriveToGRF_1,
output wire o_DriveFromIssueToExe,
output wire o_InstructionToExe_177,
 //from bypass
     //signal part
    input wire  i_DriveFromBypass0L_1,
    input wire  i_DriveFromBypass1L_1,  
    input wire  i_DriveFromBypass2L_1,
    input wire  i_DriveFromBypass3L_1,
    input wire  i_DriveFromBypass5L_1,
    input wire  i_DriveFromBypass6L_1,
    input wire  i_DriveFromBypass7L_1,
    input wire  i_DriveFromBypass8L_1,
    input wire  i_DriveFromBypass9L_1,
    input wire  i_DriveFromBypass10L_1,
    input wire  i_DriveFromBypass11L_1,
    input wire  i_DriveFromBypass12L_1,
    input wire  i_DriveFromBypass13L_1,
    input wire  i_DriveFromBypass14L_1,
    input wire  i_DriveFromBypass15L_1,
    input wire  i_DriveFromBypassLsuL_1,
    input wire  i_DriveFromBypassCsrL_1,
    input wire  i_DriveFromBypassMulL_1,
    input wire  i_DriveFromBypassDivL_1,
    
    input wire  i_DriveFromBypass0R_1,
    input wire  i_DriveFromBypass1R_1,  
    input wire  i_DriveFromBypass2R_1,
    input wire  i_DriveFromBypass3R_1,
    input wire  i_DriveFromBypass5R_1,
    input wire  i_DriveFromBypass6R_1,
    input wire  i_DriveFromBypass7R_1,
    input wire  i_DriveFromBypass8R_1,
    input wire  i_DriveFromBypass9R_1,
    input wire  i_DriveFromBypass10R_1,
    input wire  i_DriveFromBypass11R_1,
    input wire  i_DriveFromBypass12R_1,
    input wire  i_DriveFromBypass13R_1,
    input wire  i_DriveFromBypass14R_1,
    input wire  i_DriveFromBypass15R_1,
    input wire  i_DriveFromBypassLsuR_1,
    input wire  i_DriveFromBypassCsrR_1,
    input wire  i_DriveFromBypassMulR_1,
    input wire  i_DriveFromBypassDivR_1,
    
    output wire  o_FreeToBypass0L_1,
    output wire  o_FreeToBypass1L_1,
    output wire  o_FreeToBypass2L_1,
    output wire  o_FreeToBypass3L_1,
    output wire  o_FreeToBypass4L_1,
    output wire  o_FreeToBypass5L_1,
    output wire  o_FreeToBypass6L_1,
    output wire  o_FreeToBypass7L_1,
    output wire  o_FreeToBypass8L_1,
    output wire  o_FreeToBypass9L_1,
    output wire  o_FreeToBypass10L_1,
    output wire  o_FreeToBypass11L_1,
    output wire  o_FreeToBypass12L_1,
    output wire  o_FreeToBypass13L_1,
    output wire  o_FreeToBypass14L_1,
    output wire  o_FreeToBypass15L_1,
    output wire  o_FreeToBypassLsuL_1,
    output wire  o_FreeToBypassCsrL_1,
    output wire  o_FreeToBypassMulL_1,
    output wire  o_FreeToBypassDivL_1,

    output wire  o_FreeToBypass0R_1,
    output wire  o_FreeToBypass1R_1,
    output wire  o_FreeToBypass2R_1,
    output wire  o_FreeToBypass3R_1,
    output wire  o_FreeToBypass4R_1,
    output wire  o_FreeToBypass5R_1,
    output wire  o_FreeToBypass6R_1,
    output wire  o_FreeToBypass7R_1,
    output wire  o_FreeToBypass8R_1,
    output wire  o_FreeToBypass9R_1,
    output wire  o_FreeToBypass10R_1,
    output wire  o_FreeToBypass11R_1,
    output wire  o_FreeToBypass12R_1,
    output wire  o_FreeToBypass13R_1,
    output wire  o_FreeToBypass14R_1,
    output wire  o_FreeToBypass15R_1,
    output wire  o_FreeToBypassLsuR_1,
    output wire  o_FreeToBypassCarR_1,
    output wire  o_FreeToBypassMulR_1,
    output wire  o_FreeToBypassDivR_1,

    //data part
    
    input wire [31:0] i_OprandFromBypass0_32,
    input wire [31:0] i_OprandFromBypass1_32,
    input wire [31:0] i_OprandFromBypass2_32,
    input wire [31:0] i_OprandFromBypass3_32,
    input wire [31:0] i_OprandFromBypass4_32,
    input wire [31:0] i_OprandFromBypass5_32,
    input wire [31:0] i_OprandFromBypass6_32,
    input wire [31:0] i_OprandFromBypass7_32,
    input wire [31:0] i_OprandFromBypass8_32,
    input wire [31:0] i_OprandFromBypass9_32,
    input wire [31:0] i_OprandFromBypass10_32,
    input wire [31:0] i_OprandFromBypass11_32,
    input wire [31:0] i_OprandFromBypass12_32,
    input wire [31:0] i_OprandFromBypass13_32,
    input wire [31:0] i_OprandFromBypass14_32,
    input wire [31:0] i_OprandFromBypass15_32,
    input wire [31:0] i_OprandFromBypassLSU_32,
    input wire [31:0] i_OprandFromBypassCSR_32,
    input wire [31:0] i_OprandFromBypassMul_32,
    input wire [31:0] i_OprandFromBypassDiv_32,

    input wire [3:0]  i_IndexFromLSU;
    input wire [3:0]  i_IndexFromCSR;
    input wire [3:0]  i_IndexFromMul;
    input wire [3:0]  i_IndexFromDiv;

    output wire o_FreeToGRF_1;
    output wire o_FreeToGRF_1;
//BranchControl
        input wire i_BranchEnable_1;
        input wire i_BranchDrive_1;
//
        output wire i_freeFromIssue_1;
);


/*reg   [3:0] r_CsrAddresss_4;
reg   [3:0] r_ALUCount_4;
reg   [3:0] r_LsuAddress_4;*/


reg   [3:0] r_count_4;
wire  w_fire0_1;
wire  w_fire1_1;
wire  [1:0] w_fire0_2;
wire  [141:0] w_AllOpcode_142;

reg   r_CsrEmpty_1;
reg   r_LsuEmpty_1;

reg   r_IsFirst_1;

assign w_AllInstruction_1147={ i_instFromDependenceCheck0_73, i_instFromDependenceCheck1_73,i_instFromDependenceCheck2_73,i_instFromDependenceCheck3_73,
                              i_instFromDependenceCheck4_73,i_instFromDependenceCheck5_73,i_instFromDependenceCheck6_73,i_instFromDependenceCheck7_73,
                              i_instFromDependenceCheck8_73, i_instFromDependenceCheck9_73,i_instFromDependenceCheck10_73,i_instFromDependenceCheck11_73,
                              i_instFromDependenceCheck12_73,i_instFromDependenceCheck13_73,i_instFromDependenceCheck14_73,i_instFromDependenceCheck15_73};

assign w_AllOpcode_142={ o_instToIssue0_73[6:0], o_instToIssue1_73[6:0],o_instToIssue2_73[6:0],o_instToIssue3_73[6:0],
                              o_instToIssue4_73[6:0],o_instToIssue5_73[6:0],o_instToIssue6_73[6:0],o_instToIssue7_73[6:0],
                              o_instToIssue8_73[6:0], o_instToIssue9_73[6:0],o_instToIssue10_73[6:0],o_instToIssue11_73[6:0],
                              o_instToIssue12_73[6:0],o_instToIssue13_73[6:0],o_instToIssue14_73[6:0],o_instToIssue15_73[6:0]};



localparam WIDTH = 32;  
localparam DEPTH = 16;
reg [WIDTH-1:0] CSRIssue [DEPTH-1:0];
reg [WIDTH-1:0] LSAIssue [DEPTH-1:0];
reg [WIDTH-1:0] ALUIssue [DEPTH-1:0];
reg  [3:0] r_BranchStart_4;
reg  [3:0] r_BranchStop_4;
reg  [3:0] r_BranchFirst_4;


//为防止数据冲刷：未分配完就有新数据，可能要加延迟

cFifo2 cFifo0(
        i_drive(o_DriveToIssue_1),
        i_freeNext(),
        rst(rstn),
        o_free(i_freeFromIssue_1),
        o_driveNext,
        o_fire_2(w_fire0_2)
);

assign  w_fire00_1=w_fire0_2[0];
assign  w_fire01_1=w_fire0_2[1];


//跳转清零
//前级数据输入




always@(posedge w_fire00_1 or negedge rstn ) begin
if(!rstn) begin
    r_BranchStart_4 <= 4'b0;
    r_BranchStop_4 <= 4'b0;
end
else  begin
    r_BranchFirst_4= w_BranchIndex_4;
    r_BranchStart_4 <= o_BranchIndexNow_4;
    r_BranchStop_4 <= o_BranchIndexNext_4;
end

end
       


wire  [4:0]  w_CsrGrayNext_5;
wire  [4:0]  w_CsrBinnaryNext_5;
reg   [4:0]  r_CsrGray_5;
reg   [4:0]  r_CsrBinnary_5;
wire  [3:0]  w_CsrAddress_4 = r_CsrBinnary_5[3:0];

assign w_CsrBinnaryNext_5  = r_CsrBinnary_5 + 5'b00001;
assign w_CsrGrayNext_5 = (w_CsrBinnaryNext_5>>1) ^ w_CsrBinnaryNext_5; 

reg  [4:0]  r_LsuGrayNext_5;
reg  [4:0]  r_LsuBinnaryNext_5;
reg   [4:0]  r_LsuGray_5;
reg   [4:0]  r_LsuBinnary_5;


assign w_LsuBinnaryNext_5  = r_LsuBinnary_5 + 5'b00001;
assign w_LsuGrayNext_5 = (w_LsuBinnaryNext_5>>1) ^ w_LsuBinnaryNext_5; 

integer i,a,b;
integer j;
integer LsuAddress;
integer CsrAddress;
integer CsrInitial;
integer LsuInitial;

always@(posedge  w_fire01_1 or negedge rstn ) begin
if(!rstn)begin
//
r_LsuGray_5 <= 5'b0;
r_LsuBinnary_5 <= 5'b0;
//
r_CsrGray_5 <= 5'b0;
r_CsrBinnary_5 <= 5'b0;
//
LsuAddress=0;
CsrAddress=0;

for (j= 0; j< DEPTH; j = j + 1) begin
      CSRIssue[i] = 32'b0; // 初始化CSRIssue数组的值为0
      LSAIssue[i] = 32'b0; // 初始化LSAIssue数组的值为0
      ALUIssue[i] = 32'b0; // 初始化ALUIssue数组的值为0
    end
//
r_IsFirst_1 <= 1'b1;
r_LsuEmpty_1 <= 1'b1;
r_CsrEmpty_1 <= 1'b1;

end
//
else begin
 if ( r_IsFirst_1 == 1'b1 ) begin
      LsuAddress=0;
      CsrAddress=0;
  for (i=0 ;i<16;i=i+1)begin
    if(i <= r_BranchFirst_4) begin
        if(w_AllOpcode_142[6+7*i:7*i]==7'b0101111 ||w_AllOpcode_142[6+7*i:7*i]== 7'b0000011 || w_AllOpcode_142[6+7*i:7*i]== 7'b0101111) begin
            LSAIssue[LsuAddress] <= w_AllInstruction_1147[72+73*i,73*i];  
            LsuAddress=LsuAddress+1;
            /*r_LsuAddress_4  <= r_LsuAddress_4 + 1'b1;
            r_LsuBinnary_5 <= w_LsuBinnaryNext_5;
            r_LsuGray_5 <= w_LsuGrayNext_5;*/
            if(r_LsuEmpty_1 == 1'b1) begin
                r_LsuEmpty_1 <= 1'b0;
            end
        end

        else if(w_AllOpcode_142[6+7*i:7*i]== 7'b1110011 ) begin
            CSRIssue[CsrAddress]  <= w_AllInstruction_1147[72+73*i,73*i];  
            CsrAddress = CsrAddress + 1;
           /* r_CsrBinnary_5 <= w_CsrBinnaryNext_5;
            r_CsrGray_5 <= w_CsrGrayNext_5;*/
            if(r_CsrEmpty_1 == 1'b1) begin
                r_CsrEmpty_1 <= 1'b0;
            end
        end

        else  begin
            ALUIssue[i] <= w_AllInstruction_1147[72+73*i,73*i];
                
        end
    end
    //initial
    else begin
          ALUIssue[i] <= 32'b0;  
    end
   end     
  LsuInitial=LsuAddress;
  CsrInitial=CsrAddress;
  for(a=CsrInitial;a<16;a=a+1)begin
    CsrIssue[a]<= 32'b0;  
  end
  for(b=LsuInitial;b<16;b=b+1)begin
   LsuIssue[b] <= 32'b0;  
  end
  r_IsFirst_1<=1'b0;
 end
 else begin
  for (i=0;i<16;i=i+1)  begin
        if(i >= r_BranchStart_4 || i <=  r_BranchStop_4) begin
            if(w_AllOpcode_142[6+7*i:7*i]==7'b0101111 ||w_AllOpcode_142[6+7*i:7*i]== 7'b0000011 || w_AllOpcode_142[6+7*i:7*i]== 7'b0101111) begin
             LSAIssue[LsuAddress] <= w_AllInstruction_1147[72+73*i,73*i];  
             LsuAddress=LsuAddress+1;
             /*r_LsuAddress_4  <= r_LsuAddress_4 + 1'b1;
             r_LsuBinnary_5 <= w_LsuBinnaryNext_5;
             r_LsuGray_5 <= w_LsuGrayNext_5;*/
             if(r_LsuEmpty_1 == 1'b1) begin
                r_LsuEmpty_1 <= 1'b0;
             end
            end

            else if(w_AllOpcode_142[6+7*i:7*i]== 7'b1110011 ) begin
             CSRIssue[CsrAddress]  <= w_AllInstruction_1147[72+73*i,73*i];  
             CsrAddress = CsrAddress + 1;
             /* r_CsrBinnary_5 <= w_CsrBinnaryNext_5;
             r_CsrGray_5 <= w_CsrGrayNext_5;*/
             if(r_CsrEmpty_1 == 1'b1) begin
                r_CsrEmpty_1 <= 1'b0;
             end
            end

            else  begin
            ALUIssue[i] <= w_AllInstruction_1147[72+73*i,73*i];  
            end
        end
        else begin
            ALUIssue[i] <= ALUIssue[i];  
        end
   end
   LsuInitial=LsuAddress;
   CsrInitial=CsrAddress;
   for(a=CsrInitial;a<16;a=a+1)begin
   CsrIssue[a]<=  CsrIssue[a];   
   end
   for(b=LsuInitial;b<16;b=b+1)begin
   LsuIssue[b] <= LsuIssue[b];  
   end
 end
end
end


//有branch,置高first
always @(*) begin
    
end
//

genvar k;
generate
    for(k=0;k<16;k=k+1) begin:AluIssue
    AluIssue IssueAlu (
    .i_DriveFromGRF_1(i_DriveFromGRF_1()),
    .rstn(rstn),
    .i_DriveToAluIssue_1(i_DriveToAluIssue_1),
    .i_InstructionToAluIssue_113(i_InstructionToAluIssue_113),
    .i_DriveFromIssueTop_1(i_DriveFromIssueTop_1),
    .i_FreeFromGRF_1(i_FreeFromGRF_1()),
    .i_FreeFromExe_1(i_FreeFromExe_1()),

    .o_FreeToIssueTop_1(o_FreeToIssueTop_1()),
    .o_DriveToGRF_1(o_DriveToGRF_1()),
    .o_DriveFromIssueToExe(o_DriveFromIssueToExe()),
    .o_InstructionToExe_177(o_InstructionToExe_177()),

    .i_DriveFromBypass0L_1(i_DriveFromBypass0L_1),
    .i_DriveFromBypass1L_1(i_DriveFromBypass1L_1),
    .i_DriveFromBypass2L_1(i_DriveFromBypass2L_1),
    .i_DriveFromBypass3L_1(i_DriveFromBypass3L_1),
    .i_DriveFromBypass5L_1(i_DriveFromBypass5L_1),
    .i_DriveFromBypass6L_1(i_DriveFromBypass6L_1),
    .i_DriveFromBypass7L_1(i_DriveFromBypass7L_1),
    .i_DriveFromBypass8L_1(i_DriveFromBypass8L_1),
    .i_DriveFromBypass9L_1(i_DriveFromBypass9L_1),
    .i_DriveFromBypass10L_1(i_DriveFromBypass10L_1),
    .i_DriveFromBypass11L_1(i_DriveFromBypass11L_1),
    .i_DriveFromBypass12L_1(i_DriveFromBypass12L_1),
    .i_DriveFromBypass13L_1(i_DriveFromBypass13L_1),
    .i_DriveFromBypass14L_1(i_DriveFromBypass14L_1),
    .i_DriveFromBypass15L_1(i_DriveFromBypass15L_1),
    .i_DriveFromBypassLsuL_1(i_DriveFromBypassLsuL_1),
    .i_DriveFromBypassCsrL_1(i_DriveFromBypassCsrL_1),
    .i_DriveFromBypassMulL_1(i_DriveFromBypassMulL_1),
    .i_DriveFromBypassDivL_1(i_DriveFromBypassDivL_1),

    .i_DriveFromBypass0R_1(i_DriveFromBypass0R_1),
    .i_DriveFromBypass1R_1(i_DriveFromBypass1R_1),
    .i_DriveFromBypass2R_1(i_DriveFromBypass2R_1),
    .i_DriveFromBypass3R_1(i_DriveFromBypass3R_1),
    .i_DriveFromBypass5R_1(i_DriveFromBypass5R_1),
    .i_DriveFromBypass6R_1(i_DriveFromBypass6R_1),
    .i_DriveFromBypass7R_1(i_DriveFromBypass7R_1),
    .i_DriveFromBypass8R_1(i_DriveFromBypass8R_1),
    .i_DriveFromBypass9R_1(i_DriveFromBypass9R_1),
    .i_DriveFromBypass10R_1(i_DriveFromBypass10R_1),
    .i_DriveFromBypass11R_1(i_DriveFromBypass11R_1),
    .i_DriveFromBypass12R_1(i_DriveFromBypass12R_1),
    .i_DriveFromBypass13R_1(i_DriveFromBypass13R_1),
    .i_DriveFromBypass14R_1(i_DriveFromBypass14R_1),
    .i_DriveFromBypass15R_1(i_DriveFromBypass15R_1),
    .i_DriveFromBypassLsuR_1(i_DriveFromBypassLsuR_1),
    .i_DriveFromBypassCsrR_1(i_DriveFromBypassCsrR_1),
    .i_DriveFromBypassMulR_1(i_DriveFromBypassMulR_1),
    .i_DriveFromBypassDivR_1(i_DriveFromBypassDivR_1),

    .o_FreeToBypass0L_1(o_FreeToBypass0L_1),
    .o_FreeToBypass1L_1(o_FreeToBypass1L_1),
    .o_FreeToBypass2L_1(o_FreeToBypass2L_1),
    .o_FreeToBypass3L_1(o_FreeToBypass3L_1),
    .o_FreeToBypass4L_1(o_FreeToBypass4L_1),
    .o_FreeToBypass5L_1(o_FreeToBypass5L_1),
    .o_FreeToBypass6L_1(o_FreeToBypass6L_1),
    .o_FreeToBypass7L_1(o_FreeToBypass7L_1),
    .o_FreeToBypass8L_1(o_FreeToBypass8L_1),
    .o_FreeToBypass9L_1(o_FreeToBypass9L_1),
    .o_FreeToBypass10L_1(o_FreeToBypass10L_1),
    .o_FreeToBypass11L_1(o_FreeToBypass11L_1),
    .o_FreeToBypass12L_1(o_FreeToBypass12L_1),
    .o_FreeToBypass13L_1(o_FreeToBypass13L_1),
    .o_FreeToBypass14L_1(o_FreeToBypass14L_1),
    .o_FreeToBypass15L_1(o_FreeToBypass15L_1),
    .o_FreeToBypassLsuL_1(o_FreeToBypassLsuL_1),
    .o_FreeToBypassCsrL_1(o_FreeToBypassCsrL_1),
    .o_FreeToBypassMulL_1(o_FreeToBypassMulL_1),
    .o_FreeToBypassDivL_1(o_FreeToBypassDivL_1),

    .o_FreeToBypass0R_1(o_FreeToBypass0R_1),
    .o_FreeToBypass1R_1(o_FreeToBypass1R_1),
    .o_FreeToBypass2R_1(o_FreeToBypass2R_1),
    .o_FreeToBypass3R_1(o_FreeToBypass3R_1),
    .o_FreeToBypass4R_1(o_FreeToBypass4R_1),
    .o_FreeToBypass5R_1(o_FreeToBypass5R_1),
    .o_FreeToBypass6R_1(o_FreeToBypass6R_1),
    .o_FreeToBypass7R_1(o_FreeToBypass7R_1),
    .o_FreeToBypass8R_1(o_FreeToBypass8R_1),
    .o_FreeToBypass9R_1(o_FreeToBypass9R_1),
    .o_FreeToBypass10R_1(o_FreeToBypass10R_1),
    .o_FreeToBypass11R_1(o_FreeToBypass11R_1),
    .o_FreeToBypass12R_1(o_FreeToBypass12R_1),
    .o_FreeToBypass13R_1(o_FreeToBypass13R_1),
    .o_FreeToBypass14R_1(o_FreeToBypass14R_1),
    .o_FreeToBypass15R_1(o_FreeToBypass15R_1),
    .o_FreeToBypassLsuR_1(o_FreeToBypassLsuR_1),
    .o_FreeToBypassCarR_1(o_FreeToBypassCarR_1),
    .o_FreeToBypassMulR_1(o_FreeToBypassMulR_1),
    .o_FreeToBypassDivR_1(o_FreeToBypassDivR_1),

    .i_OprandFromBypass0_32(i_OprandFromBypass0_32),
    .i_OprandFromBypass1_32(i_OprandFromBypass1_32),
    .i_OprandFromBypass2_32(i_OprandFromBypass2_32),
    .i_OprandFromBypass3_32(i_OprandFromBypass3_32),
    .i_OprandFromBypass4_32(i_OprandFromBypass4_32),
    .i_OprandFromBypass5_32(i_OprandFromBypass5_32),
    .i_OprandFromBypass6_32(i_OprandFromBypass6_32),
    .i_OprandFromBypass7_32(i_OprandFromBypass7_32),
    .i_OprandFromBypass8_32(i_OprandFromBypass8_32),
    .i_OprandFromBypass9_32(i_OprandFromBypass9_32),
    .i_OprandFromBypass10_32(i_OprandFromBypass10_32),
    .i_OprandFromBypass11_32(i_OprandFromBypass11_32),
    .i_OprandFromBypass12_32(i_OprandFromBypass12_32),
    .i_OprandFromBypass13_32(i_OprandFromBypass13_32),
    .i_OprandFromBypass14_32(i_OprandFromBypass14_32),
    .i_OprandFromBypass15_32(i_OprandFromBypass15_32),
    .i_OprandFromBypassLSU_32(i_OprandFromBypassLSU_32),
    .i_OprandFromBypassCSR_32(i_OprandFromBypassCSR_32),
    .i_OprandFromBypassMul_32(i_OprandFromBypassMul_32),
    .i_OprandFromBypassDiv_32(i_OprandFromBypassDiv_32),

    .i_IndexFromLSU(i_IndexFromLSU),
    .i_IndexFromCSR(i_IndexFromCSR),
    .i_IndexFromMul(i_IndexFromMul),
    .i_IndexFromDiv(i_IndexFromDiv),

    .o_FreeToGRF_1(o_FreeToGRF_1),
    .o_FreeToGRF_1(o_FreeToGRF_1)
  );        
end

endgenerate


 LsuIssue IssueLSU (
       
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

);


 CsrIssue IssueCSR(
       
    input wire rstn,
    input wire i_CSRCount_5;
    output wire o_FreeToIssue0_1,
    output wire o_FreeToIssue1_1            
    inout reg io_empty_1;
    inout reg io_IsFirst_1;
    input reg [15:0] i_InstructionToCsrIssue_113 [0:112];

    input  wire  i_DriveFromWriteBack_1;
    output wire  o_FreeToWriteBack_1;
    input  wire  i_DriveFromIssue_1 ;
    output wire  o_FreeToIssue_1;

    
    input wire i_FreeBypassFifoToCsrIssue;
    output wire o_DriveCsrIssueToBypassFifo;

    input wire i_DriveBypassFifoToCsrIssue;
    output wire o_FreeCsrIssueToBypassBuffer;


);



 
endmodule