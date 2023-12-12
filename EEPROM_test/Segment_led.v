// **************************************************************
// File name	:  EEPROM_test
// Module name	:  Segment_led
//
// Author		:  STEP 
// Date			:  2023.3.1 
// Version		:  V 1.0 
// Description	:	segment LED Driver
// 
// Modification history
// //
// $Log$
//
// *********************************************************************
// *****************************
//  DEFINE MODULE PORT  //
// ******************************
module Segment_led (
							// INPUT
							input 		[3:0]	seg_data,		//seg_data input
							// OUTPUT
							output reg	[8:0]	segment_led		//MSB~LSB = SEG,DP,G,F,E,D,C,B,A
						  );
	// ******************************
	//	 MAIN CODE  //
	// ******************************
	always@(seg_data) 
	begin
		case(seg_data)
			4'd0: segment_led = 9'h3f;			//0
			4'd1: segment_led = 9'h06;			//1
			4'd2: segment_led = 9'h5b;			//2
			4'd3: segment_led = 9'h4f;			//3
			4'd4: segment_led = 9'h66;			//4
			4'd5: segment_led = 9'h6d;			//5
			4'd6: segment_led = 9'h7d;			//6
			4'd7: segment_led = 9'h07;			//7
			4'd8: segment_led = 9'h7f;			//8
			4'd9: segment_led = 9'h6f;			//9
			4'd10: segment_led = 9'h77;		//A
			4'd11: segment_led = 9'h7c;		//b
			4'd12: segment_led = 9'h39;		//C
			4'd13: segment_led = 9'h5e;		//d
			4'd14: segment_led = 9'h79;		//E
			4'd15: segment_led = 9'h71;		//F
			default: segment_led = 9'h00;
		endcase
	end
endmodule 