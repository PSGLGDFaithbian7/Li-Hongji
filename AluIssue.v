`timescale 1ns / 1ps

module ALUIssue(
input wire  i_DriveFromGRF_1,
input wire  rstn,
input wire  i_DriveToAluIssue_1,
input reg  [112:0] i_InstructionToAluIssue_113,
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
   

)
 
wire w_Rs1Valid_1 = i_InstructionToAluIssue_113[68];
wire w_Rs2Valid_1 = i_InstructionToAluIssue_113[68];
wire [3:0] w_dep1_4 = i_InstructionToAluIssue_113[107:103];
wire [3:0] w_dep2_4 = i_InstructionToAluIssue_113[112:108];
wire [31:0] w_immediate_32 = i_InstructionToAluIssue_113[53:22];
wire [4:0] w_Rs1_5 = i_InstructionToAluIssue_113[68:64];
wire [4:0] w_Rs2_5 =  i_InstructionToAluIssue_113[63:59];


wire w_fire0_1;

cFifo1 cFifoToGrf(
     .i_drive(i_DriveFromIssueTop_1),
     .i_freeNext(i_FreeFromGRF_1),
     .rst(rstn),
     .o_free(o_FreeToIssueTop_1),
     .o_driveNext(o_DriveToGRF_1),
     .o_fire_1(w_fire0_1)
)
;




//BYpass 

   wire [19:0]  w_DriveFromBypassL_20;
   wire [19:0]  w_FreeToBypassL_20;
   wire [19:0]  w_DriveToMutexMerge0L_20
   wire [19:0]  w_BypassSelectL_20
   wire [19:0]  w_FreeFromMutexMerge0L_20;
   
   wire [19:0]  w_DriveFromBypassR_20;
   wire [19:0]  w_FreeToBypassR_20;
   wire [19:0]  w_DriveToMutexMerge0R_20
   wire [19:0]  w_BypassSelectR_20
   wire [19:0]  w_FreeFromMutexMerge0R_20;


 assign w_DriveFromBypassL_20={i_DriveFromBypass0L_1,i_DriveFromBypass1L_1, i_DriveFromBypass2L_1,i_DriveFromBypass3L_1,i_DriveFromBypass4L_1,
                                 i_DriveFromBypass5L_1,i_DriveFromBypass6L_1,i_DriveFromBypass7L_1,i_DriveFromBypass8L_1,i_DriveFromBypass9L_1,
                                 i_DriveFromBypass10L_1,i_DriveFromBypass11L_1, i_DriveFromBypass12L_1,i_DriveFromBypass13L_1,i_DriveFromBypass14L_1,
                                 i_DriveFromBypass15L_1,i_DriveFromBypassLsuL_1,i_DriveFromBypassCsrL_1,i_DriveFromBypassMulL_1,i_DriveFromBypassDivL_1};

   assign{ o_FreeToBypass0L_1,o_FreeToBypass1L_1,o_FreeToBypass2L_1,o_FreeToBypass3L_1,o_FreeToBypass4L_1,
                               o_FreeToBypass5L_1,o_FreeToBypass6L_1,o_FreeToBypass7L_1,o_FreeToBypass8L_1,o_FreeToBypass9L_1,o_FreeToBypass10L_1,
                               o_FreeToBypass11L_1,o_FreeToBypass12L_1,o_FreeToBypass13L_1,o_FreeToBypass14L_1,o_FreeToBypass15L_1,o_FreeToBypassLsuL_1,
                               o_FreeToBypassCsrL_1,o_FreeToBypassMulL_1,o_FreeToBypassDivL_1,} = w_FreeToBypassL_20;

   assign w_DriveFromBypassR_20={i_DriveFromBypass0R_1,i_DriveFromBypass1R_1, i_DriveFromBypass2R_1,i_DriveFromBypass3R_1,i_DriveFromBypass4R_1,
                                 i_DriveFromBypass5R_1,i_DriveFromBypass6R_1,i_DriveFromBypass7R_1,i_DriveFromBypass8R_1,i_DriveFromBypass9R_1,
                                 i_DriveFromBypass10R_1,i_DriveFromBypass11R_1, i_DriveFromBypass12R_1,i_DriveFromBypass13R_1,i_DriveFromBypass14R_1,
                                 i_DriveFromBypass15R_1,i_DriveFromBypassLsuR_1,i_DriveFromBypassCsrR_1,i_DriveFromBypassMulR_1,i_DriveFromBypassDivR_1};

    assign { o_FreeToBypass0R_1,o_FreeToBypass1R_1,o_FreeToBypass2R_1,o_FreeToBypass3R_1,o_FreeToBypass4R_1,
                               o_FreeToBypass5R_1,o_FreeToBypass6R_1,o_FreeToBypass7R_1,o_FreeToBypass8R_1,o_FreeToBypass9R_1,o_FreeToBypass10R_1,
                               o_FreeToBypass11R_1,o_FreeToBypass12R_1,o_FreeToBypass13R_1,o_FreeToBypass14R_1,o_FreeToBypass15R_1,o_FreeToBypassLsuR_1,
                               o_FreeToBypassCsrR_1,o_FreeToBypassMulR_1,o_FreeToBypassDivR_1,} =w_FreeToBypassR_20;

   

wire   w_DriveToBypassPmtFifoL_1;
wire   w_FreeFromBypassPmtFifoL_1;
wire   w_DriveToBypassPmtFifoR_1;
wire   w_FreeFromBypassPmtFifoR_1;



generate
    genvar j;
    for(j=0;i<16;i=i+1) begin:SelectData1
    assign
          assign w_BypassSelectL_20[i]=  (w_dep1_4 ==i) ? 1'b1 : 1'b0;
    end
endgenerate
    assign w_BypassSelectL_20[16]=  (w_dep1_4 ==i_IndexFromLSU) ? 1'b1 : 1'b0;
    assign w_BypassSelectL_20[17]=  (w_dep1_4 ==i_IndexFromCSR) ? 1'b1 : 1'b0;
    assign w_BypassSelectL_20[20]=  (w_dep1_4 ==i_IndexFromMul) ? 1'b1 : 1'b0;
    assign w_BypassSelectL_20[19]=  (w_dep1_4 ==i_IndexFromDiv) ? 1'b1 : 1'b0;


  generate
        genvar i; 
        for(i=0; i<16; i=i+1) begin:Bypass_FIFO_L
            cPmtFifo1 BypassFifo (
            .i_drive(w_DriveFromBypassL_20[i]),
            .i_freeNext(w_FreeFromMutexMerge0L_1), 
            .rst(rstn),
            .pmt(w_BypassSelectL_20[i]),
            .o_free(w_FreeToBypassL_20[i]),
            .o_driveNext(w_DriveToMutexMerge0L_20[i]),
            .o_fire_1()
        );
        end
    endgenerate


 cPmtFifo1 BypassFifo_LSU_L (
            .i_drive(w_DriveFromBypassL_20[16]),
            .i_freeNext(w_FreeFromMutexMerge0L_1), 
            .rst(rstn),
            .pmt(w_BypassSelectL_20[16]),
            .o_free(w_FreeToBypassL_20[16]),
            .o_driveNext(w_DriveToMutexMerge0L_20[16]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_CSR_L (
            .i_drive(w_DriveFromBypassL_20[17]),
            .i_freeNext(w_FreeFromMutexMerge0L_1), 
            .rst(rstn),
            .pmt(w_BypassSelectL_20[17]),
            .o_free(w_FreeToBypassL_20[17]),
            .o_driveNext(w_DriveToMutexMerge0L_20[17]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_Div_L (
            .i_drive(w_DriveFromBypassL_20[20]),
            .i_freeNext(w_FreeFromMutexMerge0L_1), 
            .rst(rstn),
            .pmt(w_BypassSelectL_20[20]),
            .o_free(w_FreeToBypassL_20[20]),
            .o_driveNext(w_DriveToMutexMerge0L_20[20]),
            .o_fire_1()
        );
    
     cPmtFifo1 BypassFifo_Mul_L (
            .i_drive(w_DriveFromBypassL_20[19]),
            .i_freeNext(w_FreeFromMutexMerge0L_1), 
            .rst(rstn),
            .pmt(w_BypassSelectL_20[19]),
            .o_free(w_FreeToBypassL_20[19]),
            .o_driveNext(w_DriveToMutexMerge0L_20[19]),
            .o_fire_1()
        );


   cMutexMerge20_32b MutexMerge0L(
        .i_drive0(w_DriveToMutexMerge0L_20[0]),
        .i_drive1(w_DriveToMutexMerge0L_20[1]),
        .i_drive2(w_DriveToMutexMerge0L_20[2]),
        .i_drive3(w_DriveToMutexMerge0L_20[3]),
        .i_drive4(w_DriveToMutexMerge0L_20[4]),
        .i_drive5(w_DriveToMutexMerge0L_20[5]),
        .i_drive6(w_DriveToMutexMerge0L_20[6]),
        .i_drive7(w_DriveToMutexMerge0L_20[7]),
        .i_drive8(w_DriveToMutexMerge0L_20[8]),
        .i_drive9(w_DriveToMutexMerge0L_20[9]),
        .i_drive10(w_DriveToMutexMerge0L_20[10]),
        .i_drive11(w_DriveToMutexMerge0L_20[11]),
        .i_drive12(w_DriveToMutexMerge0L_20[12]),
        .i_drive13(w_DriveToMutexMerge0L_20[13]),
        .i_drive14(w_DriveToMutexMerge0L_20[14]),
        .i_drive15(w_DriveToMutexMerge0L_20[15]),
        .i_drive16(w_DriveToMutexMerge0L_20[16]),
        .i_drive17(w_DriveToMutexMerge0L_20[17]),
        .i_drive18(w_DriveToMutexMerge0L_20[20]),
        .i_drive19(w_DriveToMutexMerge0L_20[19]),
       
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

        .i_freeNext(w_FreeFromBypassPmtFifoL_1),
        .rst(rstn),

        .o_free0(w_FreeFromMutexMerge0L_20[0]),
        .o_free1(w_FreeFromMutexMerge0L_20[1]),
        .o_free2(w_FreeFromMutexMerge0L_20[2]),
        .o_free3(w_FreeFromMutexMerge0L_20[3]),
        .o_free4(w_FreeFromMutexMerge0L_20[4]),
        .o_free5(w_FreeFromMutexMerge0L_20[5]),
        .o_free6(w_FreeFromMutexMerge0L_20[6]),
        .o_free7(w_FreeFromMutexMerge0L_20[7]),
        .o_free8(w_FreeFromMutexMerge0L_20[8]),
        .o_free9(w_FreeFromMutexMerge0L_20[9]),
        .o_free10(w_FreeFromMutexMerge0L_20[10]),
        .o_free11(w_FreeFromMutexMerge0L_20[11]),
        .o_free12(w_FreeFromMutexMerge0L_20[12]),
        .o_free13(w_FreeFromMutexMerge0L_20[13]),
        .o_free14(w_FreeFromMutexMerge0L_20[14]),
        .o_free15(w_FreeFromMutexMerge0L_20[15]),
        .o_free16(w_FreeFromMutexMerge0L_20[16]),
        .o_free17(w_FreeFromMutexMerge0L_20[17]),
        .o_free18(w_FreeFromMutexMerge0L_20[18]),
        .o_free19(w_FreeFromMutexMerge0L_20[19]),



        .o_driveNext(w_DriveToBypassPmtFifoL_1),
        .o_data_32()
    );



generate
    genvar j;
    for(j=0;i<16;i=i+1) begin:SelectData2
          assign w_BypassSelectR_20[i]=  (w_dep2_4 ==i) ? 1'b1 : 1'b0;
    end
endgenerate
    assign w_BypassSelectR_20[16]=  (w_dep2_4 ==i_IndexFromLSU) ? 1'b1 : 1'b0;
    assign w_BypassSelectR_20[17]=  (w_dep2_4 ==i_IndexFromCSR) ? 1'b1 : 1'b0;
    assign w_BypassSelectR_20[20]=  (w_dep2_4 ==i_IndexFromMul) ? 1'b1 : 1'b0;
    assign w_BypassSelectR_20[19]=  (w_dep2_4 ==i_IndexFromDiv) ? 1'b1 : 1'b0;



   generate
        genvar i; 
        for(i=0; i<16; i=i+1) begin:Bypass_FIFO_R
            cPmtFifo1 BypassFifo (
            .i_drive(w_DriveFromBypassR_20[i]),
            .i_freeNext(w), 
            .rst(rstn),
            .pmt(w_BypassSelectR_20[i]),
            .o_free(w_FreeToBypassR_20[i]),
            .o_driveNext(w_DriveToMutexMerge0R_20[i]),
            .o_fire_1()
        );
        end
    endgenerate
      
    

     cPmtFifo1 BypassFifo_LSU_R (
            .i_drive(w_DriveFromBypassR_20[16]),
            .i_freeNext(w_FreeFromMutexMerge0R_1), 
            .rst(rstn),
            .pmt(w_BypassSelectR_20[16]),
            .o_free(w_FreeToBypassR_20[16]),
            .o_driveNext(w_DriveToMutexMerge0R_20[16]),
            .o_fire_1()
        );

      cPmtFifo1 BypassFifo_CSR_R (
            .i_drive(w_DriveFromBypassR_20[17]),
            .i_freeNext(w), 
            .rst(rstn),
            .pmt(w_BypassSelectR_20[17]),
            .o_free(w_FreeToBypassR_20[17]),
            .o_driveNext(w_DriveToMutexMerge0R_20[17]),
            .o_fire_1()
        );
       
       cPmtFifo1 BypassFifo_Div_R (
            .i_drive(w_DriveFromBypassR_20[20]),
            .i_freeNext(w), 
            .rst(rstn),
            .pmt(w_BypassSelectR_20[20]),
            .o_free(w_FreeToBypassR_20[20]),
            .o_driveNext(w_DriveToMutexMerge0R_20[20]),
            .o_fire_1()
        );
       
       cPmtFifo1 BypassFifo_Mul_R (
            .i_drive(w_DriveFromBypassR_20[19]),
            .i_freeNext(w), 
            .rst(rstn),
            .pmt(w_BypassSelectR_20[19]),
            .o_free(w_FreeToBypassR_20[19]),
            .o_driveNext(w_DriveToMutexMerge0R_20[19]),
            .o_fire_1()
        );
 
   
 
cMutexMerge20_32b MutexMerge0R(
        .i_drive0(w_DriveToMutexMerge0R_20[0]),
        .i_drive1(w_DriveToMutexMerge0R_20[1]),
        .i_drive2(w_DriveToMutexMerge0R_20[2]),
        .i_drive3(w_DriveToMutexMerge0R_20[3]),
        .i_drive4(w_DriveToMutexMerge0R_20[4]),
        .i_drive5(w_DriveToMutexMerge0R_20[5]),
        .i_drive6(w_DriveToMutexMerge0R_20[6]),
        .i_drive7(w_DriveToMutexMerge0R_20[7]),
        .i_drive8(w_DriveToMutexMerge0R_20[8]),
        .i_drive9(w_DriveToMutexMerge0R_20[9]),
        .i_drive10(w_DriveToMutexMerge0R_20[10]),
        .i_drive11(w_DriveToMutexMerge0R_20[11]),
        .i_drive12(w_DriveToMutexMerge0R_20[12]),
        .i_drive13(w_DriveToMutexMerge0R_20[13]),
        .i_drive14(w_DriveToMutexMerge0R_20[14]),
        .i_drive15(w_DriveToMutexMerge0R_20[15]),
        .i_drive16(w_DriveToMutexMerge0R_20[16]),
        .i_drive17(w_DriveToMutexMerge0R_20[17]),
        .i_drive18(w_DriveToMutexMerge0R_20[20]),
        .i_drive19(w_DriveToMutexMerge0R_20[19]),
       
        i_data0_32(),
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


        .i_freeNext(w_FreeFromBypassPmtFifoR_1),
        .rst(rstn),

        .o_free0(w_FreeFromMutexMerge0R_20[0]),
        .o_free1(w_FreeFromMutexMerge0R_20[1]),
        .o_free2(w_FreeFromMutexMerge0R_20[2]),
        .o_free3(w_FreeFromMutexMerge0R_20[3]),
        .o_free4(w_FreeFromMutexMerge0R_20[4]),
        .o_free5(w_FreeFromMutexMerge0R_20[5]),
        .o_free6(w_FreeFromMutexMerge0R_20[6]),
        .o_free7(w_FreeFromMutexMerge0R_20[7]),
        .o_free8(w_FreeFromMutexMerge0R_20[8]),
        .o_free9(w_FreeFromMutexMerge0R_20[9]),
        .o_free10(w_FreeFromMutexMerge0R_20[10]),
        .o_free11(w_FreeFromMutexMerge0R_20[11]),
        .o_free12(w_FreeFromMutexMerge0R_20[12]),
        .o_free13(w_FreeFromMutexMerge0R_20[13]),
        .o_free14(w_FreeFromMutexMerge0R_20[14]),
        .o_free15(w_FreeFromMutexMerge0R_20[15]),
        .o_free16(w_FreeFromMutexMerge0R_20[16]),
        .o_free17(w_FreeFromMutexMerge0R_20[17]),
        .o_free18(w_FreeFromMutexMerge0R_20[18]),
        .o_free19(w_FreeFromMutexMerge0R_20[19]),

        .o_driveNext(w_DriveToBypassPmtFifoR_1),
        .o_data_32()
    );





wire   w_IsDriveWithDepL_1 = (w_dep1_4==4'b1111) ? 1'b0: 1'b1;
wire   w_IsDriveWithGRFL_1=~(w_IsDriveWithDepL_1);
wire   w_FreeMutexMerge1LToBypassPmt_1;
wire   w_FreeMutexMerge1LToGRFPmt_1;
wire   w_DriveGRFPmtToMutexMerge1L_1;
wire   w_DriveBypassPmtToMutexMerge1L_1;


wire   w_FreeGRFPmtFifoToCopyFifoL_1;
wire   w_FreeGRFPmtFifoToCopyFifoR_1;
wire  w_DriveCopyForkToGRFPmtFifoL_1;
wire  w_DriveCopyForkToGRFPmtFifoR_1;


wire   w_IsDriveWithDepR_1 = (w_dep2_4==4'b1111) ? 1'b0: 1'b1;
wire   w_IsDriveWithGRFR_1=~(w_IsDriveWithDepR_1);
wire   w_FreeMutexMerge1RToBypassPmt_1;
wire   w_FreeMutexMerge1RToGRFPmt_1;
wire   w_DriveGRFPmtToMutexMerge1R_1;
wire   w_DriveBypassPmtToMutexMerge1R_1;


cCopyFork2_32b cCopyFork0(
    .i_drive(i_DriveFromGRF_1),
    .i_freeNext0(w_FreeGRFPmtFifoToCopyFifoL_1),
    .i_freeNext1(w_FreeGRFPmtFifoToCopyFifoR_1),
    .rst(rstn),
    .i_data_32(),
    .o_free(o_FreeToGRF_1),
    .o_driveNext0(w_DriveCopyForkToGRFPmtFifoL_1),
    .o_driveNext1(w_DriveCopyForkToGRFPmtFifoR_1),
    .o_data0(),
    .o_data1());



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


wire w_FreeWaitMergeToMutexMergeL_1;
wire w_DriveMutexMergeLToWaitMerge_1;


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
        .i_drive(w_DriveToBypassPmtFifoR_1),
        .i_freeNext(w_FreeMutexMerge1RToBypassPmt_1), 
        .rst(rstn),
        .pmt(w_IsDriveWithDepR_1),
        .o_free(w_FreeFromBypassPmtFifoR_1),
        .o_driveNext(w_DriveBypassPmtToMutexMerge1R_1),
        .o_fire_1()
);



 cPmtFifo1 cPmtFifo_FromGRFR(
        .i_drive(w_DriveCopyForkToGRFPmtFifoR_1),
        .i_freeNext(w_FreeMutexMerge1RToGRFPmt_1), 
        .rst(rstn),
        .pmt(w_IsDriveWithGRFR_1),
        .o_free(w_FreeGRFPmtFifoToCopyFifoR_1),
        .o_driveNext(w_DriveGRFPmtToMutexMerge1R_1),
        .o_fire_1()
);

wire w_FreeWaitMergeToMutexMergeR_1;
wire w_DriveMutexMergeRToWaitMerge_1;


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

    

 case(w_BypassSelectL_20)
    20'b00000000000000000001:begin assign w_bypass_oprandL_32=i_OprandFromBypass0_32 ;end
    20'b00000000000000000010:begin assign w_bypass_oprandL_32=i_OprandFromBypass1_32 ;end
    20'b00000000000000000100:begin assign w_bypass_oprandL_32=i_OprandFromBypass2_32 ;end
    20'b00000000000000001000:begin assign w_bypass_oprandL_32=i_OprandFromBypass3_32 ;end
    20'b00000000000000010000:begin assign w_bypass_oprandL_32=i_OprandFromBypass4_32 ;end
    20'b00000000000000100000:begin assign w_bypass_oprandL_32=i_OprandFromBypass5_32 ;end
    20'b00000000000001000000:begin assign w_bypass_oprandL_32=i_OprandFromBypass6_32 ;end
    20'b00000000000010000000:begin assign w_bypass_oprandL_32=i_OprandFromBypass7_32 ;end
    20'b00000000000100000000:begin assign w_bypass_oprandL_32=i_OprandFromBypass8_32 ;end
    20'b00000000001000000000:begin assign w_bypass_oprandL_32=i_OprandFromBypass9_32 ;end
    20'b00000000010000000000:begin assign w_bypass_oprandL_32=i_OprandFromBypass10_32; end
    20'b00000000100000000000:begin assign w_bypass_oprandL_32=i_OprandFromBypass11_32; end
    20'b00000001000000000000:begin assign w_bypass_oprandL_32=i_OprandFromBypass12_32; end
    20'b00000010000000000000:begin assign w_bypass_oprandL_32=i_OprandFromBypass13_32; end
    20'b00000100000000000000:begin assign w_bypass_oprandL_32=i_OprandFromBypass14_32; end
    20'b00001000000000000000:begin assign w_bypass_oprandL_32=i_OprandFromBypass15_32; end
    20'b00010000000000000000:begin assign w_bypass_oprandL_32=i_OprandFromBypassLSU_32; end
    20'b00100000000000000000:begin assign w_bypass_oprandL_32=i_OprandFromBypassCSR_32;end
    20'b01000000000000000000:begin assign w_bypass_oprandL_32=i_OprandFromBypassMul_32; end
    20'b10000000000000000000:begin assign w_bypass_oprandL_32=i_OprandFromBypassDiv_32; end
    
    default:assign w_bypass_oprandL_32=32'b0;
endcase





case(w_BypassSelectR_20)
    20'b00000000000000000001:begin assign w_bypass_oprandR_32=i_OprandFromBypass0_32 ;end
    20'b00000000000000000010:begin assign w_bypass_oprandR_32=i_OprandFromBypass1_32 ;end
    20'b00000000000000000100:begin assign w_bypass_oprandR_32=i_OprandFromBypass2_32 ;end
    20'b00000000000000001000:begin assign w_bypass_oprandR_32=i_OprandFromBypass3_32 ;end
    20'b00000000000000010000:begin assign w_bypass_oprandR_32=i_OprandFromBypass4_32 ;end
    20'b00000000000000100000:begin assign w_bypass_oprandR_32=i_OprandFromBypass5_32 ;end
    20'b00000000000001000000:begin assign w_bypass_oprandR_32=i_OprandFromBypass6_32 ;end
    20'b00000000000010000000:begin assign w_bypass_oprandR_32=i_OprandFromBypass7_32 ;end
    20'b00000000000100000000:begin assign w_bypass_oprandR_32=i_OprandFromBypass8_32 ;end
    20'b00000000001000000000:begin assign w_bypass_oprandR_32=i_OprandFromBypass9_32 ;end
    20'b00000000010000000000:begin assign w_bypass_oprandR_32=i_OprandFromBypass10_32; end
    20'b00000000100000000000:begin assign w_bypass_oprandR_32=i_OprandFromBypass11_32; end
    20'b00000001000000000000:begin assign w_bypass_oprandR_32=i_OprandFromBypass12_32; end
    20'b00000010000000000000:begin assign w_bypass_oprandR_32=i_OprandFromBypass13_32; end
    20'b00000100000000000000:begin assign w_bypass_oprandR_32=i_OprandFromBypass14_32; end
    20'b00001000000000000000:begin assign w_bypass_oprandR_32=i_OprandFromBypass15_32; end
    20'b00010000000000000000:begin assign w_bypass_oprandR_32=i_OprandFromBypassLSU_32; end
    20'b00100000000000000000:begin assign w_bypass_oprandR_32=i_OprandFromBypassCSR_32;end
    20'b01000000000000000000:begin assign w_bypass_oprandR_32=i_OprandFromBypassMul_32; end
    20'b10000000000000000000:begin assign w_bypass_oprandR_32=i_OprandFromBypassDiv_32; end
    
    default:assign w_bypass_oprandR_32=32'b0;
endcase


   wire [31:0]  w_final_oprandL_32;
   wire [31:0]  w_final_oprandR_32;
   


   assign w_final_oprandL_32=   (w_Rs1Valid_1==1'b1) ? w_immediate_32  : ((w_dep1_4==4'b1111)?  w_bypass_oprandL_32 : i_OprandFromGrfL_32);
   assign w_final_oprandR_32=   (w_Rs2Valid_1==1'b1) ? w_immediate_32  : ((w_dep2_4==4'b1111)?  w_bypass_oprandR_32 : i_OprandFromGrfR_32);
    
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


endmodule

