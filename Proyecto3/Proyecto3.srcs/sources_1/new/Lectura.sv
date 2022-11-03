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


module Lectura(input pushButton,reset ,logic[7:0]a,logic[7:0]b,output logic enable);
    //logic oa[7:0],ob[7:0];
    logic [13:0] leds;
    logic clk,Q0A,Q1A,Q2A,Q3A,Q0B,Q1B,Q2B,Q3B;
    logic [25:0]counter = 0;

    // Contador verifica 500ms
    always@(*)
    begin
        if(pushButton == 1'b1)
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
    end

    //LEDS
    Leds U2(a,b,leds,clk);
    //Antirebote A
    DFlipFlop FliFlop0A(clk,reset,a,Q0A);
    DFlipFlop FliFlop1A(clk,reset,Q0A,Q1A);
    DFlipFlop FliFlop2A(clk,reset,Q1A,Q2A);
    DFlipFlop FliFlop3A(clk,reset,Q2A,Q3A);
    //Antirebote B
    DFlipFlop FliFlop0B(clk,reset,b,Q0B);
    DFlipFlop FliFlop1B(clk,reset,Q0B,Q1B);
    DFlipFlop FliFlop2B(clk,reset,Q1B,Q2B);
    DFlipFlop FliFlop3B(clk,reset,Q2B,Q3B);

    /*
    //Si cumple con el tiempo presionado se envia
    always @(posedge clk)
    begin
        if(enable == 1'b1)
            begin
              assign oa = FliFlop0A & FliFlop1A & FliFlop2AA & FliFlop3A;
              assign ob = FliFlop0B & FliFlop1B & FliFlop2B & FliFlop3B;
            end
        else
            begin
                assign oa = 7'b0;
                assign ob = 7'b0;
            end
    end
    */
endmodule

