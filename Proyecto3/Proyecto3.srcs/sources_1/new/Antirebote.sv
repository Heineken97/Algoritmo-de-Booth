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


module Antirebote( input buttonPress, input clk, output result);
    wire clkOUT;
    wire Q0,Q1,Q2,Q3,Cout;
    DFlipFlop d0(clkOUT,buttonPress,Q0);
    DFlipFlop d1(clkOUT,Q0,Q1);
    DFlipFlop d2(clkOUT,Q1,Q2);
    DFlipFlop d3(clkOUT,Q2,Q3);
    
    assign result = Q0 & Q1 & Q2 & Q3;

endmodule
