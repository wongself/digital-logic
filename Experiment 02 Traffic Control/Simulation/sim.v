`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 12:10:46
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
    reg clk,ps,rs,ls,rr;
    wire pl,ll,rl;
    Traffic_Control tc(
        .clk(clk),
        .ps(ps),
        .rs(rs),
        .ls(ls),
        .rr(rr),
        .pl(pl),
        .ll(ll),
        .rl(rl)
    );
    initial begin
        clk = 1'b0;
    end          
    always begin
        #10 clk = ~clk;
    end
    always begin
        //���ϳ�
        ps = 1'b1;
        rs = 1'b0;
        ls = 1'b0;
        rr = 1'b0;
        #20; //Delay Time
        //����ȫѡ
        ps = 1'b1;
        rs = 1'b1;
        ls = 1'b1;
        rr = 1'b1;
        #20; //Delay Time
        //���ҳ���
        ps = 1'b0;
        rs = 1'b1;
        ls = 1'b0;
        rr = 1'b0;
        #20; //Delay Time
        //���󳵵�
        ps = 1'b0;
        rs = 1'b0;
        ls = 1'b1;
        rr = 1'b0;
        #20; //Delay Time
        //���ҳ�������ѭ��
        ps = 1'b0;
        rs = 1'b1;
        ls = 1'b1;
        rr = 1'b1;
        #20; //Delay Time
        //���ҳ�������ѭ��
        ps = 1'b0;
        rs = 1'b1;
        ls = 1'b1;
        rr = 1'b0;
        #20; //Delay Time
        //ȫ��ѡ
        ps = 1'b0;
        rs = 1'b0;
        ls = 1'b0;
        rr = 1'b0;
        #20; //Delay Time
    end
endmodule
