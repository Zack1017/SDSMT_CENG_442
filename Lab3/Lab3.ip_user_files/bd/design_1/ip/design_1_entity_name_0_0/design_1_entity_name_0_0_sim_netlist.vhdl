-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Mon Oct  6 20:10:11 2025
-- Host        : cenglab08 running 64-bit Ubuntu 24.04.3 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/student/s101113328/CENG442/Lab3/Lab3.gen/sources_1/bd/design_1/ip/design_1_entity_name_0_0/design_1_entity_name_0_0_sim_netlist.vhdl
-- Design      : design_1_entity_name_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_entity_name_0_0 is
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_entity_name_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_entity_name_0_0 : entity is "design_1_entity_name_0_0,entity_name,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_entity_name_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of design_1_entity_name_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of design_1_entity_name_0_0 : entity is "entity_name,Vivado 2025.1";
end design_1_entity_name_0_0;

architecture STRUCTURE of design_1_entity_name_0_0 is
  component design_1_entity_name_0_0_entity_name is
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
    M_AXI_AWVALID : out STD_LOGIC;
    M_AXI_AWREADY : in STD_LOGIC;
    M_AXI_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_WLAST : out STD_LOGIC;
    M_AXI_WVALID : out STD_LOGIC;
    M_AXI_WREADY : in STD_LOGIC;
    M_AXI_BID : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
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
    M_AXI_ARVALID : out STD_LOGIC;
    M_AXI_ARREADY : in STD_LOGIC;
    M_AXI_RID : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_RLAST : in STD_LOGIC;
    M_AXI_RVALID : in STD_LOGIC;
    M_AXI_RREADY : out STD_LOGIC
  );
  end component design_1_entity_name_0_0_entity_name;
  signal \<const0>\ : STD_LOGIC;
  attribute C_M_AXI_ADDR_WIDTH : integer;
  attribute C_M_AXI_ADDR_WIDTH of U0 : label is 32;
  attribute C_M_AXI_ARUSER_WIDTH : integer;
  attribute C_M_AXI_ARUSER_WIDTH of U0 : label is 0;
  attribute C_M_AXI_AWUSER_WIDTH : integer;
  attribute C_M_AXI_AWUSER_WIDTH of U0 : label is 0;
  attribute C_M_AXI_BURST_LEN : integer;
  attribute C_M_AXI_BURST_LEN of U0 : label is 1;
  attribute C_M_AXI_BUSER_WIDTH : integer;
  attribute C_M_AXI_BUSER_WIDTH of U0 : label is 0;
  attribute C_M_AXI_DATA_WIDTH : integer;
  attribute C_M_AXI_DATA_WIDTH of U0 : label is 32;
  attribute C_M_AXI_ID_WIDTH : integer;
  attribute C_M_AXI_ID_WIDTH of U0 : label is 1;
  attribute C_M_AXI_RUSER_WIDTH : integer;
  attribute C_M_AXI_RUSER_WIDTH of U0 : label is 0;
  attribute C_M_AXI_WUSER_WIDTH : integer;
  attribute C_M_AXI_WUSER_WIDTH of U0 : label is 0;
  attribute C_M_TARGET_SLAVE_BASE_ADDR : string;
  attribute C_M_TARGET_SLAVE_BASE_ADDR of U0 : label is "32'b00000000000000000000000000000000";
  attribute x_interface_info : string;
  attribute x_interface_info of M_AXI_ACLK : signal is "xilinx.com:signal:clock:1.0 M_AXI_ACLK CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of M_AXI_ACLK : signal is "slave M_AXI_ACLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of M_AXI_ACLK : signal is "XIL_INTERFACENAME M_AXI_ACLK, ASSOCIATED_BUSIF M_AXI, ASSOCIATED_RESET M_AXI_ARESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0";
  attribute x_interface_info of M_AXI_ARESETN : signal is "xilinx.com:signal:reset:1.0 M_AXI_ARESETN RST";
  attribute x_interface_mode of M_AXI_ARESETN : signal is "slave M_AXI_ARESETN";
  attribute x_interface_parameter of M_AXI_ARESETN : signal is "XIL_INTERFACENAME M_AXI_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of M_AXI_ARLOCK : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARLOCK";
  attribute x_interface_info of M_AXI_ARREADY : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARREADY";
  attribute x_interface_info of M_AXI_ARVALID : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARVALID";
  attribute x_interface_info of M_AXI_AWLOCK : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWLOCK";
  attribute x_interface_info of M_AXI_AWREADY : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWREADY";
  attribute x_interface_info of M_AXI_AWVALID : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWVALID";
  attribute x_interface_info of M_AXI_BREADY : signal is "xilinx.com:interface:aximm:1.0 M_AXI BREADY";
  attribute x_interface_info of M_AXI_BVALID : signal is "xilinx.com:interface:aximm:1.0 M_AXI BVALID";
  attribute x_interface_info of M_AXI_RLAST : signal is "xilinx.com:interface:aximm:1.0 M_AXI RLAST";
  attribute x_interface_info of M_AXI_RREADY : signal is "xilinx.com:interface:aximm:1.0 M_AXI RREADY";
  attribute x_interface_info of M_AXI_RVALID : signal is "xilinx.com:interface:aximm:1.0 M_AXI RVALID";
  attribute x_interface_info of M_AXI_WLAST : signal is "xilinx.com:interface:aximm:1.0 M_AXI WLAST";
  attribute x_interface_info of M_AXI_WREADY : signal is "xilinx.com:interface:aximm:1.0 M_AXI WREADY";
  attribute x_interface_info of M_AXI_WVALID : signal is "xilinx.com:interface:aximm:1.0 M_AXI WVALID";
  attribute x_interface_info of M_AXI_ARADDR : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARADDR";
  attribute x_interface_info of M_AXI_ARBURST : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARBURST";
  attribute x_interface_info of M_AXI_ARCACHE : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARCACHE";
  attribute x_interface_info of M_AXI_ARID : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARID";
  attribute x_interface_info of M_AXI_ARLEN : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARLEN";
  attribute x_interface_info of M_AXI_ARPROT : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARPROT";
  attribute x_interface_info of M_AXI_ARQOS : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARQOS";
  attribute x_interface_info of M_AXI_ARSIZE : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARSIZE";
  attribute x_interface_info of M_AXI_ARUSER : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARUSER";
  attribute x_interface_info of M_AXI_AWADDR : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWADDR";
  attribute x_interface_info of M_AXI_AWBURST : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWBURST";
  attribute x_interface_info of M_AXI_AWCACHE : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWCACHE";
  attribute x_interface_info of M_AXI_AWID : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWID";
  attribute x_interface_mode of M_AXI_AWID : signal is "master M_AXI";
  attribute x_interface_parameter of M_AXI_AWID : signal is "XIL_INTERFACENAME M_AXI, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute x_interface_info of M_AXI_AWLEN : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWLEN";
  attribute x_interface_info of M_AXI_AWPROT : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWPROT";
  attribute x_interface_info of M_AXI_AWQOS : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWQOS";
  attribute x_interface_info of M_AXI_AWSIZE : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWSIZE";
  attribute x_interface_info of M_AXI_AWUSER : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWUSER";
  attribute x_interface_info of M_AXI_BID : signal is "xilinx.com:interface:aximm:1.0 M_AXI BID";
  attribute x_interface_info of M_AXI_BRESP : signal is "xilinx.com:interface:aximm:1.0 M_AXI BRESP";
  attribute x_interface_info of M_AXI_BUSER : signal is "xilinx.com:interface:aximm:1.0 M_AXI BUSER";
  attribute x_interface_info of M_AXI_RDATA : signal is "xilinx.com:interface:aximm:1.0 M_AXI RDATA";
  attribute x_interface_info of M_AXI_RID : signal is "xilinx.com:interface:aximm:1.0 M_AXI RID";
  attribute x_interface_info of M_AXI_RRESP : signal is "xilinx.com:interface:aximm:1.0 M_AXI RRESP";
  attribute x_interface_info of M_AXI_RUSER : signal is "xilinx.com:interface:aximm:1.0 M_AXI RUSER";
  attribute x_interface_info of M_AXI_WDATA : signal is "xilinx.com:interface:aximm:1.0 M_AXI WDATA";
  attribute x_interface_info of M_AXI_WSTRB : signal is "xilinx.com:interface:aximm:1.0 M_AXI WSTRB";
  attribute x_interface_info of M_AXI_WUSER : signal is "xilinx.com:interface:aximm:1.0 M_AXI WUSER";
begin
  M_AXI_ARUSER(0) <= \<const0>\;
  M_AXI_AWUSER(0) <= \<const0>\;
  M_AXI_WUSER(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: component design_1_entity_name_0_0_entity_name
     port map (
      Error => Error,
      M_AXI_ACLK => M_AXI_ACLK,
      M_AXI_ARADDR(31 downto 0) => M_AXI_ARADDR(31 downto 0),
      M_AXI_ARBURST(1 downto 0) => M_AXI_ARBURST(1 downto 0),
      M_AXI_ARCACHE(3 downto 0) => M_AXI_ARCACHE(3 downto 0),
      M_AXI_ARESETN => M_AXI_ARESETN,
      M_AXI_ARID(0) => M_AXI_ARID(0),
      M_AXI_ARLEN(7 downto 0) => M_AXI_ARLEN(7 downto 0),
      M_AXI_ARLOCK => M_AXI_ARLOCK,
      M_AXI_ARPROT(2 downto 0) => M_AXI_ARPROT(2 downto 0),
      M_AXI_ARQOS(3 downto 0) => M_AXI_ARQOS(3 downto 0),
      M_AXI_ARREADY => M_AXI_ARREADY,
      M_AXI_ARSIZE(2 downto 0) => M_AXI_ARSIZE(2 downto 0),
      M_AXI_ARVALID => M_AXI_ARVALID,
      M_AXI_AWADDR(31 downto 0) => M_AXI_AWADDR(31 downto 0),
      M_AXI_AWBURST(1 downto 0) => M_AXI_AWBURST(1 downto 0),
      M_AXI_AWCACHE(3 downto 0) => M_AXI_AWCACHE(3 downto 0),
      M_AXI_AWID(0) => M_AXI_AWID(0),
      M_AXI_AWLEN(7 downto 0) => M_AXI_AWLEN(7 downto 0),
      M_AXI_AWLOCK => M_AXI_AWLOCK,
      M_AXI_AWPROT(2 downto 0) => M_AXI_AWPROT(2 downto 0),
      M_AXI_AWQOS(3 downto 0) => M_AXI_AWQOS(3 downto 0),
      M_AXI_AWREADY => M_AXI_AWREADY,
      M_AXI_AWSIZE(2 downto 0) => M_AXI_AWSIZE(2 downto 0),
      M_AXI_AWVALID => M_AXI_AWVALID,
      M_AXI_BID(0) => M_AXI_BID(0),
      M_AXI_BREADY => M_AXI_BREADY,
      M_AXI_BRESP(1 downto 0) => M_AXI_BRESP(1 downto 0),
      M_AXI_BVALID => M_AXI_BVALID,
      M_AXI_RDATA(31 downto 0) => M_AXI_RDATA(31 downto 0),
      M_AXI_RID(0) => M_AXI_RID(0),
      M_AXI_RLAST => M_AXI_RLAST,
      M_AXI_RREADY => M_AXI_RREADY,
      M_AXI_RRESP(1 downto 0) => M_AXI_RRESP(1 downto 0),
      M_AXI_RVALID => M_AXI_RVALID,
      M_AXI_WDATA(31 downto 0) => M_AXI_WDATA(31 downto 0),
      M_AXI_WLAST => M_AXI_WLAST,
      M_AXI_WREADY => M_AXI_WREADY,
      M_AXI_WSTRB(3 downto 0) => M_AXI_WSTRB(3 downto 0),
      M_AXI_WVALID => M_AXI_WVALID,
      Read_Data(0 to 31) => Read_Data(0 to 31),
      Read_Done => Read_Done,
      Read_address(31 downto 0) => Read_address(31 downto 0),
      Start_read => Start_read
    );
end STRUCTURE;
