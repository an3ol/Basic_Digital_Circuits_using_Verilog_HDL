module FullSubtractor_tb;
  
  reg A,B,Bin;
  wire Difference,Borrow;
  
  FullSubtractor f1(Difference,Borrow,A,B,Bin);
  
  initial
    
    begin
      $dumpfile("dump.vcd");
  	  $dumpvars;
      A=1'b0; B=1'b0;Bin = 1'b0;
      #20 A=1'b0; B=1'b0;Bin = 1'b1;
      #20 A=1'b0; B=1'b1;Bin = 1'b0;
      #20 A=1'b0; B=1'b1;Bin = 1'b1;
      #20 A=1'b1; B=1'b0;Bin = 1'b0;
      #20 A=1'b1; B=1'b0;Bin = 1'b1;
      #20 A=1'b1; B=1'b1;Bin = 1'b0;
      #20 A=1'b1; B=1'b1;Bin = 1'b1;
      #20 $finish;
    end  
endmodule
