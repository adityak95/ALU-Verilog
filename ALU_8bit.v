module ALU(a,b,ALU_sel,ALU_out,carryout);
input [7:0]a,b;
input [3:0]ALU_sel;
output reg [7:0]ALU_out;
output reg carryout;

wire [8:0]temp;
assign temp={1'b0,a}+{1'b0,b};
assign carryout=temp[8];
always@(*)begin 
	if(ALU_sel==4'b0000) ALU_out=a+b;	//addition
	else if(ALU_sel==4'b0001) ALU_out=a-b;	//substraction
	else if(ALU_sel==4'b0010) ALU_out=a*b;	//multiplication
	else if(ALU_sel==4'b0011) ALU_out=a/b;	//division
	else if(ALU_sel==4'b0100) ALU_out=a<<1;	//left shift
	else if(ALU_sel==4'b0101) ALU_out=a>>1;	//right shift
	else if(ALU_sel==4'b0110) ALU_out={a[6:0],a[7]};	//rotate left
	else if(ALU_sel==4'b0111) ALU_out={a[0],a[7:1]};	//rotate right
	else if(ALU_sel==4'b1000) ALU_out=a&b;	//logical and
	else if(ALU_sel==4'b1001) ALU_out=a|b;	//logical or
	else if(ALU_sel==4'b1010) ALU_out=a^b;	//logical xor
	else if(ALU_sel==4'b1011) ALU_out=~(a|b);	//logical nor
	else if(ALU_sel==4'b1100) ALU_out=~(a&b);	//logical nand
	else if(ALU_sel==4'b1101) ALU_out=~(a^b);	//logical xnor
	else if(ALU_sel==4'b1110) ALU_out=(a>b)?8'd1:8'd0;	//grater comparison
	else ALU_out= (a==b)?8'd1:8'd0;	//equal comparison
end
//always(*) begin 
//case(ALU_sel)
//4'b0000 : ALU_out=a+b;
//4'b0001 : ALU_out=a-b;
//4'b0010 : ALU_out=a*b;
//4'b0011 : ALU_out=a/b;
//4'b0100 : ALU_out=a<<b;
//4'b0101 : ALU_out=a>>b;
//4'b0110 : ALU_out={a[6:0],a[7]};	
//4'b0111 : ALU_out={a[0],a[7:1]};	
//4'b1000 : ALU_out=a&b;
//4'b1001 : ALU_out=a|b;
//4'b1010 : ALU_out=a^b;
//4'b1011 : ALU_out=~(a|b);
//4'b1100 : ALU_out=~(a&b);
//4'b1101 : ALU_out=~(a^b);
//4'b1110 : ALU_out=(a>b)?8'd1:8'd0;	
//4'b1111 : ALU_out=(a==b)?8'd1:8'd0;
//	default:ALU_out=4'bxxxx;
//endcase
//end
endmodule
