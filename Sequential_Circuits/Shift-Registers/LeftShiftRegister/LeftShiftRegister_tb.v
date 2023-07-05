module LeftShiftRegister_tb;
  
  reg clk;
  reg rst;
  reg SI;
  wire SO;
  wire [3:0]SR;
  
  LeftShiftRegister sr1(
    .clk(clk),
    .rst(rst),
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
      SI=1'b0;
    end
  
  initial
    begin
      #10 rst = 1'b1;
      #10 rst = 1'b0;
      #10 SI = 1'b1;
      #10 SI = 1'b0;
      #50 $finish;
    end  
  
endmodule