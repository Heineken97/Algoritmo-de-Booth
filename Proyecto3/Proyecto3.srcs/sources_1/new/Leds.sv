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
// Revision Segunda Version
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Leds( input logic clk,reset,input logic [7:0] a, input logic [7:0] b, output logic[15:0] leds);
    parameter [63:0] CLK_RATE = 100000000;
    parameter [63:0]  FLASH_RATE_ON_MS = 1000;
    parameter [63:0]  FLASH_RATE_OFF_MS = 1000;
    parameter [63:0]  FLASH_RATE_ON_CYCLES = CLK_RATE*FLASH_RATE_ON_MS/1000;
    parameter [63:0]  FLASH_RATE_OFF_CYCLES = CLK_RATE*FLASH_RATE_OFF_MS/1000;
    logic [31:0] flash_counter;
    logic on_not_off_flag;


    always_ff@(posedge clk, negedge reset) begin
        if (reset == 0) begin
            flash_counter <= 0;
            on_not_off_flag <= 0;
        end
        else begin
            if (on_not_off_flag) begin
                if (flash_counter < FLASH_RATE_ON_CYCLES-1) begin
                    flash_counter <= flash_counter + 1;
                end
                else begin
                    flash_counter <= 0;
                    on_not_off_flag <= ~on_not_off_flag;
                end
            end
            else begin
                if (flash_counter < FLASH_RATE_OFF_CYCLES-1) begin
                    flash_counter <= flash_counter + 1;
                end
                else begin
                    flash_counter <= 0;
                    on_not_off_flag <= ~on_not_off_flag;
                end
            end
        end
    end
    assign leds[0] = a[0];
    assign leds[1] = a[1];
    assign leds[2] = a[2];
    assign leds[3] = a[3];
    assign leds[4] = a[4];
    assign leds[5] = a[5];
    assign leds[6] = a[6];
    assign leds[7] = a[7];
    assign leds[8] = b[0];
    assign leds[9] = b[1];
    assign leds[10] = b[2];
    assign leds[11] = b[3];
    assign leds[12] = b[4];
    assign leds[13] = b[5];
    assign leds[14] = b[6];
    assign leds[15] = b[7];
endmodule
