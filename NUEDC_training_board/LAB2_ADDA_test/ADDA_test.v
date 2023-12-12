// **************************************************************
// File name	:  ADDA_test
// Module name	:  ADDA_test
//
// Author		:  STEP 
// Date			:  2023.4.19 
// Version		:  V 1.0 
// Description	:	ADDA instance module
// 
// Modification history
// //
// $Log$
//
// *********************************************************************-
// *****************************
//  DEFINE MODULE PORT  //
// ******************************
module ADDA_test(
						// INPUT
						input clk,	//12M时钟信号
						input rst_n,	//复位信号
						input  [9:0] adc_data,	//adc输出数据
						// OUTPUT
						output reg [9:0] dac_data,  //dac输入数据
						output adc_clk_out,	//adc时钟信号	
						output dac_clk_out	//dac时钟信号
						);
	assign adc_clk_out = clk;	
	assign dac_clk_out = clk;
	always @(posedge clk or negedge rst_n)
		begin
			dac_data <= adc_data;	//adc输出数据赋予dac输入端
		end
endmodule