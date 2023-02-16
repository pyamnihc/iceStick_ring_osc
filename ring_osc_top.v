`timescale 1ns / 1ps

module ring_osc_top (
    output J1_3, 
    output J1_4, 
    output J1_5, 
    output J1_6, 
    output J1_7, 
    output J1_8, 
    output J1_9, 
    output J1_10
    );

    wire [7:0] ring_out_arr_j1_w;
    assign J1_3 = ring_out_arr_j1_w[0];
    assign J1_4 = ring_out_arr_j1_w[1];
    assign J1_5 = ring_out_arr_j1_w[2];
    assign J1_6 = ring_out_arr_j1_w[3];
    assign J1_7 = ring_out_arr_j1_w[4];
    assign J1_8 = ring_out_arr_j1_w[5];
    assign J1_9 = ring_out_arr_j1_w[6];
    assign J1_10 = ring_out_arr_j1_w[7];

    genvar gen_stg;
    generate
        for (gen_stg = 0; gen_stg < 8; gen_stg = gen_stg + 1) begin
            ring_osc #(.STAGES(2*gen_stg+3)) ring_osc0 (
                .ring_out(ring_out_arr_j1_w[gen_stg])
            );
        end
    endgenerate

endmodule
