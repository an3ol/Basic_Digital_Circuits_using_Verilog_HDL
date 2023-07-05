module DownCounter(
  
  input clk,
  input rst,
  output reg [2:0]count
  
);
    
  always@(posedge clk)
    	begin
      		if((rst==1)|(count==0))
    			count<=7;
    		else
    			count<=count-1;
	end
    
endmodule