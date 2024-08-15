transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Software\ projects/Quartus/async_fifo {D:/Software projects/Quartus/async_fifo/synchronizer.v}
vlog -vlog01compat -work work +incdir+D:/Software\ projects/Quartus/async_fifo {D:/Software projects/Quartus/async_fifo/wptr_handler.v}
vlog -vlog01compat -work work +incdir+D:/Software\ projects/Quartus/async_fifo {D:/Software projects/Quartus/async_fifo/rptr_handler.v}
vlog -vlog01compat -work work +incdir+D:/Software\ projects/Quartus/async_fifo {D:/Software projects/Quartus/async_fifo/dpram.v}
vlog -vlog01compat -work work +incdir+D:/Software\ projects/Quartus/async_fifo {D:/Software projects/Quartus/async_fifo/async_fifo.v}

vlog -vlog01compat -work work +incdir+D:/Software\ projects/Quartus/async_fifo {D:/Software projects/Quartus/async_fifo/testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
