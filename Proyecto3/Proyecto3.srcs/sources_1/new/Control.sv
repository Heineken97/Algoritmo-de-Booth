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

module Control(input logic done,clk,[2:0]Q,reset, output logic load_A,load_B,load_add,shift_HQ_LQ_Q_1,add_sub,dc);
    typedef enum logic [2:0] {S0,S1,S2,S3,S4,S5} statetype;
    statetype [2:0] state,nextState;
    
    always_ff @(posedge clk,posedge reset)
        if(reset) state<= S0;
        else state <= nextState;
     
    always@(*)
    case(state)
    S0: nextState = S1;
    S1: if(done)nextState = S1; else if(Q==3'b011 || Q==3'b000) nextState = S2;else if(Q==3'b010)nextState = S3;else if(Q==3'b001)nextState = S4; else nextState = S1;
    S2: nextState = S1;
    S3: if(done)nextState = S1; else nextState = S2;
    S4: if(done)nextState = S1; else nextState = S2;
    default: nextState = S0;
    endcase

    always @(posedge clk)
    begin
        case(state)
            S0: begin load_A = 1'b1;load_B = 1'b1;load_add = 1'b1;shift_HQ_LQ_Q_1 = 1'bx;add_sub = 1'bx;dc = 1'bx; end
            S1: begin load_A = 1'bx;load_B = 1'bx;load_add = 1'bx;shift_HQ_LQ_Q_1 = 1'bx;add_sub = 1'bx;dc = 1'bx; end
            S2: begin load_A = 1'bx;load_B = 1'bx;load_add = 1'bx;shift_HQ_LQ_Q_1 = 1'b1;add_sub = 1'bx;dc = 1'b1; end
            S3: begin load_A = 1'bx;load_B = 1'bx;load_add = 1'bx;shift_HQ_LQ_Q_1 = 1'bx;add_sub = 1'b0;dc = 1'bx; end
            S4: begin load_A = 1'bx;load_B = 1'bx;load_add = 1'bx;shift_HQ_LQ_Q_1 = 1'bx;add_sub = 1'b1;dc = 1'bx; end
            default: begin load_A = 1'bx;load_B = 1'bx;load_add = 1'bx;shift_HQ_LQ_Q_1 = 1'bx;add_sub = 1'bx;dc = 1'bx; end
        endcase
    end
    
    
    
endmodule
