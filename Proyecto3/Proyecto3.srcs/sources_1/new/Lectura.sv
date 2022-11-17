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


module Lectura(input pushButton,clk ,a,b,output logic enable,oa,ob);
    logic pushButton,clk,enable;
    logic [7:0] a,b;
    logic [7:0]oa,ob;
    logic [3:0][7:0] FFA,FFB;
    
    logic [25:0]counter = 0;
    // Contador verifica 500ms
    always@(*)
    begin
        if(pushButton == 1'b1)
        begin
            if(counter == 26'd50000000)
                begin
                    counter <= 26'd0;
                end
            else
                begin
                    counter <= counter + 26'd1;
                end
            enable <= (counter == 26'd50000000)?1'b1:1'b0;
        end
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

