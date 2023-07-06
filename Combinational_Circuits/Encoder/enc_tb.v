module enc_tb;
  
  reg [3:0]I;
  wire [1:0]y;
  wire v;
  
  enc e1(
    .I(I),
    .y(y),
    .v(v)
  );
    
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      I=4'b0000;
    end
  
  initial
    begin
      #10 I=4'b0001;
      #10 I=4'b0010;
      #10 I=4'b0100;
      #10 I=4'b1000;
      #10 I=4'b0110;
      #10 I=4'b1001;
      #10 $finish;
    end  
  
endmodule