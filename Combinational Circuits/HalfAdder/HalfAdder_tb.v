module HalfAdder_tb;
  
  reg A,B;
  wire Sum, Carry;
  
  HalfAdder h1(Sum,Carry,A,B);
  
  initial
    
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      A=1'b0; B=1'b0;
      #20 A=1'b0; B=1'b1;
      #20 A=1'b1; B=1'b0;
      #20 A=1'b1; B=1'b1;
      #20 $finish;
    end  
endmodule