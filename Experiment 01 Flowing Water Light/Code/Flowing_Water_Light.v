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


module run_led(
     input clk,
     input rst_n,
     output [3:0] led
     );
   reg [31:0] counters;
   reg [3:0] state;
 always@(posedge clk or negedge rst_n)
 begin
     if(!rst_n)  begin
     counter<=0;
     led<=4'b0000;
     state<=4'b0000;
     end
     else  beign
       case(state):
           4'd0001: begin                        //��һ������
                led<=4'b0001;
                if(counters<=24999_999)          //������ʱ ͨ���ı�counters��ֵ�����Ըı��������ٶ�
                    counters<=counters+1;
                else begin
                    state<=4'b0010;
                    counters<=0;
                end
           end
           4'd0010:begin                       //�ڶ�������
                led<=4'b0010;
                if(counters<=24999_999)
                    counters<=counters+1;
                else begin
                    state<=4'b0100;
                    counters<=0;
                end
           end
           4'd0100:begin                    //����������
                led<=4'b0100;
                if(counters<=24999_999)
                    counters<=counters+1;
                else begin
                    state<=4'b1000;
                    counters<=0;
                end
           end
           4'd1000:begin                    //���ĸ�����
                led<=4'b10000;
                if(counters<=24999_999)
                    counters<=counters+1;
                else begin
                    state<=4'b0001;
                    counters<=0;
                end
           end
           defualt: state<=4'd0001;
     end
 end
endmodule