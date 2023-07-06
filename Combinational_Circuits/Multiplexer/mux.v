module mux(
  
  input a,
  input b,
  input sel,
  output reg y 
  
);
  
  always@(a,b,sel)
    begin
    	if(sel)
      		y=b;
  	else
      		y=a;
    end
endmodule