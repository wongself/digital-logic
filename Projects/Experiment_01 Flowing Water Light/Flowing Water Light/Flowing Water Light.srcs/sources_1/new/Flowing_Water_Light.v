`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 10:37:09
// Design Name: 
// Module Name: Flowing_Water_Light
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


module Flowing_Water_Light(
input clk,
output l0,
output l1,
output l2,
output l3,
output l4,
output l5,
output l6,
output l7
);
    reg[26:0]counter;
    initial counter<=0;
    reg[9:0] light;
    initial light<=1'b1;
    always @(posedge clk) begin
		if(counter<24'hFFFF_FFFF) begin
			counter<=counter+1'b1;
		end
		else begin
			counter<=0;
			light<=light<<1;
			if(light==9'b10000000) begin
				light<=1'b1;
			end
		end
    end
    assign l0=light[0];
    assign l1=light[1];
    assign l2=light[2];
    assign l3=light[3];
    assign l4=light[4];
    assign l5=light[5];
    assign l6=light[6];
    assign l7=light[7];
endmodule
