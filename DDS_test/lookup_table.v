module lookup_table
(
	input [7:0] phase, 
	output reg [9:0] sin_dat
);

wire [5:0] address = phase[5:0];
wire [1:0] sel = phase[7:6];
wire [9:0] sine;

always@(sel or sine)
	case (sel)
		2'b00 : sin_dat = {1'b1, sine[9:1]};
		2'b01 : sin_dat = {1'b1, sine[9:1]};
		2'b10 : sin_dat = {1'b0, 9'h1ff-sine[9:1]};
		2'b11 : sin_dat = {1'b0, 9'h1ff-sine[9:1]};
	endcase

sine_table sine_table_uut
(
	.sel(sel),
	.address(address),
	.sine(sine)
);
	
endmodule