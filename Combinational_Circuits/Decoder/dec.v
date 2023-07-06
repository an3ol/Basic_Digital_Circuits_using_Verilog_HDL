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