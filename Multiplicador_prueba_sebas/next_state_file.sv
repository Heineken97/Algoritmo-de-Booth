module next_state_file(
    input logic clk,
    input logic rst,
    input logic valid,
    input logic Q_0,
    input logic Q_1,
  output logic[7:0] state,
  	output logic load_A,
    output logic load_B,
    output logic load_add,
    output logic shift_HQ_LQ_Q_1,
    output logic add_sub
    );
  
   logic Z;
   logic [7:0] nextState;
   logic [7:0] cont;
   logic bool =0;
   
   
   //flip flop registra el estado
   always@ (posedge clk,rst)
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
   
   /**always @ (rst)
   begin 
   if(rst == 1)
   begin 
   state <= 8'd0;
   cont <=8'd7;
   end
   end**/
   
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
            nextState = 8'd5;
        end
        else
        begin
            nextState = 8'd4;
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
        load_A = 1;
     	load_B =1;
     	load_add=0;
     	shift_HQ_LQ_Q_1=0;
     	add_sub=0;
   end
   8'd2:
     begin
        load_A = 0;
     	load_B =0;
     	load_add=0;
     	shift_HQ_LQ_Q_1=0;
     	add_sub=0;
     	bool=1;
     end
   8'd4: //se activa la señal para hacer suma
   begin
        load_A = 0;
     	load_B =0;
     	load_add=1;
     	shift_HQ_LQ_Q_1=0;
     	add_sub=1;
   end
   8'd5: // se desactiva la señal para hcaer suma, asi que pasa a resta
   begin
        load_A = 0;
     	load_B =0;
     	load_add=1;
     	shift_HQ_LQ_Q_1=0;
     	add_sub=0;
   end
   8'd6: //cuando hacer un load B o un shit_HQ_LQ_Q_1 o ninguno
   begin
     	if(load_add==0)
         begin
            shift_HQ_LQ_Q_1=1; 
         end
         else
         begin
         shift_HQ_LQ_Q_1=0; 
         end
        //agregar logica del shift 
        cont = cont -1;   
        
   end
   8'd7:
   begin
     if(load_add)
     begin
        shift_HQ_LQ_Q_1=1; 
     end
     else
     begin
     shift_HQ_LQ_Q_1=0; 
     end
        
   end
   default: //casoo default, estados que no hacen nada
   begin
   load_A =0;
   load_B =0;
   load_add =0;
   shift_HQ_LQ_Q_1=0;
   add_sub=0;
   end
   endcase
   end
always @(posedge clk)
begin
if(cont==0)
        begin
            Z =1;
        end
        else
        begin
        Z =0;
        end
end
endmodule
