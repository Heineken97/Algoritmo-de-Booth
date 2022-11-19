`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Joseph David Jimenez Zu�iga
// 
// Create Date: 10/23/2022 10:54:26 AM
// Design Name: Multiplicador sin control
// Module Name: Multiplicador
// Project Name: Proyecto3
// Target Devices: NexysA7-100T
// Tool Versions: 
// Description: 
// Corresponde a la Ruta de Datos del algoritmo de booth
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
typedef struct packed{
    logic load_A;
    logic load_B;
    logic load_add;
    logic shift_HQ_LQ_Q_1;
    logic add_sub;
    logic dc;
} multi_control_t;

module Multiplicador#(
    parameter N = 8
)(
    input logic clk,reset,
    input logic [N-1:0]A,
    input logic [N-1:0]B,
    input multi_control_t mult_control,
    output logic [2:0] Q_LSB,
    output logic [2*N-1:0] Y,
    output done,counter);
    
    logic [N-1:0] M;
    logic [N-1:0] adder_sub_out;
    logic [2*N:0] shift;
    logic [N-1:0] HQ;
    logic [N-1:0] LQ;
    logic Q_1;
    logic one = 4'b0001;
    logic done = 0 ;
    logic [4:0] counter;
   
    //reg_m
    always_ff@(posedge clk) begin
        if(reset)
            M<='b0;
        else
            M<=(mult_control.load_A)? A:M;
    end
    //reg_counter
    always@(posedge clk)
      if(reset)
            counter = 4'b0111;
            
    //adder/sub
    always_comb begin
        if(mult_control.add_sub)
            adder_sub_out = M+HQ;
        else
            adder_sub_out = M-HQ;
    end
    //adder/counter
    always @(posedge clk) begin
        if(counter == 4'b0000)
        counter = 4'b0111;
        if(mult_control.dc)
        counter = counter-one;
    end
    //adder/done
    always @(posedge clk) begin
        if(counter == 4'b0000)
         done = 1;
    end
    //shiftRegister
    always_comb begin
        Y = {HQ,LQ};
        HQ = shift[2*N:N+1];
        LQ = shift[N:1];
        Q_1 = shift[0];
        Q_LSB = {LQ[0],Q_1};
    end

    always_ff@(posedge clk) begin
    if(!done)
        if(reset)
            shift <='b0;
        else if( mult_control.shift_HQ_LQ_Q_1)
            //arithmetic shift
            shift <= $signed(shift)>>>1;
        else begin
            if(mult_control.load_B)
                shift[N:1] <= B;
            if(mult_control.load_add)
                shift[2*N:N+1] <= adder_sub_out;
        end
    end
endmodule
