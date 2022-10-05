module HalfAdder(Sum,Carry,A,B);
  
  input A,B;
  output Sum,Carry;
  
  assign Sum = A^B;
  assign Carry = A&B;
  
endmodule