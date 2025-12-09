transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xil_defaultlib
vlib riviera/proc_sys_reset_v5_0_17
vlib riviera/axi_bram_ctrl_v4_1_13
vlib riviera/blk_mem_gen_v8_4_11

vmap xil_defaultlib riviera/xil_defaultlib
vmap proc_sys_reset_v5_0_17 riviera/proc_sys_reset_v5_0_17
vmap axi_bram_ctrl_v4_1_13 riviera/axi_bram_ctrl_v4_1_13
vmap blk_mem_gen_v8_4_11 riviera/blk_mem_gen_v8_4_11

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../Lab3B.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l axi_bram_ctrl_v4_1_13 -l blk_mem_gen_v8_4_11 \
"../../../bd/design_1/ip/design_1_entity_name_0_0/sim/design_1_entity_name_0_0.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0/design_1_clk_wiz_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0/design_1_clk_wiz_0.v" \

vcom -work proc_sys_reset_v5_0_17 -93  -incr \
"../../../../Lab3B.gen/sources_1/bd/design_1/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_rst_clk_wiz_100M_0/sim/design_1_rst_clk_wiz_100M_0.vhd" \

vcom -work axi_bram_ctrl_v4_1_13 -93  -incr \
"../../../../Lab3B.gen/sources_1/bd/design_1/ipshared/2f03/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_axi_bram_ctrl_0_0/sim/design_1_axi_bram_ctrl_0_0.vhd" \

vlog -work blk_mem_gen_v8_4_11  -incr -v2k5 "+incdir+../../../../Lab3B.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l axi_bram_ctrl_v4_1_13 -l blk_mem_gen_v8_4_11 \
"../../../../Lab3B.gen/sources_1/bd/design_1/ipshared/a32c/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../Lab3B.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l axi_bram_ctrl_v4_1_13 -l blk_mem_gen_v8_4_11 \
"../../../bd/design_1/ip/design_1_axi_bram_ctrl_0_bram_0/sim/design_1_axi_bram_ctrl_0_bram_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

