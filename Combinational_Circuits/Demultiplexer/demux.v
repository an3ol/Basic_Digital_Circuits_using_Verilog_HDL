module demux(
  
  input a,
  input sel,
  output reg y0, 
  output reg y1
  
);
  
  always@(a,sel)
    begin
    	if(sel)
          begin
      	    y0=0;
            y1=a;
          end
  	else
          begin
            y0=a;
      	    y1=0;
          end
    end
endmodule