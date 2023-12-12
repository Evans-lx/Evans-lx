// **************************************************************
// File name	:  MMA7660_test
// Module name	:  MMA7660_test
//
// Author		:  STEP 
// Date			:  2023.4.19 
// Version		:  V 1.0 
// Description	:	MMA7660 instance module
// 
// Modification history
// //
// $Log$
//
// *********************************************************************-
// *****************************
//  DEFINE MODULE PORT  //
// ******************************
module MMA7660_test(
								// INPUT
								input			clk,		//系统时钟
								input			rst_n,	//系统复位，低有效
								// OUTPUT
								output		i2c_scl,	//I2C时钟总线
								inout			i2c_sda,	//I2C数据总线	
								output	oled_rst,	//
								output	oled_dcn,	//
								output	oled_clk,	//
								output	oled_dat
							);
	//WIRES
	wire			[7:0]	xout, yout, zout, tilt, srst ,x_data_bcd, y_data_bcd, z_data_bcd;
	// ******************************
	// INSTANCE MODULE   //
	// ******************************
	MMA7660_driver U_MMA7660_driver 
	(
	.clk			(clk			),	//系统时钟
	.rst_n		(rst_n			),	//系统复位，低有效
	.i2c_scl		(i2c_scl		),	//I2C总线SCL
	.i2c_sda		(i2c_sda		),	//I2C总线SDA
	.xout			(xout			),	//读取数据
	.yout			(yout			),	//读取数据
	.zout			(zout			)	//读取数据
	);
	Calculate U_Calculate
	(
	.rst_n	(rst_n),
	.xout		(xout),
	.yout		(yout),
	.zout		(zout),
	.x_data_bcd		(x_data_bcd),
	.y_data_bcd		(y_data_bcd),
	.z_data_bcd		(z_data_bcd)
	);
	OLED_driver U_OLED_driver
	(
	.clk			(clk			),	//系统时钟
	.rst_n		(rst_n		),	//系统复位，低有效
	.freq_100	(freq_100	),
	.freq_10		(freq_10		),
	.freq_1		(freq_1		),
	.dc1_10		(dc1_10		),
	.dc1_1		(dc1_1		),
	.dc1_01		(dc1_01		),
	.dc2_10		(dc2_10		),
	.dc2_1		(dc2_1		),
	.dc2_01		(dc2_01		),
	.x_data_bcd	(x_data_bcd	),
	.y_data_bcd	(y_data_bcd	),
	.z_data_bcd	(z_data_bcd	),
	.oled_rst	(oled_rst	),
	.oled_dcn	(oled_dcn	),
	.oled_clk	(oled_clk	),
	.oled_dat	(oled_dat	)
	);
	
endmodule