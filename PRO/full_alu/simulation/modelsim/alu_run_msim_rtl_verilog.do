transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/full_alu {D:/Duke/2022 fall/ECE 550/PRO/full_alu/alu.v}
vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/full_alu {D:/Duke/2022 fall/ECE 550/PRO/full_alu/FA.v}
vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/full_alu {D:/Duke/2022 fall/ECE 550/PRO/full_alu/RCA.v}
vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/full_alu {D:/Duke/2022 fall/ECE 550/PRO/full_alu/CSA.v}
vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/full_alu {D:/Duke/2022 fall/ECE 550/PRO/full_alu/bitwise_and.v}
vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/full_alu {D:/Duke/2022 fall/ECE 550/PRO/full_alu/bitwise_or.v}
vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/full_alu {D:/Duke/2022 fall/ECE 550/PRO/full_alu/Mux_1b_2to1.v}
vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/full_alu {D:/Duke/2022 fall/ECE 550/PRO/full_alu/Mux_32b_2to1.v}
vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/full_alu {D:/Duke/2022 fall/ECE 550/PRO/full_alu/barrel_shift_left.v}
vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/full_alu {D:/Duke/2022 fall/ECE 550/PRO/full_alu/barrel_shift_right.v}
vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/full_alu {D:/Duke/2022 fall/ECE 550/PRO/full_alu/Mux_32b_8to1.v}
vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/full_alu {D:/Duke/2022 fall/ECE 550/PRO/full_alu/Mux_32b_4to1.v}
vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/full_alu {D:/Duke/2022 fall/ECE 550/PRO/full_alu/isNotEqual.v}

vlog -vlog01compat -work work +incdir+D:/Duke/2022\ fall/ECE\ 550/PRO/full_alu {D:/Duke/2022 fall/ECE 550/PRO/full_alu/alu_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
