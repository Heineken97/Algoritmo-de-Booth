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
}ControlSignals;

module AlgoritmoTestbench;
    logic reset, enable, clk;
    logic [7:0] Y;
    logic [2:0] Q_LSB;
    logic [7:0] a,b;
    ControlSignals control;
    
    Multiplicador Multiplicador(.clk(clk),.rst(reset),.A(a),.B(b),.mult_control(control),.Q_LSB(Q_LSB),.Y(Y));
    
    Control Controlador(.valid(enable),.reset(reset),.clk(clk),.Q(Q_LSB),.load_A(control.load_A),.load_B(control.load_B),.load_add(control.load_add),.shift_HQ_LQ_Q_1(control.shift_HQ_LQ_Q_1),.add_sub(control.add_sub));
    
    initial begin
        #5 clk=1;
        #5 clk=0;
        reset = 1'b1;
        #500
        #5 clk=1;
        #5 clk=0;
        reset = 1'b0;
        Y = 8'b0 ; 
        Q_LSB = 3'b0;
        a = 8'b0000100;
        b = 8'b0000111;
        #5 clk=1;
        #5 clk=0;
        #5 clk=1;
        #5 clk=0;
        #5 clk=1;
        #5 clk=0;
        #5 clk=1;
        #5 clk=0;
        #5 clk=1;
        #5 clk=0;
        #5 clk=1;
        #5 clk=0;
        #5 clk=1;
        #5 clk=0;
        #5 clk=1;
        #5 clk=0;
        #5 clk=1;
        #5 clk=0;
        enable = 1'b1; 
        #5 clk=1;
        #5 clk=0;
        #5 clk=1;
        #5 clk=0;
        #5 clk=1;
        #5 clk=0;
        #5 clk=1;
        #5 clk=0;
        #5 clk=1;
        #5 clk=0;
        #5 clk=1;
        #5 clk=0;
        #500
        a[0]=0;
        a[1]=0;
        a[2]=0;
        a[3]=0;
        a[4]=0;
        b[0]=1;
        b[1]=1;
        b[2]=1;
        b[3]=1;
        b[4]=1;
        #5 clk=1;
        #5 clk=0;
        #5 clk=1;
        #5 clk=0;
        #5 clk=1;
        #5 clk=0;
    end
endmodule
