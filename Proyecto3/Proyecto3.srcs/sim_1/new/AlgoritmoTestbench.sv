`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Joseph David Jimenez Zuñiga 
// 
// Create Date: 11/14/2022 09:04:33 PM
// Design Name: Prueba para Controlador-Datapath
// Module Name: AlgoritmoTestbench
// Project Name: Proyecto3
// Target Devices: Nexys A7 - 100T
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
typedef struct packed {
    logic load_A;
    logic load_B;
    logic load_add;
    logic shift_HQ_LQ_Q_1;
    logic add_sub;
    logic dc;
}ControlSignals;

module AlgoritmoTestbench;
    logic reset,clk,done;
    logic [7:0] Y;
    logic [2:0] Q_LSB;
    logic [4:0] counter;
    logic [7:0] a,b;
    ControlSignals control;
    
    Multiplicador Multiplicador(.clk(clk),.rst(reset),.A(a),.B(b),.mult_control(control),.Q_LSB(Q_LSB),.Y(Y),.done(done),.counter(counter));
    
    Control Controlador(.done(done),.reset(reset),.clk(clk),.Q(Q_LSB) ,.load_A(control.load_A),.load_B(control.load_B),.load_add(control.load_add),.shift_HQ_LQ_Q_1(control.shift_HQ_LQ_Q_1),.add_sub(control.add_sub),.dc(control.dc));
    
    initial begin
        #50
        #10 clk=1;
        #10 clk=0;
        Y = 8'b0 ; 
        Q_LSB = 3'b0;
        a = 8'b0000100;
        b = 8'b0000111;
        #10 clk=1;
        #10 clk=0;
        #10 clk=1;
        #10 clk=0;
        #10 clk=1;
        #10 clk=0;
        #10 clk=1;
        #10 clk=0;
        #10 clk=1;
        #10 clk=0;
        #10 clk=1;
        #10 clk=0;
        #10 clk=1;
        #10 clk=0;
        #10 clk=1;
        #10 clk=0;
        #10 clk=1;
        #10 clk=0;
        #10 clk=1;
        #10 clk=0;
        #10 clk=1;
        #10 clk=0;
        #10 clk=1;
        #10 clk=0;
        #10 clk=1;
        #10 clk=0;
        #10 clk=1;
        #10 clk=0;
        #10 clk=1;
        #10 clk=0;

    end
endmodule
