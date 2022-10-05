module FullSubtractor(Difference,Borrow,A,B,Bin);
  
  input A,B,Bin;
  output Difference,Borrow;
  
  assign Difference = A^B^Bin;
  assign Borrow = ~A & (B^Bin) | B & Bin;
  
endmodule
