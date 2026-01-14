//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
//Date        : Tue Dec  9 13:18:00 2025
//Host        : cenglab05 running 64-bit Ubuntu 24.04.3 LTS
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=12,numReposBlks=12,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=10,da_board_cnt=13,da_bram_cntlr_cnt=1,da_clkrst_cnt=10,synth_mode=None}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (INTERRUPT,
    SOFTWARE_INTERRUPT,
    TIMER_INTERRUPT,
    TRAP_CAUSE,
    dip_switches_16bits_tri_i,
    led_16bits_tri_o,
    reset,
    sys_clock);
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.INTERRUPT INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.INTERRUPT, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input INTERRUPT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.SOFTWARE_INTERRUPT INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.SOFTWARE_INTERRUPT, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input SOFTWARE_INTERRUPT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.TIMER_INTERRUPT INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.TIMER_INTERRUPT, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input TIMER_INTERRUPT;
  output [3:0]TRAP_CAUSE;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 dip_switches_16bits TRI_I" *) (* X_INTERFACE_MODE = "Master" *) input [15:0]dip_switches_16bits_tri_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 led_16bits TRI_O" *) (* X_INTERFACE_MODE = "Master" *) output [15:0]led_16bits_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN design_1_sys_clock, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input sys_clock;

  wire INTERRUPT;
  wire SOFTWARE_INTERRUPT;
  wire TIMER_INTERRUPT;
  wire [3:0]TRAP_CAUSE;
  wire [12:0]axi_bram_ctrl_0_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTA_EN;
  wire axi_bram_ctrl_0_BRAM_PORTA_RST;
  wire [12:0]axi_bram_ctrl_1_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_1_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_1_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_1_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_1_BRAM_PORTA_EN;
  wire axi_bram_ctrl_1_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_1_BRAM_PORTA_WE;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_locked;
  wire [15:0]dip_switches_16bits_tri_i;
  wire [0:0]ilconstant_0_dout;
  wire [0:0]ilconstant_1_dout;
  wire [15:0]led_16bits_tri_o;
  wire reset;
  wire [31:0]riscv_micro_1_D_M_AXI_ARADDR;
  wire [1:0]riscv_micro_1_D_M_AXI_ARBURST;
  wire [3:0]riscv_micro_1_D_M_AXI_ARCACHE;
  wire [0:0]riscv_micro_1_D_M_AXI_ARID;
  wire [7:0]riscv_micro_1_D_M_AXI_ARLEN;
  wire riscv_micro_1_D_M_AXI_ARLOCK;
  wire [2:0]riscv_micro_1_D_M_AXI_ARPROT;
  wire [3:0]riscv_micro_1_D_M_AXI_ARQOS;
  wire riscv_micro_1_D_M_AXI_ARREADY;
  wire [2:0]riscv_micro_1_D_M_AXI_ARSIZE;
  wire [31:0]riscv_micro_1_D_M_AXI_ARUSER;
  wire riscv_micro_1_D_M_AXI_ARVALID;
  wire [31:0]riscv_micro_1_D_M_AXI_AWADDR;
  wire [1:0]riscv_micro_1_D_M_AXI_AWBURST;
  wire [3:0]riscv_micro_1_D_M_AXI_AWCACHE;
  wire [0:0]riscv_micro_1_D_M_AXI_AWID;
  wire [7:0]riscv_micro_1_D_M_AXI_AWLEN;
  wire riscv_micro_1_D_M_AXI_AWLOCK;
  wire [2:0]riscv_micro_1_D_M_AXI_AWPROT;
  wire [3:0]riscv_micro_1_D_M_AXI_AWQOS;
  wire riscv_micro_1_D_M_AXI_AWREADY;
  wire [2:0]riscv_micro_1_D_M_AXI_AWSIZE;
  wire [31:0]riscv_micro_1_D_M_AXI_AWUSER;
  wire riscv_micro_1_D_M_AXI_AWVALID;
  wire [0:0]riscv_micro_1_D_M_AXI_BID;
  wire riscv_micro_1_D_M_AXI_BREADY;
  wire [1:0]riscv_micro_1_D_M_AXI_BRESP;
  wire [31:0]riscv_micro_1_D_M_AXI_BUSER;
  wire riscv_micro_1_D_M_AXI_BVALID;
  wire [31:0]riscv_micro_1_D_M_AXI_RDATA;
  wire [0:0]riscv_micro_1_D_M_AXI_RID;
  wire riscv_micro_1_D_M_AXI_RLAST;
  wire riscv_micro_1_D_M_AXI_RREADY;
  wire [1:0]riscv_micro_1_D_M_AXI_RRESP;
  wire [31:0]riscv_micro_1_D_M_AXI_RUSER;
  wire riscv_micro_1_D_M_AXI_RVALID;
  wire [31:0]riscv_micro_1_D_M_AXI_WDATA;
  wire riscv_micro_1_D_M_AXI_WLAST;
  wire riscv_micro_1_D_M_AXI_WREADY;
  wire [3:0]riscv_micro_1_D_M_AXI_WSTRB;
  wire [31:0]riscv_micro_1_D_M_AXI_WUSER;
  wire riscv_micro_1_D_M_AXI_WVALID;
  wire [31:0]riscv_micro_1_I_M_AXI_ARADDR;
  wire [1:0]riscv_micro_1_I_M_AXI_ARBURST;
  wire [3:0]riscv_micro_1_I_M_AXI_ARCACHE;
  wire [0:0]riscv_micro_1_I_M_AXI_ARID;
  wire [7:0]riscv_micro_1_I_M_AXI_ARLEN;
  wire riscv_micro_1_I_M_AXI_ARLOCK;
  wire [2:0]riscv_micro_1_I_M_AXI_ARPROT;
  wire [3:0]riscv_micro_1_I_M_AXI_ARQOS;
  wire riscv_micro_1_I_M_AXI_ARREADY;
  wire [2:0]riscv_micro_1_I_M_AXI_ARSIZE;
  wire [31:0]riscv_micro_1_I_M_AXI_ARUSER;
  wire riscv_micro_1_I_M_AXI_ARVALID;
  wire [31:0]riscv_micro_1_I_M_AXI_AWADDR;
  wire [1:0]riscv_micro_1_I_M_AXI_AWBURST;
  wire [3:0]riscv_micro_1_I_M_AXI_AWCACHE;
  wire [0:0]riscv_micro_1_I_M_AXI_AWID;
  wire [7:0]riscv_micro_1_I_M_AXI_AWLEN;
  wire riscv_micro_1_I_M_AXI_AWLOCK;
  wire [2:0]riscv_micro_1_I_M_AXI_AWPROT;
  wire [3:0]riscv_micro_1_I_M_AXI_AWQOS;
  wire riscv_micro_1_I_M_AXI_AWREADY;
  wire [2:0]riscv_micro_1_I_M_AXI_AWSIZE;
  wire [31:0]riscv_micro_1_I_M_AXI_AWUSER;
  wire riscv_micro_1_I_M_AXI_AWVALID;
  wire [0:0]riscv_micro_1_I_M_AXI_BID;
  wire riscv_micro_1_I_M_AXI_BREADY;
  wire [1:0]riscv_micro_1_I_M_AXI_BRESP;
  wire [31:0]riscv_micro_1_I_M_AXI_BUSER;
  wire riscv_micro_1_I_M_AXI_BVALID;
  wire [31:0]riscv_micro_1_I_M_AXI_RDATA;
  wire [0:0]riscv_micro_1_I_M_AXI_RID;
  wire riscv_micro_1_I_M_AXI_RLAST;
  wire riscv_micro_1_I_M_AXI_RREADY;
  wire [1:0]riscv_micro_1_I_M_AXI_RRESP;
  wire [31:0]riscv_micro_1_I_M_AXI_RUSER;
  wire riscv_micro_1_I_M_AXI_RVALID;
  wire [31:0]riscv_micro_1_I_M_AXI_WDATA;
  wire riscv_micro_1_I_M_AXI_WLAST;
  wire riscv_micro_1_I_M_AXI_WREADY;
  wire [3:0]riscv_micro_1_I_M_AXI_WSTRB;
  wire [31:0]riscv_micro_1_I_M_AXI_WUSER;
  wire riscv_micro_1_I_M_AXI_WVALID;
  wire rst_clk_wiz_100M_mb_reset;
  wire [0:0]rst_clk_wiz_100M_peripheral_aresetn;
  wire [12:0]smartconnect_0_M00_AXI_ARADDR;
  wire [1:0]smartconnect_0_M00_AXI_ARBURST;
  wire [3:0]smartconnect_0_M00_AXI_ARCACHE;
  wire [7:0]smartconnect_0_M00_AXI_ARLEN;
  wire [0:0]smartconnect_0_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_0_M00_AXI_ARPROT;
  wire smartconnect_0_M00_AXI_ARREADY;
  wire [2:0]smartconnect_0_M00_AXI_ARSIZE;
  wire smartconnect_0_M00_AXI_ARVALID;
  wire [12:0]smartconnect_0_M00_AXI_AWADDR;
  wire [1:0]smartconnect_0_M00_AXI_AWBURST;
  wire [3:0]smartconnect_0_M00_AXI_AWCACHE;
  wire [7:0]smartconnect_0_M00_AXI_AWLEN;
  wire [0:0]smartconnect_0_M00_AXI_AWLOCK;
  wire [2:0]smartconnect_0_M00_AXI_AWPROT;
  wire smartconnect_0_M00_AXI_AWREADY;
  wire [2:0]smartconnect_0_M00_AXI_AWSIZE;
  wire smartconnect_0_M00_AXI_AWVALID;
  wire smartconnect_0_M00_AXI_BREADY;
  wire [1:0]smartconnect_0_M00_AXI_BRESP;
  wire smartconnect_0_M00_AXI_BVALID;
  wire [31:0]smartconnect_0_M00_AXI_RDATA;
  wire smartconnect_0_M00_AXI_RLAST;
  wire smartconnect_0_M00_AXI_RREADY;
  wire [1:0]smartconnect_0_M00_AXI_RRESP;
  wire smartconnect_0_M00_AXI_RVALID;
  wire [31:0]smartconnect_0_M00_AXI_WDATA;
  wire smartconnect_0_M00_AXI_WLAST;
  wire smartconnect_0_M00_AXI_WREADY;
  wire [3:0]smartconnect_0_M00_AXI_WSTRB;
  wire smartconnect_0_M00_AXI_WVALID;
  wire [12:0]smartconnect_0_M01_AXI_ARADDR;
  wire [1:0]smartconnect_0_M01_AXI_ARBURST;
  wire [3:0]smartconnect_0_M01_AXI_ARCACHE;
  wire [7:0]smartconnect_0_M01_AXI_ARLEN;
  wire [0:0]smartconnect_0_M01_AXI_ARLOCK;
  wire [2:0]smartconnect_0_M01_AXI_ARPROT;
  wire smartconnect_0_M01_AXI_ARREADY;
  wire [2:0]smartconnect_0_M01_AXI_ARSIZE;
  wire smartconnect_0_M01_AXI_ARVALID;
  wire [12:0]smartconnect_0_M01_AXI_AWADDR;
  wire [1:0]smartconnect_0_M01_AXI_AWBURST;
  wire [3:0]smartconnect_0_M01_AXI_AWCACHE;
  wire [7:0]smartconnect_0_M01_AXI_AWLEN;
  wire [0:0]smartconnect_0_M01_AXI_AWLOCK;
  wire [2:0]smartconnect_0_M01_AXI_AWPROT;
  wire smartconnect_0_M01_AXI_AWREADY;
  wire [2:0]smartconnect_0_M01_AXI_AWSIZE;
  wire smartconnect_0_M01_AXI_AWVALID;
  wire smartconnect_0_M01_AXI_BREADY;
  wire [1:0]smartconnect_0_M01_AXI_BRESP;
  wire smartconnect_0_M01_AXI_BVALID;
  wire [31:0]smartconnect_0_M01_AXI_RDATA;
  wire smartconnect_0_M01_AXI_RLAST;
  wire smartconnect_0_M01_AXI_RREADY;
  wire [1:0]smartconnect_0_M01_AXI_RRESP;
  wire smartconnect_0_M01_AXI_RVALID;
  wire [31:0]smartconnect_0_M01_AXI_WDATA;
  wire smartconnect_0_M01_AXI_WLAST;
  wire smartconnect_0_M01_AXI_WREADY;
  wire [3:0]smartconnect_0_M01_AXI_WSTRB;
  wire smartconnect_0_M01_AXI_WVALID;
  wire [8:0]smartconnect_0_M02_AXI_ARADDR;
  wire smartconnect_0_M02_AXI_ARREADY;
  wire smartconnect_0_M02_AXI_ARVALID;
  wire [8:0]smartconnect_0_M02_AXI_AWADDR;
  wire smartconnect_0_M02_AXI_AWREADY;
  wire smartconnect_0_M02_AXI_AWVALID;
  wire smartconnect_0_M02_AXI_BREADY;
  wire [1:0]smartconnect_0_M02_AXI_BRESP;
  wire smartconnect_0_M02_AXI_BVALID;
  wire [31:0]smartconnect_0_M02_AXI_RDATA;
  wire smartconnect_0_M02_AXI_RREADY;
  wire [1:0]smartconnect_0_M02_AXI_RRESP;
  wire smartconnect_0_M02_AXI_RVALID;
  wire [31:0]smartconnect_0_M02_AXI_WDATA;
  wire smartconnect_0_M02_AXI_WREADY;
  wire [3:0]smartconnect_0_M02_AXI_WSTRB;
  wire smartconnect_0_M02_AXI_WVALID;
  wire [8:0]smartconnect_0_M03_AXI_ARADDR;
  wire smartconnect_0_M03_AXI_ARREADY;
  wire smartconnect_0_M03_AXI_ARVALID;
  wire [8:0]smartconnect_0_M03_AXI_AWADDR;
  wire smartconnect_0_M03_AXI_AWREADY;
  wire smartconnect_0_M03_AXI_AWVALID;
  wire smartconnect_0_M03_AXI_BREADY;
  wire [1:0]smartconnect_0_M03_AXI_BRESP;
  wire smartconnect_0_M03_AXI_BVALID;
  wire [31:0]smartconnect_0_M03_AXI_RDATA;
  wire smartconnect_0_M03_AXI_RREADY;
  wire [1:0]smartconnect_0_M03_AXI_RRESP;
  wire smartconnect_0_M03_AXI_RVALID;
  wire [31:0]smartconnect_0_M03_AXI_WDATA;
  wire smartconnect_0_M03_AXI_WREADY;
  wire [3:0]smartconnect_0_M03_AXI_WSTRB;
  wire smartconnect_0_M03_AXI_WVALID;
  wire sys_clock;

  design_1_axi_bram_ctrl_0_1 axi_bram_ctrl_0
       (.bram_addr_a(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .bram_clk_a(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .bram_en_a(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .bram_rddata_a(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .bram_rst_a(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .s_axi_aclk(clk_wiz_0_clk_out1),
        .s_axi_araddr(smartconnect_0_M00_AXI_ARADDR),
        .s_axi_arburst(smartconnect_0_M00_AXI_ARBURST),
        .s_axi_arcache(smartconnect_0_M00_AXI_ARCACHE),
        .s_axi_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .s_axi_arlen(smartconnect_0_M00_AXI_ARLEN),
        .s_axi_arlock(smartconnect_0_M00_AXI_ARLOCK),
        .s_axi_arprot(smartconnect_0_M00_AXI_ARPROT),
        .s_axi_arready(smartconnect_0_M00_AXI_ARREADY),
        .s_axi_arsize(smartconnect_0_M00_AXI_ARSIZE),
        .s_axi_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .s_axi_awburst(smartconnect_0_M00_AXI_AWBURST),
        .s_axi_awcache(smartconnect_0_M00_AXI_AWCACHE),
        .s_axi_awlen(smartconnect_0_M00_AXI_AWLEN),
        .s_axi_awlock(smartconnect_0_M00_AXI_AWLOCK),
        .s_axi_awprot(smartconnect_0_M00_AXI_AWPROT),
        .s_axi_awready(smartconnect_0_M00_AXI_AWREADY),
        .s_axi_awsize(smartconnect_0_M00_AXI_AWSIZE),
        .s_axi_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .s_axi_bready(smartconnect_0_M00_AXI_BREADY),
        .s_axi_bresp(smartconnect_0_M00_AXI_BRESP),
        .s_axi_bvalid(smartconnect_0_M00_AXI_BVALID),
        .s_axi_rdata(smartconnect_0_M00_AXI_RDATA),
        .s_axi_rlast(smartconnect_0_M00_AXI_RLAST),
        .s_axi_rready(smartconnect_0_M00_AXI_RREADY),
        .s_axi_rresp(smartconnect_0_M00_AXI_RRESP),
        .s_axi_rvalid(smartconnect_0_M00_AXI_RVALID),
        .s_axi_wdata(smartconnect_0_M00_AXI_WDATA),
        .s_axi_wlast(smartconnect_0_M00_AXI_WLAST),
        .s_axi_wready(smartconnect_0_M00_AXI_WREADY),
        .s_axi_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_0_M00_AXI_WVALID));
  design_1_axi_bram_ctrl_0_bram_0 axi_bram_ctrl_0_bram
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_0_BRAM_PORTA_ADDR}),
        .clka(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .douta(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .ena(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .rsta(axi_bram_ctrl_0_BRAM_PORTA_RST));
  design_1_axi_bram_ctrl_1_0 axi_bram_ctrl_1
       (.bram_addr_a(axi_bram_ctrl_1_BRAM_PORTA_ADDR),
        .bram_clk_a(axi_bram_ctrl_1_BRAM_PORTA_CLK),
        .bram_en_a(axi_bram_ctrl_1_BRAM_PORTA_EN),
        .bram_rddata_a(axi_bram_ctrl_1_BRAM_PORTA_DOUT),
        .bram_rst_a(axi_bram_ctrl_1_BRAM_PORTA_RST),
        .bram_we_a(axi_bram_ctrl_1_BRAM_PORTA_WE),
        .bram_wrdata_a(axi_bram_ctrl_1_BRAM_PORTA_DIN),
        .s_axi_aclk(clk_wiz_0_clk_out1),
        .s_axi_araddr(smartconnect_0_M01_AXI_ARADDR),
        .s_axi_arburst(smartconnect_0_M01_AXI_ARBURST),
        .s_axi_arcache(smartconnect_0_M01_AXI_ARCACHE),
        .s_axi_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .s_axi_arlen(smartconnect_0_M01_AXI_ARLEN),
        .s_axi_arlock(smartconnect_0_M01_AXI_ARLOCK),
        .s_axi_arprot(smartconnect_0_M01_AXI_ARPROT),
        .s_axi_arready(smartconnect_0_M01_AXI_ARREADY),
        .s_axi_arsize(smartconnect_0_M01_AXI_ARSIZE),
        .s_axi_arvalid(smartconnect_0_M01_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_0_M01_AXI_AWADDR),
        .s_axi_awburst(smartconnect_0_M01_AXI_AWBURST),
        .s_axi_awcache(smartconnect_0_M01_AXI_AWCACHE),
        .s_axi_awlen(smartconnect_0_M01_AXI_AWLEN),
        .s_axi_awlock(smartconnect_0_M01_AXI_AWLOCK),
        .s_axi_awprot(smartconnect_0_M01_AXI_AWPROT),
        .s_axi_awready(smartconnect_0_M01_AXI_AWREADY),
        .s_axi_awsize(smartconnect_0_M01_AXI_AWSIZE),
        .s_axi_awvalid(smartconnect_0_M01_AXI_AWVALID),
        .s_axi_bready(smartconnect_0_M01_AXI_BREADY),
        .s_axi_bresp(smartconnect_0_M01_AXI_BRESP),
        .s_axi_bvalid(smartconnect_0_M01_AXI_BVALID),
        .s_axi_rdata(smartconnect_0_M01_AXI_RDATA),
        .s_axi_rlast(smartconnect_0_M01_AXI_RLAST),
        .s_axi_rready(smartconnect_0_M01_AXI_RREADY),
        .s_axi_rresp(smartconnect_0_M01_AXI_RRESP),
        .s_axi_rvalid(smartconnect_0_M01_AXI_RVALID),
        .s_axi_wdata(smartconnect_0_M01_AXI_WDATA),
        .s_axi_wlast(smartconnect_0_M01_AXI_WLAST),
        .s_axi_wready(smartconnect_0_M01_AXI_WREADY),
        .s_axi_wstrb(smartconnect_0_M01_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_0_M01_AXI_WVALID));
  design_1_axi_gpio_0_0 axi_gpio_0
       (.gpio_io_i(dip_switches_16bits_tri_i),
        .s_axi_aclk(clk_wiz_0_clk_out1),
        .s_axi_araddr(smartconnect_0_M02_AXI_ARADDR),
        .s_axi_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .s_axi_arready(smartconnect_0_M02_AXI_ARREADY),
        .s_axi_arvalid(smartconnect_0_M02_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_0_M02_AXI_AWADDR),
        .s_axi_awready(smartconnect_0_M02_AXI_AWREADY),
        .s_axi_awvalid(smartconnect_0_M02_AXI_AWVALID),
        .s_axi_bready(smartconnect_0_M02_AXI_BREADY),
        .s_axi_bresp(smartconnect_0_M02_AXI_BRESP),
        .s_axi_bvalid(smartconnect_0_M02_AXI_BVALID),
        .s_axi_rdata(smartconnect_0_M02_AXI_RDATA),
        .s_axi_rready(smartconnect_0_M02_AXI_RREADY),
        .s_axi_rresp(smartconnect_0_M02_AXI_RRESP),
        .s_axi_rvalid(smartconnect_0_M02_AXI_RVALID),
        .s_axi_wdata(smartconnect_0_M02_AXI_WDATA),
        .s_axi_wready(smartconnect_0_M02_AXI_WREADY),
        .s_axi_wstrb(smartconnect_0_M02_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_0_M02_AXI_WVALID));
  design_1_axi_gpio_1_0 axi_gpio_1
       (.gpio_io_o(led_16bits_tri_o),
        .s_axi_aclk(clk_wiz_0_clk_out1),
        .s_axi_araddr(smartconnect_0_M03_AXI_ARADDR),
        .s_axi_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .s_axi_arready(smartconnect_0_M03_AXI_ARREADY),
        .s_axi_arvalid(smartconnect_0_M03_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_0_M03_AXI_AWADDR),
        .s_axi_awready(smartconnect_0_M03_AXI_AWREADY),
        .s_axi_awvalid(smartconnect_0_M03_AXI_AWVALID),
        .s_axi_bready(smartconnect_0_M03_AXI_BREADY),
        .s_axi_bresp(smartconnect_0_M03_AXI_BRESP),
        .s_axi_bvalid(smartconnect_0_M03_AXI_BVALID),
        .s_axi_rdata(smartconnect_0_M03_AXI_RDATA),
        .s_axi_rready(smartconnect_0_M03_AXI_RREADY),
        .s_axi_rresp(smartconnect_0_M03_AXI_RRESP),
        .s_axi_rvalid(smartconnect_0_M03_AXI_RVALID),
        .s_axi_wdata(smartconnect_0_M03_AXI_WDATA),
        .s_axi_wready(smartconnect_0_M03_AXI_WREADY),
        .s_axi_wstrb(smartconnect_0_M03_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_0_M03_AXI_WVALID));
  design_1_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_1_BRAM_PORTA_ADDR}),
        .clka(axi_bram_ctrl_1_BRAM_PORTA_CLK),
        .dina(axi_bram_ctrl_1_BRAM_PORTA_DIN),
        .douta(axi_bram_ctrl_1_BRAM_PORTA_DOUT),
        .ena(axi_bram_ctrl_1_BRAM_PORTA_EN),
        .rsta(axi_bram_ctrl_1_BRAM_PORTA_RST),
        .wea(axi_bram_ctrl_1_BRAM_PORTA_WE));
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(sys_clock),
        .clk_out1(clk_wiz_0_clk_out1),
        .locked(clk_wiz_0_locked),
        .resetn(reset));
  assign ilconstant_0_dout = 1'h1;
  assign ilconstant_1_dout = 1'h0;
  design_1_riscv_micro_1_0 riscv_micro_1
       (.CLK(clk_wiz_0_clk_out1),
        .D_M_AXI_ARADDR(riscv_micro_1_D_M_AXI_ARADDR),
        .D_M_AXI_ARBURST(riscv_micro_1_D_M_AXI_ARBURST),
        .D_M_AXI_ARCACHE(riscv_micro_1_D_M_AXI_ARCACHE),
        .D_M_AXI_ARID(riscv_micro_1_D_M_AXI_ARID),
        .D_M_AXI_ARLEN(riscv_micro_1_D_M_AXI_ARLEN),
        .D_M_AXI_ARLOCK(riscv_micro_1_D_M_AXI_ARLOCK),
        .D_M_AXI_ARPROT(riscv_micro_1_D_M_AXI_ARPROT),
        .D_M_AXI_ARQOS(riscv_micro_1_D_M_AXI_ARQOS),
        .D_M_AXI_ARREADY(riscv_micro_1_D_M_AXI_ARREADY),
        .D_M_AXI_ARSIZE(riscv_micro_1_D_M_AXI_ARSIZE),
        .D_M_AXI_ARUSER(riscv_micro_1_D_M_AXI_ARUSER),
        .D_M_AXI_ARVALID(riscv_micro_1_D_M_AXI_ARVALID),
        .D_M_AXI_AWADDR(riscv_micro_1_D_M_AXI_AWADDR),
        .D_M_AXI_AWBURST(riscv_micro_1_D_M_AXI_AWBURST),
        .D_M_AXI_AWCACHE(riscv_micro_1_D_M_AXI_AWCACHE),
        .D_M_AXI_AWID(riscv_micro_1_D_M_AXI_AWID),
        .D_M_AXI_AWLEN(riscv_micro_1_D_M_AXI_AWLEN),
        .D_M_AXI_AWLOCK(riscv_micro_1_D_M_AXI_AWLOCK),
        .D_M_AXI_AWPROT(riscv_micro_1_D_M_AXI_AWPROT),
        .D_M_AXI_AWQOS(riscv_micro_1_D_M_AXI_AWQOS),
        .D_M_AXI_AWREADY(riscv_micro_1_D_M_AXI_AWREADY),
        .D_M_AXI_AWSIZE(riscv_micro_1_D_M_AXI_AWSIZE),
        .D_M_AXI_AWUSER(riscv_micro_1_D_M_AXI_AWUSER),
        .D_M_AXI_AWVALID(riscv_micro_1_D_M_AXI_AWVALID),
        .D_M_AXI_BID(riscv_micro_1_D_M_AXI_BID),
        .D_M_AXI_BREADY(riscv_micro_1_D_M_AXI_BREADY),
        .D_M_AXI_BRESP(riscv_micro_1_D_M_AXI_BRESP),
        .D_M_AXI_BUSER(riscv_micro_1_D_M_AXI_BUSER),
        .D_M_AXI_BVALID(riscv_micro_1_D_M_AXI_BVALID),
        .D_M_AXI_RDATA(riscv_micro_1_D_M_AXI_RDATA),
        .D_M_AXI_RID(riscv_micro_1_D_M_AXI_RID),
        .D_M_AXI_RLAST(riscv_micro_1_D_M_AXI_RLAST),
        .D_M_AXI_RREADY(riscv_micro_1_D_M_AXI_RREADY),
        .D_M_AXI_RRESP(riscv_micro_1_D_M_AXI_RRESP),
        .D_M_AXI_RUSER(riscv_micro_1_D_M_AXI_RUSER),
        .D_M_AXI_RVALID(riscv_micro_1_D_M_AXI_RVALID),
        .D_M_AXI_WDATA(riscv_micro_1_D_M_AXI_WDATA),
        .D_M_AXI_WLAST(riscv_micro_1_D_M_AXI_WLAST),
        .D_M_AXI_WREADY(riscv_micro_1_D_M_AXI_WREADY),
        .D_M_AXI_WSTRB(riscv_micro_1_D_M_AXI_WSTRB),
        .D_M_AXI_WUSER(riscv_micro_1_D_M_AXI_WUSER),
        .D_M_AXI_WVALID(riscv_micro_1_D_M_AXI_WVALID),
        .INTERRUPT(INTERRUPT),
        .I_M_AXI_ARADDR(riscv_micro_1_I_M_AXI_ARADDR),
        .I_M_AXI_ARBURST(riscv_micro_1_I_M_AXI_ARBURST),
        .I_M_AXI_ARCACHE(riscv_micro_1_I_M_AXI_ARCACHE),
        .I_M_AXI_ARID(riscv_micro_1_I_M_AXI_ARID),
        .I_M_AXI_ARLEN(riscv_micro_1_I_M_AXI_ARLEN),
        .I_M_AXI_ARLOCK(riscv_micro_1_I_M_AXI_ARLOCK),
        .I_M_AXI_ARPROT(riscv_micro_1_I_M_AXI_ARPROT),
        .I_M_AXI_ARQOS(riscv_micro_1_I_M_AXI_ARQOS),
        .I_M_AXI_ARREADY(riscv_micro_1_I_M_AXI_ARREADY),
        .I_M_AXI_ARSIZE(riscv_micro_1_I_M_AXI_ARSIZE),
        .I_M_AXI_ARUSER(riscv_micro_1_I_M_AXI_ARUSER),
        .I_M_AXI_ARVALID(riscv_micro_1_I_M_AXI_ARVALID),
        .I_M_AXI_AWADDR(riscv_micro_1_I_M_AXI_AWADDR),
        .I_M_AXI_AWBURST(riscv_micro_1_I_M_AXI_AWBURST),
        .I_M_AXI_AWCACHE(riscv_micro_1_I_M_AXI_AWCACHE),
        .I_M_AXI_AWID(riscv_micro_1_I_M_AXI_AWID),
        .I_M_AXI_AWLEN(riscv_micro_1_I_M_AXI_AWLEN),
        .I_M_AXI_AWLOCK(riscv_micro_1_I_M_AXI_AWLOCK),
        .I_M_AXI_AWPROT(riscv_micro_1_I_M_AXI_AWPROT),
        .I_M_AXI_AWQOS(riscv_micro_1_I_M_AXI_AWQOS),
        .I_M_AXI_AWREADY(riscv_micro_1_I_M_AXI_AWREADY),
        .I_M_AXI_AWSIZE(riscv_micro_1_I_M_AXI_AWSIZE),
        .I_M_AXI_AWUSER(riscv_micro_1_I_M_AXI_AWUSER),
        .I_M_AXI_AWVALID(riscv_micro_1_I_M_AXI_AWVALID),
        .I_M_AXI_BID(riscv_micro_1_I_M_AXI_BID),
        .I_M_AXI_BREADY(riscv_micro_1_I_M_AXI_BREADY),
        .I_M_AXI_BRESP(riscv_micro_1_I_M_AXI_BRESP),
        .I_M_AXI_BUSER(riscv_micro_1_I_M_AXI_BUSER),
        .I_M_AXI_BVALID(riscv_micro_1_I_M_AXI_BVALID),
        .I_M_AXI_RDATA(riscv_micro_1_I_M_AXI_RDATA),
        .I_M_AXI_RID(riscv_micro_1_I_M_AXI_RID),
        .I_M_AXI_RLAST(riscv_micro_1_I_M_AXI_RLAST),
        .I_M_AXI_RREADY(riscv_micro_1_I_M_AXI_RREADY),
        .I_M_AXI_RRESP(riscv_micro_1_I_M_AXI_RRESP),
        .I_M_AXI_RUSER(riscv_micro_1_I_M_AXI_RUSER),
        .I_M_AXI_RVALID(riscv_micro_1_I_M_AXI_RVALID),
        .I_M_AXI_WDATA(riscv_micro_1_I_M_AXI_WDATA),
        .I_M_AXI_WLAST(riscv_micro_1_I_M_AXI_WLAST),
        .I_M_AXI_WREADY(riscv_micro_1_I_M_AXI_WREADY),
        .I_M_AXI_WSTRB(riscv_micro_1_I_M_AXI_WSTRB),
        .I_M_AXI_WUSER(riscv_micro_1_I_M_AXI_WUSER),
        .I_M_AXI_WVALID(riscv_micro_1_I_M_AXI_WVALID),
        .RESET(rst_clk_wiz_100M_mb_reset),
        .SOFTWARE_INTERRUPT(SOFTWARE_INTERRUPT),
        .TIMER_INTERRUPT(TIMER_INTERRUPT),
        .TRAP_CAUSE(TRAP_CAUSE));
  design_1_rst_clk_wiz_100M_0 rst_clk_wiz_100M
       (.aux_reset_in(ilconstant_0_dout),
        .dcm_locked(clk_wiz_0_locked),
        .ext_reset_in(reset),
        .mb_debug_sys_rst(ilconstant_1_dout),
        .mb_reset(rst_clk_wiz_100M_mb_reset),
        .peripheral_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .slowest_sync_clk(clk_wiz_0_clk_out1));
  design_1_smartconnect_0_0 smartconnect_0
       (.M00_AXI_araddr(smartconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arburst(smartconnect_0_M00_AXI_ARBURST),
        .M00_AXI_arcache(smartconnect_0_M00_AXI_ARCACHE),
        .M00_AXI_arlen(smartconnect_0_M00_AXI_ARLEN),
        .M00_AXI_arlock(smartconnect_0_M00_AXI_ARLOCK),
        .M00_AXI_arprot(smartconnect_0_M00_AXI_ARPROT),
        .M00_AXI_arready(smartconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arsize(smartconnect_0_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awburst(smartconnect_0_M00_AXI_AWBURST),
        .M00_AXI_awcache(smartconnect_0_M00_AXI_AWCACHE),
        .M00_AXI_awlen(smartconnect_0_M00_AXI_AWLEN),
        .M00_AXI_awlock(smartconnect_0_M00_AXI_AWLOCK),
        .M00_AXI_awprot(smartconnect_0_M00_AXI_AWPROT),
        .M00_AXI_awready(smartconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awsize(smartconnect_0_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_0_M00_AXI_BRESP),
        .M00_AXI_buser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M00_AXI_bvalid(smartconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_0_M00_AXI_RDATA),
        .M00_AXI_rlast(smartconnect_0_M00_AXI_RLAST),
        .M00_AXI_rready(smartconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_0_M00_AXI_WDATA),
        .M00_AXI_wlast(smartconnect_0_M00_AXI_WLAST),
        .M00_AXI_wready(smartconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_0_M00_AXI_WVALID),
        .M01_AXI_araddr(smartconnect_0_M01_AXI_ARADDR),
        .M01_AXI_arburst(smartconnect_0_M01_AXI_ARBURST),
        .M01_AXI_arcache(smartconnect_0_M01_AXI_ARCACHE),
        .M01_AXI_arlen(smartconnect_0_M01_AXI_ARLEN),
        .M01_AXI_arlock(smartconnect_0_M01_AXI_ARLOCK),
        .M01_AXI_arprot(smartconnect_0_M01_AXI_ARPROT),
        .M01_AXI_arready(smartconnect_0_M01_AXI_ARREADY),
        .M01_AXI_arsize(smartconnect_0_M01_AXI_ARSIZE),
        .M01_AXI_arvalid(smartconnect_0_M01_AXI_ARVALID),
        .M01_AXI_awaddr(smartconnect_0_M01_AXI_AWADDR),
        .M01_AXI_awburst(smartconnect_0_M01_AXI_AWBURST),
        .M01_AXI_awcache(smartconnect_0_M01_AXI_AWCACHE),
        .M01_AXI_awlen(smartconnect_0_M01_AXI_AWLEN),
        .M01_AXI_awlock(smartconnect_0_M01_AXI_AWLOCK),
        .M01_AXI_awprot(smartconnect_0_M01_AXI_AWPROT),
        .M01_AXI_awready(smartconnect_0_M01_AXI_AWREADY),
        .M01_AXI_awsize(smartconnect_0_M01_AXI_AWSIZE),
        .M01_AXI_awvalid(smartconnect_0_M01_AXI_AWVALID),
        .M01_AXI_bready(smartconnect_0_M01_AXI_BREADY),
        .M01_AXI_bresp(smartconnect_0_M01_AXI_BRESP),
        .M01_AXI_buser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M01_AXI_bvalid(smartconnect_0_M01_AXI_BVALID),
        .M01_AXI_rdata(smartconnect_0_M01_AXI_RDATA),
        .M01_AXI_rlast(smartconnect_0_M01_AXI_RLAST),
        .M01_AXI_rready(smartconnect_0_M01_AXI_RREADY),
        .M01_AXI_rresp(smartconnect_0_M01_AXI_RRESP),
        .M01_AXI_rvalid(smartconnect_0_M01_AXI_RVALID),
        .M01_AXI_wdata(smartconnect_0_M01_AXI_WDATA),
        .M01_AXI_wlast(smartconnect_0_M01_AXI_WLAST),
        .M01_AXI_wready(smartconnect_0_M01_AXI_WREADY),
        .M01_AXI_wstrb(smartconnect_0_M01_AXI_WSTRB),
        .M01_AXI_wvalid(smartconnect_0_M01_AXI_WVALID),
        .M02_AXI_araddr(smartconnect_0_M02_AXI_ARADDR),
        .M02_AXI_arready(smartconnect_0_M02_AXI_ARREADY),
        .M02_AXI_arvalid(smartconnect_0_M02_AXI_ARVALID),
        .M02_AXI_awaddr(smartconnect_0_M02_AXI_AWADDR),
        .M02_AXI_awready(smartconnect_0_M02_AXI_AWREADY),
        .M02_AXI_awvalid(smartconnect_0_M02_AXI_AWVALID),
        .M02_AXI_bready(smartconnect_0_M02_AXI_BREADY),
        .M02_AXI_bresp(smartconnect_0_M02_AXI_BRESP),
        .M02_AXI_bvalid(smartconnect_0_M02_AXI_BVALID),
        .M02_AXI_rdata(smartconnect_0_M02_AXI_RDATA),
        .M02_AXI_rready(smartconnect_0_M02_AXI_RREADY),
        .M02_AXI_rresp(smartconnect_0_M02_AXI_RRESP),
        .M02_AXI_rvalid(smartconnect_0_M02_AXI_RVALID),
        .M02_AXI_wdata(smartconnect_0_M02_AXI_WDATA),
        .M02_AXI_wready(smartconnect_0_M02_AXI_WREADY),
        .M02_AXI_wstrb(smartconnect_0_M02_AXI_WSTRB),
        .M02_AXI_wvalid(smartconnect_0_M02_AXI_WVALID),
        .M03_AXI_araddr(smartconnect_0_M03_AXI_ARADDR),
        .M03_AXI_arready(smartconnect_0_M03_AXI_ARREADY),
        .M03_AXI_arvalid(smartconnect_0_M03_AXI_ARVALID),
        .M03_AXI_awaddr(smartconnect_0_M03_AXI_AWADDR),
        .M03_AXI_awready(smartconnect_0_M03_AXI_AWREADY),
        .M03_AXI_awvalid(smartconnect_0_M03_AXI_AWVALID),
        .M03_AXI_bready(smartconnect_0_M03_AXI_BREADY),
        .M03_AXI_bresp(smartconnect_0_M03_AXI_BRESP),
        .M03_AXI_bvalid(smartconnect_0_M03_AXI_BVALID),
        .M03_AXI_rdata(smartconnect_0_M03_AXI_RDATA),
        .M03_AXI_rready(smartconnect_0_M03_AXI_RREADY),
        .M03_AXI_rresp(smartconnect_0_M03_AXI_RRESP),
        .M03_AXI_rvalid(smartconnect_0_M03_AXI_RVALID),
        .M03_AXI_wdata(smartconnect_0_M03_AXI_WDATA),
        .M03_AXI_wready(smartconnect_0_M03_AXI_WREADY),
        .M03_AXI_wstrb(smartconnect_0_M03_AXI_WSTRB),
        .M03_AXI_wvalid(smartconnect_0_M03_AXI_WVALID),
        .S00_AXI_araddr(riscv_micro_1_D_M_AXI_ARADDR),
        .S00_AXI_arburst(riscv_micro_1_D_M_AXI_ARBURST),
        .S00_AXI_arcache(riscv_micro_1_D_M_AXI_ARCACHE),
        .S00_AXI_arid(riscv_micro_1_D_M_AXI_ARID),
        .S00_AXI_arlen(riscv_micro_1_D_M_AXI_ARLEN),
        .S00_AXI_arlock(riscv_micro_1_D_M_AXI_ARLOCK),
        .S00_AXI_arprot(riscv_micro_1_D_M_AXI_ARPROT),
        .S00_AXI_arqos(riscv_micro_1_D_M_AXI_ARQOS),
        .S00_AXI_arready(riscv_micro_1_D_M_AXI_ARREADY),
        .S00_AXI_arsize(riscv_micro_1_D_M_AXI_ARSIZE),
        .S00_AXI_aruser(riscv_micro_1_D_M_AXI_ARUSER),
        .S00_AXI_arvalid(riscv_micro_1_D_M_AXI_ARVALID),
        .S00_AXI_awaddr(riscv_micro_1_D_M_AXI_AWADDR),
        .S00_AXI_awburst(riscv_micro_1_D_M_AXI_AWBURST),
        .S00_AXI_awcache(riscv_micro_1_D_M_AXI_AWCACHE),
        .S00_AXI_awid(riscv_micro_1_D_M_AXI_AWID),
        .S00_AXI_awlen(riscv_micro_1_D_M_AXI_AWLEN),
        .S00_AXI_awlock(riscv_micro_1_D_M_AXI_AWLOCK),
        .S00_AXI_awprot(riscv_micro_1_D_M_AXI_AWPROT),
        .S00_AXI_awqos(riscv_micro_1_D_M_AXI_AWQOS),
        .S00_AXI_awready(riscv_micro_1_D_M_AXI_AWREADY),
        .S00_AXI_awsize(riscv_micro_1_D_M_AXI_AWSIZE),
        .S00_AXI_awuser(riscv_micro_1_D_M_AXI_AWUSER),
        .S00_AXI_awvalid(riscv_micro_1_D_M_AXI_AWVALID),
        .S00_AXI_bid(riscv_micro_1_D_M_AXI_BID),
        .S00_AXI_bready(riscv_micro_1_D_M_AXI_BREADY),
        .S00_AXI_bresp(riscv_micro_1_D_M_AXI_BRESP),
        .S00_AXI_buser(riscv_micro_1_D_M_AXI_BUSER),
        .S00_AXI_bvalid(riscv_micro_1_D_M_AXI_BVALID),
        .S00_AXI_rdata(riscv_micro_1_D_M_AXI_RDATA),
        .S00_AXI_rid(riscv_micro_1_D_M_AXI_RID),
        .S00_AXI_rlast(riscv_micro_1_D_M_AXI_RLAST),
        .S00_AXI_rready(riscv_micro_1_D_M_AXI_RREADY),
        .S00_AXI_rresp(riscv_micro_1_D_M_AXI_RRESP),
        .S00_AXI_ruser(riscv_micro_1_D_M_AXI_RUSER),
        .S00_AXI_rvalid(riscv_micro_1_D_M_AXI_RVALID),
        .S00_AXI_wdata(riscv_micro_1_D_M_AXI_WDATA),
        .S00_AXI_wlast(riscv_micro_1_D_M_AXI_WLAST),
        .S00_AXI_wready(riscv_micro_1_D_M_AXI_WREADY),
        .S00_AXI_wstrb(riscv_micro_1_D_M_AXI_WSTRB),
        .S00_AXI_wuser(riscv_micro_1_D_M_AXI_WUSER),
        .S00_AXI_wvalid(riscv_micro_1_D_M_AXI_WVALID),
        .S01_AXI_araddr(riscv_micro_1_I_M_AXI_ARADDR),
        .S01_AXI_arburst(riscv_micro_1_I_M_AXI_ARBURST),
        .S01_AXI_arcache(riscv_micro_1_I_M_AXI_ARCACHE),
        .S01_AXI_arid(riscv_micro_1_I_M_AXI_ARID),
        .S01_AXI_arlen(riscv_micro_1_I_M_AXI_ARLEN),
        .S01_AXI_arlock(riscv_micro_1_I_M_AXI_ARLOCK),
        .S01_AXI_arprot(riscv_micro_1_I_M_AXI_ARPROT),
        .S01_AXI_arqos(riscv_micro_1_I_M_AXI_ARQOS),
        .S01_AXI_arready(riscv_micro_1_I_M_AXI_ARREADY),
        .S01_AXI_arsize(riscv_micro_1_I_M_AXI_ARSIZE),
        .S01_AXI_aruser(riscv_micro_1_I_M_AXI_ARUSER),
        .S01_AXI_arvalid(riscv_micro_1_I_M_AXI_ARVALID),
        .S01_AXI_awaddr(riscv_micro_1_I_M_AXI_AWADDR),
        .S01_AXI_awburst(riscv_micro_1_I_M_AXI_AWBURST),
        .S01_AXI_awcache(riscv_micro_1_I_M_AXI_AWCACHE),
        .S01_AXI_awid(riscv_micro_1_I_M_AXI_AWID),
        .S01_AXI_awlen(riscv_micro_1_I_M_AXI_AWLEN),
        .S01_AXI_awlock(riscv_micro_1_I_M_AXI_AWLOCK),
        .S01_AXI_awprot(riscv_micro_1_I_M_AXI_AWPROT),
        .S01_AXI_awqos(riscv_micro_1_I_M_AXI_AWQOS),
        .S01_AXI_awready(riscv_micro_1_I_M_AXI_AWREADY),
        .S01_AXI_awsize(riscv_micro_1_I_M_AXI_AWSIZE),
        .S01_AXI_awuser(riscv_micro_1_I_M_AXI_AWUSER),
        .S01_AXI_awvalid(riscv_micro_1_I_M_AXI_AWVALID),
        .S01_AXI_bid(riscv_micro_1_I_M_AXI_BID),
        .S01_AXI_bready(riscv_micro_1_I_M_AXI_BREADY),
        .S01_AXI_bresp(riscv_micro_1_I_M_AXI_BRESP),
        .S01_AXI_buser(riscv_micro_1_I_M_AXI_BUSER),
        .S01_AXI_bvalid(riscv_micro_1_I_M_AXI_BVALID),
        .S01_AXI_rdata(riscv_micro_1_I_M_AXI_RDATA),
        .S01_AXI_rid(riscv_micro_1_I_M_AXI_RID),
        .S01_AXI_rlast(riscv_micro_1_I_M_AXI_RLAST),
        .S01_AXI_rready(riscv_micro_1_I_M_AXI_RREADY),
        .S01_AXI_rresp(riscv_micro_1_I_M_AXI_RRESP),
        .S01_AXI_ruser(riscv_micro_1_I_M_AXI_RUSER),
        .S01_AXI_rvalid(riscv_micro_1_I_M_AXI_RVALID),
        .S01_AXI_wdata(riscv_micro_1_I_M_AXI_WDATA),
        .S01_AXI_wlast(riscv_micro_1_I_M_AXI_WLAST),
        .S01_AXI_wready(riscv_micro_1_I_M_AXI_WREADY),
        .S01_AXI_wstrb(riscv_micro_1_I_M_AXI_WSTRB),
        .S01_AXI_wuser(riscv_micro_1_I_M_AXI_WUSER),
        .S01_AXI_wvalid(riscv_micro_1_I_M_AXI_WVALID),
        .aclk(clk_wiz_0_clk_out1),
        .aresetn(rst_clk_wiz_100M_peripheral_aresetn));
endmodule
