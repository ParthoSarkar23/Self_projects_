transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/PARTHO/Desktop/prjct {C:/Users/PARTHO/Desktop/prjct/count60.v}
vlog -vlog01compat -work work +incdir+C:/Users/PARTHO/Desktop/prjct {C:/Users/PARTHO/Desktop/prjct/clockk.v}
vlog -vlog01compat -work work +incdir+C:/Users/PARTHO/Desktop/prjct {C:/Users/PARTHO/Desktop/prjct/bcd_to_7seg.v}

vlog -vlog01compat -work work +incdir+C:/Users/PARTHO/Desktop/prjct {C:/Users/PARTHO/Desktop/prjct/tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
