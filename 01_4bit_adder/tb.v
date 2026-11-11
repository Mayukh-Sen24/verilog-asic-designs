module tb;

    // Testbench signals
    reg  [3:0] a;
    reg  [3:0] b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    // Instantiate the design module (adder4)
    adder4 uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $display("Time |  A  +  B  + Cin | Cout | Sum | Decimal Check");
        $display("-----------------------------------------------------");
        $monitor("%4t | %2d  + %2d  +  %b  |  %b   | %2d  | Total = %2d", 
                 $time, a, b, cin, cout, sum, {cout, sum});

        // Test Case 1: Zero check
        a = 4'd0;  b = 4'd0;  cin = 1'b0; #10;

        // Test Case 2: Simple addition (3 + 5 = 8)
        a = 4'd3;  b = 4'd5;  cin = 1'b0; #10;

        // Test Case 3: Addition with Carry-In (4 + 6 + 1 = 11)
        a = 4'd4;  b = 4'd6;  cin = 1'b1; #10;

        // Test Case 4: Overflow / Carry-Out check (12 + 7 = 19)
        a = 4'd12; b = 4'd7;  cin = 1'b0; #10;

        // Test Case 5: Maximum possible value (15 + 15 + 1 = 31)
        a = 4'd15; b = 4'd15; cin = 1'b1; #10;

        $finish;
    end

endmodule
