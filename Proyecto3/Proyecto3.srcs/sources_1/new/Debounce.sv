`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Joseph David Jimenez Zuñiga
// 
// Create Date: 10/28/2022 06:40:33 PM
// Design Name: Debounce Frequency not set
// Module Name: Debounce
// Project Name: Proyecto3
// Target Devices: NexysA7-100T
// Tool Versions: 
// Description: 
// Este circuito solo genera 1 pulso de señal en un periodo determinado(slow clock)
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Debounce( input push_buttonIN, input clk, output push_buttonOUT);

wire clkOUT_1Hz;
wire Q0,Q1,Q2,Q3,Q2_bar;

Clock_Enable u1(clk,clkOUT_1Hz);

my_DFlipFlop d0(clkOUT_1Hz,push_buttonIN,Q0);
my_DFlipFlop d1(clkOUT_1Hz,Q0,Q1);
my_DFlipFlop d2(clkOUT_1Hz,Q1,Q2);
my_DFlipFlop d3(clkOUT_1Hz,Q2,Q3);

assign push_buttonOUT = Q0 & Q1 & Q2 & Q3;

endmodule
