module LeftRightShiftRegister_tb;
  
  reg clk;
  reg rst;
  reg mode;
  reg SI;
  wire SO;
  wire [3:0]SR;
  
  LeftRightShiftRegister sr1(
    .clk(clk),
    .rst(rst),
    .mode(mode),
    .SI(SI),
    .SO(SO),
    .SR(SR)
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
      SI=1'b0;
    end
  
  initial
    begin
      #10 rst = 1'b1;
      #10 rst = 1'b0;
      #10 SI = 1'b1;
      #10 SI = 1'b0;
      #30 mode = 1'b1;
      #50 $finish;
    end  
  
endmodule