`timescale 1ns / 1ps

module writeback (
    input           rstn,

    input   [15:0]  i_driveFromAlu_16,
    output  [15:0]  o_freeToAlu_16,   
    //input   [3:0]   i_index_4[15:0],
    input   [15:0]  i_instExeEnd_16,
    input   [4:0]   i_aluAreg_5[15:0],
    input   [31:0]  i_aluResult_32[15:0],

    input           i_driveFromeLsa,
    output          o_freeToLsa,        //lsa inst eu
    input   [3:0]   i_lsaIndex_4,
    input           i_isStore,
    input   [4:0]   i_lsaAreg_5,
    input   [31:0]  i_laResult_32,

    input           i_driveFromeCsr,
    output          o_freeToCsr,        //csr inst eu
    input   [3:0]   i_csrIndex_4,
    input   [2:0]   i_envInst_2,        //ecall ebreak
    input           i_isMret,           //mret
    input   [4:0]   i_csrAreg_5,
    input   [31:0]  i_csrResult_32,
    input   [11:0]  i_csrAddr_12,
    input   [31:0]  i_csrValue_32,

    input   [3:0]   i_driveFromMulDiv_4,
    output  [3:0]   o_freeToMulDiv_4,
    input   [3:0]   i_muldivIndex_4[3:0],
    input   [4:0]   i_muldivAreg_5[3:0], 
    input   [31:0]  i_muldivResult_32[3:0],

    input   [3:0]   i_branchIndex_4,
    input           i_isBranch,

    input           i_driveFromException,
    output          o_freeToException,
    input           i_isException, 
    input   [3:0]   i_exceptionIndex_4,

    output          o_driveStore,
    input           i_freeStore,      //store result in dcache

    output          o_driveToGrf,
    input           i_freeFromGrf,
    output  [4:0]   o_areg_5,
    output  [31:0]  o_result_32,        //result in grf

    output          o_driveToInt,
    input           i_freeFromInt,
    output          o_cycleEnd          //cycle end or exception
);
    
    wire            w_lsaFire,w_csrFire;
    wire    [3:0]   w_muldivFire_4;   
    wire    [15:0]  w_aluFire_16;       
    wire            w_flagTrig;  
    wire    [15:0]  w_setFlag_16;             
    wire            w_es0En,w_es0Fire;
    wire            w_curCountTrig,w_controlCountTrig;
    reg     [15:0]  r_flag_16;                              //flag bit = 1,inst exe end
    reg     [3:0]   r_curCount_4,r_controlCount_4;         //write an inst result,curCount+1
    wire    [3:0]   w_maxCount_4;
    wire            o_driveNext0,i_freeNext0,o_driveNext1,i_freeNext1,w_valid0,w_valid1;  //condfork
    wire            w_grfFire,w_storeFire;                  
    wire    [15:0]  w_instType_16;
    wire            w_curType;                              //1:store 0:grf;mret/ecall/ebreak:areg=0,result=0 

    wire    [4:0]   w_curAreg_5;
    wire    [31:0]  w_result_32;
    reg     [4:0]   r_areg_5;
    reg     [31:0]  r_result_32;

    genvar      i;
    integer     j;

    /*********input fifo begin*********/
    cFifo1  lsaFifo(
        i_drive(i_driveFromeLsa),
        rst(rstn),
        o_free(o_freeToLsa),
        o_fire_1(w_lsaFire)
        );

    cFifo1  csrFifo(
        i_drive(i_driveFromeCsr),
        rst(rstn),
        o_free(o_freeToCsr),
        o_fire_1(w_csrFire)
        );

    generate
        for(i=0;i<16;i++) begin : ALU_INPUT_FIFO 
            cFifo1  aluFifo(
                i_drive(i_driveFromAlu_16[i]),
                rst(rstn),
                o_free(o_freeToAlu_16[i]),
                o_fire_1(w_aluFire_16[i])
                );
        end
    endgenerate

    generate
        for(i=0;i<4;i++) begin : MULDIV_INPUT_FIFO 
            cFifo1  muldivFifo(
                i_drive(i_driveFromMulDiv_4[i]),
                rst(rstn),
                o_free(o_freeToMulDiv_4[i]),
                o_fire_1(w_muldivFire_4[i])
                );

        end
    endgenerate

    /*********input fifo end*********/

    assign  w_flagTrig  =  w_lsaFire | w_csrFire | (|w_aluFire_16) | (|w_muldivFire_4) | o_driveToInt;


    /*********update flag begin*********/

    generate
        for(i=0;i<16;i++) begin
            assign  w_setFlag_16[i] =   i_instExeEnd_16[i] | (i_lsaIndex_4 == i) | (i_csrIndex_4 == i) 
                                    |   (i_muldivIndex_4[0] == i) | (i_muldivIndex_4[1] == i) | (i_muldivIndex_4[2] == i) | (i_muldivIndex_4[3] == i);
        end
    endgenerate

    always @(posedge w_flagTrig or negedge rstn) begin
        if(!rstn) begin
            r_flag_16   <=  16'h0;
        end
        else if(o_cycleEnd) begin
            r_flag_16   <=  16'h0;
        end
        else begin
            for(j=0;j<16;j++) begin
            if(w_setFlag_16[j]) begin
                r_flag_16[j]    <=  1'b1;
            end
        end
    end
    end
    /*********update flag end*********/

    /*********input event source begin*********/
    eventSource eventSource0(
        .rstn(rstn),
        .switch(w_es0En),
        .pulseOut(w_es0Fire)
    );
    /*********input event source end*********/



    assign  w_maxCount_4    =   {4{i_isException}} & i_exceptionIndex_4  
                                |{4{~i_isException & i_isMret}} & i_csrIndex_4
                                |{4{~i_isException & ~i_isMret & i_isBranch}} & i_branchIndex_4
                                |{4{~i_isException & ~i_isMret & ~i_isBranch}} & 4'hf;


    assign  w_es0En =   r_flag_16[0] & (r_curCount_4 == 4'h0)
                        |r_flag_16[1] & (r_curCount_4 == 4'h1)
                        |r_flag_16[2] & (r_curCount_4 == 4'h2)
                        |r_flag_16[3] & (r_curCount_4 == 4'h3)
                        |r_flag_16[4] & (r_curCount_4 == 4'h4)
                        |r_flag_16[5] & (r_curCount_4 == 4'h5)
                        |r_flag_16[6] & (r_curCount_4 == 4'h6)
                        |r_flag_16[7] & (r_curCount_4 == 4'h7)
                        |r_flag_16[8] & (r_curCount_4 == 4'h8)
                        |r_flag_16[9] & (r_curCount_4 == 4'h9)
                        |r_flag_16[10] & (r_curCount_4 == 4'ha)
                        |r_flag_16[11] & (r_curCount_4 == 4'hb)
                        |r_flag_16[12] & (r_curCount_4 == 4'hc)
                        |r_flag_16[13] & (r_curCount_4 == 4'hd)
                        |r_flag_16[14] & (r_curCount_4 == 4'he)
                        |r_flag_16[15] & (r_curCount_4 == 4'hf)
                        & (r_curCount_4 == r_controlCount_4)
                        & (r_curCount_4 < w_maxCount_4);


    assign  w_controlCountTrig  =   w_es0En | o_cycleEnd;

    always @(posedge w_controlCountTrig or negedge rstn) begin
        if(!rstn) begin
            r_controlCount_4 <= 4'h0;
        end
        else if(o_cycleEnd) begin
            r_controlCount_4 <= 4'h0;
        end
        else begin
            r_controlCount_4 <=  r_controlCount_4 + 1'b1;
        end
    end

    /*********write back begin*********/
    cCondFork2_32b    cCondFork0(
        .rst(rstn),
        .i_drive(w_es0Fire),
        //.o_free(),
        .i_data_32(),
        .valid0(w_valid0),
        .valid1(w_valid1),
        .o_driveNext0(o_driveNext0),
        .i_freeNext0(i_freeNext0),
        .o_data0_32(),
        .o_driveNext1(o_driveNext1),
        .i_freeNext1(i_freeNext1),
        .o_data1_32()
    );

    cFifo1  writeGrfFifo(
        rst(rstn),
        i_drive(o_driveNext0),
        o_free(i_freeNext0),
        o_driveNext(o_driveToGrf),
        i_freeNext(i_freeFromGrf),
        o_fire_1(w_grfFire)
    );

    cFifo1  writeDcacheFifo(
        rst(rstn),
        i_drive(o_driveNext1),
        o_free(i_freeNext1),
        o_driveNext(o_driveStore),
        i_freeNext(i_freeStore),
        o_fire_1(w_storeFire)
    );


//assign  w_valid0    =   ~((r_curCount_4 == i_lsaIndex_4) & i_isStore | (r_curCount_4 != i_lsaIndex_4) & (r_curCount_4 == i_csrIndex_4) & i_isMret);

    generate
        for(i=0;i<15;i++) begin
            assign  w_instType_16[i] =  (i_lsaIndex_4 == i && i_isStore) ? 1'b1 : 1'b0;
        end
    endgenerate

    generate
        for(i=0;i<15;i++) begin
            assign  w_curType = (r_curCount_4 == i) ? w_instType_16[i] : 1'b0;
        end
    endgenerate

    assign  w_valid0    =   ~w_curType;
    assign  w_valid1    =   w_curType;

    assign  w_curCountTrig   =   w_grfFire | w_lsaFire | o_driveToInt;

    always @(posedge w_grfFire or negedge rstn) begin
        if(!rstn) begin
            r_areg_5    <=  5'b0;
            r_result_32 <=  32'h0;
        end
        else begin
            r_areg_5    <=  w_curAreg_5;
            r_result_32 <=  w_curResult_32;
        end
    end

    always @(posedge w_curCountTrig or negedge rstn) begin
        if(!rstn) begin
            r_curCount_4    <=  4'b0;
        end
        else if(o_cycleEnd) begin
            r_curCount_4    <=  4'b0;
        end
        else begin
            r_curCount_4    <=  r_curCount_4 + 1'b1;
        end
    end
/*********write back end*********/

/*********cycle end begin*********/
    eventSource eventSource1(
        .rstn(rstn),
        .switch(o_cycleEnd),
        .pulseOut(o_driveToInt)
    );

    assign  o_cycleEnd  =   r_curCount_4    ==  w_maxCount_4;


/*********cycle end end*********/





endmodule