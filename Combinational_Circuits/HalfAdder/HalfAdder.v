
module HalfAdder(
  
  input A,
  input B,
  output Sum,
  output Carry
  
);
  
  assign Sum = A^B;
  assign Carry = A&B;
  
endmodule