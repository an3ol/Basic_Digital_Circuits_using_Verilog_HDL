
module FullSubtractor(
  
  input A,
  input B,
  input Bin, 
  output Difference,
  output Borrow
  
);
  
  assign Difference = A^B^Bin;
  assign Borrow = ~A & (B^Bin) | B & Bin;
  
endmodule
