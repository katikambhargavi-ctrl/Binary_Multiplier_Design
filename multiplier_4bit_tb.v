`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2026 08:36:29
// Design Name: 
// Module Name: multiplier_4bit_tb
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


`timescale 1ns/1ps

module multiplier_4bit_tb;

reg  [3:0] A;
reg  [3:0] B;
wire [7:0] P;

// Instantiate the DUT
multiplier_4bit uut (
    .A(A),
    .B(B),
    .P(P)
);

initial begin

    $display("------------------------------------------------");
    $display(" Time\tA\tB\tProduct");
    $display("------------------------------------------------");
    $monitor("%0t\t%d\t%d\t%d", $time, A, B, P);

    // Test Case 1
    A = 4'd0; B = 4'd0;
    #10;

    // Test Case 2
    A = 4'd1; B = 4'd1;
    #10;

    // Test Case 3
    A = 4'd2; B = 4'd3;
    #10;

    // Test Case 4
    A = 4'd5; B = 4'd6;
    #10;

    // Test Case 5
    A = 4'd7; B = 4'd8;
    #10;

    // Test Case 6
    A = 4'd9; B = 4'd9;
    #10;

    // Test Case 7
    A = 4'd10; B = 4'd12;
    #10;

    // Test Case 8
    A = 4'd15; B = 4'd15;
    #10;

    // Test Case 9
    A = 4'd15; B = 4'd0;
    #10;

    // Test Case 10
    A = 4'd13; B = 4'd11;
    #10;

    $finish;

end

endmodule