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