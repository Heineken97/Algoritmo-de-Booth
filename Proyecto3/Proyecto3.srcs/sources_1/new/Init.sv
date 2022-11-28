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
    logic dc;
}ControlSignals;

module Init(input pushButton,reset ,logic[7:0]a,logic[7:0]b,output logic [7:0]anode, logic [7:0]cathode,logic [15:0] leds );
    ControlSignals controlsigns;
    logic valid,ready,done,clk,reset;
    logic [1:0] Q_LSB;
    logic [7:0] state;
    logic [15:0] Y = 15'd0;
    wire refreshclock;
    wire [2:0] refresh_counter;
    wire [3:0] ONE_DIGIT;
    wire [15:0] bcd_;


    Lectura L0(.clk(clk),.reset(reset),.a(a),.b(b),.pushButton(pushButton),.enable(ready));
    
    Leds U2(.clk(clk),.a(a),.b(b),.leds(leds));
            
    top top(.clk(clk),.rst(reset), .valid(valid),.A(a),.B(b),.Q_LSB(Q_LSB),.Y(Y), .state(state));

    ClockDivider Refreshclock_generator (.clk(clk),.divided_clk(refreshclock));
    
    RefreshCounter Refreshcounter_wrapper(.refresh_clock(refreshclock),.refresh_counter(refresh_counter));
    
    Bin2Bcd BCD_wrapper(.bin(Y),.bcd(bcd_));
    
    AnodoControl Anode_control_wrapper(.refresh_counter(refresh_counter),.anode(anode));
    
    BCDControl BCD_control_wrapper(.digit1(bcd_[3:0]),.digit2(bcd_[7:4]),.digit3(bcd_[11:8]),.digit4(bcd_[15:12]),.refresh_counter(refresh_counter),.ONE_DIGIT(ONE_DIGIT));
    
    BCDCathode BCD_to_Cathodes_Wrapper(.digit(ONE_DIGIT),.cathode(cathode));
    
endmodule
