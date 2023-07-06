module demux_tb;
  
  reg a;
  reg sel;
  wire y0;
  wire y1;
  
  demux d1(
    .a(a),
    .sel(sel),
    .y0(y0),
    .y1(y1)
  );
    
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      a=1'b1; 
      sel=1'b0;
    end
  
  initial
    begin
      #10 sel = 1'b1;
      #10 $finish;
    end  
  
endmodule