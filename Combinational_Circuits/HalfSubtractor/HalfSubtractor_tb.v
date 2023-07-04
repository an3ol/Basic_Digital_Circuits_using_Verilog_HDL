module HalfSubtractor_tb;
  
  reg A;
  reg B;
  wire Difference;
  wire Borrow;
  
  HalfSubtractor h1(
    .A(A),
    .B(B),
    .Difference(Difference),
    .Borrow(Borrow));
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      A=1'b0; 
      B=1'b0;
    end
  
  initial
    begin
      #20 A=1'b0; B=1'b1;
      #20 A=1'b1; B=1'b0;
      #20 A=1'b1; B=1'b1;
      #20 $finish;
    end  
  
endmodule