`timescale 1ns / 1ps

module Issue(
        input rstn,
//jump flag
      input wire  ;
// data
        input wire [114:0] i_instToIssue0_115,
        input wire [114:0] i_instToIssue1_115,
        input wire [114:0] i_instToIssue2_115,
        input wire [114:0] i_instToIssue3_115, 
        input wire [114:0] i_instToIssue4_115, 
        input wire [114:0] i_instToIssue5_115,
        input wire [114:0] i_instToIssue6_115, 
        input wire [114:0] i_instToIssue7_115,
        input wire [114:0] i_instToIssue8_115, 
        input wire [114:0] i_instToIssue9_115, 
        input wire [114:0] i_instToIssue10_115, 
        input wire [114:0] i_instToIssue11_115, 
        input wire [114:0] i_instToIssue12_115, 
        input wire [114:0] i_instToIssue13_115, 
        input wire [114:0] i_instToIssue14_115, 
        input wire [114:0] i_instToIssue15_115,

        input wire [3:0] o_FirstBranchIndex_4;
//signal
        input wire   o_DriveToIssue_1
//ALUISSUE

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


reg   [3:0] r_count_4;
wire  w_fire0_1;
wire  w_fire1_1;
wire  [1:0] w_fire0_2;
reg   r_CsrEmpty_1;
reg   r_LsuEmpty_1;
reg   r_IsFirst_1;

reg   [2:0]       r_AllOpcode[0:INSTRUCTION_NUMBER-1];
reg   [DEP_WIDTH:0]       r_AllDepL[0:INSTRUCTION_NUMBER-1];
reg   [DEP_WIDTH:0]       r_AllDepR[0:INSTRUCTION_NUMBER-1];
reg   [101:0]     r_AllIncInfo[0:INSTRUCTION_NUMBER-1];

wire [INSTRUCTION_WIDTH*INSTRUCTION_NUMBER:0] w_AllInstruction;

always @(*) begin
  w_AllInstruction = { i_instFromDependenceCheck0_115, i_instFromDependenceCheck1_115,i_instFromDependenceCheck2_115,i_instFromDependenceCheck3_115,
                                i_instFromDependenceCheck4_115,i_instFromDependenceCheck5_115,i_instFromDependenceCheck6_115,i_instFromDependenceCheck7_115,
                                i_instFromDependenceCheck8_115, i_instFromDependenceCheck9_115,i_instFromDependenceCheck10_115,i_instFromDependenceCheck11_115,
                                i_instFromDependenceCheck12_115,i_instFromDependenceCheck13_115,i_instFromDependenceCheck14_115,i_instFromDependenceCheck15_115};
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
  


localparam WIDTH = 32;  
localparam DEPTH = 16;

reg [WIDTH-1:0] CSRIssue [0:DEPTH-1];
reg [WIDTH-1:0] LSAIssue [0:DEPTH-1];
reg [WIDTH-1:0] ALUIssue [0:DEPTH-1];
reg [WIDTH-1:0] MULIssue [0:DEPTH-1];
reg [WIDTH-1:0] DIVIssue [0:DEPTH-1];


reg  [3:0] r_BranchStart_4;
reg  [3:0] r_BranchStop_4;
reg  [3:0] r_BranchFirst_4;
reg r_IsBranch_1;
input wire i_isBranch;
//为防止数据冲刷：未分配完就有新数据，可能要加延迟



//跳转清零
//前级数据输入
input wire o_driveToIssue1_1;
output wire i_freeFromIssue1_1;
wire [1:0] w_fire1_2;

cLastFifo2  instance_name (
  .i_drive(o_driveToIssue1_1),   
  .rst(rstn),                
  .o_free(i_freeFromIssue1_1),           
  .o_driveNext(),  
  .o_fire_1(w_fire1_2)       
);


always@(posedge w_fire1_2[0] or negedge rstn ) begin
if(!rstn) begin
    r_BranchStart_4 <= 4'b0;
    r_BranchStop_4 <= 4'b0;
    r_BranchFirst_4 <= 4'b0;
    r_IsBranch_1 <=0;
end
else  begin
    r_BranchFirst_4 <= o_BranchIndexFirst_4;
    r_BranchStart_4 <= o_BranchIndexNow_4;
    r_BranchStop_4 <= o_BranchIndexNext_4;
    r_IsBranch_1 <= i_isBranch;
end

end
       

cFifo2 cFifo0(
        i_drive(o_DriveToIssue_1),
        i_freeNext(w_Free_Copyfork10TocFifo0),
        rst(rstn),
        o_free(i_freeFromIssue_1),
        o_driveNext(w_Drive_ToCopyfork10),
        o_fire_2(w_fire0_2)
);

assign  w_fire00_1=w_fire0_2[0];
assign  w_fire01_1=w_fire0_2[1];


reg  [4:0]  r_LsuGrayNext_5;
reg  [4:0]  r_LsuBinnaryNext_5;
reg  [4:0]  r_LsuGray_5;
reg  [4:0]  r_LsuBinnary_5;

reg [15:0]  r_AluPermit_16 ;


assign w_LsuBinnaryNext_5  = r_LsuBinnary_5 + 5'b00001;
assign w_LsuGrayNext_5 = (w_LsuBinnaryNext_5>>1) ^ w_LsuBinnaryNext_5; 

integer i,j,a,b,c,d;
integer LsuAddress;
integer CsrAddress;
integer MulAddress;
integer DivAddress;
integer BjpAddress;
integer DivInitial;
integer MulInitial;
integer CsrInitial;
integer LsuInitial;

always@(posedge  w_fire00_1 or negedge rstn ) begin
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
MulAddress=0;
DivAddress=0;
BjpAddress=0;

r_AluPermit_16 <= 16'b0;

for (j= 0; j< DEPTH; j = j + 1) begin
      CSRIssue[i] <= 32'b0; // 初始化CSRIssue数组的值为0
      LSAIssue[i] <= 32'b0; // 初始化LSAIssue数组的值为0
      ALUIssue[i] <= 32'b0; // 初始化ALUIssue数组的值为0
      MULIssue[i] <= 32'b0; // 初始化MULIssue数组的值为0
      DIVIssue[i] <= 32'b0; // 初始化DIVIssue数组的值为0
    end
//
r_LsuEmpty_1 <= 1'b1;
r_CsrEmpty_1 <= 1'b1;
r_MulEmpty_1 <= 1'b1;
r_DivEmpty_1 <= 1'b1;

end
//
else begin
 if (r_IsFirst_1 == 1'b1) begin
      LsuAddress=0;
      CsrAddress=0;
      MulAddress=0;
      DivAddress=0;
      AluAddress=0;

  for (i=0;i<16;i=i+1)begin
    if(i <r_BranchFirst_4) begin
        if(r_AllOpcode[2+3*i:3*i]==3'b001) begin
            LSAIssue[LsuAddress] <= r_Instruction[114+115*i:115*i];  
            LsuAddress=LsuAddress+1;
            /*r_LsuAddress_4  <= r_LsuAddress_4 + 1'b1;
            r_LsuBinnary_5 <= w_LsuBinnaryNext_5;
            r_LsuGray_5 <= w_LsuGrayNext_5;*/
            if(r_LsuEmpty_1 == 1'b1) begin
                r_LsuEmpty_1 <= 1'b0;
            end
        end
        else if(r_AllOpcode[2+3*i:3*i]==3'b011) begin
            CSRIssue[CsrAddress]  <= r_Instruction[114+115*i:115*i];  
            CsrAddress = CsrAddress + 1;
           /* r_CsrBinnary_5 <= w_CsrBinnaryNext_5;
            r_CsrGray_5 <= w_CsrGrayNext_5;*/
            if(r_CsrEmpty_1 == 1'b1) begin
                r_CsrEmpty_1 <= 1'b0;
            end
        end
        else if(r_AllOpcode[2+3*i:3*i]==3'b011) begin
            CSRIssue[CsrAddress]  <= r_Instruction[114+115*i:115*i];  
            CsrAddress = CsrAddress + 1;
           /* r_CsrBinnary_5 <= w_CsrBinnaryNext_5;
            r_CsrGray_5 <= w_CsrGrayNext_5;*/
            if(r_CsrEmpty_1 == 1'b1) begin
                r_CsrEmpty_1 <= 1'b0;
            end
        end
        else if((r_AllOpcode[2+3*i:3*i]==3'b011)&(|r_AllIncInfo[i][11:8]==1'b1)) begin
            MULIssue[MulAddress]  <= r_Instruction[114+115*i:115*i];  
            MulAddress = MulAddress + 1;
           /* r_MulBinnary_5 <= w_MulBinnaryNext_5;
            r_MulGray_5 <= w_MulGrayNext_5;*/
            if(r_MulEmpty_1 == 1'b1) begin
                r_MulEmpty_1 <= 1'b0;
            end
        end
        else if((r_AllOpcode[2+3*i:3*i]==3'b011)&(|r_AllIncInfo[i][15:12]==1'b1)) begin
            DIVIssue[DivAddress]  <= r_Instruction[114+115*i:115*i];  
            DivAddress = DivAddress + 1;
           /* r_DivBinnary_5 <= w_DivBinnaryNext_5;
            r_DivGray_5 <= w_DivGrayNext_5;*/
            if(r_DivEmpty_1 == 1'b1) begin
                r_DivEmpty_1 <= 1'b0;
        end
        end
        else if(r_AllOpcode[2+3*i:3*i]==3'100) begin
        BjpAddress=BjpAddress+1;
        end
        else  begin
        ALUIssue[i] <= r_Instruction[114+115*i:115*i];
        r_AluPermit_16[i] <= 1;
        AluAddress=AluAddress+1;
        end
    end
    //initial
    else begin
          ALUIssue[i] <= 32'b0;  
          r_AluPermit_16[i] <= 0;
    end
   end     
   LsuInitial=LsuAddress;
   CsrInitial=CsrAddress;
   MulInitial=MulAddress;
   DivInitial=DivAddress;
   for(a=CsrInitial;a<16;a=a+1)begin
   CsrIssue[a] <=  0;   
   end
   for(b=LsuInitial;b<16;b=b+1)begin
   LsuIssue[b] <= 0;  
   end
   for(c=CsrInitial;c<16;c=c+1)begin
   MulIssue[c] <= 0;   
   end
   for(d=LsuInitial;d<16;d=d+1)begin
   DivIssue[d] <= 0;  
   end
 end
 else begin
  for (i=0;i<16;i=i+1)  begin
    if(i>=r_BranchStart_4|i<=r_BranchStop_4)begin
        if(r_AllOpcode[2+3*i:3*i]==3'b001) begin
            LSAIssue[LsuAddress] <= r_Instruction[114+115*i:115*i];  
            LsuAddress=LsuAddress+1;
            /*r_LsuAddress_4  <= r_LsuAddress_4 + 1'b1;
            r_LsuBinnary_5 <= w_LsuBinnaryNext_5;
            r_LsuGray_5 <= w_LsuGrayNext_5;*/
            if(r_LsuEmpty_1 == 1'b1) begin
            r_LsuEmpty_1 <= 1'b0;
            end
        end
        else if(r_AllOpcode[2+3*i:3*i]==3'b011) begin
            CSRIssue[CsrAddress]  <= r_Instruction[114+115*i:115*i];  
            CsrAddress = CsrAddress + 1;
           /* r_CsrBinnary_5 <= w_CsrBinnaryNext_5;
            r_CsrGray_5 <= w_CsrGrayNext_5;*/
            if(r_CsrEmpty_1 == 1'b1) begin
                r_CsrEmpty_1 <= 1'b0;
            end
        end
        else if(r_AllOpcode[2+3*i:3*i]==3'b011) begin
            CSRIssue[CsrAddress]  <= r_Instruction[114+115*i:115*i];  
            CsrAddress = CsrAddress + 1;
           /* r_CsrBinnary_5 <= w_CsrBinnaryNext_5;
            r_CsrGray_5 <= w_CsrGrayNext_5;*/
            if(r_CsrEmpty_1 == 1'b1) begin
                r_CsrEmpty_1 <= 1'b0;
            end
        end
        else if((r_AllOpcode[2+3*i:3*i]==3'b011)&(|r_AllIncInfo[i][11:8]==1'b1)) begin
            MULIssue[MulAddress]  <= r_Instruction[114+115*i:115*i];  
            MulAddress = MulAddress + 1;
           /* r_MulBinnary_5 <= w_MulBinnaryNext_5;
            r_MulGray_5 <= w_MulGrayNext_5;*/
            if(r_MulEmpty_1 == 1'b1) begin
                r_MulEmpty_1 <= 1'b0;
            end
        end
        else if((r_AllOpcode[2+3*i:3*i]==3'b011)&(|r_AllIncInfo[i][15:12]==1'b1)) begin
            DIVIssue[DivAddress]  <= r_Instruction[114+115*i:115*i];  
            DivAddress = DivAddress + 1;
           /* r_DivBinnary_5 <= w_DivBinnaryNext_5;
            r_DivGray_5 <= w_DivGrayNext_5;*/
            if(r_DivEmpty_1 == 1'b1) begin
                r_DivEmpty_1 <= 1'b0;
            end
        end
        else if(r_AllOpcode[2+3*i:3*i]==3'100) begin
        BjpAddress=BjpAddress+1;        
        end
        else  begin
        ALUIssue[i] <= r_Instruction[114+115*i:115*i];
        r_AluPermit_16[i] <= 1;
        AluAddress=AluAddress+1;
        end
    end
  else begin
        ALUIssue[i] <= 115'b0;
        r_AluPermit_16[i] <= 0;
        CsrIssue[i] <= CsrIssue[i];
        MulIssue[i] <= MulIssue[i];
        DivIssue[i] <= DivIssue[i];
  end
   end
 end
end
end


wire w_FirstDecideFire = (w_fire1_2[1]&r_IsBranch_1)|w_fire01_1;
//有branch,置高first
always @(posedge  w_FirstDecideFire or negedge rstn) begin
    if (!rstn) begin
        r_IsFirst_1 <= 1; 
    end 
    else  begin
      if (w_fire1_2[1]&r_IsBranch_1) begin
        r_IsFirst_1 <= 1; 
      end
      else begin
        if(AluAddress+CsrAddress+LsuAddress+DivAddress+MulAddress+BjpAddress==16)begin
        r_IsFirst_1 <=1;
        else begin
        r_IsFirst_1 <=0;
         end
        end
      end
    end
end
//

wire  w_Drive_ToCopyfork10;
wire  w_Free_Copyfork10TocFifo0;

wire  w_Drive_ToCondAlu;
wire  w_Drive_ToCsrPmtFifo;
wire  w_Drive_ToDivPmtFifo;
wire  w_Drive_ToMulPmtFifo;
wire  w_Drive_ToLsuPmtFifo;
wire  w_Drive_ToEmptyControlCsr;
wire  w_Drive_ToEmptyControlLsu;
wire  w_Drive_ToEmptyControlMul;
wire  w_Drive_ToEmptyControlDiv;

wire  w_Free_FromCondAlu;
wire  w_Free_FromCsrPmtFifo;
wire  w_Free_FromDivPmtFifo;
wire  w_Free_FromMulPmtFifo;
wire  w_Free_FromLsuPmtFifo;
wire  w_Free_FromEmptyControlCsr;
wire  w_Free_FromEmptyControlLsu;
wire  w_Free_FromEmptyControlMul;
wire  w_Free_FromEmptyControlDiv;

//启动Issue
cCopyFork10_32b my_cCopyFork10_32b (
.i_drive(w_Drive_ToCopyfork10),
.i_freeNext0(w_Free_FromCondAlu),
.i_freeNext1(w_Free_FromCsrPmtFifo),
.i_freeNext2(w_Free_FromDivPmtFifo),
.i_freeNext3(w_Free_FromMulPmtFifo),
.i_freeNext4(w_Free_FromLsuPmtFifo),
.i_freeNext5(w_Free_FromEmptyControlCsr),
.i_freeNext6(w_Free_FromEmptyControlLsu),
.i_freeNext7(w_Free_FromEmptyControlMul),
.i_freeNext8(w_Free_FromEmptyControlDiv),
.i_freeNext9(),
.rst(rstn),
.i_data_32(),
.o_free( w_Free_Copyfork10TocFifo0),
.o_driveNext0(w_Drive_ToCondAlu),
.o_driveNext1(w_Drive_ToCsrPmtFifo),
.o_driveNext2(w_Drive_ToDivPmtFifo),
.o_driveNext3(w_Drive_ToMulPmtFifo),
.o_driveNext4(w_Drive_ToLsuPmtFifo),
.o_driveNext5(w_Drive_ToEmptyControlCsr),
.o_driveNext6(w_Drive_ToEmptyControlDiv),
.o_driveNext7(w_Drive_ToEmptyControlMul),
.o_driveNext8(w_Drive_ToEmptyControlLsu),
.o_driveNext9(),
.o_data0(),
.o_data1(),
.o_data2(),
.o_data3(),
.o_data4(),
.o_data5(),
.o_data6(),
.o_data7(),
.o_data8(),
.o_data9();

);




wire [15:0]     i_DriveFromGRF_16;

wire [1807:0]   i_InstructionToAluIssue_1807;
wire [15:0]     i_DriveFromIssueTop_16;
wire [15:0]     i_FreeFromGRF_16;
wire [15:0]     i_FreeFromExe_16;

wire [15:0]   o_FreeToIssueTop_16;
wire [15:0]   o_DriveToGRF_16;
wire [15:0]   o_DriveFromIssueToExe_16;
wire [1871:0] o_InstructionToExe_1871;

wire [15:0] w_DriveToAluIssue;
wire [15:0] w_Free_AluIssueToCondFork;
cCondFork16_32b AluIssue_cCondFork16_0 (
    .i_drive(w_Drive_ToCondAlu),
    .i_freeNext0(w_Free_AluIssueToCondFork[0]), 
    .i_freeNext1(w_Free_AluIssueToCondFork[1]), 
    .i_freeNext2(w_Free_AluIssueToCondFork[2]),
    .i_freeNext3(w_Free_AluIssueToCondFork[3]), 
    .i_freeNext4(w_Free_AluIssueToCondFork[4]),
    .i_freeNext5(w_Free_AluIssueToCondFork[5]), 
    .i_freeNext6(w_Free_AluIssueToCondFork[6]), 
    .i_freeNext7(w_Free_AluIssueToCondFork[7]),
    .i_freeNext8(w_Free_AluIssueToCondFork[8]), 
    .i_freeNext9(w_Free_AluIssueToCondFork[9]),
    .i_freeNext10(w_Free_AluIssueToCondFork[10]), 
    .i_freeNext11(w_Free_AluIssueToCondFork[11]), 
    .i_freeNext12(w_Free_AluIssueToCondFork[12]),
    .i_freeNext13(w_Free_AluIssueToCondFork[13]), 
    .i_freeNext14(w_Free_AluIssueToCondFork[14]),
    .i_freeNext15(w_Free_AluIssueToCondFork[15]),
    .valid0(r_AluPermit_16[0]),
    .valid1(r_AluPermit_16[1]), 
    .valid2(r_AluPermit_16[2]), 
    .valid3(r_AluPermit_16[3]), 
    .valid4(r_AluPermit_16[4]),
    .valid5(r_AluPermit_16[5]),
    .valid6(r_AluPermit_16[6]), 
    .valid7(r_AluPermit_16[7]), 
    .valid8(r_AluPermit_16[8]), 
    .valid9(r_AluPermit_16[9]),
    .valid10(r_AluPermit_16[10]),
    .valid11(r_AluPermit_16[11]), 
    .valid12(r_AluPermit_16[12]), 
    .valid13(r_AluPermit_16[13]), 
    .valid14(r_AluPermit_16[14]),
    .valid15(r_AluPermit_16[15]);
    .rst(rstn), 
    .i_data_32(),
    .o_free(w_Free_FromCondAlu),
    .o_driveNext0(w_DriveToAluIssue[0]), 
    .o_driveNext1(w_DriveToAluIssue[1]), 
    .o_driveNext2(w_DriveToAluIssue[2]),
    .o_driveNext3(w_DriveToAluIssue[3]), 
    .o_driveNext4(w_DriveToAluIssue[4]),
    .o_driveNext5(w_DriveToAluIssue[5]), 
    .o_driveNext6(w_DriveToAluIssue[6]), 
    .o_driveNext7(w_DriveToAluIssue[7]),
    .o_driveNext8(w_DriveToAluIssue[8]), 
    .o_driveNext9(w_DriveToAluIssue[9]),
    .o_driveNext10(w_DriveToAluIssue[10]), 
    .o_driveNext11(w_DriveToAluIssue[11]), 
    .o_driveNext12(w_DriveToAluIssue[12]),
    .o_driveNext13(w_DriveToAluIssue[13]), 
    .o_driveNext14(w_DriveToAluIssue[14]),
    .o_driveNext15(w_DriveToAluIssue[15]);
    .o_data0_32(), 
    .o_data1_32(), 
    .o_data2_32(),
    .o_data3_32(), 
    .o_data4_32(),
    .o_data5_32(), 
    .o_data6_32(), 
    .o_data7_32(),
    .o_data8_32(), 
    .o_data9_32(),
    .o_data10_32(), 
    .o_data11_32(), 
    .o_data12_32(),
    .o_data13_32(), 
    .o_data14_32(),
    .o_data15_32();
  );


//例化issue


genvar k;
generate
    for(k=0;k<16;k=k+1) begin:AluIssue
    AluIssue IssueAlu (
    .i_DriveFromGRF_1(i_DriveFromGRF_16[k]),
    .rstn(rstn),
    .i_DriveToAluIssue_1(w_DriveToAluIssue[k]),
    .i_InstructionToAluIssue_113(i_InstructionToAluIssue_1807[112+113*k:113*k]),
    .i_DriveFromIssueTop_1(i_DriveFromIssueTop_16[k]),
    .i_FreeFromGRF_1(i_FreeFromGRF_16[k]),
    .i_FreeFromExe_1(i_FreeFromExe_16[k]),

    .o_FreeToIssueTop_1(o_FreeToIssueTop_16[k]),
    .o_DriveToGRF_1(o_DriveToGRF_16[k]),
    .o_DriveFromIssueToExe(o_DriveFromIssueToExe_16[k]),
    .o_InstructionToExe_177(o_InstructionToExe_1871[177*k+176:117*k]),


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

//Csr
wire w_PmtCsrIssueFifo =r_CsrEmpty_1;

wire w_Drive_Cond10ToPmtCsr;
wire w_Free_PmtCsrToCond10;
output wire o_Drive_CsrPmtToCsrIssue;
input  wire i_Free_CsrIssueToCsrPmt;
wire w_CsrPmtFire;

cPmtFifo1 cPmtFifo_ToCsrIssue(
        .i_drive(w_Drive_Cond10ToPmtCsr),
        .i_freeNext(i_Free_CsrIssueToCsrPmt), 
        .rst(rstn),
        .pmt(w_PmtCsrIssueFifo),
        .o_free(w_Free_PmtCsrToCond10),
        .o_driveNext(o_Drive_CsrPmtToCsrIssu),
        .o_fire_1(w_CsrPmtFire)
);


reg   [4:0]  r_CsrGray_5;
reg   [4:0]  r_CsrBinnary_5;

wire  [4:0]  w_CsrBinnary_5 = CsrAddress;
wire  [4:0]  w_CsrGray_5;

assign w_CsrGray_5 = (w_CsrBinnary_5>>1) ^ w_CsrBinnary_5; 

always @(posedge w_CsrPmtFire or negedge rstn) begin
  if(!rstn) begin
  r_CsrGray_5 <= 5'b0;
  r_CsrBinnary_5 <= 5'b0;
  end
  else begin
  r_CsrGray_5 <= w_CsrBinnary_5;
  r_CsrBinnary_5 <= w_CsrGray_5;
  end
end

output wire o_CsrBinnary_5 = r_CsrBinnary_5;
output wire o_CsrGray_5 = r_CsrGray_5;


wire w_Drive_MutexToCsrEmpty;
wire w_Free_CsrEmptyToMutex;
input wire i_Drive_CsrIssueToCsrEmpty;
output wire o_Drive_CsrEmptyToCsrIssue;
wire w_Drive_Cond10ToMutexCsr;
wire w_Free_MutexCsrToCond10;



cMutexMerge2_32b MutexMergeCsr(
        .i_drive0(i_Drive_CsrIssueToCsrEmpty),
        .i_drive1(w_Drive_Cond10ToMutexCsr),
        .i_data0_32(),
        .i_data1_32(),
        .i_freeNext(w_Free_CsrEmptyToMutex),
        .rst(rstn),
        .o_free0(o_Drive_CsrEmptyToCsrIssue),
        .o_free1(w_Free_MutexCsrToCond10),
        .o_driveNext(w_Drive_MutexToCsrEmpty),
        .o_data_32(),
    );

cLastFifo2  CsrEmpty (
  .i_drive(w_Drive_MutexToCsrEmpty),   
  .rst(rstn),                
  .o_free(w_Free_CsrEmptyToMutex),           
  .o_driveNext(),  
  .o_fire_1(w_fireCsrEmpty)       
);
wire w_fireCsrEmpty;

always @(posedge w_fireCsrEmpty or negedge rstn) begin
  if(!rstn) begin
    r_CsrEmpty_1 <= 1;
  end
  else begin
  if(i_CsrReadEmpty_1==1)begin
    r_CsrEmpty_1 <= 1;
  end
  else begin
    r_CsrEmpty_1 <= 0;
  end
  end
end

CsrIssue myCsrInstance (
    .rstn(rstn_wire),
    .i_CSRCount_5(count_wire),
    .o_FreeToIssue0_1(freeToIssue0_wire),
    .o_FreeToIssue1_1(freeToIssue1_wire),
    .io_empty_1(empty_wire),
    .io_IsFirst_1(isFirst_wire),
    .i_InstructionToCsrIssue_113(instruction_wire),
    .i_DriveFromWriteBack_1(driveFromWriteBack_wire),
    .o_FreeToWriteBack_1(freeToWriteBack_wire),
    .i_DriveFromIssue_1(driveFromIssue_wire),
    .o_FreeToIssue_1(freeToIssue_wire),
    .i_FreeBypassFifoToCsrIssue(fifoToCsrIssue_wire),
    .o_DriveCsrIssueToBypassFifo(driveCsrIssueToBypassFifo_wire),
    .i_DriveBypassFifoToCsrIssue(driveBypassFifoToCsrIssue_wire),
    .o_FreeCsrIssueToBypassBuffer(freeCsrIssueToBypassBuffer_wire)
);

//Mul
wire w_PmtMulIssueFifo = r_MulEmpty_1;

wire w_Drive_Cond10ToPmtMul;
wire w_Free_PmtMulToCond10;
output wire o_Drive_MulPmtToMulIssue;
input  wire i_Free_MulIssueToMulPmt;
wire w_MulPmtFire;

cPmtFifo1 cPmtFifo_ToMulIssue(
        .i_drive(w_Drive_Cond10ToPmtMul),
        .i_freeNext(i_Free_MulIssueToMulPmt), 
        .rst(rstn),
        .pmt(w_PmtMulIssueFifo),
        .o_free(w_Free_PmtMulToCond10),
        .o_driveNext(o_Drive_MulPmtToMulIssu),
        .o_fire_1(w_MulPmtFire)
);


reg   [4:0]  r_MulGray_5;
reg   [4:0]  r_MulBinnary_5;

wire  [4:0]  w_MulBinnary_5 = MulAddress;
wire  [4:0]  w_MulGray_5;

assign w_MulGray_5 = (w_MulBinnary_5>>1) ^ w_MulBinnary_5; 

always @(posedge w_MulPmtFire or negedge rstn) begin
  if(!rstn) begin
  r_MulGray_5 <= 5'b0;
  r_MulBinnary_5 <= 5'b0;
  end
  else begin
  r_MulGray_5 <= w_MulBinnary_5;
  r_MulBinnary_5 <= w_MulGray_5;
  end
end

output wire o_MulBinnary_5 = r_MulBinnary_5;
output wire o_MulGray_5 = r_MulGray_5;


wire w_Drive_MutexToMulEmpty;
wire w_Free_MulEmptyToMutex;
input wire i_Drive_MulIssueToMulEmpty;
output wire o_Drive_MulEmptyToMulIssue;
wire w_Drive_Cond10ToMutexMul;
wire w_Free_MutexMulToCond10;



cMutexMerge2_32b MutexMergeMul(
        .i_drive0(i_Drive_MulIssueToMulEmpty),
        .i_drive1(w_Drive_Cond10ToMutexMul),
        .i_data0_32(),
        .i_data1_32(),
        .i_freeNext(w_Free_MulEmptyToMutex),
        .rst(rstn),
        .o_free0(o_Drive_MulEmptyToMulIssue),
        .o_free1(w_Free_MutexMulToCond10),
        .o_driveNext(w_Drive_MutexToMulEmpty),
        .o_data_32(),
    );

cLastFifo2  MulEmpty (
  .i_drive(w_Drive_MutexToMulEmpty),   
  .rst(rstn),                
  .o_free(w_Free_MulEmptyToMutex),           
  .o_driveNext(),  
  .o_fire_1(w_fireMulEmpty)       
);
wire w_fireMulEmpty;

always @(posedge w_fireMulEmpty or negedge rstn) begin
  if(!rstn) begin
    r_MulEmpty_1 <= 1;
  end
  else begin
  if(i_MulReadEmpty_1==1)begin
    r_MulEmpty_1 <= 1;
  end
  else begin
    r_MulEmpty_1 <= 0;
  end
  end
end

MulIssue myMulInstance (
    .rstn(rstn_wire),
    .i_MulCount_5(count_wire),
    .o_FreeToIssue0_1(freeToIssue0_wire),
    .o_FreeToIssue1_1(freeToIssue1_wire),
    .io_empty_1(empty_wire),
    .io_IsFirst_1(isFirst_wire),
    .i_InstructionToMulIssue_113(instruction_wire),
    .i_DriveFromWriteBack_1(driveFromWriteBack_wire),
    .o_FreeToWriteBack_1(freeToWriteBack_wire),
    .i_DriveFromIssue_1(driveFromIssue_wire),
    .o_FreeToIssue_1(freeToIssue_wire),
    .i_FreeBypassFifoToMulIssue(fifoToMulIssue_wire),
    .o_DriveMulIssueToBypassFifo(driveMulIssueToBypassFifo_wire),
    .i_DriveBypassFifoToMulIssue(driveBypassFifoToMulIssue_wire),
    .o_FreeMulIssueToBypassBuffer(freeMulIssueToBypassBuffer_wire)
);
//Div
wire w_PmtDivIssueFifo =r_DivEmpty_1;

wire w_Drive_Cond10ToPmtDiv;
wire w_Free_PmtDivToCond10;
output wire o_Drive_DivPmtToDivIssue;
input  wire i_Free_DivIssueToDivPmt;
wire w_DivPmtFire;

cPmtFifo1 cPmtFifo_ToDivIssue(
        .i_drive(w_Drive_Cond10ToPmtDiv),
        .i_freeNext(i_Free_DivIssueToDivPmt), 
        .rst(rstn),
        .pmt(w_PmtDivIssueFifo),
        .o_free(w_Free_PmtDivToCond10),
        .o_driveNext(o_Drive_DivPmtToDivIssu),
        .o_fire_1(w_DivPmtFire)
);


reg   [4:0]  r_DivGray_5;
reg   [4:0]  r_DivBinnary_5;

wire  [4:0]  w_DivBinnary_5 = DivAddress;
wire  [4:0]  w_DivGray_5;

assign w_DivGray_5 = (w_DivBinnary_5>>1) ^ w_DivBinnary_5; 

always @(posedge w_DivPmtFire or negedge rstn) begin
  if(!rstn) begin
  r_DivGray_5 <= 5'b0;
  r_DivBinnary_5 <= 5'b0;
  end
  else begin
  r_DivGray_5 <= w_DivBinnary_5;
  r_DivBinnary_5 <= w_DivGray_5;
  end
end

output wire o_DivBinnary_5 = r_DivBinnary_5;
output wire o_DivGray_5 = r_DivGray_5;


wire w_Drive_MutexToDivEmpty;
wire w_Free_DivEmptyToMutex;
input wire i_Drive_DivIssueToDivEmpty;
output wire o_Drive_DivEmptyToDivIssue;
wire w_Drive_Cond10ToMutexDiv;
wire w_Free_MutexDivToCond10;



cMutexMerge2_32b MutexMergeDiv(
        .i_drive0(i_Drive_DivIssueToDivEmpty),
        .i_drive1(w_Drive_Cond10ToMutexDiv),
        .i_data0_32(),
        .i_data1_32(),
        .i_freeNext(w_Free_DivEmptyToMutex),
        .rst(rstn),
        .o_free0(o_Drive_DivEmptyToDivIssue),
        .o_free1(w_Free_MutexDivToCond10),
        .o_driveNext(w_Drive_MutexToDivEmpty),
        .o_data_32(),
    );

cLastFifo2  DivEmpty (
  .i_drive(w_Drive_MutexToDivEmpty),   
  .rst(rstn),                
  .o_free(w_Free_DivEmptyToMutex),           
  .o_driveNext(),  
  .o_fire_1(w_fireDivEmpty)       
);
wire w_fireDivEmpty;

always @(posedge w_fireDivEmpty or negedge rstn) begin
  if(!rstn) begin
    r_DivEmpty_1 <= 1;
  end
  else begin
  if(i_DivReadEmpty_1==1)begin
    r_DivEmpty_1 <= 1;
  end
  else begin
    r_DivEmpty_1 <= 0;
  end
  end
end

DivIssue myDivInstance (
    .rstn(rstn_wire),
    .i_DivCount_5(count_wire),
    .o_FreeToIssue0_1(freeToIssue0_wire),
    .o_FreeToIssue1_1(freeToIssue1_wire),
    .io_empty_1(empty_wire),
    .io_IsFirst_1(isFirst_wire),
    .i_InstructionToDivIssue_113(instruction_wire),
    .i_DriveFromWriteBack_1(driveFromWriteBack_wire),
    .o_FreeToWriteBack_1(freeToWriteBack_wire),
    .i_DriveFromIssue_1(driveFromIssue_wire),
    .o_FreeToIssue_1(freeToIssue_wire),
    .i_FreeBypassFifoToDivIssue(fifoToDivIssue_wire),
    .o_DriveDivIssueToBypassFifo(driveDivIssueToBypassFifo_wire),
    .i_DriveBypassFifoToDivIssue(driveBypassFifoToDivIssue_wire),
    .o_FreeDivIssueToBypassBuffer(freeDivIssueToBypassBuffer_wire)
);

//Lsu
wire w_PmtLsuIssueFifo =r_LsuEmpty_1;

wire w_Drive_Cond10ToPmtLsu;
wire w_Free_PmtLsuToCond10;
output wire o_Drive_LsuPmtToLsuIssue;
input  wire i_Free_LsuIssueToLsuPmt;
wire w_LsuPmtFire;

cPmtFifo1 cPmtFifo_ToLsuIssue(
        .i_drive(w_Drive_Cond10ToPmtLsu),
        .i_freeNext(i_Free_LsuIssueToLsuPmt), 
        .rst(rstn),
        .pmt(w_PmtLsuIssueFifo),
        .o_free(w_Free_PmtLsuToCond10),
        .o_driveNext(o_Drive_LsuPmtToLsuIssu),
        .o_fire_1(w_LsuPmtFire)
);


reg   [4:0]  r_LsuGray_5;
reg   [4:0]  r_LsuBinnary_5;

wire  [4:0]  w_LsuBinnary_5 = LsuAddress;
wire  [4:0]  w_LsuGray_5;

assign w_LsuGray_5 = (w_LsuBinnary_5>>1) ^ w_LsuBinnary_5; 

always @(posedge w_LsuPmtFire or negedge rstn) begin
  if(!rstn) begin
  r_LsuGray_5 <= 5'b0;
  r_LsuBinnary_5 <= 5'b0;
  end
  else begin
  r_LsuGray_5 <= w_LsuBinnary_5;
  r_LsuBinnary_5 <= w_LsuGray_5;
  end
end

output wire o_LsuBinnary_5 = r_LsuBinnary_5;
output wire o_LsuGray_5 = r_LsuGray_5;


wire w_Drive_MutexToLsuEmpty;
wire w_Free_LsuEmptyToMutex;
input wire i_Drive_LsuIssueToLsuEmpty;
output wire o_Drive_LsuEmptyToLsuIssue;
wire w_Drive_Cond10ToMutexLsu;
wire w_Free_MutexLsuToCond10;



cMutexMerge2_32b MutexMergeLsu(
        .i_drive0(i_Drive_LsuIssueToLsuEmpty),
        .i_drive1(w_Drive_Cond10ToMutexLsu),
        .i_data0_32(),
        .i_data1_32(),
        .i_freeNext(w_Free_LsuEmptyToMutex),
        .rst(rstn),
        .o_free0(o_Drive_LsuEmptyToLsuIssue),
        .o_free1(w_Free_MutexLsuToCond10),
        .o_driveNext(w_Drive_MutexToLsuEmpty),
        .o_data_32(),
    );

cLastFifo2  LsuEmpty (
  .i_drive(w_Drive_MutexToLsuEmpty),   
  .rst(rstn),                
  .o_free(w_Free_LsuEmptyToMutex),           
  .o_driveNext(),  
  .o_fire_1(w_fireLsuEmpty)       
);
wire w_fireLsuEmpty;

always @(posedge w_fireLsuEmpty or negedge rstn) begin
  if(!rstn) begin
    r_LsuEmpty_1 <= 1;
  end
  else begin
  if(i_LsuReadEmpty_1==1)begin
    r_LsuEmpty_1 <= 1;
  end
  else begin
    r_LsuEmpty_1 <= 0;
  end
  end
end

LsuIssue myLsuInstance (
    .rstn(rstn_wire),
    .i_LsuCount_5(count_wire),
    .o_FreeToIssue0_1(freeToIssue0_wire),
    .o_FreeToIssue1_1(freeToIssue1_wire),
    .io_empty_1(empty_wire),
    .io_IsFirst_1(isFirst_wire),
    .i_InstructionToLsuIssue_113(instruction_wire),
    .i_DriveFromWriteBack_1(driveFromWriteBack_wire),
    .o_FreeToWriteBack_1(freeToWriteBack_wire),
    .i_DriveFromIssue_1(driveFromIssue_wire),
    .o_FreeToIssue_1(freeToIssue_wire),
    .i_FreeBypassFifoToLsuIssue(fifoToLsuIssue_wire),
    .o_DriveLsuIssueToBypassFifo(driveLsuIssueToBypassFifo_wire),
    .i_DriveBypassFifoToLsuIssue(driveBypassFifoToLsuIssue_wire),
    .o_FreeLsuIssueToBypassBuffer(freeLsuIssueToBypassBuffer_wire)
);


endmodule