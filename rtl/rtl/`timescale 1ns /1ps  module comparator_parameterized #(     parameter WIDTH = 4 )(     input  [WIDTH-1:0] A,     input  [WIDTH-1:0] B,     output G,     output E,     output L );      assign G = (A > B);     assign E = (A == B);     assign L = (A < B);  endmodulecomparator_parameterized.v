`timescale 1ns / 1ps

module comparator_parameterized #(
    parameter WIDTH = 4
)(
    input  [WIDTH-1:0] A,
    input  [WIDTH-1:0] B,
    output G,
    output E,
    output L
);

    assign G = (A > B);
    assign E = (A == B);
    assign L = (A < B);

endmodule
