
module dflipflop(
  input d, 
  input clk, 
  input rst, 
  output reg q
);
  
  always@(posedge clk, negedge rst)
    begin
	if(!rst)
      	     q<=0;
        else
             q<=d;
    end
  
endmodule