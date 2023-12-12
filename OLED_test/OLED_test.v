module OLED_test(
								input	clk,			//12MHz系统时钟
								input	rst_n,			//系统复位，低有效

		 
								output oled_rst, 
								output oled_dcn, 
								output oled_clk, 
								output oled_dat 
								);
	OLED_driver U_OLED_driver (
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
										.oled_rst		(oled_rst	),
										.oled_dcn		(oled_dcn	),
										.oled_clk		(oled_clk	),
										.oled_dat		(oled_dat	)
										);
endmodule							
