
module dflipflop_tb;
  
  reg d;
  reg clk;
  reg rst;
  wire q;
  
  dflipflop m0(
    .d(d),
    .clk(clk),
    .rst(rst),
    .q(q)  
  );
  
  always 
    #5 clk = ~clk;
  
 initial 
   begin
     $dumpfile("dump.vcd");
     $dumpvars(1);
     clk<=0;
     d<=0;
     rst<=1;
   end
     
  initial
    begin
     #5 rst<=0;
     #5 rst<=1;
     #10 d<=1;
     #10 d<=0;
     #10 d<=1;
     #10 d<=1;
     #10 d<=0;
     #10 d<=0;
     #5 $finish;
    end

endmodule