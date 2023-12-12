// **************************************************************
// File name	:  EEPROM_test
// Module name	:  EEPROM_test
//
// Author		:  STEP 
// Date			:  2023.3.1 
// Version		:  V 1.0 
// Description	:	EEPROM instance module
// 
// Modification history
// //
// $Log$
//
// *********************************************************************-
// *****************************
//  DEFINE MODULE PORT  //
// ******************************
module EEPROM_test (	
							// INPUT
							input			clk,
							input			rst_n,
							// OUTPUT
							output		[8:0]	seg_1,	//MSB~LSB = SEG,DP,G,F,E,D,C,B,A
							output		[8:0]	seg_2,	//MSB~LSB = SEG,DP,G,F,E,D,C,B,A	
							output		i2c_scl,	//I2C时钟总线
							inout			i2c_sda	//I2C数据总线	
						  );
	//WIRES
	wire			[7:0]	seg_data;

	// ******************************
	// INSTANCE MODULE   //
	// ******************************
	AT24C02_Driver U_AT24C02_Driver (
												.clk			(clk			),	//系统时钟
												.rst_n		(rst_n			),	//系统复位，低有效
												.i2c_scl		(i2c_scl		),	//I2C总线SCL
												.i2c_sda		(i2c_sda		),	//I2C总线SDA
												.seg_data			(seg_data			)	//读取数据
												);
	//Segment led display module
	Segment_led U_Segment_led_1 (
											.seg_data				(seg_data[7:4]	),  //seg_data input
											.segment_led			(seg_1			)   //MSB~LSB = SEG,DP,G,F,E,D,C,B,A
										  );

	Segment_led U_Segment_led_2 (
											.seg_data				(seg_data[3:0]	),  //seg_data input
											.segment_led			(seg_2			)   //MSB~LSB = SEG,DP,G,F,E,D,C,B,A
										  );
endmodule