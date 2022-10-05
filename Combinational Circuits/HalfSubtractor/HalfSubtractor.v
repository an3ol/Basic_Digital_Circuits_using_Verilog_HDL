module HalfSubtractor(Difference,Borrow,A,B);
  
  input A,B;
  output Difference,Borrow;
  
  assign Difference = A^B;
  assign Borrow = ~A&B;
  
endmodule
