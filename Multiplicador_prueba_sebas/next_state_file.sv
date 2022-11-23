`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2022 11:39:00 PM
// Design Name: 
// Module Name: next_state_file
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module next_state_file(
    input logic clk,
    input logic rst,
    input logic valid,
    input logic Q_0,
    input logic Q_1,
    input mult_control_t mult_control,
    output logic state
    );
   logic Z;
   logic [7:0] nextState;
   logic [7:0] cont;
   
   
   //flip flop registra el estado
   always@ (posedge clk, rst)
   begin
   if(rst == 1)
   begin 
   state <= 8'd0;
   cont <=8'd7;
   end
   else
   begin
   state <= nextState;
   end
   end 
   
   always @ *
   begin
    case (state)
    8'd0: //IDLE
    begin
        if(valid)
        begin
            nextState = 8'd1;
        end
        else
        begin
         nextState = 8'd0;
        end
    end
    8'd1://INIT
    begin
        nextState = 8'd2;
    end
    8'd2: //MUL0
    begin
        if(Q_0 == Q_1)
        begin
           nextState = 8'd6;
        end
        else
        begin
            nextState = 8'd3;
        end
    end
    8'd3: //ADD_SUB
    begin
        if(Q_0)
        begin
            nextState = 8'd4;
        end
        else
        begin
            nextState = 8'd5;
        end
    end
    8'd4: //ADD
    begin
        nextState = 8'd6;
    end
    8'd5: //SUB
    begin
        nextState = 8'd6;
    end
    8'd6: //shift
    begin
        nextState = 8'd7;
    end
    8'd7://MUL1
    begin
        if(Z)
        begin
            nextState = 8'd0;
        end
        else
        begin
            nextState = 8'd2;
        end
    end
    default:
    begin
        nextState = 8'd0;
    end
    endcase
   end
   
   //output logic
   always @*
   begin
   case(state)
   8'd1: //Se activa la señal para cargar A y se inicia el contador en 8
   begin
        cont = 8'd7;
        mult_control.load_A = 1;
   end
   8'd4: //se activa la señal para hacer suma
   begin
        mult_control.add_sub =1;
   end
   8'd5: // se desactiva la señal para hcaer suma, asi que pasa a resta
   begin
        mult_control.add_sub =0;
   end
   8'd6: //cuando hacer un load B o un shit_HQ_LQ_Q_1 o ninguno
   begin
        //agregar logica del shift
        cont = cont-1;
        if(cont==0)
        begin
            Z =1;
        end
        else
        begin
        Z =0;
        end
   end
   default: //casoo default, estados que no hacen nada
   begin
   mult_control.load_A =0;
   mult_control.load_B =0;
   mult_control.load_add =0;
   mult_control.shift_HQ_LQ_Q_1=0;
   mult_control.add_sub=0;
   end
   endcase
   end
endmodule
