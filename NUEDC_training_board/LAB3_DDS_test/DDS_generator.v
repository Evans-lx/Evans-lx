// **************************************************************
// File name	:  DDS_test
// Module name	:  DDS_generator
//
// Author		:  STEP 
// Date			:  2023.4.19 
// Version		:  V 1.0 
// Description	:	DDS_generator
// 
// Modification history
// //
// $Log$
//
// *********************************************************************
// *****************************
//  DEFINE MODULE PORT  //
// ******************************
module DDS_generator(
							// INPUT
							input clk,  //时钟信号
							input rst_n,  //重置信号
							input		[1:0]	wave,
							input					key_a,		//旋转编码器EC11的A脚 
							input					key_b,		//旋转编码器EC11的B脚  
							input [11:0] f_increment,  //频率增量
							// OUTPUT							
							output dac_clk_out,  //dac时钟信号
							output reg [9:0] dac_data_out  //dac数据
							);
	assign dac_clk_out = clk;
	// REGS
	reg [23:0] phase_accumulator;
	//WIRES
	wire [7:0] phase;
	wire [9:0] sin_dat;	//正弦波
	wire [9:0] saw_dat = phase_accumulator[23:14];	//锯齿波
	wire [9:0] tri_dat = phase_accumulator[23]? (~phase_accumulator[22:13]) : phase_accumulator[22:13];	//三角波
	wire [9:0] squ_dat = phase_accumulator[23]? 8'hff : 8'h00;	//方波	
	// ******************************
	//	 MAIN CODE  //
	// ******************************
	always @(posedge clk or negedge rst_n)
		begin
		if(!rst_n) 
			phase_accumulator <= 23'b0;
		else
			phase_accumulator <= phase_accumulator + f_increment;	
		end
	//按键切换波形
	always @(*) begin
		case(wave)	
			2'b00: dac_data_out = saw_dat;	//锯齿波
			2'b01: dac_data_out = tri_dat;	//三角波
			2'b10: dac_data_out = squ_dat;	//方	波
			2'b11: dac_data_out = sin_dat;	//正弦波
			default: dac_data_out = saw_dat;	//锯齿波
		endcase
	end
	assign phase = phase_accumulator[23:16]; //相位是高8	位
	// ******************************
	// INSTANCE MODULE   //
	// ******************************
	lookup_table lookup_table_uut
	(
		.phase(phase), 
		.sin_dat(sin_dat)
	);
	endmodule