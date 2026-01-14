transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/generic_baseblocks_v2_1_2
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_register_slice_v2_1_35
vlib riviera/fifo_generator_v13_2_13
vlib riviera/axi_data_fifo_v2_1_35
vlib riviera/axi_crossbar_v2_1_37
vlib riviera/xil_defaultlib
vlib riviera/proc_sys_reset_v5_0_17
vlib riviera/axi_bram_ctrl_v4_1_13
vlib riviera/blk_mem_gen_v8_4_11
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/interrupt_control_v3_1_5
vlib riviera/axi_gpio_v2_0_37
vlib riviera/axi_protocol_converter_v2_1_36

vmap generic_baseblocks_v2_1_2 riviera/generic_baseblocks_v2_1_2
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_35 riviera/axi_register_slice_v2_1_35
vmap fifo_generator_v13_2_13 riviera/fifo_generator_v13_2_13
vmap axi_data_fifo_v2_1_35 riviera/axi_data_fifo_v2_1_35
vmap axi_crossbar_v2_1_37 riviera/axi_crossbar_v2_1_37
vmap xil_defaultlib riviera/xil_defaultlib
vmap proc_sys_reset_v5_0_17 riviera/proc_sys_reset_v5_0_17
vmap axi_bram_ctrl_v4_1_13 riviera/axi_bram_ctrl_v4_1_13
vmap blk_mem_gen_v8_4_11 riviera/blk_mem_gen_v8_4_11
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_5 riviera/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_37 riviera/axi_gpio_v2_0_37
vmap axi_protocol_converter_v2_1_36 riviera/axi_protocol_converter_v2_1_36

vlog -work generic_baseblocks_v2_1_2  -incr -v2k5 "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_35 -l fifo_generator_v13_2_13 -l axi_data_fifo_v2_1_35 -l axi_crossbar_v2_1_37 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l axi_bram_ctrl_v4_1_13 -l blk_mem_gen_v8_4_11 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_protocol_converter_v2_1_36 \
"../../../../Lab5.gen/sources_1/bd/design_1/ipshared/0c28/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -incr -v2k5 "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_35 -l fifo_generator_v13_2_13 -l axi_data_fifo_v2_1_35 -l axi_crossbar_v2_1_37 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l axi_bram_ctrl_v4_1_13 -l blk_mem_gen_v8_4_11 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_protocol_converter_v2_1_36 \
"../../../../Lab5.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_35  -incr -v2k5 "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_35 -l fifo_generator_v13_2_13 -l axi_data_fifo_v2_1_35 -l axi_crossbar_v2_1_37 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l axi_bram_ctrl_v4_1_13 -l blk_mem_gen_v8_4_11 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_protocol_converter_v2_1_36 \
"../../../../Lab5.gen/sources_1/bd/design_1/ipshared/c5b7/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_13  -incr -v2k5 "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_35 -l fifo_generator_v13_2_13 -l axi_data_fifo_v2_1_35 -l axi_crossbar_v2_1_37 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l axi_bram_ctrl_v4_1_13 -l blk_mem_gen_v8_4_11 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_protocol_converter_v2_1_36 \
"../../../../Lab5.gen/sources_1/bd/design_1/ipshared/dc46/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_13 -93  -incr \
"../../../../Lab5.gen/sources_1/bd/design_1/ipshared/dc46/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_13  -incr -v2k5 "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_35 -l fifo_generator_v13_2_13 -l axi_data_fifo_v2_1_35 -l axi_crossbar_v2_1_37 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l axi_bram_ctrl_v4_1_13 -l blk_mem_gen_v8_4_11 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_protocol_converter_v2_1_36 \
"../../../../Lab5.gen/sources_1/bd/design_1/ipshared/dc46/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_35  -incr -v2k5 "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_35 -l fifo_generator_v13_2_13 -l axi_data_fifo_v2_1_35 -l axi_crossbar_v2_1_37 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l axi_bram_ctrl_v4_1_13 -l blk_mem_gen_v8_4_11 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_protocol_converter_v2_1_36 \
"../../../../Lab5.gen/sources_1/bd/design_1/ipshared/4846/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_37  -incr -v2k5 "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_35 -l fifo_generator_v13_2_13 -l axi_data_fifo_v2_1_35 -l axi_crossbar_v2_1_37 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l axi_bram_ctrl_v4_1_13 -l blk_mem_gen_v8_4_11 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_protocol_converter_v2_1_36 \
"../../../../Lab5.gen/sources_1/bd/design_1/ipshared/a1a7/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_35 -l fifo_generator_v13_2_13 -l axi_data_fifo_v2_1_35 -l axi_crossbar_v2_1_37 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l axi_bram_ctrl_v4_1_13 -l blk_mem_gen_v8_4_11 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_protocol_converter_v2_1_36 \
"../../../bd/design_1/ip/design_1_axi_interconnect_0_imp_xbar_0/sim/design_1_axi_interconnect_0_imp_xbar_0.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0/design_1_clk_wiz_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0/design_1_clk_wiz_0.v" \

vcom -work proc_sys_reset_v5_0_17 -93  -incr \
"../../../../Lab5.gen/sources_1/bd/design_1/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_rst_clk_wiz_100M_0/sim/design_1_rst_clk_wiz_100M_0.vhd" \

vcom -work axi_bram_ctrl_v4_1_13 -93  -incr \
"../../../../Lab5.gen/sources_1/bd/design_1/ipshared/2f03/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_axi_bram_ctrl_0_0/sim/design_1_axi_bram_ctrl_0_0.vhd" \

vlog -work blk_mem_gen_v8_4_11  -incr -v2k5 "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_35 -l fifo_generator_v13_2_13 -l axi_data_fifo_v2_1_35 -l axi_crossbar_v2_1_37 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l axi_bram_ctrl_v4_1_13 -l blk_mem_gen_v8_4_11 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_protocol_converter_v2_1_36 \
"../../../../Lab5.gen/sources_1/bd/design_1/ipshared/a32c/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_35 -l fifo_generator_v13_2_13 -l axi_data_fifo_v2_1_35 -l axi_crossbar_v2_1_37 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l axi_bram_ctrl_v4_1_13 -l blk_mem_gen_v8_4_11 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_protocol_converter_v2_1_36 \
"../../../bd/design_1/ip/design_1_axi_bram_ctrl_0_bram_0/sim/design_1_axi_bram_ctrl_0_bram_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93  -incr \
"../../../../Lab5.gen/sources_1/bd/design_1/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_5 -93  -incr \
"../../../../Lab5.gen/sources_1/bd/design_1/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_37 -93  -incr \
"../../../../Lab5.gen/sources_1/bd/design_1/ipshared/0271/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_axi_gpio_0_0_1/sim/design_1_axi_gpio_0_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_gpio_1_0_1/sim/design_1_axi_gpio_1_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_bram_ctrl_1_0_1/sim/design_1_axi_bram_ctrl_1_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_35 -l fifo_generator_v13_2_13 -l axi_data_fifo_v2_1_35 -l axi_crossbar_v2_1_37 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l axi_bram_ctrl_v4_1_13 -l blk_mem_gen_v8_4_11 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_protocol_converter_v2_1_36 \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_0_1/sim/design_1_blk_mem_gen_0_0.v" \
"../../../bd/design_1/ipshared/ccff/hdl/CPU_TEST_master_lite_v1_0_M00_AXI.v" \
"../../../bd/design_1/ipshared/ccff/hdl/CPU_TEST.v" \
"../../../bd/design_1/ip/design_1_CPU_TEST_0_0/sim/design_1_CPU_TEST_0_0.v" \

vlog -work axi_protocol_converter_v2_1_36  -incr -v2k5 "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_35 -l fifo_generator_v13_2_13 -l axi_data_fifo_v2_1_35 -l axi_crossbar_v2_1_37 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l axi_bram_ctrl_v4_1_13 -l blk_mem_gen_v8_4_11 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_protocol_converter_v2_1_36 \
"../../../../Lab5.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../Lab5.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" -l generic_baseblocks_v2_1_2 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_35 -l fifo_generator_v13_2_13 -l axi_data_fifo_v2_1_35 -l axi_crossbar_v2_1_37 -l xil_defaultlib -l proc_sys_reset_v5_0_17 -l axi_bram_ctrl_v4_1_13 -l blk_mem_gen_v8_4_11 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_37 -l axi_protocol_converter_v2_1_36 \
"../../../bd/design_1/ip/design_1_axi_interconnect_0_imp_auto_pc_0_1/sim/design_1_axi_interconnect_0_imp_auto_pc_0.v" \
"../../../bd/design_1/ip/design_1_axi_interconnect_0_imp_auto_pc_1_1/sim/design_1_axi_interconnect_0_imp_auto_pc_1.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

