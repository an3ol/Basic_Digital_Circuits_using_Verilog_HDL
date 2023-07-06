module Mealy_101(
  
  input clk,
  input rst,
  input I,
  output reg det 
  
);
  
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  
  reg [1:0]state;
  reg [1:0]next_state;
    
  always@(posedge clk)
    
    begin              
    	if(rst)
    	   state<=S0;
              
    	else
    	   state<=next_state;
    end
   
  always@(state,I)
    begin
      case(state)
        S0: if(I)
          	next_state<=S1;
            else
              	next_state<=S0;
        
        S1:  if(I)
          	next_state<=S1;
             else
              	next_state<=S2;
        
        S2:  next_state<=S0;
      endcase
    end
          
   always@(state,I)
    begin
      case(state)
        S0: det=0;
        
        S1: det=0;
        
        S2:  if(I)
          	det=1;
             else
             	det=0;
      endcase
    end
  
endmodule