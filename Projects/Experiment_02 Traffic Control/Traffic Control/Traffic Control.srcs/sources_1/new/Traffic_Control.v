`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 11:34:11
// Design Name: 
// Module Name: Traffic_Control
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


module Traffic_Control(
input wire clk,
input wire ps,
input wire rs,
input wire ls,
input wire rr,
output wire pl,
output wire ll,
output wire rl
    );
    assign pl=ps;
    assign rl=~ps&rs(~ls|~rr);
	assign ll=~ps&ls(~rs|rr);   
endmodule
