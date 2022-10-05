module HalfSubtractor_tb;
  
  reg A,B;
  wire Difference,Borrow;
  
  HalfSubtractor h1(Difference,Borrow,A,B);
  
  initial
    
    begin
      A=1'b0; B=1'b0;
      #20 A=1'b0; B=1'b1;
      #20 A=1'b1; B=1'b0;
      #20 A=1'b1; B=1'b1;
      #20 $finish;
    end  
endmodule
