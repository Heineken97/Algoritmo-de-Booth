`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Joseph David Jimenez Zuñiga
// 
// Create Date: 11/14/2022 08:09:41 PM
// Design Name: Unidad de Control
// Module Name: Control
// Project Name: Proyecto 3
// Target Devices: Nexys A7 - 100 T
// Tool Versions: 
// Description: 
// Unidad de control que recibe las entradas de la ruta de datos 
// crea las señales para lograr controlar la ruta de datos 
// load indica que se cargan los registros, add inicia la operacion de adicion 
// sub inicia la operacion de sustraccion, shift hacer el movimiento aritmetico, dc decrementa
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Control(input logic clk,Q1, Q0, output logic add,sub,load,shift,dc);
    logic [2:0]state;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;
    always @(posedge clk)
    begin
        case(state)
            S0: if(Q0 != 0) state<= S1;
            S1: state <= S2;
            S2: state <= S3;
            S3: state <= S4;
            S4: state <= S0;
            default: state<= S0;
        endcase
    end
    always @(state)
    begin
        case(state)
            S0: begin #1 load=1;add=0;sub=0;shift=0;dc=0; end
            S1: begin #1 load=0;add=1;sub=0;shift=0;dc=0; end
            S2: begin #1 load=0;add=0;sub=1;shift=0;dc=0; end
            S3: begin #1 load=0;add=0;sub=0;shift=1;dc=0; end
            S4: begin #1 load=0;add=0;sub=0;shift=0;dc=1; end
            default: begin #1 load=0;add=0;sub=0;shift=0;dc=0; end
        endcase
    end


endmodule
