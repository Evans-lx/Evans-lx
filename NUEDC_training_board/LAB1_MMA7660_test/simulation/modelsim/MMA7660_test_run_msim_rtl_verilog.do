transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/WORK/new/MMA7660_test {D:/WORK/new/MMA7660_test/MMA7660_test.v}
vlog -vlog01compat -work work +incdir+D:/WORK/new/MMA7660_test {D:/WORK/new/MMA7660_test/MMA7660_driver.v}
vlog -vlog01compat -work work +incdir+D:/WORK/new/MMA7660_test {D:/WORK/new/MMA7660_test/OLED_driver.v}
vlog -vlog01compat -work work +incdir+D:/WORK/new/MMA7660_test {D:/WORK/new/MMA7660_test/bin_to_bcd.v}
vlog -vlog01compat -work work +incdir+D:/WORK/new/MMA7660_test {D:/WORK/new/MMA7660_test/Calculate.v}

vlog -vlog01compat -work work +incdir+D:/WORK/new/MMA7660_test/simulation/modelsim {D:/WORK/new/MMA7660_test/simulation/modelsim/MMA7660_test.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_MMA7660_test

add wave *
view structure
view signals
run -all
