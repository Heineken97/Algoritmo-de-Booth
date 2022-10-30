`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Joseph David Jimenez Zuñiga
// 
// Create Date: 10/29/2022 01:45:15 PM
// Design Name: Submodulo 1 Lectura
// Module Name: Lectura
// Project Name: Proyecto3
// Target Devices: Nexys A7 - 100T
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


module Lectura(input pushButton,reset ,[7:0]a,[7:0]b,output reg[7:0]oa,reg[7:0]ob);
    wire clkOut;
    wire enable;
    reg [7:0] A;
    reg [7:0] B;

    Reloj_Gen U1(pushButton,clkOut);
    
    //Complemento    
    assign A = (a[7]==0)? a[6:0]: ~a[6:0] + 1'b1;
    assign B = (b[7]==0)? b[6:0]: ~b[6:0] + 1'b1;
    //LEDS
    Leds U2(A,B,clkOut);
    //Antirebote
    Antirebote U3(pushButton,reset,A,B,clkOut,enable);
    //Asignacion
    
    assign oa = (enable==1)? {A} : {8'b0};
    assign ob = (enable==1)? {B} : {8'b0};
    
    assign oa= A;

    assign ob= B;
endmodule
