module Moore_101_tb;
  
  reg clk;
  reg rst;
  reg I;
  wire det;
  
  Moore_101 m1(
    .clk(clk),
    .rst(rst),
    .I(I),
    .det(det)
  );
  
  always
    #5 clk=~clk;
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      clk=1'b0; 
      rst=1'b0;
      I=1'b0;
    end
  
  initial
    begin
      #10 rst = 1'b1;
      #10 rst = 1'b0;
      #10 I = 1'b1;
      #10 I = 1'b1;
      #10 I = 1'b0;
      #10 I = 1'b1;
      #10 I = 1'b1;
      #10 I = 1'b0;
      #10 I = 1'b1;
      #10 I = 1'b0;
      #10 $finish;
    end  
  
endmodule
