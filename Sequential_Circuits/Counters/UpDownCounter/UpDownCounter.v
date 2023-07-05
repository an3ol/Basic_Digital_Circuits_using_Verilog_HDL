module UpDownCounter(
  
  input clk,
  input rst,
  input mode,
  output reg [2:0]count
  
);
  
  
  always@(posedge clk)
    begin
      if(mode)
        begin
          if((rst==1)|(count==0))
            count<=7;
          else
            count<=count-1;
        end
      else
        begin
          if((rst==1)|(count==7))
            count<=0;
          else
            count<=count+1;
        end
    end
  
  
endmodule
