`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Joseph David Jimenez Zuñiga
// 
// Create Date: 10/29/2022 03:42:08 PM
// Design Name: Complemento en leds
// Module Name: Leds
// Project Name: Proyecto3
// Target Devices:  Nexys Ay - 100T
// Tool Versions: 
// Description: 
// Cuando se ha obtenido el complemento se visualiza en los leds
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Leds( input wire [7:0] compl1, input wire [7:0] compl2, output reg[13:0] leds, input clk);
    reg [25:0] counter = 26'd0;
    reg enable = 0;

    always @(posedge clk)
    begin
        if(enable)
            leds[14:8] <= compl1;
            leds[0:7] <= compl2;
    end
    always @*
    begin
        if(counter == 26'd50000000)
            counter = 26'd0;
        else
            counter = counter + 26'd1;
    end
endmodule
