`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/26 12:15:20
// Design Name: 
// Module Name: Timer
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


module Timer(
input wire clk,
output wire[3:0] digit_anode,
output wire[7:0] tube,
input wire be,
input wire zan,
input wire re,
output wire l1,
output wire l2
);
    reg clk_div;
    reg clk_div2;
    reg[15:0] disp_num;
    parameter fenpin=499999;
    parameter fenpin2=49999;
    reg[26:0] counter;
    reg[26:0] counter2;
    initial clk_div=1'b0;
    initial clk_div2=1'b0;
    initial counter<=0;
    initial counter2<=0;
    always @(posedge clk) begin
        if(counter==fenpin) begin
            clk_div<=~clk_div;
            counter<=0;
        end
        else
            counter<=counter+1'b1;
    end
    
    always @(posedge clk) begin
		if(counter2==fenpin2) begin
			clk_div2<=~clk_div2;
			counter2<=0;
		end
		else
			counter2<=counter2+1'b1;
	end
    
    reg pre_be;
    reg pre_zan;
    reg pre_re;
    initial pre_be=1'b0;
    initial pre_zan=1'b0;
    initial pre_re=1'b0;
    wire be_out,zan_out,re_out;
    anti_jitter aj0(.clk(clk),.btn_in(be),.btn_out(be_out));
    anti_jitter aj1(.clk(clk),.btn_in(zan),.btn_out(zan_out));
    anti_jitter aj2(.clk(clk),.btn_in(re),.btn_out(re_out));
    reg f=0;
    reg light1,light2;
    
    initial light1=1'b0;
    initial light2=1'b0;
    
    always @(posedge clk_div) begin
        pre_be<=be_out;
        
        if(pre_be==1'b0&&be_out==1'b1) begin
            f=1;
        end
        pre_zan<=zan_out;
        
        if(pre_zan==1'b0&&zan_out==1'b1) begin
            f=0;     
        end
        pre_re<=re_out;
        
        if(pre_re==1'b0&&re_out==1'b1) begin
            f=0;
            disp_num<=16'b0000_0000_0000_0000;
            light1=0;
            light2=0;                
        end
        
        if(f==1) begin
            disp_num[3:0]<=disp_num[3:0]+1'b1;
            if(disp_num[3:0]==4'b1010) begin
                disp_num[3:0]<=4'b0;
                disp_num[7:4]<=disp_num[7:4]+1'b1;
            end
            
            if(disp_num[7:4]==4'b1010) begin
                disp_num[7:4]<=4'b0;
                disp_num[11:8]<=disp_num[11:8]+1'b1;
            end
            
            if(disp_num[11:8]==4'b1010) begin
                disp_num[11:8]<=4'b0;
                disp_num[15:12]<=disp_num[15:12]+1'b1;
            end
            
            if(disp_num[15:12]==4'b0110) begin
                disp_num[15:12]<=4'b0;
                if(light1==1'b0)
                    light1=1'b1;
                else begin
                    light2=1'b1;
                    f=0;
                    disp_num<=16'b0000_0000_0000_0000;
                end           
            end
        end        
    end
    
    display_switch sw(.clk(clk_div2),.disp_num(disp_num),.anode_n(digit_anode),.tube_n(tube));
    assign l1=light1;
    assign l2=light2;    
endmodule
