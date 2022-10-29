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


module Lectura(input pushButton,input [7:0]a,input [7:0]b,output [7:0]oa,output [7:0]ob);
    wire clkOut;
    wire enable;
    reg [7:0] A;
    reg [7:0] B;
    begin
        Reloj_Gen U1(pushButton,clkOut);
        //Complemento
        if(a[7] == 1)
            assign A = ~a + 1;
        else
            assign A = a;
        if(b[7] == 1)
            assign B = ~b + 1;
        else
            assign B = b;
            
        //LEDS
        Leds U2(A,B);
        //Antirebote
        Antirebote U3(pushButton,clkOut,enable);
        
        if(enable == 1)
            assign oa= A;
            
            assign ob= B;
        
    end
endmodule
