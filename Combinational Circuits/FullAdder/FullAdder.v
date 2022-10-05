module FullAdder(Sum,Carry,A,B,Cin);
  
  input A,B,Cin;
  output Sum,Carry;
  
  assign Sum = A^B^Cin;
  assign Carry = A&B | B&Cin | Cin&A;
  
endmodule
