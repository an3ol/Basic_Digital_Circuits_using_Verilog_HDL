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

- Acknowledgement

# Combinational Circuits


## Adder
---
An adder is a digital electronic circuit that performs addition of binary numbers. It is a fundamental component in digital computer systems and is used to add two binary numbers together. Adders can be designed to add binary numbers of various lengths, from single-bit addition to adding multi-bit numbers.
### Half Adder
---
A half adder adds two binary digits (bits) and produces a sum and a carry output. It can handle one-bit additions but does not account for any carry from previous stages.
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
A full adder is an extension of the half adder and adds three binary bits: two inputs and a carry-in from a previous stage. It produces a sum and a carry output, allowing it to handle multi-bit additions with carry propagation.
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
A subtractor is a digital electronic circuit or operation that performs subtraction between two binary numbers. A subtractor typically takes two binary numbers, the minuend, and the subtrahend, and produces the difference as its output. The minuend is the number from which the subtrahend is subtracted, similar to how subtraction works in arithmetic. The result is called the difference or the remainder.
### Half Subtractor
---
A half subtractor is a basic subtractor circuit that can subtract two 1-bit binary numbers. It has two inputs, A and B, representing the minuend and subtrahend, respectively. It produces two outputs: the difference (D) and the borrow (Borrow). The borrow output indicates whether a borrow is needed from the next higher bit during subtraction.
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
A full subtractor is an extension of the half subtractor and can subtract three 1-bit binary numbers: A (minuend), B (subtrahend), and a borrow-in (C_in) from a previous subtraction stage. It produces two outputs: the difference (D) and a borrow-out (Borrow_out) for use in the next stage.
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
A digital encoder is a combinational logic circuit that converts a set of input signals into a coded output representation. It is commonly used in digital electronics for various purposes, including data encoding, address encoding, and signal multiplexing. There are different types of digital encoders, such as binary encoders, priority encoders, and decimal (BCD) encoders, each serving specific functions.
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
A digital decoder is a combinational logic circuit that takes an encoded input and produces one of several possible output states based on the input code. Decoders are commonly used in digital electronics for tasks such as address decoding in memory systems, signal demultiplexing, and control logic.
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
A multiplexer, often abbreviated as "mux," is a digital logic circuit used in electronics and digital systems to select and route one of multiple input signals to a single output line. It's sometimes referred to as a "data selector" because it selects data from one of its inputs and forwards it to the output based on a set of control signals.
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
A demultiplexer, often abbreviated as "demux," is a digital logic circuit that takes a single input and routes it to one of multiple output lines based on control inputs. Essentially, a demux is used for distributing or "demultiplexing" a single input signal to multiple destinations.
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
A D latch, also known as a data latch or transparent latch, is a fundamental digital electronic circuit used in digital logic and sequential logic circuits. It is a bistable device that can store a single binary bit (0 or 1).

The operation of a D latch is such that when the enable input is HIGH, the D input is transferred to the Q output. When the enable input is LOW, the latch holds its previous state.

D latches are commonly used in digital circuits for various purposes, including data storage, signal stabilization, and sequential logic elements. They are often used as building blocks in more complex circuits, such as flip-flops and registers, which are essential for creating sequential logic and memory elements in digital systems.

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
A D flip-flop (DFF) is a fundamental building block in digital electronic circuits and sequential logic. It is a type of flip-flop that can store a single binary bit (0 or 1) and is widely used for various purposes in digital design, including data storage, clock synchronization, and sequential logic operations.

The operation of a D flip-flop can be summarized as follows:

 - When the clock signal transitions (e.g., from low to high or high to low, depending on the specific flip-flop design), the D input is sampled.
 - The sampled value of the D input is transferred to the Q output.

D flip-flops are essential components in digital systems for storing data, synchronizing signals, and implementing various sequential logic functions. They are often used in combination to create more complex sequential elements like registers and counters, which are crucial for tasks such as data processing, memory storage, and control in digital circuits.
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
A counter is a digital electronic circuit or device used to count events or pulses and generate an output representation of that count. Counters are essential components in digital systems for a wide range of applications, including time measurement, frequency division, address generation, and sequencing. 
### Up Counter
---
An up counter is a type of digital counter that counts upwards in a sequential manner, incrementing its value with each clock pulse. It starts from an initial value (usually 0) and counts up towards a maximum value, which is typically determined by the number of bits in the counter. When the counter reaches its maximum value, it wraps around to zero and continues counting.

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
A down counter is a type of digital counter that counts downward in a sequential manner, decrementing its value with each clock pulse. It starts from an initial value (usually a maximum value) and counts down towards a minimum value (often zero). When the counter reaches its minimum value, it wraps around to the maximum value and continues counting downward.

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
An up-down counter, also known as a bidirectional counter, is a digital counter that can count in both the upward (increment) and downward (decrement) directions. This type of counter provides the flexibility to count both forwards and backwards, depending on the control inputs. It's commonly used in applications where you need to track changes in two directions, such as in motor control, position sensing, or user interfaces.

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
A shift register is a digital circuit or component used in digital electronics for the purpose of shifting data sequentially, one bit at a time. It stores and moves data in a linear fashion, either to the left (left-shift) or to the right (right-shift) with each clock pulse. Shift registers are versatile and find applications in various areas of digital design, including data storage, serial-to-parallel and parallel-to-serial conversion, and shift-based arithmetic operations.

Shift registers are used in various applications, including serial communication protocols (e.g., UART), data storage, data manipulation, and controlling various digital devices. They are essential building blocks in digital circuits and are often combined with other logic elements to perform specific tasks.

### Left Shift Register
---
A left shift register is a type of shift register that shifts data to the left, one bit position at a time, with each clock pulse or shift operation. This means that the data in the register moves from the higher-order bit positions to the lower-order bit positions. Left shift registers are widely used in digital electronics for various applications, including data manipulation, data storage, and serial-to-parallel conversion.

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
A right shift register is a type of shift register that shifts data to the right, one bit position at a time, with each clock pulse or shift operation. This means that the data in the register moves from the lower-order bit positions to the higher-order bit positions. Right shift registers are commonly used in digital electronics for various applications, including data manipulation, data storage, and parallel-to-serial conversion.

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
A left-right shift register, also known as a bidirectional shift register, is a type of shift register that can shift data both to the left (left-shift) and to the right (right-shift) with each clock pulse or shift operation. This type of shift register offers the flexibility to move data in both directions and is used in various digital applications where bidirectional data movement is required.

These shift registers have a control input that determines the shift direction. When the control input is set to "LEFT," the data is shifted to the left, and when set to "RIGHT," the data is shifted to the right.

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
A state machine, also known as a finite-state machine (FSM), is a computational model used in digital and computer science to represent and control the behavior of a system or process. It is a mathematical abstraction that consists of a finite number of states, transitions between these states, and a set of rules that define how the machine transitions from one state to another in response to inputs.

State machines provide a structured and organized way to describe and understand the behavior of complex systems, making them an essential concept in both hardware and software design. They are particularly useful for systems with well-defined and predictable behaviors that can be divided into distinct states and transitions.

### Mealy Machine
---
A Mealy machine is a type of finite-state machine (FSM) used in digital electronics and computer science to model and control sequential logic circuits. A Mealy machine's behavior depends on both its current state and the external inputs it receives. Mealy machine produces outputs that are a function of both its current state and the inputs.

 A sequence detector is a type of finite-state machine that recognizes a specific sequence of binary input bits and produces corresponding binary output based on the sequence it detects. 

 Implementation of Sequence detector using Mealy machine concept that detects the sequence "101" in a stream of binary input is shown in the example below

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
A Moore machine is a type of finite-state machine (FSM) used in digital electronics and computer science to model and control sequential logic circuits. A key characteristic of a Moore machine is that its outputs depend solely on its current state, not on the inputs it receives at that moment. This distinguishes it from a Mealy machine, where outputs are a function of both the current state and the inputs.

 A sequence detector is a type of finite-state machine that recognizes a specific sequence of binary input bits and produces corresponding binary output based on the sequence it detects. 

 Implementation of Sequence detector using Moore machine concept that detects the sequence "101" in a stream of binary input is shown in the example below

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

# Acknowledgement
  - EDA Playground
  - ChatGPT

