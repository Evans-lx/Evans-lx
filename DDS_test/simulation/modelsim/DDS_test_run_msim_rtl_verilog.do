transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/WORK/new/DDS_test {D:/WORK/new/DDS_test/DDS_test.v}
vlog -vlog01compat -work work +incdir+D:/WORK/new/DDS_test {D:/WORK/new/DDS_test/lookup_table.v}
vlog -vlog01compat -work work +incdir+D:/WORK/new/DDS_test {D:/WORK/new/DDS_test/sine_table.v}
vlog -vlog01compat -work work +incdir+D:/WORK/new/DDS_test {D:/WORK/new/DDS_test/Decoder.v}
vlog -vlog01compat -work work +incdir+D:/WORK/new/DDS_test {D:/WORK/new/DDS_test/Encoder.v}
vlog -vlog01compat -work work +incdir+D:/WORK/new/DDS_test {D:/WORK/new/DDS_test/DDS_generator.v}
vlog -vlog01compat -work work +incdir+D:/WORK/new/DDS_test/output_files {D:/WORK/new/DDS_test/output_files/Debounce.v}
vlog -vlog01compat -work work +incdir+D:/WORK/new/DDS_test {D:/WORK/new/DDS_test/OLED_driver.v}

vlog -vlog01compat -work work +incdir+D:/WORK/new/DDS_test/simulation/modelsim {D:/WORK/new/DDS_test/simulation/modelsim/DDS_test.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  DDS_test

add wave *
view structure
view signals
run -all
