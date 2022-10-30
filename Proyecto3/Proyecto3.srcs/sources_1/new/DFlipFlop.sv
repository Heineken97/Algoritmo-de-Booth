`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Joseph David Jimenez Zuñiga
// 
// Create Date: 10/28/2022 06:46:15 PM
// Design Name: Flip Flop D
// Module Name: my_DFlipFlop
// Project Name: Proyecto3
// Target Devices: NexysA7-100T
// Tool Versions: 
// Description: 
// Flip Flop basico
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module DFlipFlop(input [7:0]DataA, [7:0]DataB, Clk, Sync_reset,output reg [7:0]QA, [7:0]QB);
    always@(posedge Clk)
    begin
        if(Sync_reset == 1'b1)
        begin
            QA <= 7'b0;
            QB <= 7'b0;
        end
        else
        begin
            QA <= DataA;
            QB <= DataB;
        end
        
    end
endmodule
