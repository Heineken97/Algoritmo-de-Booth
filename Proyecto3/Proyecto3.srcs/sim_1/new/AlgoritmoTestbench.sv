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
typedef struct packed{
    logic load;
    logic add;
    logic sub;
    logic shift;
    logic dc;
} ControlSignals;

module AlgoritmoTestbench;
    logic reset, clk, Y, Q_LSB;
    logic [7:0] a,b;
    ControlSignals control;
    Control Controlador(clk,Y, Q_LSB, control.add,control.sub,control.load,control.shift,control.dc);
    Multiplicador Multiplicador(clk,reset,a,b,control,Q_LSB,Y);
    always #5 clk = ~clk;
    initial begin
        a = 8'b1;
        b = 8'b0000011;
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
    end
    initial
    begin
        $monitor($time,"%a %b %c %d", Y, Q_LSB,a,b);
    end
endmodule
