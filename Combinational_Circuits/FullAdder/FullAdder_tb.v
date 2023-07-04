module FullAdder_tb;
  
  reg A;
  reg B;
  reg Cin;
  wire Sum;
  wire Carry;
  
  FullAdder h1(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Carry(Carry)
  );
  
  initial
	begin
          $dumpfile("dump.vcd");
  	  $dumpvars;
          A=1'b0; B=1'b0;  Cin=1'b0;
        end
  
  initial
    begin
      #20 A=1'b0; B=1'b0;Cin=1'b1;
      #20 A=1'b0; B=1'b1;Cin=1'b0;
      #20 A=1'b0; B=1'b1;Cin=1'b1;
      #20 A=1'b1; B=1'b0;Cin=1'b0;
      #20 A=1'b1; B=1'b0;Cin=1'b1;
      #20 A=1'b1; B=1'b1;Cin=1'b0;
      #20 A=1'b1; B=1'b1;Cin=1'b1;
      #20 $finish;
    end  
  
endmodule