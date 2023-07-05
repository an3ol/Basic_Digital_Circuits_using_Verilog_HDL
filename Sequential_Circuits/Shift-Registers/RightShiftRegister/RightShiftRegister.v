module RightShiftRegister(
  
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
                  	SR<={SI,SR[3:1]};
                  	SO<=SR[0];
                end
            end
    
endmodule