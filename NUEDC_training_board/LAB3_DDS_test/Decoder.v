// **************************************************************
// File name	:  DDS_test
// Module name	:  Decoder
//
// Author		:  STEP 
// Date			:  2023.4.19 
// Version		:  V 1.0 
// Description	:	Decoder
// 
// Modification history
// //
// $Log$
//
// *********************************************************************
// *****************************
//  DEFINE MODULE PORT  //
// ******************************
module Decoder(
					input				clk,
					input				rst_n,
					input				L_pulse,
					input				R_pulse,
					input				O_pulse,	//编码器按动脉冲
					output	reg	[1:0]	wave,		//波形输出
					output	reg	[11:0]	f_increment	//
					);
	// *****************************
	//  DEFINE PARAMETER  //
	// ****************************** 
	localparam	SAW = 2'b00, TRI = 2'b01, SQU = 2'b10, SIN = 2'b11;
	// ******************************
	//	 MAIN CODE  //
	// ******************************	
	//波形输出选择
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) wave <= SIN;
		else if(O_pulse)begin
			case(wave)
				SAW: wave <= TRI;
				TRI: wave <= SQU;
				SQU: wave <= SIN;
				SIN: wave <= SAW;
				default: wave <= SAW;
			endcase
		end else wave <= wave;
	end
	//key_pulse transfer to seg_data
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n) 
			begin
				f_increment <= 12'd2048;
			end 
		else 
			begin
				if(L_pulse) 
					begin
						f_increment <= f_increment - 12'd8;
					end 
				else if(R_pulse) 
					begin
						f_increment <= f_increment + 12'd8;
					end 
				else 
					begin
						f_increment <= f_increment;
					end
				end
			end
endmodule
