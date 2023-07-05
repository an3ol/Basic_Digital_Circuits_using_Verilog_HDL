module LeftShiftRegister(
  
  input clk,
  input rst,
  input SI,
  output reg SO,
  output reg [3:0]SR
  
);
    
  always@(posedge clk)
    
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
    
endmodule

