`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Joseph David Jimenez Zuñiga
// 
// Create Date: 10/29/2022 03:42:08 PM
// Design Name: Complemento en leds
// Module Name: Leds
// Project Name: Proyecto3
// Target Devices: Nexys Ay - 100T
// Tool Versions: 
// Description: 
// Se encarga de recibir las entradas en formato de complemento y pasa a visualizar en leds
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Leds( input logic clk,input logic [7:0] a, input logic [7:0] b, output logic[13:0] leds);
    logic [25:0] counter = 26'd0;
    logic valid = 1;
    always @(posedge clk)
    begin
        if(valid)
        begin
            leds[13:8] = a;
            leds[7:0] = b;
        end
    end
    always @*
    begin
        if(counter == 26'd50000000)
            begin
                counter = 26'd0;
            end
        else
            begin
                counter = counter + 26'd1;
            end
        valid = (counter == 26'd50000000)? 1'b1:1'b0;
    end
endmodule
