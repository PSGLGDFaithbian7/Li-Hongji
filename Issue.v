`timescale 1ns / 1ps

module Issue(
        input rstn,

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

wire  [4:0]  w_LsuGrayNext_5;
wire  [4:0]  w_LsuBinnaryNext_5;
reg   [4:0]  r_LsuGray_5;
reg   [4:0]  r_LsuBinnary_5;
wire  [3:0]  w_LsuAddress_4 = r_LsuBinnary_5[3:0];

assign w_LsuBinnaryNext_5  = r_LsuBinnary_5 + 5'b00001;
assign w_LsuGrayNext_5 = (w_LsuBinnaryNext_5>>1) ^ w_LsuBinnaryNext_5; 





always@(posedge  w_fire01_1 or negedge rstn ) begin
if(!rstn)begin
r_LsuGray_5 <= 5'b0;
r_LsuBinnary_5 <= 5'b0;
r_CsrGray_5 <= 5'b0;
r_CsrBinnary_5 <= 5'b0;

r_IsFirst_1 <= 1'b1;
r_IsFirst_1 <= 1'b1;
r_CsrEmpty_1 <= 1'b1;
end
else begin
if ( r_IsFirst_1 == 1'b1 ) begin
  for (integer i=0 ;i<16;i++)  begin
        if(i <= r_BranchFirst_4) begin
            if(w_AllOpcode_142[6+7*i:7*i]==7'b0101111 ||w_AllOpcode_142[6+7*i:7*i]== 7'b0000011 || w_AllOpcode_142[6+7*i:7*i]== 7'b0101111) begin
            LSAIssue[r_LsuAddress_4] <= w_AllInstruction_1147[72+73*i,73*i];  
            r_LsuAddress_4  <= r_LsuAddress_4 + 1'b1;
            r_LsuBinnary_5 <= w_LsuBinnaryNext_5;
            r_LsuGray_5 <= w_LsuGrayNext_5;
            if(r_LsuEmpty_1 == 1'b1) begin
                r_LsuEmpty_1 <= 0'b0;
            end
            else begin
                r_LsuEmpty_1 <= 0'b0;
            end
           
        
            end
        else if(w_AllOpcode_142[6+7*i:7*i]== 7'b1110011 ) begin
            CSRIssue[r_CsrAddresss_4]  <= w_AllInstruction_1147[72+73*i,73*i];  
            r_CsrAddresss_4 <= r_CsrAddresss_4 + 1'b1;
            r_CsrBinnary_5 <= w_CsrBinnaryNext_5;
            r_CsrGray_5 <= w_CsrGrayNext_5;
            if(r_CsrEmpty_1 == 1'b1) begin
                r_CsrEmpty_1 <= 0'b0;
            end
            else begin
                r_CsrEmpty_1 <= 0'b0;
            end
            end
        else  begin
            ALUIssue[i] <= w_AllInstruction_1147[72+73*i,73*i];  
            end

            r_IsFirst_1 <= 1'b0;

        end
     else begin
          
            if(w_AllOpcode_142[6+7*i:7*i]==7'b0101111 ||w_AllOpcode_142[6+7*i:7*i]== 7'b0000011 || w_AllOpcode_142[6+7*i:7*i]== 7'b0101111) begin
            LSAIssue[r_LsuAddress_4] <= 32'b0;  
    
            end
        else if(w_AllOpcode_142[6+7*i:7*i]== 7'b1110011 ) begin
            CSRIssue[r_CsrAddresss_4]  <= 32'b0;  
            end
        else  begin
            ALUIssue[i] <= 32'b0;  
            end
        end
     end
  end
end
else begin
for (integer i=0 ;i<16;i++)  begin
        if(i >= r_BranchStart_4 || i <=  r_BranchStop_4) begin
            if(w_AllOpcode_142[6+7*i:7*i]== 7'b0101111||w_AllOpcode_142[6+7*i:7*i]== 7'b0000011 ||w_AllOpcode_142[6+7*i:7*i]== 7'b0101111 ) begin
            r_LsuAddress_4 <= r_LsuAddress_4 + 1'b1;
            integer j=r_LsuAddress_4;
            LSAIssue[j]<= w_AllInstruction_1147[72+73*i,73*i];  
            end
        else if(w_AllOpcode_142[6+7*i:7*i]== 7'b1110011 ) begin
                r_CsrAddresss_4 <= r_CsrAddresss_4 + 1'b1;
            integer j=r_CsrAddresss_4;
            CSRIssue[j] <= w_AllInstruction_1147[72+73*i,73*i];  
            end
         else  begin
            ALUIssue[i] <= w_AllInstruction_1147[72+73*i,73*i];  
            end   
        end
        else begin

            if(w_AllOpcode_142[6+7*i:7*i]== 7'b0101111||w_AllOpcode_142[6+7*i:7*i]== 7'b0000011 ||w_AllOpcode_142[6+7*i:7*i]== 7'b0101111 ) begin
          
            LSAIssue[i]<= LSAIssue[i];  
            end
        else if(w_AllOpcode_142[6+7*i:7*i]== 7'b1110011 ) begin
         
            CSRIssue[j] <= w_AllInstruction_1147[72+73*i,73*i];  
            end
         else  begin
            ALUIssue[i] <= w_AllInstruction_1147[72+73*i,73*i];  
            end   

        end
   end
 end
end




 
endmodule