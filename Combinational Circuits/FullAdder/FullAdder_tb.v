module FullAdder_tb;
  
  reg A,B,Cin;
  wire Sum, Carry;
  
  FullAdder h1(Sum,Carry,A,B,Cin);
  
  initial
    
    begin
      $dumpfile("dump.vcd");
  	  $dumpvars;
      A=1'b0; B=1'b0;  Cin=1'b0;
      #20 A=1'b0; B=1'b0;Cin=1'b1;
      #20 A=1'b0; B=1'b1;Cin=1'b0;
      #20 A=1'b0; B=1'b1;Cin=1'b1;
      #20 A=1'b1; B=1'b0;Cin=1'b0;
      #20 A=1'b1; B=1'b0;Cin=1'b1;
      #20 A=1'b1; B=1'b1;Cin=1'b0;
      #20 A=1'b1; B=1'b1;Cin=1'b1;
      #20 $finish;
    end  
endmodule