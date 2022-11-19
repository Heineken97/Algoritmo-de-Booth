`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joseph David Jimenez Zuñiga
// 
// Create Date: 11/14/2022 09:13:06 PM
// Design Name: Prueba para el modulo de LEDS
// Module Name: LedsTestbench
// Project Name: Proyecto 3
// Target Devices: Nexys A7 - 100 T
// Tool Versions: 
// Description: 
// Testbench para el submodulo de Leds
// Dependencies: 
// 
// Revision:
// Revision Segunda Version
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module LedsTestbench;
    logic clk = 0;
    logic [7:0]a, b;
    logic [15:0]leds;
    logic rst = 1;

    // Clock definition
    localparam CLK_PERIOD = 10; // 100 Mhz (counter is in ns)
    localparam RST_COUNT = 10; //Clock cycles that reset is high
    
    Leds led(.clk(clk),.a(a),.b(b),.reset(~rst),.leds(leds));

    always begin
        clk   = #(CLK_PERIOD/2) ~clk;
    end

    initial begin
        rst = 1;
        #(RST_COUNT*CLK_PERIOD);
        b = 8'b00000100;
        a = 8'b00000111;
        @(posedge clk);
        rst = 0;
    end

 

endmodule
