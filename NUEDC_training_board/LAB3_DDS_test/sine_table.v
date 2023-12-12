module sine_table
(
	input [1:0] sel,
	input [5:0] address,
	output reg [9:0] sine
);

reg    [5:0] table_addr;

always @(sel or address)
	case (sel)
		2'b00: table_addr = address;
		2'b01: table_addr = 6'h3f - address;
		2'b10: table_addr = address;
		2'b11: table_addr = 6'h3f - address;
	endcase

always @(table_addr)
	case(table_addr)	
		6'h0: sine=10'h000;
		6'h1: sine=10'h019;
		6'h2: sine=10'h032;
		6'h3: sine=10'h04B;
		6'h4: sine=10'h064;
		6'h5: sine=10'h07D;
		6'h6: sine=10'h096;
		6'h7: sine=10'h0AF;
		6'h8: sine=10'h0C4;
		6'h9: sine=10'h0E0;
		6'ha: sine=10'h0F9;
		6'hb: sine=10'h111;
		6'hc: sine=10'h128;
		6'hd: sine=10'h141;
		6'he: sine=10'h159;
		6'hf: sine=10'h170;
		6'h10: sine=10'h187;
		6'h11: sine=10'h19F;
		6'h12: sine=10'h1B5;
		6'h13: sine=10'h1CC;
		6'h14: sine=10'h1E2;
		6'h15: sine=10'h1F8;
		6'h16: sine=10'h20E;
		6'h17: sine=10'h223;
		6'h18: sine=10'h238;
		6'h19: sine=10'h24D;
		6'h1a: sine=10'h261;
		6'h1b: sine=10'h275;
		6'h1c: sine=10'h289;
		6'h1d: sine=10'h29C;
		6'h1e: sine=10'h2AF;
		6'h1f: sine=10'h2C1;
		6'h20: sine=10'h2D3;
		6'h21: sine=10'h2E5;
		6'h22: sine=10'h2F6;
		6'h23: sine=10'h307;
		6'h24: sine=10'h317;
		6'h25: sine=10'h326;
		6'h26: sine=10'h336;
		6'h27: sine=10'h344;
		6'h28: sine=10'h353;
		6'h29: sine=10'h360;
		6'h2a: sine=10'h36D;
		6'h2b: sine=10'h37A;
		6'h2c: sine=10'h386;
		6'h2d: sine=10'h392;
		6'h2e: sine=10'h39C;
		6'h2f: sine=10'h3A7;
		6'h30: sine=10'h3B1;
		6'h31: sine=10'h3BA;
		6'h32: sine=10'h3C3;
		6'h33: sine=10'h3CB;
		6'h34: sine=10'h3D3;
		6'h35: sine=10'h3DA;
		6'h36: sine=10'h3E0;
		6'h37: sine=10'h3E6;
		6'h38: sine=10'h3EB;
		6'h39: sine=10'h3F0;
		6'h3a: sine=10'h3F3;
		6'h3b: sine=10'h3F7;
		6'h3c: sine=10'h3FA;
		6'h3d: sine=10'h3FC;
		6'h3e: sine=10'h3FE;
		6'h3f: sine=10'h3FF;
	endcase
endmodule