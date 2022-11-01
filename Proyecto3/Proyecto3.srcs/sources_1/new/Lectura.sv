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
// Se activan los leds que corresponde a
// Dependencies: 
// 
// Revision:
// Revision 0.02 - Segunda Version
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Lectura(input pushButton,reset ,reg[7:0]a,reg[7:0]b,output reg[7:0]oa,reg[7:0]ob);
    wire clk,Q0A[7:0],Q1A[7:0],Q2A[7:0],Q3A[7:0],Q0B[7:0],Q1B[7:0],Q2B[7:0],Q3B[7:0];
    reg enable = 0;
    reg [25:0]counter = 0;

    // Contador verifica 500ms
    always@(pushButton == 1'b1 )
    begin
        if(counter == 26'd50000000)
            begin
                counter = 26'd0;
            end
        else
            begin
                counter = counter + 26'd1;
            end
        enable = (counter == 26'd50000000)?1'b1:1'b0;
    end

    //LEDS
    Leds U2(a,b,clk);
    //Antirebote A
    DFlipFlop d0A(.clk(clk),.reset(reset),.data(a),.Q(Q0A));
    DFlipFlop d1A(.clk(clk),.reset(reset),.data(Q0A),.Q(Q1A));
    DFlipFlop d2A(.clk(clk),.reset(reset),.data(Q1A),.Q(Q2A));
    DFlipFlop d3A(.clk(clk),.reset(reset),.data(Q2A),.Q(Q3A));
    //Antirebote B
    DFlipFlop d0B(.clk(clk),.reset(reset),.data(b),.Q(Q0B));
    DFlipFlop d1B(.clk(clk),.reset(reset),.data(Q0B),.Q(Q1B));
    DFlipFlop d2B(.clk(clk),.reset(reset),.data(Q1B),.Q(Q2B));
    DFlipFlop d3B(.clk(clk),.reset(reset),.data(Q2B),.Q(Q3B));
    //Si cumple con el tiempo presionado se envia
    always @(posedge clk)
    begin
        if(enable == 1'b1)
            begin
                assign oa = d0A & d1A & d2A & d3A;
                assign ob = d0B & d1B & d2B & d3B;
            end
        else
            begin
                assign oa = 7'b0;
                assign ob = 7'b0;
            end
    end

endmodule