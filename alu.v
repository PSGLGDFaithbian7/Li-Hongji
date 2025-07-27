`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/13 14:58:39
// Design Name: 
// Module Name: alu
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


module alu(
input        rstn,
input        i_driveFromIssue,
output       o_freeToIssue,
input [3:0]  i_controlFromIssue_4,//控制信号
input [3:0]  i_tagFromIssue_4,//指令编号
input [31:0] i_oprand1FromIssue_32,
input [31:0] i_oprand2FromIssue_32,
input [4:0]  i_areg_5,

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
output [3:0] o_indexToBranch_4,
output       o_driveToWB,
input        i_freeFromWB,
output [31:0]o_resultToWB_32,
output       o_indexToWB,
output [4:0]  o_areg_5
    );
reg     [36:0]   r_resultAndTag_37;
wire    [36:0]   w_resultAndTag_37;
reg    [36:0]   w_resultAndTag1_37;
reg    [36:0]   w_resultAndTag2_37;
reg    [36:0]   w_resultAndTag3_37;
reg    [36:0]   w_resultAndTag4_37;
wire             w_ADD;//1111
wire             w_SUB;//0001
wire             w_SLT;//0010
wire             w_SLTU;//0011
wire             w_AND;//0100
wire             w_OR;//0101
wire             w_XOR;//0110
wire             w_SRA;//0111
wire             w_SLL;//1000
wire             w_SRL;//1001
wire             w_LUI;//1010
wire [31:0]      w_addSubResult_32;
wire [31:0]      w_sltResult_32;
wire [31:0]      w_sltuResult_32;
wire [31:0]      w_andResult_32;
wire [31:0]      w_orResult_32;
wire [31:0]      w_xorResult_32;
wire [31:0]      w_sllResult_32;
wire [31:0]      w_srlResult_32;
wire [31:0]      w_sraResult_32;
wire [31:0]      w_luiResult_32;
wire [31:0]      w_aluResult_32;
wire             w_aluFire;
wire             w_copyFire;
wire             w_drive;
wire             w_free;
reg  [4:0]       r_areg_5;
cFifo1  aluFifo(
        .rst(rstn),
        .i_drive(i_driveFromIssue),
        .o_free(o_freeToIssue),
        .o_driveNext(w_drive),
        .i_freeNext(w_free),
        .o_fire_1(w_aluFire)
    );
//解码
    assign w_ADD  = (i_controlFromIssue_4 == 4'b1111)?1'h1:1'h0;
    assign w_SUB  = (i_controlFromIssue_4 == 4'b0001)?1'h1:1'h0;
    assign w_SLT  = (i_controlFromIssue_4 == 4'b0010)?1'h1:1'h0;
    assign w_SLTU = (i_controlFromIssue_4 == 4'b0011)?1'h1:1'h0;
    assign w_AND  = (i_controlFromIssue_4 == 4'b0100)?1'h1:1'h0;
    assign w_OR   = (i_controlFromIssue_4 == 4'b0101)?1'h1:1'h0;
    assign w_XOR  = (i_controlFromIssue_4 == 4'b0110)?1'h1:1'h0;
    assign w_SLL  = (i_controlFromIssue_4 == 4'b1000)?1'h1:1'h0;
    assign w_SRL  = (i_controlFromIssue_4 == 4'b1001)?1'h1:1'h0;
    assign w_SRA  = (i_controlFromIssue_4 == 4'b0111)?1'h1:1'h0;
    assign w_LUI  = (i_controlFromIssue_4 == 4'b1010)?1'h1:1'h0;
//加法器
    wire [31:0] w_adderOperand1_32;                                         // 加法操作数1
    wire [31:0] w_adderOperand2_32;                                         // 加法操作数2
    wire        w_adderCin_1;                                               // 加法进位输入
    wire [32:0] w_adderResult_33;                                           // 加法结果
    wire        w_adderCout_1;                                              // 加法进位输出
    assign w_adderOperand1_32   = i_oprand1FromIssue_32;
    assign w_adderOperand2_32   = w_ADD   ?  i_oprand2FromIssue_32
                                           : ~i_oprand2FromIssue_32;
    assign w_adderCin_1         = ~w_ADD;
    assign w_adderResult_33     = w_adderOperand1_32 + w_adderOperand2_32 + w_adderCin_1;
    assign w_adderCout_1        = w_adderResult_33[32];
//加减结果
    assign w_addSubResult_32    = w_adderResult_33[31:0];
//slt
    assign w_sltResult_32[31:1] = 31'd0;
    assign w_sltResult_32[0]    = (i_oprand1FromIssue_32[31]==1'h1&&i_oprand2FromIssue_32[31]==1'h0)?1'h1:((i_oprand1FromIssue_32[31]==1'h0&&i_oprand2FromIssue_32[31]==1'h1)?1'h0:((i_oprand1FromIssue_32<i_oprand2FromIssue_32)?1'h1:1'h0));
//sltu
    assign w_sltuResult_32[31:1] = 31'd0;
    assign w_sltuResult_32[0]   = (i_oprand1FromIssue_32<i_oprand2FromIssue_32)?1'h1:1'h0;
//与或异或
    assign w_andResult_32   = i_oprand1FromIssue_32 & i_oprand2FromIssue_32;          // 与运算
    assign w_orResult_32    = i_oprand1FromIssue_32 | i_oprand2FromIssue_32;          // 或运算
    assign w_xorResult_32   = i_oprand1FromIssue_32 ^ i_oprand2FromIssue_32;          // 异或运算
// 逻辑左移
    assign w_sllResult_32   =($unsigned(i_oprand1FromIssue_32)) << i_oprand2FromIssue_32[4:0];

// 逻辑右移
    assign w_srlResult_32   =($unsigned(i_oprand1FromIssue_32)) >> i_oprand2FromIssue_32[4:0];

// 算数右移
    assign w_sraResult_32   =$unsigned((($signed(i_oprand1FromIssue_32)) >>> i_oprand2FromIssue_32[4:0]));
//加载
    assign w_luiResult_32   = i_oprand2FromIssue_32;
//alu输出
    assign w_aluResult_32  = {{32{w_ADD | w_SUB}}    & w_addSubResult_32 }   // 输出加减法结果
                            | {{32{w_SLT          }}  & w_sltResult_32    }   // 输出小于置位结果
                            | {{32{w_SLTU         }}  & w_sltuResult_32   }   // 输出无符号小于置位结果
                            | {{32{w_AND          }}  & w_andResult_32    }   // 输出与结果
                            | {{32{w_OR           }}  & w_orResult_32     }   // 输出或结果
                            | {{32{w_XOR          }}  & w_xorResult_32    }   // 输出异或结果
                            | {{32{w_SLL          }}  & w_sllResult_32    }   // 输出逻辑左移结果
                            | {{32{w_SRL          }}  & w_srlResult_32    }   // 输出逻辑右移结果
                            | {{32{w_SRA          }}  & w_sraResult_32    }   // 输出算数右移结果
                            | {{32{w_LUI          }}  & w_luiResult_32    };  // 输出加载结果 
always @(posedge w_aluFire or negedge rstn) begin
        if(!rstn) begin
            r_resultAndTag_37   <=  37'h0;
            r_areg_5            <=   5'h0;
        end
        else begin
            r_resultAndTag_37   <=  {w_aluResult_32,i_tagFromIssue_4,1'd1};
            r_areg_5            <=  i_areg_5;
            end
end
assign w_resultAndTag_37 = r_resultAndTag_37;
cCopyFork4    cCopyFork0(
        .rst(rstn),
        .i_drive(w_drive),
        .o_free(w_free),
        .o_driveNext0(o_driveToIssue),
        .i_freeNext0(i_freeFromIssue),
        .o_driveNext1(o_driveToMD),
        .i_freeNext1(i_freeFromMD),
        .o_driveNext2(o_driveToBranch),
        .i_freeNext2(i_freeFromBranch),
        .o_driveNext3(o_driveToWB),
        .i_freeNext3(i_freeFromWB),
        .o_fire(w_copyFire)
    );
always @(posedge w_copyFire or negedge rstn) begin
        if(!rstn) begin
            w_resultAndTag1_37   <=  37'h0;
            w_resultAndTag2_37  <=   37'h0;
            w_resultAndTag3_37   <=  37'h0;
            w_resultAndTag4_37   <=  37'h0;
        end
        else begin
            w_resultAndTag1_37   <=  w_resultAndTag_37;
            w_resultAndTag2_37   <=  w_resultAndTag_37;
            w_resultAndTag3_37   <=  w_resultAndTag_37;
            w_resultAndTag4_37   <=  w_resultAndTag_37;
            end
end
assign o_resultToIssue_32 = w_resultAndTag1_37[36:5];
assign o_indexToIssue_4   = w_resultAndTag1_37[4:1];
assign o_resultToMD_32 = w_resultAndTag2_37[36:5];
assign o_indexToMD_4   = w_resultAndTag2_37[4:1];
assign o_resultToBranch_32 = w_resultAndTag3_37[36:5];
assign o_indexToBranch_4   = w_resultAndTag3_37[4:1];
assign o_resultToWB_32 = w_resultAndTag4_37[36:5];
assign o_indexToWB   = w_resultAndTag4_37[0];
assign o_areg_5=r_areg_5;
endmodule
