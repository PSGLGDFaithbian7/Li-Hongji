`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/14 14:35:43
// Design Name: 
// Module Name: lsa_eu
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


module lsa_eu(
input        rstn,
input        i_driveFromIssue,
output       o_freeToIssue,
input [3:0]  i_controlFromIssue_4,//控制信号
input [9:0]  i_tagFromIssue_10,//指令编号+type
input [31:0] i_oprand1FromIssue_32,
input [31:0] i_oprand2FromIssue_32,
input [31:0] i_storedataFromIssue_32,
input [4:0]  i_areg_5,
input        i_driveFromLSU,
output       o_freeToLSU,//如果是原子指令，访存单元要把取出的数给我，并给我数据
input [31:0] i_oprandFromLSU,//原子指令取出的数


output       o_driveToLSU,//无论什么指令，把计算的地址等信息给访存
input        i_freeFromLSU,
output[31:0] o_addrToLSU,//地址
output[3:0]  o_indexToLSU,//指令序号
output[5:0]  o_typeToLSU,//指令类型
output[31:0] o_storedataToLSU,//存储的数据
output[4:0]  o_areg_5,//目的寄存器


output       o_driveToLSUForA,//原子指令算出结果，给访存
input        i_freeFromLSUForA,
output[31:0] o_resultToLSU,

output       o_driveToIssue,
input        i_freeFromIssue,
output [31:0]o_resultToIssue_32,
output [3:0] o_indexToIssue_4,
output       o_driveToMD,
input        i_freeFromMD,
output [31:0]o_resultToMD_32,
output [3:0] o_indexToMD_4,
output       o_driveToBranch,
input        i_freeFromBranch,
output [31:0]o_resultToBranch_32,
output [3:0] o_indexToBranch_4
    );
wire [1:0]  w_aluFire;
wire        w_addFire;
wire        w_copyFire;
wire [31:0] w_adderresult;
wire        w_drive;
wire        w_free;
wire        w_driveToAlu;
wire        w_freeFromAlu;
wire [35:0] w_resultAndTag_36;
reg [35:0] w_resultAndTag1_36;
reg [35:0] w_resultAndTag2_36;
reg [35:0] w_resultAndTag3_36;
reg [35:0] w_resultAndTag4_36;
wire [31:0] w_oprand_32;
wire [31:0] w_aluoprand1;
wire [31:0] w_aluoprand2;
wire [3:0]  w_alucontrol;
wire        w_LUI;//1010
wire        w_ADD;//1111
wire        w_XOR;//0110
wire        w_AND;//0100
wire        w_OR;//0101
wire        w_MAX;//1011
wire        w_MAXU;//1100
wire        w_MIN;//1101
wire        w_MINU;//1110
wire [31:0] w_luiResult_32;
wire [31:0] w_addResult_32;
wire [31:0] w_xorResult_32;
wire [31:0] w_andResult_32;
wire [31:0] w_orResult_32;
wire [31:0] w_maxResult_32;
wire [31:0] w_maxuResult_32;
wire [31:0] w_minResult_32;
wire [31:0] w_minuResult_32;
wire [31:0] w_aluResult_32;
wire        w_is_min;
wire        w_is_minu;
reg  [31:0] r_addr;
reg  [3:0]  r_index;
reg  [5:0]  r_type;
reg  [31:0] r_storedata;
reg  [4:0]  r_areg;
reg  [31:0] r_oprand2;
reg  [3:0]  r_control;
reg  [31:0] r_oprand1;
reg  [31:0] r_result;
assign w_adderresult=i_oprand1FromIssue_32+i_oprand2FromIssue_32;
cFifo1  addFifo(
        .rst(rstn),
        .i_drive(i_driveFromIssue),
        .o_free(o_freeToIssue),
        .o_driveNext(o_driveToLSU),
        .i_freeNext(i_freeFromLSU),
        .o_fire_1(w_addFire)
    );
always @(posedge w_addFire or negedge rstn) begin
        if(!rstn) begin
            r_addr   <=  32'h0;
            r_index  <=  4'h0;
            r_type   <=  6'h0;
            r_storedata<=32'h0;
            r_areg   <=  5'h0;
        end
        else begin
            r_addr   <=  w_adderresult;
            r_index  <=  i_tagFromIssue_10[9:6];
            r_type   <=  i_tagFromIssue_10[5:0];
            r_storedata<=i_storedataFromIssue_32;
            r_areg   <=  i_areg_5;
            end
end
assign o_addrToLSU   = r_type[4] ? i_oprand1FromIssue_32 : r_addr;
assign o_indexToLSU  = r_index;
assign o_typeToLSU   = r_type;
assign o_storedataToLSU= r_storedata;
assign o_areg_5      = r_areg;
assign w_resultAndTag_36={i_oprandFromLSU,i_tagFromIssue_10[9:6]};
cCopyFork4    cCopyFork0(
        .rst(rstn),
        .i_drive(i_driveFromLSU),
        .o_free(o_freeToLSU),
        .o_driveNext0(o_driveToIssue),
        .i_freeNext0(i_freeFromIssue),
        .o_driveNext1(o_driveToMD),
        .i_freeNext1(i_freeFromMD),
        .o_driveNext2(o_driveToBranch),
        .i_freeNext2(i_freeFromBranch),
        .o_driveNext3(w_driveToAlu),
        .i_freeNext3(w_freeFromAlu),
        .o_fire(w_copyFire)
    );
always @(posedge w_copyFire or negedge rstn) begin
        if(!rstn) begin
            w_resultAndTag1_36   <=  36'h0;
            w_resultAndTag2_36   <=  36'h0;
            w_resultAndTag3_36   <=  36'h0;
            w_resultAndTag4_36   <=  36'h0;
        end
        else begin
            w_resultAndTag1_36   <=  w_resultAndTag_36;
            w_resultAndTag2_36   <=  w_resultAndTag_36;
            w_resultAndTag3_36   <=  w_resultAndTag_36;
            w_resultAndTag4_36   <=  w_resultAndTag_36;
            end
end
assign o_resultToIssue_32 = w_resultAndTag1_36[35:4];
assign o_indexToIssue_4   = w_resultAndTag1_36[3:0];
assign o_resultToMD_32 = w_resultAndTag2_36[35:4];
assign o_indexToMD_4   = w_resultAndTag2_36[3:0];
assign o_resultToBranch_32 = w_resultAndTag3_36[35:4];
assign o_indexToBranch_4   = w_resultAndTag3_36[3:0];
assign w_oprand_32 = w_resultAndTag4_36[35:4];
cFifo2  aluFifo(
        .rst(rstn),
        .i_drive(w_driveToAlu),
        .o_free(w_freeFromAlu),
        .o_driveNext(o_driveToLSUForA),
        .i_freeNext(i_freeFromLSUForA),
        .o_fire_2(w_aluFire)
    );
always @(posedge w_aluFire[0] or negedge rstn) begin
        if(!rstn) begin
            r_oprand1   <=  32'h0;
            r_oprand2   <=  32'h0;
            r_control   <=  4'h0;
        end
        else begin
            r_oprand1   <=  w_oprand_32;
            r_oprand2   <=  i_oprand2FromIssue_32;
            r_control   <=  i_controlFromIssue_4;
            end
end
assign w_aluoprand1 = r_oprand1;
assign w_aluoprand2 = r_oprand2;
assign w_alucontrol = r_control;
assign w_LUI  = (w_alucontrol == 4'b1010)?1'h1:1'h0;
assign w_ADD  = (w_alucontrol == 4'b1111)?1'h1:1'h0;
assign w_XOR  = (w_alucontrol == 4'b0110)?1'h1:1'h0;
assign w_AND  = (w_alucontrol == 4'b0100)?1'h1:1'h0;
assign w_OR   = (w_alucontrol == 4'b0101)?1'h1:1'h0;
assign w_MAX  = (w_alucontrol == 4'b1011)?1'h1:1'h0;
assign w_MAXU = (w_alucontrol == 4'b1100)?1'h1:1'h0;
assign w_MIN  = (w_alucontrol == 4'b1101)?1'h1:1'h0;
assign w_MINU = (w_alucontrol == 4'b1110)?1'h1:1'h0;
//加载
    assign w_luiResult_32   = w_aluoprand2;
//加
    assign w_addResult_32   = w_aluoprand1 + w_aluoprand2;
//异或
    assign w_xorResult_32   = w_aluoprand1 ^ w_aluoprand2;
//与
    assign w_andResult_32   = w_aluoprand1 & w_aluoprand2;
//或
    assign w_orResult_32    = w_aluoprand1 | w_aluoprand2;
//有符号比较
    assign w_is_min         = (w_aluoprand1[31]==1'h1&&w_aluoprand2[31]==1'h0)?1'h1:((w_aluoprand1[31]==1'h0&&w_aluoprand2[31]==1'h1)?1'h0:((w_aluoprand1<w_aluoprand2)?1'h1:1'h0));
    assign w_minResult_32   =(w_is_min==1)?w_aluoprand1:w_aluoprand2;
    assign w_maxResult_32   =(w_is_min==1)?w_aluoprand2:w_aluoprand1;
//无符号数比较
    assign w_is_minu        = (w_aluoprand1<w_aluoprand2)?1'h1:1'h0;
    assign w_minuResult_32  =(w_is_min==1)?w_aluoprand1:w_aluoprand2;
    assign w_maxuResult_32  =(w_is_min==1)?w_aluoprand2:w_aluoprand1;
//alu输出
    assign w_aluResult_32   = {{32{w_ADD          }}  & w_addResult_32    }   // 输出加法结果
                            | {{32{w_MAX          }}  & w_maxResult_32    }   // 输出有符号取最大
                            | {{32{w_MAXU         }}  & w_maxuResult_32   }   // 输出无符号取最大
                            | {{32{w_MIN          }}  & w_minResult_32    }   // 输出有符号取最小
                            | {{32{w_MINU         }}  & w_minuResult_32   }   // 输出无符号取最小
                            | {{32{w_AND          }}  & w_andResult_32    }   // 输出与结果
                            | {{32{w_OR           }}  & w_orResult_32     }   // 输出或结果
                            | {{32{w_XOR          }}  & w_xorResult_32    }   // 输出异或结果
                            | {{32{w_LUI          }}  & w_luiResult_32    };  // 输出加载结果 
always @(posedge w_aluFire[1] or negedge rstn) begin
        if(!rstn) begin
            r_result    <=  32'h0;
        end
        else begin
            r_result    <=  w_aluResult_32;
            end
end
assign o_resultToLSU    =   r_result;
endmodule
