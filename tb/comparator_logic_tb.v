`timescale 1ns / 1ps

module comparator_logic_tb();

    reg [3:0] A;
    reg [3:0] B;

    wire G_DUT;
    wire E_DUT;
    wire L_DUT;

    wire G_REF;
    wire E_REF;
    wire L_REF;

    integer i;
    integer j;
    integer pass_count;
    integer fail_count;


    // Actual Design Under Test
    comparator_logic DUT (
        .A(A),
        .B(B),
        .G(G_DUT),
        .E(E_DUT),
        .L(L_DUT)
    );


    // Reference Model
    comparator_parameterized #(.WIDTH(4)) REF (
        .A(A),
        .B(B),
        .G(G_REF),
        .E(E_REF),
        .L(L_REF)
    );


    initial begin

        pass_count = 0;
        fail_count = 0;

        // Test all 256 combinations
        for (i = 0; i < 16; i = i + 1) begin

            for (j = 0; j < 16; j = j + 1) begin

                A = i;
                B = j;

                #1;

                // Compare DUT with Reference Model
                if ((G_DUT == G_REF) &&
                    (E_DUT == E_REF) &&
                    (L_DUT == L_REF)) begin

                    pass_count = pass_count + 1;

                end
                else begin

                    fail_count = fail_count + 1;

                end

            end

        end

        $finish;

    end

endmodule
