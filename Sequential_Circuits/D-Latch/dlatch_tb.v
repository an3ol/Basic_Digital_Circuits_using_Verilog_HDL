
module dlatch_tb;
  
  reg d;
  reg en;
  reg rst;
  wire q;
  
 dlatch m0(
   .d(d),
   .en(en),
   .rst(rst),
   .q(q)
 );
  
 initial 
   begin
     $dumpfile("dump.vcd");
     $dumpvars(1);
     d<=0;
     en<=0;
     rst<=1;
   end
  
  initial
    begin
     #10 rst<=0;     
     #10 en <=1; d<=1;
     #10 d<=0;
     #10 d<=1;
     #10 d<=1;
     #10 en <=0; d<=0;
     #10 en <=1; d<=0;
     #10 d<=1;
     $finish;
   end
  
endmodule