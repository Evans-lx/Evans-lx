// **************************************************************
// File name	:  MMA7660_test
// Module name	:  bin_to_bcd
//
// Author		:  STEP 
// Date			:  2023.4.19 
// Version		:  V 1.0 
// Description	:	bin_to_bcd module
// 
// Modification history
// //
// $Log$
//
// *********************************************************************-
// *****************************
//  DEFINE MODULE PORT  //
// ******************************
module bin_to_bcd(
						// INPUT
						input				rst_n,	//系统复位，低有效
						input		[7:0]	bin_code,	//需要进行BCD转码的二进制数据
						// OUTPUT
						output	reg	[7:0]	bcd_code	//转码后的BCD码型数据输出
						);

/*
此模块为了将ADC采样的数据转换为我们常用的十进制显示而存在，
主要知识涉及数学中不同制式数据的转换，详细原理这里不做介绍，去百度搜索<FPGA 二进制转BCD码>可得
*/
// REGS
reg		[15:0]		shift_reg; 
always@(bin_code or rst_n)begin
	shift_reg = {8'h0,bin_code};
	if(!rst_n) bcd_code = 0; 
	else begin 
		repeat(8) begin //循环8次  
			//BCD码各位数据作满5加3操作，
			if (shift_reg[11:8] >= 5) shift_reg[11:8] = shift_reg[11:8] + 2'b11;
			if (shift_reg[15:12] >= 5) shift_reg[15:12] = shift_reg[15:12] + 2'b11;
			shift_reg = shift_reg << 1; 
		end
		bcd_code = shift_reg[15:8];   
	end  
end

endmodule
//module bin2bcd
 //#( parameter                W = 18)  // input width
 // ( input      [W-1      :0] bin   ,  // binary
 //   output reg [W+(W-4)/3:0] bcd   ); // bcd {...,thousands,hundreds,tens,ones}

 // integer i,j;

//  always @(bin) begin
 //   for(i = 0; i <= W+(W-4)/3; i = i+1) bcd[i] = 0;     // initialize with zeros
 //   bcd[W-1:0] = bin;                                   // initialize with input vector
  //  for(i = 0; i <= W-4; i = i+1)                       // iterate on structure depth
  //    for(j = 0; j <= i/3; j = j+1)                     // iterate on structure width
//if (bcd[W-i+4*j -: 4] > 4)                      // if > 4
 //         bcd[W-i+4*j -: 4] = bcd[W-i+4*j -: 4] + 4'd3; // add 3
//  end

//endmodule