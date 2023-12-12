// **************************************************************
// File name	:  MMA7660_test
// Module name	:  Calculate
//
// Author		:  STEP 
// Date			:  2023.4.19 
// Version		:  V 1.0 
// Description	:	Calculate module
// 
// Modification history
// //
// $Log$
//
// *********************************************************************-
// *****************************
//  DEFINE MODULE PORT  //
// ******************************
module Calculate(
						// INPUT
						input				rst_n,		//复位信号
						input		[7:0]	xout,  //写入数据
						input		[7:0]	yout,
						input		[7:0]	zout,
						// OUTPUT
						output		[7:0]	x_data_bcd,		
						output		[7:0]	y_data_bcd,	
						output		[7:0]	z_data_bcd		
						);
	// ******************************
	// INSTANCE MODULE   //
	// ******************************
bin_to_bcd u1
(
.rst_n				(rst_n		),	//系统复位，低有效
.bin_code			(xout	),	//需要进行BCD转码的二进制数据
.bcd_code			(x_data_bcd	)	//转码后的BCD码型数据输出
);

bin_to_bcd u2
(
.rst_n				(rst_n		),	//系统复位，低有效
.bin_code			(yout	),	//需要进行BCD转码的二进制数据
.bcd_code			(y_data_bcd	)	//转码后的BCD码型数据输出
);

bin_to_bcd u3
(
.rst_n				(rst_n		),	//系统复位，低有效
.bin_code			(zout	),	//需要进行BCD转码的二进制数据
.bcd_code			(z_data_bcd	)	//转码后的BCD码型数据输出
);
endmodule
