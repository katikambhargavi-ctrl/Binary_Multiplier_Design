`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2026 08:35:51
// Design Name: 
// Module Name: multiplier_4bit
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


module multiplier_4bit(
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] P
);

//----------------------------------------------------
// Partial Products
//----------------------------------------------------

wire pp00,pp01,pp02,pp03;
wire pp10,pp11,pp12,pp13;
wire pp20,pp21,pp22,pp23;
wire pp30,pp31,pp32,pp33;

assign pp00 = A[0] & B[0];
assign pp01 = A[0] & B[1];
assign pp02 = A[0] & B[2];
assign pp03 = A[0] & B[3];

assign pp10 = A[1] & B[0];
assign pp11 = A[1] & B[1];
assign pp12 = A[1] & B[2];
assign pp13 = A[1] & B[3];

assign pp20 = A[2] & B[0];
assign pp21 = A[2] & B[1];
assign pp22 = A[2] & B[2];
assign pp23 = A[2] & B[3];

assign pp30 = A[3] & B[0];
assign pp31 = A[3] & B[1];
assign pp32 = A[3] & B[2];
assign pp33 = A[3] & B[3];

//----------------------------------------------------
// Internal wires
//----------------------------------------------------

wire s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12;
wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12;

//----------------------------------------------------
// Product bit 0
//----------------------------------------------------

assign P[0] = pp00;

//----------------------------------------------------
// First Row
//----------------------------------------------------

half_adder HA1(
    .a(pp01),
    .b(pp10),
    .sum(P[1]),
    .carry(c1)
);

half_adder HA2(
    .a(pp02),
    .b(pp11),
    .sum(s1),
    .carry(c2)
);

half_adder HA3(
    .a(pp03),
    .b(pp12),
    .sum(s2),
    .carry(c3)
);

//----------------------------------------------------
// Second Row
//----------------------------------------------------

full_adder FA1(
    .a(s1),
    .b(pp20),
    .cin(c1),
    .sum(P[2]),
    .carry(c4)
);

full_adder FA2(
    .a(s2),
    .b(pp21),
    .cin(c2),
    .sum(s3),
    .carry(c5)
);

full_adder FA3(
    .a(pp13),
    .b(pp22),
    .cin(c3),
    .sum(s4),
    .carry(c6)
);

//----------------------------------------------------
// Third Row
//----------------------------------------------------

full_adder FA4(
    .a(s3),
    .b(pp30),
    .cin(c4),
    .sum(P[3]),
    .carry(c7)
);

full_adder FA5(
    .a(s4),
    .b(pp31),
    .cin(c5),
    .sum(s5),
    .carry(c8)
);

full_adder FA6(
    .a(pp23),
    .b(pp32),
    .cin(c6),
    .sum(s6),
    .carry(c9)
);

//----------------------------------------------------
// Final Row
//----------------------------------------------------

half_adder HA4(
    .a(s5),
    .b(c7),
    .sum(P[4]),
    .carry(c10)
);

full_adder FA7(
    .a(s6),
    .b(c8),
    .cin(c10),
    .sum(P[5]),
    .carry(c11)
);

full_adder FA8(
    .a(pp33),
    .b(c9),
    .cin(c11),
    .sum(P[6]),
    .carry(P[7])
);

endmodule

module half_adder(
    input a,
    input b,
    output sum,
    output carry
);

assign sum   = a ^ b;
assign carry = a & b;

endmodule

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output carry
);

assign sum   = a ^ b ^ cin;
assign carry = (a & b) | (b & cin) | (a & cin);

endmodule
