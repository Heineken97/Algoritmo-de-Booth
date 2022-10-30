`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Joseph David Jimenez Zuñiga
// 
// Create Date: 10/29/2022 03:06:52 PM
// Design Name: Clock generador 500ms -> 2Hz
// Module Name: Reloj_Gen
// Project Name: Proyecto3
// Target Devices: Nexys A7 - 100T
// Tool Versions: 
// Description: 
// Este modulo se encarga de generar un reloj a 2Hz
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Reloj_Gen(input enable, output reg clk);

    parameter FREQ = 0.002;
    parameter PHASE = 0;
    parameter DUTY = 50;

    real clk_pd = 1.0 /(FREQ * 1e3) * 1e9;
    real clk_on = DUTY / 100.0 * clk_pd ;
    real clk_off =(100.0 - DUTY)/100 * clk_pd;
    real quarter = clk_pd/4;
    real start_delay = quarter * PHASE/90;

    reg start_clk;

    initial begin
        clk <= 0;
        start_clk  <= 0;
    end
/*
Cuando el clock se activa(enabled), el retraso permite(delay) permite 
alcanzar el efecto de fase, Permite obtener suficiente tiempo para completar la fase
*/
    always@ (posedge enable or negedge enable)
    begin
    if(enable)
        begin
            #(start_delay)start_clk = 1;
        end
    else
        begin
            #(start_delay )start_clk = 0;
        end
    end  
/*
Se ejecuta mientras el reloj esta activo cuando alcanza el ciclo de trabajo
*/
    always@ (posedge start_clk)
    begin
    if(start_clk)
        begin
            clk = 1;
            while(start_clk )
            begin
            #(clk_on ) clk = 0;
            #(clk_off ) clk = 1;
            end
        end
    end
endmodule
