vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/blk_mem_gen_v8_4_11
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/proc_sys_reset_v5_0_17
vlib questa_lib/msim/axi_bram_ctrl_v4_1_13
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/interrupt_control_v3_1_5
vlib questa_lib/msim/axi_gpio_v2_0_37
vlib questa_lib/msim/xlconstant_v1_1_10
vlib questa_lib/msim/smartconnect_v1_0
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_35
vlib questa_lib/msim/axi_vip_v1_1_21

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap blk_mem_gen_v8_4_11 questa_lib/msim/blk_mem_gen_v8_4_11
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap proc_sys_reset_v5_0_17 questa_lib/msim/proc_sys_reset_v5_0_17
vmap axi_bram_ctrl_v4_1_13 questa_lib/msim/axi_bram_ctrl_v4_1_13
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_5 questa_lib/msim/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_37 questa_lib/msim/axi_gpio_v2_0_37
vmap xlconstant_v1_1_10 questa_lib/msim/xlconstant_v1_1_10
vmap smartconnect_v1_0 questa_lib/msim/smartconnect_v1_0
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_35 questa_lib/msim/axi_register_slice_v2_1_35
vmap axi_vip_v1_1_21 questa_lib/msim/axi_vip_v1_1_21

vlog -work xilinx_vip -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work blk_mem_gen_v8_4_11 -64 -incr -mfcu  "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a32c/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_axi_bram_ctrl_0_bram_0/sim/design_1_axi_bram_ctrl_0_bram_0.v" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \

vcom -work proc_sys_reset_v5_0_17 -64 -93  \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_rst_clk_wiz_100M_0/sim/design_1_rst_clk_wiz_100M_0.vhd" \

vcom -work axi_bram_ctrl_v4_1_13 -64 -93  \
"../../../../interupt.gen/sources_1/bd/design_1/ipshared/2f03/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_axi_bram_ctrl_0_1/sim/design_1_axi_bram_ctrl_0_1.vhd" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_axi_bram_ctrl_1_0/sim/design_1_axi_bram_ctrl_1_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_blk_mem_gen_0_0/sim/design_1_blk_mem_gen_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93  \
"../../../../interupt.gen/sources_1/bd/design_1/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_5 -64 -93  \
"../../../../interupt.gen/sources_1/bd/design_1/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_37 -64 -93  \
"../../../../interupt.gen/sources_1/bd/design_1/ipshared/0271/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_axi_gpio_0_0/sim/design_1_axi_gpio_0_0.vhd" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_axi_gpio_1_0/sim/design_1_axi_gpio_1_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/sim/bd_48ac.v" \

vlog -work xlconstant_v1_1_10 -64 -incr -mfcu  "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../interupt.gen/sources_1/bd/design_1/ipshared/a165/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_0/sim/bd_48ac_one_0.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_48ac_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../interupt.gen/sources_1/bd/design_1/ipshared/3718/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_48ac_arsw_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_48ac_rsw_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_48ac_awsw_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_48ac_wsw_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_48ac_bsw_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../interupt.gen/sources_1/bd/design_1/ipshared/d800/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_48ac_s00mmu_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../interupt.gen/sources_1/bd/design_1/ipshared/2da8/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_48ac_s00tr_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../interupt.gen/sources_1/bd/design_1/ipshared/dce3/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_48ac_s00sic_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../interupt.gen/sources_1/bd/design_1/ipshared/cef3/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_48ac_s00a2s_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_11/sim/bd_48ac_sarn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_12/sim/bd_48ac_srn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_13/sim/bd_48ac_sawn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_14/sim/bd_48ac_swn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_15/sim/bd_48ac_sbn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_16/sim/bd_48ac_s01mmu_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_17/sim/bd_48ac_s01tr_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_18/sim/bd_48ac_s01sic_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_19/sim/bd_48ac_s01a2s_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_20/sim/bd_48ac_sarn_1.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_21/sim/bd_48ac_srn_1.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_22/sim/bd_48ac_sawn_1.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_23/sim/bd_48ac_swn_1.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_24/sim/bd_48ac_sbn_1.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../interupt.gen/sources_1/bd/design_1/ipshared/7f4f/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_25/sim/bd_48ac_m00s2a_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_26/sim/bd_48ac_m00arn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_27/sim/bd_48ac_m00rn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_28/sim/bd_48ac_m00awn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_29/sim/bd_48ac_m00wn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_30/sim/bd_48ac_m00bn_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../interupt.gen/sources_1/bd/design_1/ipshared/0133/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_31/sim/bd_48ac_m00e_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_32/sim/bd_48ac_m01s2a_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_33/sim/bd_48ac_m01arn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_34/sim/bd_48ac_m01rn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_35/sim/bd_48ac_m01awn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_36/sim/bd_48ac_m01wn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_37/sim/bd_48ac_m01bn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_38/sim/bd_48ac_m01e_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_39/sim/bd_48ac_m02s2a_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_40/sim/bd_48ac_m02arn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_41/sim/bd_48ac_m02rn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_42/sim/bd_48ac_m02awn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_43/sim/bd_48ac_m02wn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_44/sim/bd_48ac_m02bn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_45/sim/bd_48ac_m02e_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_46/sim/bd_48ac_m03s2a_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_47/sim/bd_48ac_m03arn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_48/sim/bd_48ac_m03rn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_49/sim/bd_48ac_m03awn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_50/sim/bd_48ac_m03wn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_51/sim/bd_48ac_m03bn_0.sv" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_52/sim/bd_48ac_m03e_0.sv" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu  "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_35 -64 -incr -mfcu  "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../interupt.gen/sources_1/bd/design_1/ipshared/c5b7/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_21 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../interupt.gen/sources_1/bd/design_1/ipshared/f16f/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_smartconnect_0_0/sim/design_1_smartconnect_0_0.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ipshared/a9be" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/a8e4/hdl/verilog" "+incdir+../../../../interupt.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../../../../../opt/Xilinx/2025.1/data/rsb/busdef" "+incdir+/opt/Xilinx/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/ip/design_1_riscv_micro_1_0/sim/design_1_riscv_micro_1_0.v" \
"../../../../riscv_microprocessor.gen/sources_1/bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

