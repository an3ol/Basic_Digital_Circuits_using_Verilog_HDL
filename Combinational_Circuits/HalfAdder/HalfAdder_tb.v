module HalfAdder_tb;
  
  reg A;
  reg B;
  wire Sum;
  wire Carry;
  
  HalfAdder h1(
    .A(A),
    .B(B),
    .Sum(Sum),
    .Carry(Carry)
  );
  
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