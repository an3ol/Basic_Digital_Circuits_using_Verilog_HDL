module FullAdder(
  
  input A,
  input B,
  input Cin,
  output Sum,
  output Carry
  
);
  
  assign Sum = A^B^Cin;
  assign Carry = A&B | B&Cin | Cin&A;
  
endmodule