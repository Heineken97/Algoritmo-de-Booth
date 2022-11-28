`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Joseph David Jimenez Zuñiga
// 
// Create Date: 10/29/2022 01:45:15 PM
// Design Name: Submodulo 1 Lectura
// Module Name: Lectura
// Project Name: Proyecto3
// Target Devices: Nexys A7 - 100T
// Tool Versions: 
// Description: 
// Subsistema de Lectura espera boton de espera para enviar los datos al subsistema de multiplicacion
// Se activan los leds que corresponde a y posee un sistema antirebote con FF para sincronizar el dato de entrada
// Dependencies: 
// 
// Revision:
// Revision 0.02 - Segunda Version
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Lectura(input clk,reset,a,b,pushButton, output enable);
    logic pushButton,clk,enable,oa,ob,on_not_off_flag;
    logic [7:0] a,b;
    logic [31:0] counter,counterB;
    logic [3:0][7:0] FFA,FFB;
    
    parameter [63:0] CLK_RATE = 500000000;
    parameter [63:0]  RATE_ON_MS = 1000;
    parameter [63:0]  RATE_OFF_MS = 1000;    
    
    parameter [63:0]  RATE_ON_CYCLES = CLK_RATE*RATE_ON_MS/1000;
    parameter [63:0]  RATE_OFF_CYCLES = CLK_RATE*RATE_OFF_MS/1000;
         
    always_ff@(posedge clk, negedge reset) begin
        if (reset == 0) begin
         counter <= 0;
         on_not_off_flag <= 0; 
         end
         else begin
         if (counter < RATE_ON_CYCLES-1 || counter < RATE_OFF_CYCLES-1) begin
         counter <= counter + 1;
         end
         else begin
         counter <= 0;
         end
         end
    end
    // Contador verifica 500ms
    always@(*)
    begin
        if(pushButton == 1'b1)
        begin
            enable <=  1'b1; 
            counterB <= counter + 1;     
        end
        //if(oa && ob)
        //enable <= (counter == counterB)?1'b1:1'b0;
    end

    //Antirebote
    always @(posedge clk)
    begin
        FFA <= {a,FFA[3],FFA[2],FFA[1]};
        FFB <= {b,FFB[3],FFB[2],FFB[1]};
    end
    
    always_comb
    begin
        oa <= FFA[3] & (~FFA[2]) & (~FFA[1]) & (~FFA[0]);
        ob <= FFB[3] & (~FFB[2]) & (~FFB[1]) & (~FFB[0]);
    end
endmodule

