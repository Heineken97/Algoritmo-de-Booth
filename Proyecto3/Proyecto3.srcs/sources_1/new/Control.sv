`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Joseph David Jimenez Zu�iga
// 
// Create Date: 11/14/2022 08:09:41 PM
// Design Name: Unidad de Control
// Module Name: Control
// Project Name: Proyecto 3
// Target Devices: Nexys A7 - 100 T
// Tool Versions: 
// Description: 
// Unidad de control que recibe las entradas de la ruta de datos 
// crea las se�ales para lograr controlar la ruta de datos 
// load indica que se cargan los registros, add inicia la operacion de adicion 
// sub inicia la operacion de sustraccion, shift hacer el movimiento aritmetico, dc decrementa
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Control(input logic valid,reset,clk,[7:0]Q_1,[2:0]Q0, output logic load_A,load_B,load_add,shift_HQ_LQ_Q_1,add_sub);
    typedef enum logic [1:0] {S0,S1,S2} statetype;
    statetype [1:0] state,nextState;
    
    always_ff @(posedge clk,posedge reset)
        if(reset) state<= S0;
        else state <= nextState;
        
    always_comb 
    case(state)
    S0: nextState = S1;
    S1: nextState = S2;
    S2: nextState = S0;
    default: nextState = S0;
    endcase
    
    always @(valid)
    begin
        case(state)
            S0: begin load_A=1;load_B=1;load_add=1;shift_HQ_LQ_Q_1=0;add_sub=0; end
            S1: begin load_A=0;load_B=0;load_add=0;shift_HQ_LQ_Q_1=0;add_sub=1; end
            S2: begin load_A=0;load_B=0;load_add=0;shift_HQ_LQ_Q_1=1;add_sub=0; end
            default: begin load_A=0;load_B=0;load_add=0;shift_HQ_LQ_Q_1=0;add_sub=0; end
        endcase
    end
    
endmodule
