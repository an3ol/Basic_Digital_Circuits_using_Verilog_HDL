module mux_tb;
  
  reg a;
  reg b;
  reg sel;
  wire y;
  
  mux m1(
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
  );
    
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      a=1'b0; 
      b=1'b1;
      sel=1'b0;
    end
  
  initial
    begin
      #10 sel = 1'b1;
      #10 $finish;
    end 