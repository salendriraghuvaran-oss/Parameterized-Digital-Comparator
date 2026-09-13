`timescale 1ns / 1ps

module comparator_logic(
    input [3:0] A,
    input [3:0] B,
    output G,
    output E,
    output L
);

    wire g3, g2, g1, g0;
    wire e3, e2, e1, e0;
    wire l3, l2, l1, l0;

    // Greater-than comparison
    assign g3 = A[3] & ~B[3];
    assign g2 = A[2] & ~B[2];
    assign g1 = A[1] & ~B[1];
    assign g0 = A[0] & ~B[0];

    // Equality comparison
    assign e3 = ~(A[3] ^ B[3]);
    assign e2 = ~(A[2] ^ B[2]);
    assign e1 = ~(A[1] ^ B[1]);
    assign e0 = ~(A[0] ^ B[0]);

    // Less-than comparison
    assign l3 = ~A[3] & B[3];
    assign l2 = ~A[2] & B[2];
    assign l1 = ~A[1] & B[1];
    assign l0 = ~A[0] & B[0];

    // Final outputs
    assign G = g3 |
               (e3 & g2) |
               (e3 & e2 & g1) |
               (e3 & e2 & e1 & g0);

    assign E = e3 & e2 & e1 & e0;

    assign L = l3 |
               (e3 & l2) |
               (e3 & e2 & l1) |
               (e3 & e2 & e1 & l0);

endmodule
