`timescale 1ns / 1ps

module ring_osc #(
        parameter STAGES = 3
    ) (
        output ring_out
    );

    wire [STAGES-1:0] not_in_w, not_out_w;
    assign not_in_w[0] = not_out_w[STAGES-1];
    genvar gen_inter;
    generate
        for (gen_inter = 1; gen_inter < STAGES; gen_inter = gen_inter + 1) begin
            assign not_in_w[gen_inter] = not_out_w[gen_inter-1];
        end
    endgenerate
    assign ring_out = not_out_w[STAGES-1];

    genvar gen_inv;
    generate
        for (gen_inv = 0; gen_inv < STAGES; gen_inv = gen_inv + 1) begin
            SB_LUT4 #(
                    .LUT_INIT(16'd1)
            ) inverter (
                    .O(not_out_w[gen_inv]),
                    .I0(not_in_w[gen_inv]),
                    .I1(1'b0),
                    .I2(1'b0),
                    .I3(1'b0)
            );
        end
    endgenerate



endmodule
