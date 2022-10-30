`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Joseph David Jimenez Zuñiga
// 
// Create Date: 10/29/2022 02:55:07 PM
// Design Name: Antirebote
// Module Name: Antirebote
// Project Name: Proyecto3
// Target Devices: Nexys Ay - 100T
// Tool Versions: 
// Description: 
// Cuando los se utilizan botones y hay cambios entre sus estados puede generar ruido por lo cual se pasa a este sistema Antirebote
// el reloj y el pulso hacia los respectivos flip flops
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Antirebote( input buttonPress, reset, A, B , input clk, output result);

    wire Q0A,Q1A,Q2A,Q3A,Q0B,Q1B,Q2B,Q3B;
    reg CoutA,CoutB;
    
    DFlipFlop d0(A,B,clk,Q0A,Q0B);
    DFlipFlop d1(Q0A,Q0B,clk,Q1A,Q1B);
    DFlipFlop d2(Q1A,Q1B,clk,Q2A,Q2B);
    DFlipFlop d3(Q2A,Q2B,clk,Q3A,Q3B);
    
    assign CoutA = Q3A;
    
    assign CoutB = Q3B;
    
    assign result = 1'b1;

endmodule
