module depCheck (
    input           rstn,
    input           i_driveFromDecoder_1,
    output          o_freeToDecoder_1,
 
    input   [104:0] i_uopcoder0_105,
    input   [104:0] i_uopcoder1_105,
    input   [104:0] i_uopcoder2_105,
    input   [104:0] i_uopcoder3_105,
    input   [104:0] i_uopcoder4_105,
    input   [104:0] i_uopcoder5_105,
    input   [104:0] i_uopcoder6_105,
    input   [104:0] i_uopcoder7_105,
    input   [104:0] i_uopcoder8_105,
 

input wire i_FreeFromBranch;
output wire o_DriveFromDep;

    
output wire [112:0] o_InstructionToBranch0_113;
output wire [112:0] o_InstructionToBranch1_113;
output wire [112:0] o_InstructionToBranch2_113;
output wire [112:0] o_InstructionToBranch3_113;
output wire [112:0] o_InstructionToBranch4_113;
output wire [112:0] o_InstructionToBranch5_113;
output wire [112:0] o_InstructionToBranch6_113;
output wire [112:0] o_InstructionToBranch7_113;
output wire [112:0] o_InstructionToBranch8_113;
output wire [112:0] o_InstructionToBranch9_113;
output wire [112:0] o_InstructionToBranch10_113;
output wire [112:0] o_InstructionToBranch11_113;
output wire [112:0] o_InstructionToBranch12_113;
output wire [112:0] o_InstructionToBranch13_113;
output wire [112:0] o_InstructionToBranch14_113;
output wire [112:0] o_InstructionToBranch15_113;

);
     
    wire    o_driveNext1,i_freeNext1;
    wire [1:0] w_fire1_2;
    wire [1:0] w_fire0_2;
    wire [112:0]  w_inst0_113;
    wire [112:0]  w_inst1_113;
    wire [112:0]  w_inst2_113;
    wire [112:0]  w_inst3_113;
    wire [112:0]  w_inst4_113;
    wire [112:0]  w_inst5_113;
    wire [112:0]  w_inst6_113;
    wire [112:0]  w_inst7_113;
    wire [112:0]  w_inst8_113;
    wire [112:0]  w_inst9_113;
    wire [112:0]  w_inst10_113;
    wire [112:0]  w_inst11_113;
    wire [112:0]  w_inst12_113;
    wire [112:0]  w_inst13_113;
    wire [112:0]  w_inst14_113;
    wire [112:0]  w_inst15_113;

    reg  [112:0]  r_inst_113 [0:3];
   

    reg    [4:0]   srcl[0:3];
    reg    [4:0]   srcr[0:3];
    reg    [4:0]   dest[0:3];
    reg            srclValid[0:3];
    reg            srcrValid[0:3];
    reg            destValid[0:3];
    reg    [3:0]   index[0:3];
    reg    [15:0]   r_rawDepl[0:3];
    reg    [15:0]   r_rawDepr[0:3];


    wire w_fire11;
    wire w_fire12;
    wire w_fire01;
    wire w_fire02;

    reg r_counter;
   wire w_Drive_from_Fifo0;
   wire w_Free_To_Fifo0;
   
    
    cFifo2  cFifo0(
        .i_drive(i_driveFromDecoder_1),
        .i_freeNext(w_Free_To_Fifo0),
        .rst(rstn),
        .o_free(o_freeToDecoder_1),
        .o_driveNext(w_Drive_from_Fifo0),
        .o_fire_2(w_fire0_2)
    );
{w_fire01,w_fire02} = w_fire0_2;

 reg [104:0] r_Insruction [0:4] ;

    
always @(posedge w_fire01 or negedge rstn)begin
       if(!rstn) begin
     dest[0]       = 0;
     srcr[0]      = 0;
     srcl[0]      = 0;
     destValid[0] = 0;
     srcrValid[0] = 0;
     srclValid[0] = 0;
     index[0]     = 0;
     dest[1]      = 0;
     srcr[1]      = 0;
     srcl[1]      = 0;
     destValid[1] = 0;
     srcrValid[1] = 0;
     srclValid[1] = 0;
     index[1]     = 0;
     dest[2]      = 0;
     srcr[2]      = 0;
     srcl[2]      = 0;
     destValid[2] = 0;
     srcrValid[2] = 0;
     srclValid[2] = 0;
     index[2]     = 0;
     dest[3]      = 0;
     srcr[3]      = 0;
     srcl[3]      = 0;
     destValid[3] = 0;
     srcrValid[3] = 0;
     srclValid[3] = 0;
     index[3]     = 0;
     dest[4]      = 0;
     srcr[4]      = 0;
     srcl[4]      = 0;
     destValid[4] = 0;
     srcrValid[4] = 0;
     srclValid[4] = 0;
     index[4]     = 0;
     dest[5]      = 0;
     srcr[5]      = 0;
     srcl[5]      = 0;
     destValid[5] = 0;
     srcrValid[5] = 0;
     srclValid[5] = 0;
     index[5]     = 0;
     dest[6]      = 0;
     srcr[6]      = 0;
     srcl[6]      = 0;
     destValid[6] = 0;
     srcrValid[6] = 0;
     srclValid[6] = 0;
     index[6]     = 0;
     dest[7]      =0;
     srcr[7]      = 0;
     srcl[7]      = 0;
     destValid[7] = 0;
     srcrValid[7] = 0;
     srclValid[7] = 0;
     index[7]     = 0;
     dest[8]       = 0;
     srcr[8]       = 0;
     srcl[8]       = 0;
     destValid[8]  = 0;
     srcrValid[8]  = 0;
     srclValid[8]  = 0;
     index[8]      = 0;
     dest[9]       = 0;
     srcr[9]       = 0;
     srcl[9]       = 0;
     destValid[9]  = 0;
     srcrValid[9]  = 0;
     srclValid[9]  =0;
     index[9]      = 0;
     dest[10]      = 0;
     srcr[10]      = 0;
     srcl[10]      = 0;
     destValid[10] = 0;
     srcrValid[10] = 0;
     srclValid[10] = 0;
     index[10]     = 0;
     dest[11]      = 0;
     srcl[11]      = 0;
     destValid[11] = 0;
     srcrValid[11] = 0;
     srclValid[11] = 0;
     index[11]     = 0;
     dest[12]      = 0;
     srcr[12]      = 0;
     srcl[12]      = 0;
     destValid[12] = 0;
     srcrValid[12] = 0;
     srclValid[12] = 0;
     index[12]     = 0;
     dest[13]      = 0;
     srcr[13]      = 0;
     srcl[13]      = 0;
     destValid[13] = 0;
     srcrValid[13] = 0;
     srclValid[13] = 0;
     index[13]     = 0;
     dest[14]      = 0;
     srcr[14]      = 0;
     srcl[14]      = 0;
     destValid[14] = 0;
     srcrValid[14] = 0;
     srclValid[14] = 0;
     index[14]     = 0;
     dest[15]      = 0;
     srcr[15]      = 0;
     srcl[15]      = 0;
     destValid[15] = 0;
     srcrValid[15] = 0;
     srclValid[15] = 0;
     index[15]     = 0;
     r_Insruction[0] = 0;
     r_Insruction[1] = 0;
     r_Insruction[2] = 0;
     r_Insruction[3] = 0;
     r_Insruction[4] = 0;
     r_Insruction[5] = 0;
     r_Insruction[6] = 0;
     r_Insruction[7] = 0;
     r_Insruction[8] = 0;
     r_Insruction[9] = 0;
     r_Insruction[10] = 0;
     r_Insruction[11] = 0;
     r_Insruction[12] = 0;
     r_Insruction[13] = 0;
     r_Insruction[14] = 0;
     r_Insruction[15] = 0;
    end
    else if(r_counter==0) begin
     dest[0]         = i_uopcoder0_105[4:0];
     srcr[0]      = i_uopcoder0_105[9:5];
     srcl[0]      = i_uopcoder0_105[14:10];
     destValid[0] = i_uopcoder0_105[15];
     srcrValid[0] = i_uopcoder0_105[16];
     srclValid[0] = i_uopcoder0_105[17];
     index[0]     = i_uopcoder0_105[65:62];
     dest[1]      = i_uopcoder1_105[4:0];
     srcr[1]      = i_uopcoder1_105[9:5];
     srcl[1]      = i_uopcoder1_105[14:10];
     destValid[1] = i_uopcoder1_105[15];
     srcrValid[1] = i_uopcoder1_105[16];
     srclValid[1] = i_uopcoder1_105[17];
     index[1]     = i_uopcoder1_105[65:62];
     dest[2]      = i_uopcoder2_105[4:0];
     srcr[2]      = i_uopcoder2_105[9:5];
     srcl[2]      = i_uopcoder2_105[14:10];
     destValid[2] = i_uopcoder2_105[15];
     srcrValid[2] = i_uopcoder2_105[16];
     srclValid[2] = i_uopcoder2_105[17];
     index[2]     = i_uopcoder2_105[65:62];
     dest[3]      = i_uopcoder3_105[4:0];
     srcr[3]      = i_uopcoder3_105[9:5];
     srcl[3]      = i_uopcoder3_105[14:10];
     destValid[3] = i_uopcoder3_105[15];
     srcrValid[3] = i_uopcoder3_105[16];
     srclValid[3] = i_uopcoder3_105[17];
     index[3]     = i_uopcoder3_105[65:62];
     dest[4]      = i_uopcoder4_105[4:0];
     srcr[4]      = i_uopcoder4_105[9:5];
     srcl[4]      = i_uopcoder4_105[14:10];
     destValid[4] = i_uopcoder4_105[15];
     srcrValid[4] = i_uopcoder4_105[16];
     srclValid[4] = i_uopcoder4_105[17];
     index[4]     = i_uopcoder4_105[65:62];
     dest[5]      = i_uopcoder5_105[4:0];
     srcr[5]      = i_uopcoder5_105[9:5];
     srcl[5]      = i_uopcoder5_105[14:10];
     destValid[5] = i_uopcoder5_105[15];
     srcrValid[5] = i_uopcoder5_105[16];
     srclValid[5] = i_uopcoder5_105[17];
     index[5]     = i_uopcoder5_105[65:62];
     dest[6]      = i_uopcoder6_105[4:0];
     srcr[6]      = i_uopcoder6_105[9:5];
     srcl[6]      = i_uopcoder6_105[14:10];
     destValid[6] = i_uopcoder6_105[15];
     srcrValid[6] = i_uopcoder6_105[16];
     srclValid[6] = i_uopcoder6_105[17];
     index[6]     = i_uopcoder6_105[65:62];
     dest[7]      = i_uopcoder7_105[4:0];
     srcr[7]      = i_uopcoder7_105[9:5];
     srcl[7]      = i_uopcoder7_105[14:10];
     destValid[7] = i_uopcoder7_105[15];
     srcrValid[7] = i_uopcoder7_105[16];
     srclValid[7] = i_uopcoder7_105[17];
     index[7]     = i_uopcoder7_105[65:62];
     r_Insruction[0] = i_uopcoder0_105;
     r_Insruction[1] = i_uopcoder1_105;
     r_Insruction[2] = i_uopcoder2_105;
     r_Insruction[3] = i_uopcoder3_105;
     r_Insruction[4] = i_uopcoder4_105;
     r_Insruction[5] = i_uopcoder5_105;
     r_Insruction[6] = i_uopcoder6_105;
     r_Insruction[7] = i_uopcoder7_105;
    end
else begin
    dest[8]       = i_uopcoder0_105[4:0];
     srcr[8]       = i_uopcoder0_105[9:5];
     srcl[8]       = i_uopcoder0_105[14:10];
     destValid[8]  = i_uopcoder0_105[15];
     srcrValid[8]  = i_uopcoder0_105[16];
     srclValid[8]  = i_uopcoder0_105[17];
     index[8]      = i_uopcoder0_105[65:62];
     dest[9]       = i_uopcoder1_105[4:0];
     srcr[9]       = i_uopcoder1_105[9:5];
     srcl[9]       = i_uopcoder1_105[14:10];
     destValid[9]  = i_uopcoder1_105[15];
     srcrValid[9]  = i_uopcoder1_105[16];
     srclValid[9]  = i_uopcoder1_105[17];
     index[9]      = i_uopcoder1_105[65:62];
     dest[10]      = i_uopcoder2_105[4:0];
     srcr[10]      = i_uopcoder2_105[9:5];
     srcl[10]      = i_uopcoder2_105[14:10];
     destValid[10] = i_uopcoder2_105[15];
     srcrValid[10] = i_uopcoder2_105[16];
     srclValid[10] = i_uopcoder2_105[17];
     index[10]     = i_uopcoder2_105[65:62];
     dest[11]      = i_uopcoder3_105[4:0];
     srcr[11]      = i_uopcoder3_105[9:5];
     srcl[11]      = i_uopcoder3_105[14:10];
     destValid[11] = i_uopcoder3_105[15];
     srcrValid[11] = i_uopcoder3_105[16];
     srclValid[11] = i_uopcoder3_105[17];
     index[11]     = i_uopcoder3_105[65:62];
     dest[12]      = i_uopcoder4_105[4:0];
     srcr[12]      = i_uopcoder4_105[9:5];
     srcl[12]      = i_uopcoder4_105[14:10];
     destValid[12] = i_uopcoder4_105[15];
     srcrValid[12] = i_uopcoder4_105[16];
     srclValid[12] = i_uopcoder4_105[17];
     index[12]     = i_uopcoder4_105[65:62];
     dest[13]      = i_uopcoder5_105[4:0];
     srcr[13]      = i_uopcoder5_105[9:5];
     srcl[13]      = i_uopcoder5_105[14:10];
     destValid[13] = i_uopcoder5_105[15];
     srcrValid[13] = i_uopcoder5_105[16];
     srclValid[13] = i_uopcoder5_105[17];
     index[13]     = i_uopcoder5_105[65:62];
     dest[14]      = i_uopcoder6_105[4:0];
     srcr[14]      = i_uopcoder6_105[9:5];
     srcl[14]      = i_uopcoder6_105[14:10];
     destValid[14] = i_uopcoder6_105[15];
     srcrValid[14] = i_uopcoder6_105[16];
     srclValid[14] = i_uopcoder6_105[17];
     index[14]     = i_uopcoder6_105[65:62];
     dest[15]      = i_uopcoder7_105[4:0];
     srcr[15]      = i_uopcoder7_105[9:5];
     srcl[15]      = i_uopcoder7_105[14:10];
     destValid[15] = i_uopcoder7_105[15];
     srcrValid[15] = i_uopcoder7_105[16];
     srclValid[15] = i_uopcoder7_105[17];
     index[15]     = i_uopcoder7_105[65:62];
    r_Insruction[8] = i_uopcoder0_105;
     r_Insruction[9] = i_uopcoder1_105;
     r_Insruction[10] = i_uopcoder2_105;
     r_Insruction[11] = i_uopcoder3_105;
     r_Insruction[12] = i_uopcoder4_105;
     r_Insruction[13] = i_uopcoder5_105;
     r_Insruction[14] = i_uopcoder6_105;
     r_Insruction[15] = i_uopcoder7_105;
end
end


always@(posedge w_fire02 or negedge rstn) begin
    if(!rstn) begin
        r_counter <= 1'b0;
    end
    else begin
        r_counter = r_counter + 1'b1;
    end
end

wire w_Drive_From_Fifo1;
wire w_Free_To_Fifo1;


 cFifo2  cFifo1(
        .i_drive(w_Drive_from_Fifo0),
        .i_freeNext(w_Free_To_Fifo1),
        .rst(rstn),
        .o_free(w_Free_To_Fifo0),
        .o_driveNext(w_Drive_From_Fifo1),
        .o_fire_2(w_fire1_2)
    );
{w_fire11,w_fire12} = w_fire1_2;


reg [3:0] r_DepL [0:3];
reg [3:0] r_DepR [0:3];


always@(posedge w_fire11 or negedge rstn)begin
integer   j;
integer   k;
if(!rstn) begin
for(j=1;j<16;j=j+1)begin
for(k=0;k<16;k=k+1)begin
        r_rawDepr[k][j]   <=  1'b0;
        r_rawDepl[k][j]   <=  1'b1;
    end
end
end
for(j=1;j<16;j=j+1)begin
for(k=0;k<16;k=k+1)begin
        if(srcl[j]==dest[k] && srclValid[j]!=0 && destValid[k]!=0)begin
            r_rawDepl[k][j]   <= 1'b1;
        end
        else begin
            r_rawDepl[k][j]   <= 1'b0;
        end
        if(srcr[j]==dest[k] && srcrValid[j]!=0 && destValid[k]!=0)begin
            r_rawDepr[k][j]   <=  1'b0;
        end
        else begin
            r_rawDepr[k][j]   <=  1'b0
        end
    end
end
end


always@(posedge w_fire12 or negedge rstn)begin
integer  i;
if(!rstn)begin
    for(i=0;i<16;i=i+1)begin
        r_DepR[i] <=4'hF;
        r_DepL[i] <=4'hF;
    end
end

for(i=0;i<16;i=i+1)begin
    case(r_rawDepl[i])
    16'b01xx_xxxx_xxxx_xxxx:begin r_DepL[i] <= 4'hE end;
    16'b001x_xxxx_xxxx_xxxx:begin r_DepL[i] <= 4'hD end;
    16'b0001_xxxx_xxxx_xxxx:begin r_DepL[i] <= 4'hC end;
    16'b0000_1xxx_xxxx_xxxx:begin r_DepL[i] <= 4'hB end;
    16'b0000_01xx_xxxx_xxxx:begin r_DepL[i] <= 4'hA end;
    16'b0000_001x_xxxx_xxxx:begin r_DepL[i] <= 4'h9 end;
    16'b0000_0000_1xxx_xxxx:begin r_DepL[i] <= 4'h8 end;
    16'b0000_0000_01xx_xxxx:begin r_DepL[i] <= 4'h7 end;
    16'b0000_0000_001x_xxxx:begin r_DepL[i] <= 4'h6 end;
    16'b0000_0000_0001_xxxx:begin r_DepL[i] <= 4'h5 end;
    16'b01xx_0000_0000_1xxx:begin r_DepL[i] <= 4'h4 end;
    16'b0000_0000_0000_01xx:begin r_DepL[i] <= 4'h3 end;
    16'b0000_0000_0000_001x:begin r_DepL[i] <= 4'h2 end;
    16'b0000_0000_0000_0001:begin r_DepL[i] <=4'h1  end;
    default:r_DepL[i] <= 4'hF;
endcase
    case(r_rawDepr[i])
    16'b01xx_xxxx_xxxx_xxxx:begin r_DepR[i] <= 4'hE end;
    16'b001x_xxxx_xxxx_xxxx:begin r_DepR[i] <= 4'hD end;
    16'b0001_xxxx_xxxx_xxxx:begin r_DepR[i] <= 4'hC end;
    16'b0000_1xxx_xxxx_xxxx:begin r_DepR[i] <= 4'hB end;
    16'b0000_01xx_xxxx_xxxx:begin r_DepR[i] <= 4'hA end;
    16'b0000_001x_xxxx_xxxx:begin r_DepR[i] <= 4'h9 end;
    16'b0000_0000_1xxx_xxxx:begin r_DepR[i] <= 4'h8 end;
    16'b0000_0000_01xx_xxxx:begin r_DepR[i] <= 4'h7 end;
    16'b0000_0000_001x_xxxx:begin r_DepR[i] <= 4'h6 end;
    16'b0000_0000_0001_xxxx:begin r_DepR[i] <= 4'h5 end;
    16'b01xx_0000_0000_1xxx:begin r_DepR[i] <= 4'h4 end;
    16'b0000_0000_0000_01xx:begin r_DepR[i] <= 4'h3 end;
    16'b0000_0000_0000_001x:begin r_DepR[i] <= 4'h2 end;
    16'b0000_0000_0000_0001:begin r_DepR[i] <= 4'h1 end;
    default:r_DepR[i] <= 4'hF;
endcase
    end
end



    /*package*/
        assign w_inst0_113 = {r_Insruction[0],r_DepL[0],r_DepR[0]};
        assign w_inst1_113 = {r_Insruction[1],r_DepL[1],r_DepR[1]};
        assign w_inst2_113 = {r_Insruction[2],r_DepL[2],r_DepR[2]};
        assign w_inst3_113 = {r_Insruction[3],r_DepL[3],r_DepR[3]};
        assign w_inst4_113 = {r_Insruction[4],r_DepL[4],r_DepR[4]};
        assign w_inst5_113 = {r_Insruction[5],r_DepL[5],r_DepR[5]};
        assign w_inst6_113 = {r_Insruction[6],r_DepL[6],r_DepR[6]};
        assign w_inst7_113 = {r_Insruction[7],r_DepL[7],r_DepR[7]};
        assign w_inst8_113 = {r_Insruction[8],r_DepL[8],r_DepR[8]};
        assign w_inst9_113 = {r_Insruction[9],r_DepL[9],r_DepR[9]};
        assign w_inst10_113 = {r_Insruction[10],r_DepL[10],r_DepR[10]};
        assign w_inst11_113 = {r_Insruction[11],r_DepL[11],r_DepR[11]};
        assign w_inst12_113 = {r_Insruction[12],r_DepL[12],r_DepR[12]};
        assign w_inst13_113 = {r_Insruction[13],r_DepL[13],r_DepR[13]};
        assign w_inst14_113 = {r_Insruction[14],r_DepL[14],r_DepR[14]};
        assign w_inst15_113 = {r_Insruction[15],r_DepL[15],r_DepR[15]};


wire w_fire2;


 cFifo1 cFifo2(
       .i_drive(w_Drive_From_Fifo1),
       .i_freeNext(i_FreeFromBranch),
       .rst(rstn),
       .o_free(w_Free_To_Fifo1),
       .o_driveNext(o_DriveFromDep),
       .o_fire_1(w_fire2)
);



always @(posedge w_fire2 or negedge rstn) begin
        if(!rstn) begin
            r_inst0_113   <=  113'h0;
            r_inst1_113   <=  113'h0;
            r_inst2_113   <=  113'h0;
            r_inst3_113   <=  113'h0;
            r_inst4_113   <=  113'h0;
            r_inst5_113   <=  113'h0;
            r_inst6_113   <=  113'h0;
            r_inst7_113   <=  113'h0;
            r_inst8_113   <=  113'h0;
            r_inst9_113   <=  113'h0;
            r_inst10_113   <=  113'h0;
            r_inst11_113   <=  113'h0;
            r_inst12_113   <=  113'h0;
            r_inst13_113   <=  113'h0;
            r_inst14_113   <=  113'h0;
            r_inst15_113   <=  113'h0;
        end
        else begin
            r_inst0_113   <=  w_inst0_113;
            r_inst1_113   <=  w_inst1_113;
            r_inst2_113   <=  w_inst2_113;
            r_inst3_113   <=  w_inst3_113;
            r_inst4_113   <=  w_inst4_113;
            r_inst5_113   <=  w_inst5_113;
            r_inst6_113   <=  w_inst6_113;
            r_inst7_113   <=  w_inst7_113;
            r_inst8_113   <=  w_inst8_113;
            r_inst9_113   <=  w_inst9_113;
            r_inst10_113   <=  w_inst10_113;
            r_inst11_113   <=  w_inst11_113;
            r_inst12_113   <=  w_inst12_113;
            r_inst13_113   <=  w_inst13_113;
            r_inst14_113   <=  w_inst14_113;
            r_inst15_113   <=  w_inst15_113;
            o_InstructionToBranch0_113   <=  r_inst0_113;
            o_InstructionToBranch1_113   <=  r_inst1_113;
            o_InstructionToBranch2_113   <=  r_inst2_113;
            o_InstructionToBranch3_113   <=  r_inst3_113;
            o_InstructionToBranch4_113   <=  r_inst4_113;
            o_InstructionToBranch5_113   <=  r_inst5_113;
            o_InstructionToBranch6_113   <=  r_inst6_113;
            o_InstructionToBranch7_113   <=  r_inst7_113;
            o_InstructionToBranch8_113   <=  r_inst8_113;
            o_InstructionToBranch9_113   <=  r_inst9_113;
            o_InstructionToBranch10_113   <=  r_inst10_113;
            o_InstructionToBranch11_113   <=  r_inst11_113;
            o_InstructionToBranch12_113   <=  r_inst12_113;
            o_InstructionToBranch13_113   <=  r_inst13_113;
            o_InstructionToBranch14_113   <=  r_inst14_113;
            o_InstructionToBranch15_113   <=  r_inst15_113;
            end
end


endmodule 