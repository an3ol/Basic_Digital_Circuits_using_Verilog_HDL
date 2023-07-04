
module dlatch(
  input d, 
  input en, 
  input rst, 
  output reg q
);
  
  always@(d,en,rst)
    begin
    	if(rst)
      		q<=0;
  	else
      		if(en)
        		q<=d;
    end
  
endmodule