# Basic Digital Circuits using Verilog HDL
This repository contains RTL code of Basic digital circuits in Verilog HDL

# Table of Contents
- Combinational Circuits
    - Adder
        - Half Adder
        - Full Adder
    - Subtractor
        - Half Subtractor
        - Full Subtractor
    - Encoder
    - Decoder
    - Multiplexer
    - Demultiplexer

- Sequential Circuits
    - D Latch
    - D Flip Flop
    - Counters
        - Up Counter
        - Down Counter
        - Up-Down Counter
    - Shift Registers
        - Left Shift Register
        - Right Shift Register
        - Left-Right Shift Register
    - State Machines
        - Mealy Machine
        - Moore Machine

# Combinational Circuits


## Adder
---
### Half Adder
---
### Design
```Verilog
module HalfAdder(
  
  input A,
  input B,
  output Sum,
  output Carry
  
);
  
  assign Sum = A^B;
  assign Carry = A&B;
  
endmodule
```

### Testbench
```Verilog
module HalfAdder_tb;
  
  reg A;
  reg B;
  wire Sum;
  wire Carry;
  
  HalfAdder h1(
    .A(A),
    .B(B),
    .Sum(Sum),
    .Carry(Carry)
  );
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      A=1'b0; 
      B=1'b0;
    end
  
  initial
    begin
      #20 A=1'b0; B=1'b1;
      #20 A=1'b1; B=1'b0;
      #20 A=1'b1; B=1'b1;
      #20 $finish;
    end  
endmodule
```

### Waveform
![Half Adder Wave](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Combinational_Circuits/HalfAdder/HalfAdder_Waveform.png)

### Full Adder
---
### Design
```Verilog
module FullAdder(
  
  input A,
  input B,
  input Cin,
  output Sum,
  output Carry
  
);
  
  assign Sum = A^B^Cin;
  assign Carry = A&B | B&Cin | Cin&A;
  
endmodule
```
### Testbench
```Verilog
module FullAdder_tb;
  
  reg A;
  reg B;
  reg Cin;
  wire Sum;
  wire Carry;
  
  FullAdder h1(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Carry(Carry)
  );
  
  initial
	begin
          $dumpfile("dump.vcd");
  	  $dumpvars;
          A=1'b0; B=1'b0;  Cin=1'b0;
        end
  
  initial
    begin
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
```
### Waveform
![Full Adder](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Combinational_Circuits/FullAdder/FullAdder_Waveform.png)
## Subtractor
---
### Half Subtractor
---
### Design
```Verilog
module HalfSubtractor(
  
  input A,
  input B,
  output Difference,
  output Borrow
  
);
  
  assign Difference = A^B;
  assign Borrow = ~A&B;
  
endmodule
```
### Testbench
```Verilog
module HalfSubtractor_tb;
  
  reg A;
  reg B;
  wire Difference;
  wire Borrow;
  
  HalfSubtractor h1(
    .A(A),
    .B(B),
    .Difference(Difference),
    .Borrow(Borrow));
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      A=1'b0; 
      B=1'b0;
    end
  
  initial
    begin
      #20 A=1'b0; B=1'b1;
      #20 A=1'b1; B=1'b0;
      #20 A=1'b1; B=1'b1;
      #20 $finish;
    end  
  
endmodule
```
### Waveform
![Half Subtractor](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Combinational_Circuits/HalfAdder/HalfAdder_Waveform.png)

### Full Subtractor
---
### Design
```Verilog
module FullSubtractor(
  
  input A,
  input B,
  input Bin, 
  output Difference,
  output Borrow
  
);
  
  assign Difference = A^B^Bin;
  assign Borrow = ~A & (B^Bin) | B & Bin;
  
endmodule
```
### Testbench
```Verilog
module FullSubtractor_tb;
  
  reg A;
  reg B;
  reg Bin;
  wire Difference;
  wire Borrow;
  
  FullSubtractor f1(
    .Difference(Difference),
    .Borrow(Borrow),
    .A(A),
    .B(B),
    .Bin(Bin)
  );
  
  initial  
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      A=1'b0; 
      B=1'b0;
      Bin=1'b0;
    end
  
  initial
    begin
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
```
### Waveform
![Full Subtractor](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Combinational_Circuits/FullSubtractor/FullSubtractor_Waveform.png)
## Encoder
---
### Design
```Verilog
module enc(
  
  input [3:0]I,
  output reg [1:0]y, 
  output reg v
  
);
  
  always@(I)
    begin
      case(I)
        4'b0001: {y,v}=3'b001;    
        4'b0010: {y,v}=3'b011;  
        4'b0100: {y,v}=3'b101;
        4'b1000: {y,v}=3'b111;
        default: {y,v}=3'b000;
      endcase
    end
endmodule

```
### Testbench
```Verilog
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
```
### Waveform
![Encoder](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Combinational_Circuits/Encoder/enc_Waveform.png)

## Decoder
---
### Design
```Verilog
module dec(
  
  input [1:0]I,
  input v,
  output reg [3:0]y
  
);
  
  always@(I)
    begin
      case({I,v})
        3'b001: y = 4'b0001;    
        3'b011: y = 4'b0010;  
        3'b101: y = 4'b0100;
        3'b111: y = 4'b1000;
        default: y=4'b0000;
      endcase
    end
endmodule
```
### Testbench
```Verilog
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
```
### Waveform
![Decoder](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Combinational_Circuits/Decoder/dec_Waveform.png)
## Multiplexer
---
### Design
```Verilog
module mux(
  
  input a,
  input b,
  input sel,
  output reg y 
  
);
  
  always@(a,b,sel)
    begin
    	if(sel)
      		y=b;
  	else
      		y=a;
    end
endmodule

```
### Testbench
```Verilog
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

```
### Waveform
![Mux](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Combinational_Circuits/Multiplexer/mux_Waveform.png)

## Demultipexer
---
### Design
```Verilog
module demux(
  
  input a,
  input sel,
  output reg y0, 
  output reg y1
  
);
  
  always@(a,sel)
    begin
    	if(sel)
          begin
      	    y0=0;
            y1=a;
          end
  	else
          begin
            y0=a;
      	    y1=0;
          end
    end
endmodule

```
### Testbench
```Verilog
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

```
### Waveform
![DeMux](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Combinational_Circuits/Demultiplexer/demux_Waveform.png)
# Sequential Circuits
## D Latch
---
### Design
```Verilog
module dlatch(
  input d, 
  input en, 
  input rst, 
  output reg q
);
  
  always@(d,en,rst)
    begin
    	if(rst)
      		q<=0;
  	else
      		if(en)
        		q<=d;
    end
  
endmodule
```
### Testbench
```Verilog

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
```
### Waveform
![D Latch](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Sequential_Circuits/D-Latch/dlatch_Waveform.png)

## D Flip Flop
---
### Design
```Verilog

module dflipflop(
  input d, 
  input clk, 
  input rst, 
  output reg q
);
  
  always@(posedge clk, negedge rst)
    begin
	if(!rst)
      	     q<=0;
        else
             q<=d;
    end
  
endmodule
```
### Testbench
```Verilog

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
```
### Waveform
![D Flip Flop](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Sequential_Circuits/D-FlipFlop/dflipflop_Waveform.png)
## Counters
---
### Up Counter
---
### Design
```Verilog
module UpCounter(
  
  input clk,
  input rst,
  output reg [2:0]count
  
);
    
  always@(posedge clk)
    	begin
		if((rst==1)|(count==7))
    			count<=0;
    		else
    			count<=count+1;
	end
    
endmodule
```
### Testbench
```Verilog
module UpCounter_tb;
  
  reg clk;
  reg rst;
  wire [2:0]count;
  
  UpCounter c1(
    .clk(clk),
    .rst(rst),
    .count(count)
  );
  
  always
    #5 clk=~clk;
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      clk=1'b0; 
      rst=1'b0;
    end
  
  initial
    begin
      #10 rst = 1'b1;
      #10 rst = 1'b0;
      #160 $finish;
    end  
  
endmodule
```
### Waveform
![Up Counter](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Sequential_Circuits/Counters/UpCounter/UpCounter_Waveform.png)

### Down Counter
---
### Design
```Verilog
module DownCounter(
  
  input clk,
  input rst,
  output reg [2:0]count
  
);
    
  always@(posedge clk)
    	begin
      		if((rst==1)|(count==0))
    			count<=7;
    		else
    			count<=count-1;
	end
    
endmodule
```
### Testbench
```Verilog
module DownCounter_tb;
  
  reg clk;
  reg rst;
  wire [2:0]count;
  
  DownCounter c1(
    .clk(clk),
    .rst(rst),
    .count(count)
  );
  
  always
    #5 clk=~clk;
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      clk=1'b0; 
      rst=1'b0;
    end
  
  initial
    begin
      #10 rst = 1'b1;
      #10 rst = 1'b0;
      #160 $finish;
    end  
  
endmodule
```
### Waveform
![Down Counter](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Sequential_Circuits/Counters/DownCounter/DownCounter_Waveform.png)

### Up Down Counter 
---
### Design
```Verilog
module UpDownCounter(
  
  input clk,
  input rst,
  input mode,
  output reg [2:0]count
  
);
  
  
  always@(posedge clk)
    begin
      if(mode)
        begin
          if((rst==1)|(count==0))
            count<=7;
          else
            count<=count-1;
        end
      else
        begin
          if((rst==1)|(count==7))
            count<=0;
          else
            count<=count+1;
        end
    end
  
  
endmodule
```
### Testbench
```Verilog
module UpDownCounter_tb;
  
  reg clk;
  reg rst;
  reg mode;
  wire [2:0]count;
  
  UpDownCounter c1(
    .clk(clk),
    .rst(rst),
    .mode(mode),
    .count(count)
  );
  
  always
    #5 clk=~clk;
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      clk=1'b0; 
      rst=1'b0;
      mode=1'b0;
    end
  
  initial
    begin
      #10 rst = 1'b1;
      #10 rst = 1'b0;
      #160 mode=1'b1;
      #150 $finish;
    end  
  
endmodule
```
### Waveform
![Up Down Counter](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Sequential_Circuits/Counters/UpDownCounter/UpDownCounter_Waveform.png)
## Shift Registers
---
### Left Shift Register
---
### Design
```Verilog
module LeftShiftRegister(
  
  input clk,
  input rst,
  input SI,
  output reg SO,
  output reg [3:0]SR
  
);
    
  always@(posedge clk)
    
    		begin
              
              if(rst)
                begin
                	SR<=4'b0;
              		SO<=1'b0;
                end
              
              else
                begin
                  	SR<={SR[2:0],SI};
                  	SO<=SR[3];
                end
            end
    
endmodule
```
### Testbench
```Verilog
module LeftShiftRegister_tb;
  
  reg clk;
  reg rst;
  reg SI;
  wire SO;
  wire [3:0]SR;
  
  LeftShiftRegister sr1(
    .clk(clk),
    .rst(rst),
    .SI(SI),
    .SO(SO),
    .SR(SR)
  );
  
  always
    #5 clk=~clk;
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      clk=1'b0; 
      rst=1'b0;
      SI=1'b0;
    end
  
  initial
    begin
      #10 rst = 1'b1;
      #10 rst = 1'b0;
      #10 SI = 1'b1;
      #10 SI = 1'b0;
      #50 $finish;
    end  
  
endmodule
```
### Waveform
![Left Shift Register](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Sequential_Circuits/Shift-Registers/LeftShiftRegister/LeftShiftRegister_Waveform.png)

### Right Shift Register
---
### Design
```Verilog
module RightShiftRegister(
  
  input clk,
  input rst,
  input SI,
  output reg SO,
  output reg [3:0]SR
  
);
    
  always@(posedge clk)
    
    		begin
              
              if(rst)
                begin
                	SR<=4'b0;
              		SO<=1'b0;
                end
              
              else
                begin
                  	SR<={SI,SR[3:1]};
                  	SO<=SR[0];
                end
            end
    
endmodule
```
### Testbench
```Verilog
module RightShiftRegister_tb;
  
  reg clk;
  reg rst;
  reg SI;
  wire SO;
  wire [3:0]SR;
  
  RightShiftRegister sr1(
    .clk(clk),
    .rst(rst),
    .SI(SI),
    .SO(SO),
    .SR(SR)
  );
  
  always
    #5 clk=~clk;
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      clk=1'b0; 
      rst=1'b0;
      SI=1'b0;
    end
  
  initial
    begin
      #10 rst = 1'b1;
      #10 rst = 1'b0;
      #10 SI = 1'b1;
      #10 SI = 1'b0;
      #50 $finish;
    end  
  
endmodule
```
### Waveform
![Right Shift Register](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Sequential_Circuits/Shift-Registers/RightShiftRegister/RightShiftRegister_Waveform.png)

### Left-Right Shift Register
---
### Design
```Verilog
module LeftRightShiftRegister(
  
  input clk,
  input rst,
  input mode,
  input SI,
  output reg SO,
  output reg [3:0]SR
  
);
    
  always@(posedge clk)
    begin
      	if(mode)
        	begin
              
              if(rst)
                begin
                	SR<=4'b0;
              		SO<=1'b0;
                end
              
              else
                begin
                  	SR<={SI,SR[3:1]};
              		SO<=SR[0];
                end
        	end
      
   		else
    		begin
              
              if(rst)
                begin
                	SR<=4'b0;
              		SO<=1'b0;
                end
              
              else
                begin
                  SR<={SR[2:0],SI};
                  SO<=SR[3];
                end
            end
	end
    
endmodule
```
### Testbench
```Verilog
module LeftRightShiftRegister_tb;
  
  reg clk;
  reg rst;
  reg mode;
  reg SI;
  wire SO;
  wire [3:0]SR;
  
  LeftRightShiftRegister sr1(
    .clk(clk),
    .rst(rst),
    .mode(mode),
    .SI(SI),
    .SO(SO),
    .SR(SR)
  );
  
  always
    #5 clk=~clk;
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      clk=1'b0; 
      rst=1'b0;
      mode=1'b0;
      SI=1'b0;
    end
  
  initial
    begin
      #10 rst = 1'b1;
      #10 rst = 1'b0;
      #10 SI = 1'b1;
      #10 SI = 1'b0;
      #30 mode = 1'b1;
      #50 $finish;
    end  
  
endmodule
```
### Waveform
![Left Right Shift Register](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Sequential_Circuits/Shift-Registers/LeftRightShiftRegister/LeftRightShiftRegister_Waveform.png)
## State Machines
---
### Mealy Machine
---
### Design
```Verilog
module Mealy_101(
  
  input clk,
  input rst,
  input I,
  output reg det 
  
);
  
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  
  reg [1:0]state;
  reg [1:0]next_state;
    
  always@(posedge clk)
    
    begin              
    	if(rst)
    	   state<=S0;
              
    	else
    	   state<=next_state;
    end
   
  always@(state,I)
    begin
      case(state)
        S0: if(I)
          	next_state<=S1;
            else
              	next_state<=S0;
        
        S1:  if(I)
          	next_state<=S1;
             else
              	next_state<=S2;
        
        S2:  next_state<=S0;
      endcase
    end
          
   always@(state,I)
    begin
      case(state)
        S0: det=0;
        
        S1: det=0;
        
        S2:  if(I)
          	det=1;
             else
             	det=0;
      endcase
    end
  
endmodule
```
### Testbench
```Verilog
module Mealy_101_tb;
  
  reg clk;
  reg rst;
  reg I;
  wire det;
  
  Mealy_101 m1(
    .clk(clk),
    .rst(rst),
    .I(I),
    .det(det)
  );
  
  always
    #5 clk=~clk;
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      clk=1'b0; 
      rst=1'b0;
      I=1'b0;
    end
  
  initial
    begin
      #10 rst = 1'b1;
      #10 rst = 1'b0;
      #10 I = 1'b1;
      #10 I = 1'b1;
      #10 I = 1'b0;
      #10 I = 1'b1;
      #10 I = 1'b1;
      #10 I = 1'b0;
      #10 I = 1'b1;
      #10 I = 1'b0;
      #10 $finish;
    end  
  
endmodule
```
### Waveform
![Mealy Machine](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Sequential_Circuits/Mealy_Machine/Mealy_101_Waveform.png)

### Moore Machine
---
### Design
```Verilog
module Moore_101(
  
  input clk,
  input rst,
  input I,
  output reg det 
  
);
  
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  parameter S3 = 2'b11;
  
  reg [1:0]state;
  reg [1:0]next_state;
    
  always@(posedge clk)
    
    begin              
    	if(rst)
    		state<=S0;
              
    	else
    		state<=next_state;
    end
   
  always@(state,I)
    begin
      case(state)
        S0: if(I)
          	next_state<=S1;
            else
              	next_state<=S0;
        
        S1:  if(I)
          	next_state<=S1;
             else
              	next_state<=S2;
        
        S2:  if(I)
          	next_state<=S3;
             else
              	next_state<=S0;
        S3: if(I)
          	next_state<=S1;
            else
              	next_state<=S0;
      endcase
    end
          
   always@(state)
    begin
      case(state)
        S0: det=0;
        
        S1: det=0;
        
        S2: det=0;
        
        S3: det=1;
      endcase
    end
  
endmodule
```
### Testbench
```Verilog
module Moore_101_tb;
  
  reg clk;
  reg rst;
  reg I;
  wire det;
  
  Moore_101 m1(
    .clk(clk),
    .rst(rst),
    .I(I),
    .det(det)
  );
  
  always
    #5 clk=~clk;
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      clk=1'b0; 
      rst=1'b0;
      I=1'b0;
    end
  
  initial
    begin
      #10 rst = 1'b1;
      #10 rst = 1'b0;
      #10 I = 1'b1;
      #10 I = 1'b1;
      #10 I = 1'b0;
      #10 I = 1'b1;
      #10 I = 1'b1;
      #10 I = 1'b0;
      #10 I = 1'b1;
      #10 I = 1'b0;
      #10 $finish;
    end  
  
endmodule

```
### Waveform
![Moore Machine](https://github.com/an3ol/Basic_Digital_Circuits_using_Verilog_HDL/blob/main/Sequential_Circuits/Moore_Machine/Moore_101_Waveform.png)

