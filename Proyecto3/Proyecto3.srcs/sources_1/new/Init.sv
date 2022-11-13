`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Joseph David Jimenez Zuñiga
// 
// Create Date: 11/02/2022 07:35:53 PM
// Design Name: Inicia el circuito
// Module Name: Init
// Project Name: Proyecto 3
// Target Devices: Nexys A7 - 100T
// Tool Versions: 
// Description: 
// Sirve para unir todos los submodulos
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
interface ControlSignals;
logic enable;
endinterface 

module Init(input pushButton,reset ,logic[7:0]a,logic[7:0]b,logic[3:0]button,output logic[7:0]out, logic [3:0]anode, logic [7:0]cathode );
    ControlSignals control();
    logic mult_control;
    logic clk ;
    logic refreshclock;
    logic [2:0] Q_LSB;
    logic [15:0] Y;
    logic [1:0] refresh_counter;
    logic [3:0] ONE_DIGIT;
    logic [7:0] oa,ob;
    
    assign control.enable = 1'b0;
    Lectura L0(pushButton, reset,a,b,control.enable,oa,ob);
    begin
        Multiplicador Multiplicador(clk,reset,a,b,mult_control,Q_LSB,Y);
        ClockDivider Refreshclock_generator(.clk(clk),.divided_clk(refreshclock));
        RefreshCounter Refreshcounter_wrapper(.refresh_clock(refreshclock),.refresh_counter(refresh_counter));
        AnodoControl Anode_Control_wrapper(.refresh_counter(refresh_counter),.anode(anode));
        BCDControl BCD_Control_wrapper(.digit1(out[3:0]),.digit2(out[7:4]),.digit3(button[3:0]),.digit4(button[3:0]),.refresh_counter(refresh_counter),.ONE_DIGIT(ONE_DIGIT));
        BCDCathode BCD_to_Cathodes_Wrapper(.digit(ONE_DIGIT),.cathode(cathode));
    end


endmodule
