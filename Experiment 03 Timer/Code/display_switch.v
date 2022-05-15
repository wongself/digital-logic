`timescale 1ns / 1ps

module display_switch(
input clk,
input wire[15:0] disp_num,
output reg[3:0] anode_n,
output reg[7:0] tube_n
);
    reg[19:0] counter;
    reg[3:0] show_num;
    reg[1:0] pianxuan;
    reg y;
    parameter
		zero = 8'b00111111,
        one = 8'b00000110,
		two = 8'b01011011,
		three = 8'b01001111,
		four = 8'b01100110,
		five = 8'b01101101,
		six = 8'b01111101,
		seven = 8'b00000111,
		eight = 8'b01111111,
		nine = 8'b01101111;

	initial show_num=4'b0000;

	always @(posedge clk) begin
		anode_n=4'b0000;
		case(pianxuan)
			2'b00: begin
				anode_n<=4'b0001;
				show_num<=disp_num[3:0];
				y=0;
			end
			2'b01: begin
				anode_n<=4'b0010;
				show_num<=disp_num[7:4];
				y=0;
			end
			2'b10: begin
				anode_n<=4'b0100;
				show_num<=disp_num[11:8];
				y=1;
			end
			2'b11: begin
				anode_n<=4'b1000;
				show_num<=disp_num[15:12];
				y=0;
			end
		endcase
        pianxuan <= pianxuan+1'b1;
    end

	always @(*) begin
        if(y==0) begin
			case(show_num)
				4'b0000:tube_n=zero;
				4'b0001:tube_n=one;
				4'b0010:tube_n=two;
				4'b0011:tube_n=three;
				4'b0100:tube_n=four;
				4'b0101:tube_n=five;
				4'b0110:tube_n=six;
				4'b0111:tube_n=seven;
				4'b1000:tube_n=eight;
				4'b1001:tube_n=nine;
			endcase
        end
        else begin
			case(show_num)
                4'b0000:tube_n=zero+8'b10000000;
                4'b0001:tube_n=one+8'b10000000;
                4'b0010:tube_n=two+8'b10000000; 
                4'b0011:tube_n=three+8'b10000000; 
                4'b0100:tube_n=four+8'b10000000; 
                4'b0101:tube_n=five+8'b10000000; 
                4'b0110:tube_n=six+8'b10000000; 
                4'b0111:tube_n=seven+8'b10000000; 
                4'b1000:tube_n=eight+8'b10000000; 
                4'b1001:tube_n=nine+8'b10000000; 
            endcase
        end
    end
endmodule
