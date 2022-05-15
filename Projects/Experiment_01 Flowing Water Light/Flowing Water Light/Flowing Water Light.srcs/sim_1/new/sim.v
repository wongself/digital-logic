`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 11:04:44
// Design Name: 
// Module Name: sim
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


module sim();
    reg clk;
    wire l0,l1,l2,l3,l4,l5,l6,l7;
    Flowing_Water_Light(
        .clk(clk),
        .l0(l0),
        .l1(l1),
        .l2(l2),
        .l3(l3),
        .l4(l4),
        .l5(l5),
        .l6(l6),
        .l7(l7),
    );
endmodule
