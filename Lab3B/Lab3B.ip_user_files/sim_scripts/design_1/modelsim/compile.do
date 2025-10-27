vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/proc_sys_reset_v5_0_17
vlib modelsim_lib/msim/axi_bram_ctrl_v4_1_13
vlib modelsim_lib/msim/blk_mem_gen_v8_4_11

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap proc_sys_reset_v5_0_17 modelsim_lib/msim/proc_sys_reset_v5_0_17
vmap axi_bram_ctrl_v4_1_13 modelsim_lib/msim/axi_bram_ctrl_v4_1_13
vmap blk_mem_gen_v8_4_11 modelsim_lib/msim/blk_mem_gen_v8_4_11

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../Lab3B.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" \
"../../../bd/design_1/ip/design_1_entity_name_0_0/sim/design_1_entity_name_0_0.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0/design_1_clk_wiz_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0/design_1_clk_wiz_0.v" \

vcom -work proc_sys_reset_v5_0_17 -64 -93  \
"../../../../Lab3B.gen/sources_1/bd/design_1/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/design_1/ip/design_1_rst_clk_wiz_100M_0/sim/design_1_rst_clk_wiz_100M_0.vhd" \

vcom -work axi_bram_ctrl_v4_1_13 -64 -93  \
"../../../../Lab3B.gen/sources_1/bd/design_1/ipshared/2f03/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/design_1/ip/design_1_axi_bram_ctrl_0_0/sim/design_1_axi_bram_ctrl_0_0.vhd" \

vlog -work blk_mem_gen_v8_4_11 -64 -incr -mfcu  "+incdir+../../../../Lab3B.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" \
"../../../../Lab3B.gen/sources_1/bd/design_1/ipshared/a32c/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../Lab3B.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" \
"../../../bd/design_1/ip/design_1_axi_bram_ctrl_0_bram_0/sim/design_1_axi_bram_ctrl_0_bram_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

