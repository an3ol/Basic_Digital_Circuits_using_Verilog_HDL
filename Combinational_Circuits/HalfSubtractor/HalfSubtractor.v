module HalfSubtractor(
  
  input A,
  input B,
  output Difference,
  output Borrow
  
);
  
  assign Difference = A^B;
  assign Borrow = ~A&B;
  
endmodule