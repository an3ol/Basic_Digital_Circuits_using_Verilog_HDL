module LeftRightShiftRegister(
  
  input clk,
  input rst,
  input mode,
  input SI,
  output reg SO,
  output reg [3:0]SR
  
);
    
  always@(posedge clk)
    begin
      	if(mode)
        	begin
              
              if(rst)
                begin
                	SR<=4'b0;
              		SO<=1'b0;
                end
              
              else
                begin
                  	SR<={SI,SR[3:1]};
              		SO<=SR[0];
                end
        	end
      
   		else
    		begin
              
              if(rst)
                begin
                	SR<=4'b0;
              		SO<=1'b0;
                end
              
              else
                begin
                  SR<={SR[2:0],SI};
                  SO<=SR[3];
                end
            end
	end
    
endmodule