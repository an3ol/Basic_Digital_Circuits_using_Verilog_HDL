module dec_tb;
  
  reg [1:0]I;
  reg v;
  wire [3:0]y;
  
  dec d1(
    .I(I),
    .v(v),
    .y(y)    
  );
    
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      I=2'b00;
      v=0;
    end
  
  initial
    begin
      #10 I=2'b01; v=1;
      #10 I=2'b10; v=1;
      #10 I=2'b10; v=1;
      #10 I=2'b11; v=1;
      #10 I=2'b01; v=1;
      #10 I=2'b00; v=0;
      #10 $finish;
    end  
  
endmodule