`include"ALU_8bit.v"
module tb;
integer i;
reg [7:0]a,b;
reg [3:0]ALU_sel;
wire [7:0]ALU_out;
wire carryout;

ALU dut(.*);
initial begin 
a=8'h0A;
b=8'h05;
ALU_sel=4'b0;
for(i=0;i<=15;i=i+1)begin
ALU_sel=ALU_sel+4'h0001;
#10;
end
end
initial begin 
$monitor($time,"\ta=%0d,b=%0d,ALU_sel=%0d,ALU_out=%0d,carryout=%0d",a,b,ALU_sel,ALU_out,carryout);
end
endmodule
