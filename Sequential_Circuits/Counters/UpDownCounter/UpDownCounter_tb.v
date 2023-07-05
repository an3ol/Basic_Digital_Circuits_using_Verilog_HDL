module UpDownCounter_tb;
  
  reg clk;
  reg rst;
  reg mode;
  wire [2:0]count;
  
  UpDownCounter c1(
    .clk(clk),
    .rst(rst),
    .mode(mode),
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
      mode=1'b0;
    end
  
  initial
    begin
      #10 rst = 1'b1;
      #10 rst = 1'b0;
      #160 mode=1'b1;
      #150 $finish;
    end  
  
endmodule