/**************************************************
module: DDS_test
author: wanganran
description: The testbench for module DDS
input: 
output: 
date: 2015.11.05
**************************************************/
`timescale 1ns / 100ps

module DDS_test;

parameter CLK_PERIOD = 40;  //CLK_PERIOD=40ns, Frequency=25MHz

reg sys_clk;
initial
	sys_clk = 1'b0;
always
	sys_clk = #(CLK_PERIOD/2) ~sys_clk;

reg sys_rst_n;  //active low
initial 
	begin
		sys_rst_n = 1'b0;
		#200;
		sys_rst_n = 1'b1;
	end

wire dac_clk_out;
wire [9:0] dac_data_out;
DDS DDS_uut
(
.clk_in(sys_clk),  //clock in
.rst_n_in(sys_rst_n),  //reset, active low
.dds_en_in(1),  //dds work enable
.f_increment(24'h10000),  //frequency increment
.p_increment(0),  //phase increment
.dac_clk_out(dac_clk_out),  //clock out
.dac_data_out(dac_data_out)  //data out
);
	
endmodule