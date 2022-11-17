`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joseph David Jimenez Zuñiga
// 
// Create Date: 11/14/2022 09:13:06 PM
// Design Name: Prueba para el modulo de LEDS
// Module Name: LedsTestbench
// Project Name: Proyecto 3
// Target Devices: Nexys A7 - 100 T
// Tool Versions: 
// Description: 
// Testbench para el submodulo de Leds
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module LedsTestbench;
    logic clk = 0;
    logic [7:0] a,b;
    logic [13:0] leds;
    Leds U1(.clk(clk),.a(a),.b(b),.leds(leds));
    always  #20 clk = ~clk;
    initial begin
    a = 8'b1;
    b = 8'b0000011;
    #500
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
    #500
    a = 8'b1;
    b = 8'b0000011;
    end
endmodule
