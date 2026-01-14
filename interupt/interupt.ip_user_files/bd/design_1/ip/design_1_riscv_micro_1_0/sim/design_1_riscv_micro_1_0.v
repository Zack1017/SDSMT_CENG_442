// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:riscv_micro:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_riscv_micro_1_0 (
  CLK,
  RESET,
  INTERRUPT,
  TIMER_INTERRUPT,
  SOFTWARE_INTERRUPT,
  TRAP_CAUSE,
  I_M_AXI_AWID,
  I_M_AXI_AWADDR,
  I_M_AXI_AWLEN,
  I_M_AXI_AWSIZE,
  I_M_AXI_AWBURST,
  I_M_AXI_AWLOCK,
  I_M_AXI_AWCACHE,
  I_M_AXI_AWPROT,
  I_M_AXI_AWQOS,
  I_M_AXI_AWUSER,
  I_M_AXI_AWVALID,
  I_M_AXI_AWREADY,
  I_M_AXI_WDATA,
  I_M_AXI_WSTRB,
  I_M_AXI_WLAST,
  I_M_AXI_WUSER,
  I_M_AXI_WVALID,
  I_M_AXI_WREADY,
  I_M_AXI_BID,
  I_M_AXI_BRESP,
  I_M_AXI_BUSER,
  I_M_AXI_BVALID,
  I_M_AXI_BREADY,
  I_M_AXI_ARID,
  I_M_AXI_ARADDR,
  I_M_AXI_ARLEN,
  I_M_AXI_ARSIZE,
  I_M_AXI_ARBURST,
  I_M_AXI_ARLOCK,
  I_M_AXI_ARCACHE,
  I_M_AXI_ARPROT,
  I_M_AXI_ARQOS,
  I_M_AXI_ARUSER,
  I_M_AXI_ARVALID,
  I_M_AXI_ARREADY,
  I_M_AXI_RID,
  I_M_AXI_RDATA,
  I_M_AXI_RRESP,
  I_M_AXI_RLAST,
  I_M_AXI_RUSER,
  I_M_AXI_RVALID,
  I_M_AXI_RREADY,
  D_M_AXI_AWID,
  D_M_AXI_AWADDR,
  D_M_AXI_AWLEN,
  D_M_AXI_AWSIZE,
  D_M_AXI_AWBURST,
  D_M_AXI_AWLOCK,
  D_M_AXI_AWCACHE,
  D_M_AXI_AWPROT,
  D_M_AXI_AWQOS,
  D_M_AXI_AWUSER,
  D_M_AXI_AWVALID,
  D_M_AXI_AWREADY,
  D_M_AXI_WDATA,
  D_M_AXI_WSTRB,
  D_M_AXI_WLAST,
  D_M_AXI_WUSER,
  D_M_AXI_WVALID,
  D_M_AXI_WREADY,
  D_M_AXI_BID,
  D_M_AXI_BRESP,
  D_M_AXI_BUSER,
  D_M_AXI_BVALID,
  D_M_AXI_BREADY,
  D_M_AXI_ARID,
  D_M_AXI_ARADDR,
  D_M_AXI_ARLEN,
  D_M_AXI_ARSIZE,
  D_M_AXI_ARBURST,
  D_M_AXI_ARLOCK,
  D_M_AXI_ARCACHE,
  D_M_AXI_ARPROT,
  D_M_AXI_ARQOS,
  D_M_AXI_ARUSER,
  D_M_AXI_ARVALID,
  D_M_AXI_ARREADY,
  D_M_AXI_RID,
  D_M_AXI_RDATA,
  D_M_AXI_RRESP,
  D_M_AXI_RLAST,
  D_M_AXI_RUSER,
  D_M_AXI_RVALID,
  D_M_AXI_RREADY
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK, ASSOCIATED_BUSIF D_M_AXI:I_M_AXI, ASSOCIATED_RESET RESET, FREQ_HZ 75000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *)
input wire CLK;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RESET RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RESET, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
input wire RESET;
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTERRUPT INTERRUPT" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTERRUPT, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
input wire INTERRUPT;
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 TIMER_INTERRUPT INTERRUPT" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME TIMER_INTERRUPT, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
input wire TIMER_INTERRUPT;
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 SOFTWARE_INTERRUPT INTERRUPT" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SOFTWARE_INTERRUPT, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
input wire SOFTWARE_INTERRUPT;
output wire [3 : 0] TRAP_CAUSE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI AWID" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME I_M_AXI, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 75000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 32, ARUSER_WIDTH 32, WUSER_WIDTH 32, RUSER_WIDTH 32, BUSER_WIDTH 32, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREA\
DS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
output wire [0 : 0] I_M_AXI_AWID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI AWADDR" *)
output wire [31 : 0] I_M_AXI_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI AWLEN" *)
output wire [7 : 0] I_M_AXI_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI AWSIZE" *)
output wire [2 : 0] I_M_AXI_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI AWBURST" *)
output wire [1 : 0] I_M_AXI_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI AWLOCK" *)
output wire I_M_AXI_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI AWCACHE" *)
output wire [3 : 0] I_M_AXI_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI AWPROT" *)
output wire [2 : 0] I_M_AXI_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI AWQOS" *)
output wire [3 : 0] I_M_AXI_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI AWUSER" *)
output wire [31 : 0] I_M_AXI_AWUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI AWVALID" *)
output wire I_M_AXI_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI AWREADY" *)
input wire I_M_AXI_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI WDATA" *)
output wire [31 : 0] I_M_AXI_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI WSTRB" *)
output wire [3 : 0] I_M_AXI_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI WLAST" *)
output wire I_M_AXI_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI WUSER" *)
output wire [31 : 0] I_M_AXI_WUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI WVALID" *)
output wire I_M_AXI_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI WREADY" *)
input wire I_M_AXI_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI BID" *)
input wire [0 : 0] I_M_AXI_BID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI BRESP" *)
input wire [1 : 0] I_M_AXI_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI BUSER" *)
input wire [31 : 0] I_M_AXI_BUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI BVALID" *)
input wire I_M_AXI_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI BREADY" *)
output wire I_M_AXI_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI ARID" *)
output wire [0 : 0] I_M_AXI_ARID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI ARADDR" *)
output wire [31 : 0] I_M_AXI_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI ARLEN" *)
output wire [7 : 0] I_M_AXI_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI ARSIZE" *)
output wire [2 : 0] I_M_AXI_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI ARBURST" *)
output wire [1 : 0] I_M_AXI_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI ARLOCK" *)
output wire I_M_AXI_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI ARCACHE" *)
output wire [3 : 0] I_M_AXI_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI ARPROT" *)
output wire [2 : 0] I_M_AXI_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI ARQOS" *)
output wire [3 : 0] I_M_AXI_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI ARUSER" *)
output wire [31 : 0] I_M_AXI_ARUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI ARVALID" *)
output wire I_M_AXI_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI ARREADY" *)
input wire I_M_AXI_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI RID" *)
input wire [0 : 0] I_M_AXI_RID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI RDATA" *)
input wire [31 : 0] I_M_AXI_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI RRESP" *)
input wire [1 : 0] I_M_AXI_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI RLAST" *)
input wire I_M_AXI_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI RUSER" *)
input wire [31 : 0] I_M_AXI_RUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI RVALID" *)
input wire I_M_AXI_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 I_M_AXI RREADY" *)
output wire I_M_AXI_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI AWID" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME D_M_AXI, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 75000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 32, ARUSER_WIDTH 32, WUSER_WIDTH 32, RUSER_WIDTH 32, BUSER_WIDTH 32, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREA\
DS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
output wire [0 : 0] D_M_AXI_AWID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI AWADDR" *)
output wire [31 : 0] D_M_AXI_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI AWLEN" *)
output wire [7 : 0] D_M_AXI_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI AWSIZE" *)
output wire [2 : 0] D_M_AXI_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI AWBURST" *)
output wire [1 : 0] D_M_AXI_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI AWLOCK" *)
output wire D_M_AXI_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI AWCACHE" *)
output wire [3 : 0] D_M_AXI_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI AWPROT" *)
output wire [2 : 0] D_M_AXI_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI AWQOS" *)
output wire [3 : 0] D_M_AXI_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI AWUSER" *)
output wire [31 : 0] D_M_AXI_AWUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI AWVALID" *)
output wire D_M_AXI_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI AWREADY" *)
input wire D_M_AXI_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI WDATA" *)
output wire [31 : 0] D_M_AXI_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI WSTRB" *)
output wire [3 : 0] D_M_AXI_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI WLAST" *)
output wire D_M_AXI_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI WUSER" *)
output wire [31 : 0] D_M_AXI_WUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI WVALID" *)
output wire D_M_AXI_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI WREADY" *)
input wire D_M_AXI_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI BID" *)
input wire [0 : 0] D_M_AXI_BID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI BRESP" *)
input wire [1 : 0] D_M_AXI_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI BUSER" *)
input wire [31 : 0] D_M_AXI_BUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI BVALID" *)
input wire D_M_AXI_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI BREADY" *)
output wire D_M_AXI_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI ARID" *)
output wire [0 : 0] D_M_AXI_ARID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI ARADDR" *)
output wire [31 : 0] D_M_AXI_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI ARLEN" *)
output wire [7 : 0] D_M_AXI_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI ARSIZE" *)
output wire [2 : 0] D_M_AXI_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI ARBURST" *)
output wire [1 : 0] D_M_AXI_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI ARLOCK" *)
output wire D_M_AXI_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI ARCACHE" *)
output wire [3 : 0] D_M_AXI_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI ARPROT" *)
output wire [2 : 0] D_M_AXI_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI ARQOS" *)
output wire [3 : 0] D_M_AXI_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI ARUSER" *)
output wire [31 : 0] D_M_AXI_ARUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI ARVALID" *)
output wire D_M_AXI_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI ARREADY" *)
input wire D_M_AXI_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI RID" *)
input wire [0 : 0] D_M_AXI_RID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI RDATA" *)
input wire [31 : 0] D_M_AXI_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI RRESP" *)
input wire [1 : 0] D_M_AXI_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI RLAST" *)
input wire D_M_AXI_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI RUSER" *)
input wire [31 : 0] D_M_AXI_RUSER;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI RVALID" *)
input wire D_M_AXI_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 D_M_AXI RREADY" *)
output wire D_M_AXI_RREADY;

  riscv_micro #(
    .C_M_TARGET_SLAVE_BASE_ADDR(32'H00000000),
    .C_M_AXI_BURST_LEN(1),
    .C_M_AXI_ID_WIDTH(1),
    .C_M_AXI_ADDR_WIDTH(32),
    .C_M_AXI_DATA_WIDTH(32),
    .C_M_AXI_AWUSER_WIDTH(32),
    .C_M_AXI_ARUSER_WIDTH(32),
    .C_M_AXI_WUSER_WIDTH(32),
    .C_M_AXI_RUSER_WIDTH(32),
    .C_M_AXI_BUSER_WIDTH(32)
  ) inst (
    .CLK(CLK),
    .RESET(RESET),
    .INTERRUPT(INTERRUPT),
    .TIMER_INTERRUPT(TIMER_INTERRUPT),
    .SOFTWARE_INTERRUPT(SOFTWARE_INTERRUPT),
    .TRAP_CAUSE(TRAP_CAUSE),
    .I_M_AXI_AWID(I_M_AXI_AWID),
    .I_M_AXI_AWADDR(I_M_AXI_AWADDR),
    .I_M_AXI_AWLEN(I_M_AXI_AWLEN),
    .I_M_AXI_AWSIZE(I_M_AXI_AWSIZE),
    .I_M_AXI_AWBURST(I_M_AXI_AWBURST),
    .I_M_AXI_AWLOCK(I_M_AXI_AWLOCK),
    .I_M_AXI_AWCACHE(I_M_AXI_AWCACHE),
    .I_M_AXI_AWPROT(I_M_AXI_AWPROT),
    .I_M_AXI_AWQOS(I_M_AXI_AWQOS),
    .I_M_AXI_AWUSER(I_M_AXI_AWUSER),
    .I_M_AXI_AWVALID(I_M_AXI_AWVALID),
    .I_M_AXI_AWREADY(I_M_AXI_AWREADY),
    .I_M_AXI_WDATA(I_M_AXI_WDATA),
    .I_M_AXI_WSTRB(I_M_AXI_WSTRB),
    .I_M_AXI_WLAST(I_M_AXI_WLAST),
    .I_M_AXI_WUSER(I_M_AXI_WUSER),
    .I_M_AXI_WVALID(I_M_AXI_WVALID),
    .I_M_AXI_WREADY(I_M_AXI_WREADY),
    .I_M_AXI_BID(I_M_AXI_BID),
    .I_M_AXI_BRESP(I_M_AXI_BRESP),
    .I_M_AXI_BUSER(I_M_AXI_BUSER),
    .I_M_AXI_BVALID(I_M_AXI_BVALID),
    .I_M_AXI_BREADY(I_M_AXI_BREADY),
    .I_M_AXI_ARID(I_M_AXI_ARID),
    .I_M_AXI_ARADDR(I_M_AXI_ARADDR),
    .I_M_AXI_ARLEN(I_M_AXI_ARLEN),
    .I_M_AXI_ARSIZE(I_M_AXI_ARSIZE),
    .I_M_AXI_ARBURST(I_M_AXI_ARBURST),
    .I_M_AXI_ARLOCK(I_M_AXI_ARLOCK),
    .I_M_AXI_ARCACHE(I_M_AXI_ARCACHE),
    .I_M_AXI_ARPROT(I_M_AXI_ARPROT),
    .I_M_AXI_ARQOS(I_M_AXI_ARQOS),
    .I_M_AXI_ARUSER(I_M_AXI_ARUSER),
    .I_M_AXI_ARVALID(I_M_AXI_ARVALID),
    .I_M_AXI_ARREADY(I_M_AXI_ARREADY),
    .I_M_AXI_RID(I_M_AXI_RID),
    .I_M_AXI_RDATA(I_M_AXI_RDATA),
    .I_M_AXI_RRESP(I_M_AXI_RRESP),
    .I_M_AXI_RLAST(I_M_AXI_RLAST),
    .I_M_AXI_RUSER(I_M_AXI_RUSER),
    .I_M_AXI_RVALID(I_M_AXI_RVALID),
    .I_M_AXI_RREADY(I_M_AXI_RREADY),
    .D_M_AXI_AWID(D_M_AXI_AWID),
    .D_M_AXI_AWADDR(D_M_AXI_AWADDR),
    .D_M_AXI_AWLEN(D_M_AXI_AWLEN),
    .D_M_AXI_AWSIZE(D_M_AXI_AWSIZE),
    .D_M_AXI_AWBURST(D_M_AXI_AWBURST),
    .D_M_AXI_AWLOCK(D_M_AXI_AWLOCK),
    .D_M_AXI_AWCACHE(D_M_AXI_AWCACHE),
    .D_M_AXI_AWPROT(D_M_AXI_AWPROT),
    .D_M_AXI_AWQOS(D_M_AXI_AWQOS),
    .D_M_AXI_AWUSER(D_M_AXI_AWUSER),
    .D_M_AXI_AWVALID(D_M_AXI_AWVALID),
    .D_M_AXI_AWREADY(D_M_AXI_AWREADY),
    .D_M_AXI_WDATA(D_M_AXI_WDATA),
    .D_M_AXI_WSTRB(D_M_AXI_WSTRB),
    .D_M_AXI_WLAST(D_M_AXI_WLAST),
    .D_M_AXI_WUSER(D_M_AXI_WUSER),
    .D_M_AXI_WVALID(D_M_AXI_WVALID),
    .D_M_AXI_WREADY(D_M_AXI_WREADY),
    .D_M_AXI_BID(D_M_AXI_BID),
    .D_M_AXI_BRESP(D_M_AXI_BRESP),
    .D_M_AXI_BUSER(D_M_AXI_BUSER),
    .D_M_AXI_BVALID(D_M_AXI_BVALID),
    .D_M_AXI_BREADY(D_M_AXI_BREADY),
    .D_M_AXI_ARID(D_M_AXI_ARID),
    .D_M_AXI_ARADDR(D_M_AXI_ARADDR),
    .D_M_AXI_ARLEN(D_M_AXI_ARLEN),
    .D_M_AXI_ARSIZE(D_M_AXI_ARSIZE),
    .D_M_AXI_ARBURST(D_M_AXI_ARBURST),
    .D_M_AXI_ARLOCK(D_M_AXI_ARLOCK),
    .D_M_AXI_ARCACHE(D_M_AXI_ARCACHE),
    .D_M_AXI_ARPROT(D_M_AXI_ARPROT),
    .D_M_AXI_ARQOS(D_M_AXI_ARQOS),
    .D_M_AXI_ARUSER(D_M_AXI_ARUSER),
    .D_M_AXI_ARVALID(D_M_AXI_ARVALID),
    .D_M_AXI_ARREADY(D_M_AXI_ARREADY),
    .D_M_AXI_RID(D_M_AXI_RID),
    .D_M_AXI_RDATA(D_M_AXI_RDATA),
    .D_M_AXI_RRESP(D_M_AXI_RRESP),
    .D_M_AXI_RLAST(D_M_AXI_RLAST),
    .D_M_AXI_RUSER(D_M_AXI_RUSER),
    .D_M_AXI_RVALID(D_M_AXI_RVALID),
    .D_M_AXI_RREADY(D_M_AXI_RREADY)
  );
endmodule
