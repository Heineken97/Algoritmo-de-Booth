`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2022 12:58:25 PM
// Design Name: 
// Module Name: LecturaTestbench
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


module LecturaTestbench;
    logic pushButton,enable;
    logic [7:0] a,b;
    logic [7:0] oa,ob;
    logic [13:0] leds;
    Lectura U1(pushButton,a,b,enable,oa,ob);
    Leds U2(a,b,leds);
    
    initial begin
    
    pushButton = 1'b0;
    enable = 1'b0;
    #50
    a = 8'b1;
    b = 8'b0000011;
    pushButton = 1'b1;
    #50
    pushButton = 1'b0;
    #50
    a[0]=0;
    a[1]=0;
    a[2]=0;
    a[3]=0;
    a[4]=0;
    b[0]=1;
    b[1]=1;
    b[2]=1;
    b[3]=1;
    b[4]=1;
    #50
    a = 8'b1;
    b = 8'b0000011;
    pushButton = 1'b1;
    #50
    pushButton = 1'b0;
    end
endmodule
