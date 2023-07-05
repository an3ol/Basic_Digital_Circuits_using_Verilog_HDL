module DownCounter_tb;
  
  reg clk;
  reg rst;
  wire [2:0]count;
  
  DownCounter c1(
    .clk(clk),
    .rst(rst),
    .count(count)
  );
  
  always
    #5 clk=~clk;
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      clk=1'b0; 
      rst=1'b0;
    end
  
  initial
    begin
      #10 rst = 1'b1;
      #10 rst = 1'b0;
      #160 $finish;
    end  
  
endmodule