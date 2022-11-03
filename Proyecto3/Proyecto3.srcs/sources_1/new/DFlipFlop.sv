`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Joseph David Jimenez Zuñiga
// 
// Create Date: 11/01/2022 03:33:08 PM
// Design Name: Flip Flop D 
// Module Name: DFlipFlop
// Project Name: Proyecto 3
// Target Devices: Nexys A7 - 100T
// Tool Versions: 
// Description: 
// El modulo corresponde a un flip flop D basico de 8 bits
// Dependencies: 
// 
// Revision:
// Revision 0.02 - Flip Flop arreglado 8 bits
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module DFlipFlop(input clk,reset,logic [7:0]data, output logic [7:0]Q);
    always_ff @(posedge clk)
    begin
        if(reset == 1'b1)
            begin
                Q <= 7'b0;
            end
        else
            begin
                Q <= data;
            end
    end
endmodule