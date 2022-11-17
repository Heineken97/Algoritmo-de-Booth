`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2022 06:31:56 PM
// Design Name: 
// Module Name: BCDtb
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


module BCD_tb;

  logic clk = 0; 
  logic [13:0] caca = 14'b1110;
  logic [15:0] cacaSaliente;

  bin2bcd DUC (caca, cacaSaliente);
  
  initial begin
    #5 clk = ~ clk;
  end

endmodule

