module FullSubtractor_tb;
  
  reg A;
  reg B;
  reg Bin;
  wire Difference;
  wire Borrow;
  
  FullSubtractor f1(
    .Difference(Difference),
    .Borrow(Borrow),
    .A(A),
    .B(B),
    .Bin(Bin)
  );
  
  initial  
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      A=1'b0; 
      B=1'b0;
      Bin=1'b0;
    end
  
  initial
    begin
      #20 A=1'b0; B=1'b0;Bin = 1'b1;
      #20 A=1'b0; B=1'b1;Bin = 1'b0;
      #20 A=1'b0; B=1'b1;Bin = 1'b1;
      #20 A=1'b1; B=1'b0;Bin = 1'b0;
      #20 A=1'b1; B=1'b0;Bin = 1'b1;
      #20 A=1'b1; B=1'b1;Bin = 1'b0;
      #20 A=1'b1; B=1'b1;Bin = 1'b1;
      #20 $finish;
    end  
  
endmodule
