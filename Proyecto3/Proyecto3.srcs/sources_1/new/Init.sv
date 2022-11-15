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
// Inicial el modulo de Lectura, cuando este esta listo, habilita la ruta de datos y el multiplicador
// Une los modulos de contadores y su paso a BCD y los submodulos de despliegue 
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

module Init(input pushButton,reset ,logic[7:0]a,logic[7:0]b,logic[3:0]button,output logic[7:0]out, logic [3:0]anode, logic [7:0]cathode );
    ControlSignals controlsigns;
    logic enable;
    logic clk ;
    logic refreshclock;
    logic [2:0] Q_LSB;
    logic [15:0] Y;
    logic [1:0] refresh_counter;
    logic [3:0] ONE_DIGIT;
    logic [7:0] oa;
    logic [7:0] ob;

    Lectura L0(.pushButton(pushButton),.a(a),.b(b),.enable(enable),.oa(oa),.ob(ob));
    
    Multiplicador Multiplicador(.clk(clk),.rst(reset),.A(oa),.B(ob),.mult_control(controlsigns),.Q_LSB(Q_LSB),.Y(Y));
    
    Control Controlador(.valid(enable),.reset(reset),.clk(clk),.Q_1(Y),.Q0(Q_LSB),.load_A(controlsigns.load_A),.load_B(controlsigns.load_B),.load_add(controlsigns.load_add),.shift_HQ_LQ_Q_1(controlsigns.shift_HQ_LQ_Q_1),.add_sub(controlsigns.add_sub));
    
    ClockDivider Refreshclock_generator(.clk(clk),.divided_clk(refreshclock));

    RefreshCounter Refreshcounter_wrapper(.refresh_clock(refreshclock),.refresh_counter(refresh_counter));

    AnodoControl Anode_Control_wrapper(.refresh_counter(refresh_counter),.anode(anode));

    BCDControl BCD_Control_wrapper(.digit1(out[3:0]),.digit2(out[7:4]),.digit3(button[3:0]),.digit4(button[3:0]),.refresh_counter(refresh_counter),.ONE_DIGIT(ONE_DIGIT));

    BCDCathode BCD_to_Cathodes_Wrapper(.digit(ONE_DIGIT),.cathode(cathode));
    
endmodule
