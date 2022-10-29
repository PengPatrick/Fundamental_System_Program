transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/simple_alu {D:/Duke/2022 fall/ECE 550/PRO/simple_alu/alu.v}
vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/simple_alu {D:/Duke/2022 fall/ECE 550/PRO/simple_alu/FA.v}
vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/simple_alu {D:/Duke/2022 fall/ECE 550/PRO/simple_alu/RCA.v}
vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/simple_alu {D:/Duke/2022 fall/ECE 550/PRO/simple_alu/CSA.v}

vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/simple_alu {D:/Duke/2022 fall/ECE 550/PRO/simple_alu/alu_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
