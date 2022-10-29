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

module my_DFlipFlop(input DFF_CLOCK, clock_enable, D, output reg Q=0);
    always@(posedge DFF_CLOCK)
    begin
        if(clock_enable)
            Q<=D;
    end
endmodule
