// **************************************************************
// File name	:  DDS_test
// Module name	:  DDS_test
//
// Author		:  STEP 
// Date			:  2023.4.19 
// Version		:  V 1.0 
// Description	:	DDS_test
// 
// Modification history
// //
// $Log$
//
// *********************************************************************
// *****************************
//  DEFINE MODULE PORT  //
// ******************************
module DDS_test(
					input clk,  //时钟信号
					input rst_n,  //重置信号
					input					key_a,		//旋转编码器EC11的A脚 
					input					key_b,		//旋转编码器EC11的B脚  
					input					key_o,		//旋转编码器EC11的B脚
					//input [11:0] f_increment,  //频率增量
					//input [23:0] p_increment,  //相位增量
					output dac_clk_out,  //dac时钟信号
					output [9:0] dac_data_out,  //dac数据
					output oled_rst, 
					output oled_dcn, 
					output oled_clk, 
					output oled_dat 
					);
	//WIRES
	wire L_pulse,R_pulse;
	// ******************************
	// INSTANCE MODULE   //
	// ******************************
	Encoder u1
	(
	.clk					(clk		),	//系统时钟 12MHz
	.rst_n				(rst_n	),	//系统复位 低有效
	.key_a				(key_a	),	//旋转编码器EC11的A脚 
	.key_b				(key_b	),	//旋转编码器EC11的B脚 
	.L_pulse				(L_pulse	),	//左旋脉冲输出
	.R_pulse				(R_pulse	)	//右旋脉冲输出
	);
	wire key_jit,key_pulse,key_state;
	//key debounce module
	Debounce u2
	(
	.clk				(clk		),	//系统时钟 12MHz
	.rst_n				(rst_n		),	//系统复位 低有效
	.key_n				(key_o		),	//按键信号输入
	.key_jit			(key_jit	),	//延时消抖输出
	.key_pulse			(key_pulse	),	//消抖脉冲输出
	.key_state			(key_state	)	//消抖翻转输出
	);
	wire [1:0] wave;
	wire [11:0] f_increment;
	Decoder u3
	(
	.clk						(clk		),	//系统时钟 12MHz
	.rst_n					(rst_n	),	//系统复位 低有效
	.L_pulse					(L_pulse	),	//左旋脉冲输出
	.R_pulse					(R_pulse	),	//右旋脉冲输出
	.O_pulse					(key_pulse),
	.wave						(wave			),
	.f_increment			(f_increment)	//高4位代表十位，低4位代表个位
	);
	DDS_generator u4
	(
	.clk						(clk		),	//系统时钟 12MHz
	.rst_n					(rst_n	),	//系统复位 低有效
	.key_a					(key_a		),	//旋转编码器EC11的A脚 
	.key_b					(key_b		),	//旋转编码器EC11的B脚 
	.wave						(wave			),
	.f_increment			(f_increment),
	.dac_clk_out			(dac_clk_out),	//
	.dac_data_out			(dac_data_out)	//
	);
	OLED_driver u5 
	(
	.clk				(clk			),	//12MHz系统时钟
	.rst_n			(rst_n		),	//系统复位，低有效
	.freq_100		(freq_100	),
	.freq_10			(freq_10		),
	.freq_1			(freq_1		),
	.dc1_10			(dc1_10		),
	.dc1_1			(dc1_1		),
	.dc1_01			(dc1_01		),
	.dc2_10			(dc2_10		),
	.dc2_1			(dc2_1		),
	.dc2_01			(dc2_01		),
	.wave				(wave			),
	.oled_rst		(oled_rst	),
	.oled_dcn		(oled_dcn	),
	.oled_clk		(oled_clk	),
	.oled_dat		(oled_dat	)
	);
endmodule	