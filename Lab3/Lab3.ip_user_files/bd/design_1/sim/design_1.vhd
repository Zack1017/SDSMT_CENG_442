--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
--Date        : Mon Oct  6 20:09:40 2025
--Host        : cenglab08 running 64-bit Ubuntu 24.04.3 LTS
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_O7FAN0 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC;
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awlock : out STD_LOGIC;
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rlast : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC;
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC;
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s00_couplers_imp_O7FAN0;

architecture STRUCTURE of s00_couplers_imp_O7FAN0 is
  signal \^m_axi_araddr\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^m_axi_arburst\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^m_axi_arcache\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^m_axi_arid\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^m_axi_arlen\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^m_axi_arlock\ : STD_LOGIC;
  signal \^m_axi_arprot\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^m_axi_arsize\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^m_axi_arvalid\ : STD_LOGIC;
  signal \^m_axi_awaddr\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^m_axi_awburst\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^m_axi_awcache\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^m_axi_awid\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^m_axi_awlen\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^m_axi_awlock\ : STD_LOGIC;
  signal \^m_axi_awprot\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^m_axi_awsize\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^m_axi_awvalid\ : STD_LOGIC;
  signal \^m_axi_bready\ : STD_LOGIC;
  signal \^m_axi_rready\ : STD_LOGIC;
  signal \^m_axi_wdata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^m_axi_wlast\ : STD_LOGIC;
  signal \^m_axi_wstrb\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^m_axi_wvalid\ : STD_LOGIC;
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_bid\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^s_axi_bvalid\ : STD_LOGIC;
  signal \^s_axi_rdata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s_axi_rid\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^s_axi_rlast\ : STD_LOGIC;
  signal \^s_axi_rresp\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^s_axi_rvalid\ : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= \^m_axi_araddr\(31 downto 0);
  M_AXI_arburst(1 downto 0) <= \^m_axi_arburst\(1 downto 0);
  M_AXI_arcache(3 downto 0) <= \^m_axi_arcache\(3 downto 0);
  M_AXI_arid(0) <= \^m_axi_arid\(0);
  M_AXI_arlen(7 downto 0) <= \^m_axi_arlen\(7 downto 0);
  M_AXI_arlock <= \^m_axi_arlock\;
  M_AXI_arprot(2 downto 0) <= \^m_axi_arprot\(2 downto 0);
  M_AXI_arsize(2 downto 0) <= \^m_axi_arsize\(2 downto 0);
  M_AXI_arvalid <= \^m_axi_arvalid\;
  M_AXI_awaddr(31 downto 0) <= \^m_axi_awaddr\(31 downto 0);
  M_AXI_awburst(1 downto 0) <= \^m_axi_awburst\(1 downto 0);
  M_AXI_awcache(3 downto 0) <= \^m_axi_awcache\(3 downto 0);
  M_AXI_awid(0) <= \^m_axi_awid\(0);
  M_AXI_awlen(7 downto 0) <= \^m_axi_awlen\(7 downto 0);
  M_AXI_awlock <= \^m_axi_awlock\;
  M_AXI_awprot(2 downto 0) <= \^m_axi_awprot\(2 downto 0);
  M_AXI_awsize(2 downto 0) <= \^m_axi_awsize\(2 downto 0);
  M_AXI_awvalid <= \^m_axi_awvalid\;
  M_AXI_bready <= \^m_axi_bready\;
  M_AXI_rready <= \^m_axi_rready\;
  M_AXI_wdata(31 downto 0) <= \^m_axi_wdata\(31 downto 0);
  M_AXI_wlast <= \^m_axi_wlast\;
  M_AXI_wstrb(3 downto 0) <= \^m_axi_wstrb\(3 downto 0);
  M_AXI_wvalid <= \^m_axi_wvalid\;
  S_AXI_arready <= \^s_axi_arready\;
  S_AXI_awready <= \^s_axi_awready\;
  S_AXI_bid(0) <= \^s_axi_bid\(0);
  S_AXI_bresp(1 downto 0) <= \^s_axi_bresp\(1 downto 0);
  S_AXI_bvalid <= \^s_axi_bvalid\;
  S_AXI_rdata(31 downto 0) <= \^s_axi_rdata\(31 downto 0);
  S_AXI_rid(0) <= \^s_axi_rid\(0);
  S_AXI_rlast <= \^s_axi_rlast\;
  S_AXI_rresp(1 downto 0) <= \^s_axi_rresp\(1 downto 0);
  S_AXI_rvalid <= \^s_axi_rvalid\;
  S_AXI_wready <= \^s_axi_wready\;
  \^m_axi_araddr\(31 downto 0) <= S_AXI_araddr(31 downto 0);
  \^m_axi_arburst\(1 downto 0) <= S_AXI_arburst(1 downto 0);
  \^m_axi_arcache\(3 downto 0) <= S_AXI_arcache(3 downto 0);
  \^m_axi_arid\(0) <= S_AXI_arid(0);
  \^m_axi_arlen\(7 downto 0) <= S_AXI_arlen(7 downto 0);
  \^m_axi_arlock\ <= S_AXI_arlock;
  \^m_axi_arprot\(2 downto 0) <= S_AXI_arprot(2 downto 0);
  \^m_axi_arsize\(2 downto 0) <= S_AXI_arsize(2 downto 0);
  \^m_axi_arvalid\ <= S_AXI_arvalid;
  \^m_axi_awaddr\(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  \^m_axi_awburst\(1 downto 0) <= S_AXI_awburst(1 downto 0);
  \^m_axi_awcache\(3 downto 0) <= S_AXI_awcache(3 downto 0);
  \^m_axi_awid\(0) <= S_AXI_awid(0);
  \^m_axi_awlen\(7 downto 0) <= S_AXI_awlen(7 downto 0);
  \^m_axi_awlock\ <= S_AXI_awlock;
  \^m_axi_awprot\(2 downto 0) <= S_AXI_awprot(2 downto 0);
  \^m_axi_awsize\(2 downto 0) <= S_AXI_awsize(2 downto 0);
  \^m_axi_awvalid\ <= S_AXI_awvalid;
  \^m_axi_bready\ <= S_AXI_bready;
  \^m_axi_rready\ <= S_AXI_rready;
  \^m_axi_wdata\(31 downto 0) <= S_AXI_wdata(31 downto 0);
  \^m_axi_wlast\ <= S_AXI_wlast;
  \^m_axi_wstrb\(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  \^m_axi_wvalid\ <= S_AXI_wvalid;
  \^s_axi_arready\ <= M_AXI_arready;
  \^s_axi_awready\ <= M_AXI_awready;
  \^s_axi_bid\(0) <= M_AXI_bid(0);
  \^s_axi_bresp\(1 downto 0) <= M_AXI_bresp(1 downto 0);
  \^s_axi_bvalid\ <= M_AXI_bvalid;
  \^s_axi_rdata\(31 downto 0) <= M_AXI_rdata(31 downto 0);
  \^s_axi_rid\(0) <= M_AXI_rid(0);
  \^s_axi_rlast\ <= M_AXI_rlast;
  \^s_axi_rresp\(1 downto 0) <= M_AXI_rresp(1 downto 0);
  \^s_axi_rvalid\ <= M_AXI_rvalid;
  \^s_axi_wready\ <= M_AXI_wready;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_interconnect_0_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_arlock : out STD_LOGIC;
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_awlock : out STD_LOGIC;
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_rlast : in STD_LOGIC;
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wlast : out STD_LOGIC;
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_arlock : in STD_LOGIC;
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_awlock : in STD_LOGIC;
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC
  );
end design_1_axi_interconnect_0_0;

architecture STRUCTURE of design_1_axi_interconnect_0_0 is
begin
s00_couplers: entity work.s00_couplers_imp_O7FAN0
     port map (
      M_ACLK => M00_ACLK,
      M_ARESETN => M00_ARESETN,
      M_AXI_araddr(31 downto 0) => M00_AXI_araddr(31 downto 0),
      M_AXI_arburst(1 downto 0) => M00_AXI_arburst(1 downto 0),
      M_AXI_arcache(3 downto 0) => M00_AXI_arcache(3 downto 0),
      M_AXI_arid(0) => M00_AXI_arid(0),
      M_AXI_arlen(7 downto 0) => M00_AXI_arlen(7 downto 0),
      M_AXI_arlock => M00_AXI_arlock,
      M_AXI_arprot(2 downto 0) => M00_AXI_arprot(2 downto 0),
      M_AXI_arready => M00_AXI_arready,
      M_AXI_arsize(2 downto 0) => M00_AXI_arsize(2 downto 0),
      M_AXI_arvalid => M00_AXI_arvalid,
      M_AXI_awaddr(31 downto 0) => M00_AXI_awaddr(31 downto 0),
      M_AXI_awburst(1 downto 0) => M00_AXI_awburst(1 downto 0),
      M_AXI_awcache(3 downto 0) => M00_AXI_awcache(3 downto 0),
      M_AXI_awid(0) => M00_AXI_awid(0),
      M_AXI_awlen(7 downto 0) => M00_AXI_awlen(7 downto 0),
      M_AXI_awlock => M00_AXI_awlock,
      M_AXI_awprot(2 downto 0) => M00_AXI_awprot(2 downto 0),
      M_AXI_awready => M00_AXI_awready,
      M_AXI_awsize(2 downto 0) => M00_AXI_awsize(2 downto 0),
      M_AXI_awvalid => M00_AXI_awvalid,
      M_AXI_bid(0) => M00_AXI_bid(0),
      M_AXI_bready => M00_AXI_bready,
      M_AXI_bresp(1 downto 0) => M00_AXI_bresp(1 downto 0),
      M_AXI_bvalid => M00_AXI_bvalid,
      M_AXI_rdata(31 downto 0) => M00_AXI_rdata(31 downto 0),
      M_AXI_rid(0) => M00_AXI_rid(0),
      M_AXI_rlast => M00_AXI_rlast,
      M_AXI_rready => M00_AXI_rready,
      M_AXI_rresp(1 downto 0) => M00_AXI_rresp(1 downto 0),
      M_AXI_rvalid => M00_AXI_rvalid,
      M_AXI_wdata(31 downto 0) => M00_AXI_wdata(31 downto 0),
      M_AXI_wlast => M00_AXI_wlast,
      M_AXI_wready => M00_AXI_wready,
      M_AXI_wstrb(3 downto 0) => M00_AXI_wstrb(3 downto 0),
      M_AXI_wvalid => M00_AXI_wvalid,
      S_ACLK => S00_ACLK,
      S_ARESETN => S00_ARESETN,
      S_AXI_araddr(31 downto 0) => S00_AXI_araddr(31 downto 0),
      S_AXI_arburst(1 downto 0) => S00_AXI_arburst(1 downto 0),
      S_AXI_arcache(3 downto 0) => S00_AXI_arcache(3 downto 0),
      S_AXI_arid(0) => S00_AXI_arid(0),
      S_AXI_arlen(7 downto 0) => S00_AXI_arlen(7 downto 0),
      S_AXI_arlock => S00_AXI_arlock,
      S_AXI_arprot(2 downto 0) => S00_AXI_arprot(2 downto 0),
      S_AXI_arready => S00_AXI_arready,
      S_AXI_arsize(2 downto 0) => S00_AXI_arsize(2 downto 0),
      S_AXI_arvalid => S00_AXI_arvalid,
      S_AXI_awaddr(31 downto 0) => S00_AXI_awaddr(31 downto 0),
      S_AXI_awburst(1 downto 0) => S00_AXI_awburst(1 downto 0),
      S_AXI_awcache(3 downto 0) => S00_AXI_awcache(3 downto 0),
      S_AXI_awid(0) => S00_AXI_awid(0),
      S_AXI_awlen(7 downto 0) => S00_AXI_awlen(7 downto 0),
      S_AXI_awlock => S00_AXI_awlock,
      S_AXI_awprot(2 downto 0) => S00_AXI_awprot(2 downto 0),
      S_AXI_awready => S00_AXI_awready,
      S_AXI_awsize(2 downto 0) => S00_AXI_awsize(2 downto 0),
      S_AXI_awvalid => S00_AXI_awvalid,
      S_AXI_bid(0) => S00_AXI_bid(0),
      S_AXI_bready => S00_AXI_bready,
      S_AXI_bresp(1 downto 0) => S00_AXI_bresp(1 downto 0),
      S_AXI_bvalid => S00_AXI_bvalid,
      S_AXI_rdata(31 downto 0) => S00_AXI_rdata(31 downto 0),
      S_AXI_rid(0) => S00_AXI_rid(0),
      S_AXI_rlast => S00_AXI_rlast,
      S_AXI_rready => S00_AXI_rready,
      S_AXI_rresp(1 downto 0) => S00_AXI_rresp(1 downto 0),
      S_AXI_rvalid => S00_AXI_rvalid,
      S_AXI_wdata(31 downto 0) => S00_AXI_wdata(31 downto 0),
      S_AXI_wlast => S00_AXI_wlast,
      S_AXI_wready => S00_AXI_wready,
      S_AXI_wstrb(3 downto 0) => S00_AXI_wstrb(3 downto 0),
      S_AXI_wvalid => S00_AXI_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    Error : out STD_LOGIC;
    Read_Data : out STD_LOGIC_VECTOR ( 0 to 31 );
    Read_Done : out STD_LOGIC;
    Read_address : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Start_read : in STD_LOGIC;
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=9,numReposBlks=7,numNonXlnxBlks=0,numHierBlks=2,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=1,da_board_cnt=3,da_bram_cntlr_cnt=1,da_clkrst_cnt=2,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_entity_name_0_0 is
  port (
    Start_read : in STD_LOGIC;
    Read_address : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Read_Done : out STD_LOGIC;
    Read_Data : out STD_LOGIC_VECTOR ( 0 to 31 );
    Error : out STD_LOGIC;
    M_AXI_ACLK : in STD_LOGIC;
    M_AXI_ARESETN : in STD_LOGIC;
    M_AXI_AWID : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_AWLOCK : out STD_LOGIC;
    M_AXI_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_AWUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_AWVALID : out STD_LOGIC;
    M_AXI_AWREADY : in STD_LOGIC;
    M_AXI_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_WLAST : out STD_LOGIC;
    M_AXI_WUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_WVALID : out STD_LOGIC;
    M_AXI_WREADY : in STD_LOGIC;
    M_AXI_BID : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_BUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_BVALID : in STD_LOGIC;
    M_AXI_BREADY : out STD_LOGIC;
    M_AXI_ARID : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_ARLOCK : out STD_LOGIC;
    M_AXI_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_ARUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_ARVALID : out STD_LOGIC;
    M_AXI_ARREADY : in STD_LOGIC;
    M_AXI_RID : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_RLAST : in STD_LOGIC;
    M_AXI_RUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_RVALID : in STD_LOGIC;
    M_AXI_RREADY : out STD_LOGIC
  );
  end component design_1_entity_name_0_0;
  component design_1_clk_wiz_0 is
  port (
    resetn : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component design_1_clk_wiz_0;
  component design_1_rst_clk_wiz_100M_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_rst_clk_wiz_100M_0;
  component design_1_axi_bram_ctrl_0_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC;
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC;
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    bram_rst_a : out STD_LOGIC;
    bram_clk_a : out STD_LOGIC;
    bram_en_a : out STD_LOGIC;
    bram_we_a : out STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_addr_a : out STD_LOGIC_VECTOR ( 12 downto 0 );
    bram_wrdata_a : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_rddata_a : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axi_bram_ctrl_0_0;
  component design_1_axi_bram_ctrl_0_bram_0 is
  port (
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 31 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rsta_busy : out STD_LOGIC
  );
  end component design_1_axi_bram_ctrl_0_bram_0;
  signal axi_bram_ctrl_0_BRAM_PORTA_ADDR : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal axi_bram_ctrl_0_BRAM_PORTA_CLK : STD_LOGIC;
  signal axi_bram_ctrl_0_BRAM_PORTA_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_bram_ctrl_0_BRAM_PORTA_EN : STD_LOGIC;
  signal axi_bram_ctrl_0_BRAM_PORTA_RST : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M00_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARLOCK : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M00_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWLOCK : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M00_AXI_BREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_BVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M00_AXI_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M00_AXI_RLAST : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_RREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_RVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M00_AXI_WLAST : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_WREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_WVALID : STD_LOGIC;
  signal clk_wiz_clk_out1 : STD_LOGIC;
  signal clk_wiz_locked : STD_LOGIC;
  signal entity_name_0_M_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal entity_name_0_M_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal entity_name_0_M_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal entity_name_0_M_AXI_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal entity_name_0_M_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal entity_name_0_M_AXI_ARLOCK : STD_LOGIC;
  signal entity_name_0_M_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal entity_name_0_M_AXI_ARREADY : STD_LOGIC;
  signal entity_name_0_M_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal entity_name_0_M_AXI_ARVALID : STD_LOGIC;
  signal entity_name_0_M_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal entity_name_0_M_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal entity_name_0_M_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal entity_name_0_M_AXI_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal entity_name_0_M_AXI_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal entity_name_0_M_AXI_AWLOCK : STD_LOGIC;
  signal entity_name_0_M_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal entity_name_0_M_AXI_AWREADY : STD_LOGIC;
  signal entity_name_0_M_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal entity_name_0_M_AXI_AWVALID : STD_LOGIC;
  signal entity_name_0_M_AXI_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal entity_name_0_M_AXI_BREADY : STD_LOGIC;
  signal entity_name_0_M_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal entity_name_0_M_AXI_BVALID : STD_LOGIC;
  signal entity_name_0_M_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal entity_name_0_M_AXI_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal entity_name_0_M_AXI_RLAST : STD_LOGIC;
  signal entity_name_0_M_AXI_RREADY : STD_LOGIC;
  signal entity_name_0_M_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal entity_name_0_M_AXI_RVALID : STD_LOGIC;
  signal entity_name_0_M_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal entity_name_0_M_AXI_WLAST : STD_LOGIC;
  signal entity_name_0_M_AXI_WREADY : STD_LOGIC;
  signal entity_name_0_M_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal entity_name_0_M_AXI_WVALID : STD_LOGIC;
  signal ilconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ilconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rst_clk_wiz_100M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_bram_ctrl_0_bram_we_a_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_axi_bram_ctrl_0_bram_wrdata_a_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axi_bram_ctrl_0_bram_rsta_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_entity_name_0_M_AXI_ARQOS_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_entity_name_0_M_AXI_ARUSER_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_entity_name_0_M_AXI_AWQOS_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_entity_name_0_M_AXI_AWUSER_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_entity_name_0_M_AXI_WUSER_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_clk_wiz_100M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_clk_wiz_100M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_clk_wiz_100M_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_clk_wiz_100M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 RST.RESET RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of sys_clock : signal is "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK";
  attribute X_INTERFACE_PARAMETER of sys_clock : signal is "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN design_1_sys_clock, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
axi_bram_ctrl_0: component design_1_axi_bram_ctrl_0_0
     port map (
      bram_addr_a(12 downto 0) => axi_bram_ctrl_0_BRAM_PORTA_ADDR(12 downto 0),
      bram_clk_a => axi_bram_ctrl_0_BRAM_PORTA_CLK,
      bram_en_a => axi_bram_ctrl_0_BRAM_PORTA_EN,
      bram_rddata_a(31 downto 0) => axi_bram_ctrl_0_BRAM_PORTA_DOUT(31 downto 0),
      bram_rst_a => axi_bram_ctrl_0_BRAM_PORTA_RST,
      bram_we_a(3 downto 0) => NLW_axi_bram_ctrl_0_bram_we_a_UNCONNECTED(3 downto 0),
      bram_wrdata_a(31 downto 0) => NLW_axi_bram_ctrl_0_bram_wrdata_a_UNCONNECTED(31 downto 0),
      s_axi_aclk => clk_wiz_clk_out1,
      s_axi_araddr(12 downto 0) => axi_interconnect_0_M00_AXI_ARADDR(12 downto 0),
      s_axi_arburst(1 downto 0) => axi_interconnect_0_M00_AXI_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => axi_interconnect_0_M00_AXI_ARCACHE(3 downto 0),
      s_axi_aresetn => rst_clk_wiz_100M_peripheral_aresetn(0),
      s_axi_arid(0) => axi_interconnect_0_M00_AXI_ARID(0),
      s_axi_arlen(7 downto 0) => axi_interconnect_0_M00_AXI_ARLEN(7 downto 0),
      s_axi_arlock => axi_interconnect_0_M00_AXI_ARLOCK,
      s_axi_arprot(2 downto 0) => axi_interconnect_0_M00_AXI_ARPROT(2 downto 0),
      s_axi_arready => axi_interconnect_0_M00_AXI_ARREADY,
      s_axi_arsize(2 downto 0) => axi_interconnect_0_M00_AXI_ARSIZE(2 downto 0),
      s_axi_arvalid => axi_interconnect_0_M00_AXI_ARVALID,
      s_axi_awaddr(12 downto 0) => axi_interconnect_0_M00_AXI_AWADDR(12 downto 0),
      s_axi_awburst(1 downto 0) => axi_interconnect_0_M00_AXI_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => axi_interconnect_0_M00_AXI_AWCACHE(3 downto 0),
      s_axi_awid(0) => axi_interconnect_0_M00_AXI_AWID(0),
      s_axi_awlen(7 downto 0) => axi_interconnect_0_M00_AXI_AWLEN(7 downto 0),
      s_axi_awlock => axi_interconnect_0_M00_AXI_AWLOCK,
      s_axi_awprot(2 downto 0) => axi_interconnect_0_M00_AXI_AWPROT(2 downto 0),
      s_axi_awready => axi_interconnect_0_M00_AXI_AWREADY,
      s_axi_awsize(2 downto 0) => axi_interconnect_0_M00_AXI_AWSIZE(2 downto 0),
      s_axi_awvalid => axi_interconnect_0_M00_AXI_AWVALID,
      s_axi_bid(0) => axi_interconnect_0_M00_AXI_BID(0),
      s_axi_bready => axi_interconnect_0_M00_AXI_BREADY,
      s_axi_bresp(1 downto 0) => axi_interconnect_0_M00_AXI_BRESP(1 downto 0),
      s_axi_bvalid => axi_interconnect_0_M00_AXI_BVALID,
      s_axi_rdata(31 downto 0) => axi_interconnect_0_M00_AXI_RDATA(31 downto 0),
      s_axi_rid(0) => axi_interconnect_0_M00_AXI_RID(0),
      s_axi_rlast => axi_interconnect_0_M00_AXI_RLAST,
      s_axi_rready => axi_interconnect_0_M00_AXI_RREADY,
      s_axi_rresp(1 downto 0) => axi_interconnect_0_M00_AXI_RRESP(1 downto 0),
      s_axi_rvalid => axi_interconnect_0_M00_AXI_RVALID,
      s_axi_wdata(31 downto 0) => axi_interconnect_0_M00_AXI_WDATA(31 downto 0),
      s_axi_wlast => axi_interconnect_0_M00_AXI_WLAST,
      s_axi_wready => axi_interconnect_0_M00_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => axi_interconnect_0_M00_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => axi_interconnect_0_M00_AXI_WVALID
    );
axi_bram_ctrl_0_bram: component design_1_axi_bram_ctrl_0_bram_0
     port map (
      addra(31 downto 13) => B"0000000000000000000",
      addra(12 downto 0) => axi_bram_ctrl_0_BRAM_PORTA_ADDR(12 downto 0),
      clka => axi_bram_ctrl_0_BRAM_PORTA_CLK,
      douta(31 downto 0) => axi_bram_ctrl_0_BRAM_PORTA_DOUT(31 downto 0),
      ena => axi_bram_ctrl_0_BRAM_PORTA_EN,
      rsta => axi_bram_ctrl_0_BRAM_PORTA_RST,
      rsta_busy => NLW_axi_bram_ctrl_0_bram_rsta_busy_UNCONNECTED
    );
axi_interconnect_0: entity work.design_1_axi_interconnect_0_0
     port map (
      ACLK => clk_wiz_clk_out1,
      ARESETN => rst_clk_wiz_100M_peripheral_aresetn(0),
      M00_ACLK => clk_wiz_clk_out1,
      M00_ARESETN => rst_clk_wiz_100M_peripheral_aresetn(0),
      M00_AXI_araddr(31 downto 0) => axi_interconnect_0_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arburst(1 downto 0) => axi_interconnect_0_M00_AXI_ARBURST(1 downto 0),
      M00_AXI_arcache(3 downto 0) => axi_interconnect_0_M00_AXI_ARCACHE(3 downto 0),
      M00_AXI_arid(0) => axi_interconnect_0_M00_AXI_ARID(0),
      M00_AXI_arlen(7 downto 0) => axi_interconnect_0_M00_AXI_ARLEN(7 downto 0),
      M00_AXI_arlock => axi_interconnect_0_M00_AXI_ARLOCK,
      M00_AXI_arprot(2 downto 0) => axi_interconnect_0_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arready => axi_interconnect_0_M00_AXI_ARREADY,
      M00_AXI_arsize(2 downto 0) => axi_interconnect_0_M00_AXI_ARSIZE(2 downto 0),
      M00_AXI_arvalid => axi_interconnect_0_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => axi_interconnect_0_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awburst(1 downto 0) => axi_interconnect_0_M00_AXI_AWBURST(1 downto 0),
      M00_AXI_awcache(3 downto 0) => axi_interconnect_0_M00_AXI_AWCACHE(3 downto 0),
      M00_AXI_awid(0) => axi_interconnect_0_M00_AXI_AWID(0),
      M00_AXI_awlen(7 downto 0) => axi_interconnect_0_M00_AXI_AWLEN(7 downto 0),
      M00_AXI_awlock => axi_interconnect_0_M00_AXI_AWLOCK,
      M00_AXI_awprot(2 downto 0) => axi_interconnect_0_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awready => axi_interconnect_0_M00_AXI_AWREADY,
      M00_AXI_awsize(2 downto 0) => axi_interconnect_0_M00_AXI_AWSIZE(2 downto 0),
      M00_AXI_awvalid => axi_interconnect_0_M00_AXI_AWVALID,
      M00_AXI_bid(0) => axi_interconnect_0_M00_AXI_BID(0),
      M00_AXI_bready => axi_interconnect_0_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => axi_interconnect_0_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => axi_interconnect_0_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => axi_interconnect_0_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rid(0) => axi_interconnect_0_M00_AXI_RID(0),
      M00_AXI_rlast => axi_interconnect_0_M00_AXI_RLAST,
      M00_AXI_rready => axi_interconnect_0_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => axi_interconnect_0_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => axi_interconnect_0_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => axi_interconnect_0_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wlast => axi_interconnect_0_M00_AXI_WLAST,
      M00_AXI_wready => axi_interconnect_0_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => axi_interconnect_0_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid => axi_interconnect_0_M00_AXI_WVALID,
      S00_ACLK => clk_wiz_clk_out1,
      S00_ARESETN => rst_clk_wiz_100M_peripheral_aresetn(0),
      S00_AXI_araddr(31 downto 0) => entity_name_0_M_AXI_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => entity_name_0_M_AXI_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => entity_name_0_M_AXI_ARCACHE(3 downto 0),
      S00_AXI_arid(0) => entity_name_0_M_AXI_ARID(0),
      S00_AXI_arlen(7 downto 0) => entity_name_0_M_AXI_ARLEN(7 downto 0),
      S00_AXI_arlock => entity_name_0_M_AXI_ARLOCK,
      S00_AXI_arprot(2 downto 0) => entity_name_0_M_AXI_ARPROT(2 downto 0),
      S00_AXI_arready => entity_name_0_M_AXI_ARREADY,
      S00_AXI_arsize(2 downto 0) => entity_name_0_M_AXI_ARSIZE(2 downto 0),
      S00_AXI_arvalid => entity_name_0_M_AXI_ARVALID,
      S00_AXI_awaddr(31 downto 0) => entity_name_0_M_AXI_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => entity_name_0_M_AXI_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => entity_name_0_M_AXI_AWCACHE(3 downto 0),
      S00_AXI_awid(0) => entity_name_0_M_AXI_AWID(0),
      S00_AXI_awlen(7 downto 0) => entity_name_0_M_AXI_AWLEN(7 downto 0),
      S00_AXI_awlock => entity_name_0_M_AXI_AWLOCK,
      S00_AXI_awprot(2 downto 0) => entity_name_0_M_AXI_AWPROT(2 downto 0),
      S00_AXI_awready => entity_name_0_M_AXI_AWREADY,
      S00_AXI_awsize(2 downto 0) => entity_name_0_M_AXI_AWSIZE(2 downto 0),
      S00_AXI_awvalid => entity_name_0_M_AXI_AWVALID,
      S00_AXI_bid(0) => entity_name_0_M_AXI_BID(0),
      S00_AXI_bready => entity_name_0_M_AXI_BREADY,
      S00_AXI_bresp(1 downto 0) => entity_name_0_M_AXI_BRESP(1 downto 0),
      S00_AXI_bvalid => entity_name_0_M_AXI_BVALID,
      S00_AXI_rdata(31 downto 0) => entity_name_0_M_AXI_RDATA(31 downto 0),
      S00_AXI_rid(0) => entity_name_0_M_AXI_RID(0),
      S00_AXI_rlast => entity_name_0_M_AXI_RLAST,
      S00_AXI_rready => entity_name_0_M_AXI_RREADY,
      S00_AXI_rresp(1 downto 0) => entity_name_0_M_AXI_RRESP(1 downto 0),
      S00_AXI_rvalid => entity_name_0_M_AXI_RVALID,
      S00_AXI_wdata(31 downto 0) => entity_name_0_M_AXI_WDATA(31 downto 0),
      S00_AXI_wlast => entity_name_0_M_AXI_WLAST,
      S00_AXI_wready => entity_name_0_M_AXI_WREADY,
      S00_AXI_wstrb(3 downto 0) => entity_name_0_M_AXI_WSTRB(3 downto 0),
      S00_AXI_wvalid => entity_name_0_M_AXI_WVALID
    );
clk_wiz: component design_1_clk_wiz_0
     port map (
      clk_in1 => sys_clock,
      clk_out1 => clk_wiz_clk_out1,
      locked => clk_wiz_locked,
      resetn => reset
    );
entity_name_0: component design_1_entity_name_0_0
     port map (
      Error => Error,
      M_AXI_ACLK => clk_wiz_clk_out1,
      M_AXI_ARADDR(31 downto 0) => entity_name_0_M_AXI_ARADDR(31 downto 0),
      M_AXI_ARBURST(1 downto 0) => entity_name_0_M_AXI_ARBURST(1 downto 0),
      M_AXI_ARCACHE(3 downto 0) => entity_name_0_M_AXI_ARCACHE(3 downto 0),
      M_AXI_ARESETN => rst_clk_wiz_100M_peripheral_aresetn(0),
      M_AXI_ARID(0) => entity_name_0_M_AXI_ARID(0),
      M_AXI_ARLEN(7 downto 0) => entity_name_0_M_AXI_ARLEN(7 downto 0),
      M_AXI_ARLOCK => entity_name_0_M_AXI_ARLOCK,
      M_AXI_ARPROT(2 downto 0) => entity_name_0_M_AXI_ARPROT(2 downto 0),
      M_AXI_ARQOS(3 downto 0) => NLW_entity_name_0_M_AXI_ARQOS_UNCONNECTED(3 downto 0),
      M_AXI_ARREADY => entity_name_0_M_AXI_ARREADY,
      M_AXI_ARSIZE(2 downto 0) => entity_name_0_M_AXI_ARSIZE(2 downto 0),
      M_AXI_ARUSER(0) => NLW_entity_name_0_M_AXI_ARUSER_UNCONNECTED(0),
      M_AXI_ARVALID => entity_name_0_M_AXI_ARVALID,
      M_AXI_AWADDR(31 downto 0) => entity_name_0_M_AXI_AWADDR(31 downto 0),
      M_AXI_AWBURST(1 downto 0) => entity_name_0_M_AXI_AWBURST(1 downto 0),
      M_AXI_AWCACHE(3 downto 0) => entity_name_0_M_AXI_AWCACHE(3 downto 0),
      M_AXI_AWID(0) => entity_name_0_M_AXI_AWID(0),
      M_AXI_AWLEN(7 downto 0) => entity_name_0_M_AXI_AWLEN(7 downto 0),
      M_AXI_AWLOCK => entity_name_0_M_AXI_AWLOCK,
      M_AXI_AWPROT(2 downto 0) => entity_name_0_M_AXI_AWPROT(2 downto 0),
      M_AXI_AWQOS(3 downto 0) => NLW_entity_name_0_M_AXI_AWQOS_UNCONNECTED(3 downto 0),
      M_AXI_AWREADY => entity_name_0_M_AXI_AWREADY,
      M_AXI_AWSIZE(2 downto 0) => entity_name_0_M_AXI_AWSIZE(2 downto 0),
      M_AXI_AWUSER(0) => NLW_entity_name_0_M_AXI_AWUSER_UNCONNECTED(0),
      M_AXI_AWVALID => entity_name_0_M_AXI_AWVALID,
      M_AXI_BID(0) => entity_name_0_M_AXI_BID(0),
      M_AXI_BREADY => entity_name_0_M_AXI_BREADY,
      M_AXI_BRESP(1 downto 0) => entity_name_0_M_AXI_BRESP(1 downto 0),
      M_AXI_BUSER(0) => '0',
      M_AXI_BVALID => entity_name_0_M_AXI_BVALID,
      M_AXI_RDATA(31 downto 0) => entity_name_0_M_AXI_RDATA(31 downto 0),
      M_AXI_RID(0) => entity_name_0_M_AXI_RID(0),
      M_AXI_RLAST => entity_name_0_M_AXI_RLAST,
      M_AXI_RREADY => entity_name_0_M_AXI_RREADY,
      M_AXI_RRESP(1 downto 0) => entity_name_0_M_AXI_RRESP(1 downto 0),
      M_AXI_RUSER(0) => '0',
      M_AXI_RVALID => entity_name_0_M_AXI_RVALID,
      M_AXI_WDATA(31 downto 0) => entity_name_0_M_AXI_WDATA(31 downto 0),
      M_AXI_WLAST => entity_name_0_M_AXI_WLAST,
      M_AXI_WREADY => entity_name_0_M_AXI_WREADY,
      M_AXI_WSTRB(3 downto 0) => entity_name_0_M_AXI_WSTRB(3 downto 0),
      M_AXI_WUSER(0) => NLW_entity_name_0_M_AXI_WUSER_UNCONNECTED(0),
      M_AXI_WVALID => entity_name_0_M_AXI_WVALID,
      Read_Data(0 to 31) => Read_Data(0 to 31),
      Read_Done => Read_Done,
      Read_address(31 downto 0) => Read_address(31 downto 0),
      Start_read => Start_read
    );
  ilconstant_0_dout <= B"0";
  ilconstant_1_dout <= B"1";
rst_clk_wiz_100M: component design_1_rst_clk_wiz_100M_0
     port map (
      aux_reset_in => ilconstant_1_dout(0),
      bus_struct_reset(0) => NLW_rst_clk_wiz_100M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => clk_wiz_locked,
      ext_reset_in => reset,
      interconnect_aresetn(0) => NLW_rst_clk_wiz_100M_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => ilconstant_0_dout(0),
      mb_reset => NLW_rst_clk_wiz_100M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_clk_wiz_100M_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_rst_clk_wiz_100M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => clk_wiz_clk_out1
    );
end STRUCTURE;
