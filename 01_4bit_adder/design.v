module adder4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire       cin,
    output wire [3:0] sum,
    output wire       cout
);

    // 5-bit addition result split into carry-out and 4-bit sum
    assign {cout, sum} = a + b + cin;

endmodule
