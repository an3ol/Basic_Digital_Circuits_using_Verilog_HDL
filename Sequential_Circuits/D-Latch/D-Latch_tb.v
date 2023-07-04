
module dlatch_tb;
 reg d,en,rst;
 wire q;
  
 dlatch m0(d,en,rst,q);
  
 initial 
   begin
     d<=0;
     en<=0;
     rst<=1;
   
     #10 rst<=0;
     
     #10 en <=1; d<=1;
     #10 d<=0;
     #10 d<=1;
     #10 d<=1;
     #10 en <=0; d<=0;
     #10 en <=1; d<=0;
     #10 d<=1;
   end
endmodule