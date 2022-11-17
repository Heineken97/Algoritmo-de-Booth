`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Joseph David Jimenez Zuñiga 
// 
// Create Date: 11/13/2022 12:58:25 PM
// Design Name: Prueba para el modulo de Lectura
// Module Name: LecturaTestbench
// Project Name: Proyecto 3
// Target Devices: Nexys A7 - 100T
// Tool Versions: 
// Description: 
// Testbench para probar el submodulo de Lectura
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module LecturaTestbench;
    logic clk = 0;
    logic pushButton,enable;
    logic [7:0] a,b;
    logic oa,ob;
    Lectura U1(.pushButton(pushButton),.clk(clk),.a(a),.b(b),.enable(enable),.oa(oa),.ob(ob));
    always  #20 clk = ~clk;
    initial begin
        a = 8'b0000001;
        b = 8'b0000011;
        pushButton = 1'b0;
        enable = 1'b0;
        #500
        pushButton = 1'b1;
        #100
        pushButton = 1'b0;
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
        pushButton = 1'b1;
        #500
        pushButton = 1'b0;
    end
endmodule
