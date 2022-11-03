`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Joseph David Jimenez Zuñiga
// 
// Create Date: 10/30/2022 02:12:02 PM
// Design Name: Prueba subsistema de Lectura
// Module Name: Lectura_Testbench
// Project Name: Proyecto3
// Target Devices: Nexys A7 - 100T 
// Tool Versions: 
// Description: 
// Permite realizar las pruebas al modulo de lectura
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Lectura_Testbench();

    reg pushButton,reset;
    reg [7:0]a = 10000001;
    reg [7:0]b = 10000010;
    wire [7:0]oa;
    wire [7:0]ob;

    Lectura U1(pushButton,reset,a,b,oa,ob);
    
    initial begin
        a= 10000001;
        b= 10000010;
        pushButton = 0;
        reset = 1;
        #10
        reset = 0;
        pushButton = 1;
        #600
        pushButton = 1;
        #300
        a= 10000011;
        b= 00000010;
        pushButton = 1;
        #500
        pushButton = 0;
    end

endmodule
