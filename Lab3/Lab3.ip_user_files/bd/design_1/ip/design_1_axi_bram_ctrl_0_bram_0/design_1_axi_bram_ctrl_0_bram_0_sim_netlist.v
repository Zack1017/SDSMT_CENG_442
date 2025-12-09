// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Mon Oct  6 20:10:14 2025
// Host        : cenglab08 running 64-bit Ubuntu 24.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/student/s101113328/CENG442/Lab3/Lab3.gen/sources_1/bd/design_1/ip/design_1_axi_bram_ctrl_0_bram_0/design_1_axi_bram_ctrl_0_bram_0_sim_netlist.v
// Design      : design_1_axi_bram_ctrl_0_bram_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_axi_bram_ctrl_0_bram_0,blk_mem_gen_v8_4_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_11,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module design_1_axi_bram_ctrl_0_bram_0
   (clka,
    rsta,
    ena,
    addra,
    douta,
    rsta_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_ONLY, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  output rsta_busy;

  wire [31:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;
  wire rsta;
  wire rsta_busy;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     4.8711 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "NONE" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "1" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  design_1_axi_bram_ctrl_0_bram_0_blk_mem_gen_v8_4_11 U0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[12:2],1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
gydSV72FvW4hnoyUt6yZFJHfJqjRQWPUfYIuDKP0fpjrPOkLRbJGBr4Z9msYTvoIHRlYtXJ2YMY0
d1TIQb+FK4gKsTRru9wr397OxuFBsTRf4e+ZjpYZEdsnqYWcgMSzhN4yhPvO06GyZO15y/LKBxa8
3OKwxVlOLYXhv+sxdXg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WHB6Zbfa5Qi47krP9T4L8UnPOlr881dWx7UcYaZfNGIQQM0gadcoXbhucIpRaUuyOKxv6yhKveRN
h0l+N9+KX6rbZ6+TRhP9JAMuPhlpI7T42QtRv5zx9+m3ct5S0NMszbFaK8zeTAYra5BGP7BHmtkr
MpKfLK5sFyaTE/A7ACtAace9MwFTHDZdl9uUs4aY6KJlm6GaypKduiqkNugukJp5vlFPX/ZapJqG
KMtMhI6grhcuYb1FJrwRZ4jW7hs9HxddSdGLzsZ0HsBcO/qaCPTst+ZA0YIQfd5ULlFmPqq39FfO
p1P+2hEH2n+LycbMj5cn4Dxfqv2R8eucM78R3w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
SmAzQA1VEuJXtJi5vXa2Jg7YvRqAJs6PX9HTZ1YqrJw4VfonBW3726gJ81BjlizpMkcf/Uk5sFIK
aPedVhEs4xCIZylz7gXYDshtytOA/pXUID2qV9nXr8qfI+FydSADUF3ScYDZmlkclFqlZrGq6DQ7
da3lJAzt2h/iR+cczrA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
iAph5JWb/chMQpLPX1UoLjQDxN5l2I8McM/k2xN5wRht7HXoE6F5yV8luDjn3zkI6vnfUYo7BaI1
mogRRx+R3XcwxvhHr+lngh4+/YLVex1TFncl+kiUMAsu3M/FjFSiqGMVMdKTNLDqr35DuZJVyuiF
lTwXob/KkbQDJiJjBEoxbt+968rKRKRyJGcqIjm4mqRBdqMcgo3HOJFG74SFsWAQrxvXfBhdLSG3
OfoLfls9XDojBjp7G83k0h82g1eeWgBfydm/OcX9o48Pst93NvI4ua8WShZL8MCvRWYqWZrrjrWi
cfUjXAF5SDACjq1/OU6arz/Idz6/a7AP/jmexw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BY49GZBxBT/gjZDPyaSWlti/sctckoR7jK6NuWdhnF9tiyNfVU7BqjjwxSnyMi0Uucv1BKHXC18h
8hQbFWnNtrq71ilURotXux7sssHlVJ2i1CsJWU18DOcBWxm2ai89uwvxDJh3TJkBJixB5KPvsDhL
lWOjTvZWPoR+Ixy+Tzo+U5Vx7z7SOakRwTrn3u7+c3vmCEBphE+HKeJExhBAoOEd0SXK5iwXaByW
D7Wb7zq6NNUmnCyaJ2BG9kGxLVsf+md7SlocuaFsYyaRZhwPyTucxIlz1tLYwcytKzx0ovoax3no
nYgzlzP/F0/PDWk9BqXgr/tuclc4EZYX0cf4ng==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qGnCvL35qO7cbUEKCL50yDv1UvezcqBz601zctKop1954QlcjemzZWZHg1zJ00nJaToNdH2S8AKX
n8hNJvbQ+x5HEGL5DoSU9m5qjXd8xxocnZ0yzuZX/dGCT8kDn3gWJR2Gz13pT+w2LQUno1fX+MsC
ehgwvjBBT6GeYjdxHi+aybQUP9AblSxX/z3vh857SGCPohEWvghOgORCHAe45YD+ZWnL62FLxMM2
c+Ozq/Au/Q4q1Yzlzcfv8Mnsvg7OqOeEamQHbuYOfdkJUuYqOwsskEWW348u7FXtsf8m7P3pZyyz
IWyTDAW4igGguMPLHfbtK/twZx8ScJQmOKzglg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hz+6K8+wh5/fukU4ZWNDXGsq6hreSVCSPP67nA6kUz9Vpjy4TtTnOrrl1BWY0ivEC7Ldyw8VI60A
VO/WPlt409LdAZdMZGsEZ1JuTZ0m9LPcgu9CPCyoMECctmd8LHE+otY6etTmYABB9syY61rk2hrv
RgbcyT/HCK9TzWxSm+XMqvx2nvagCLkMDPh/JZv51fj2zcKaBPnxsz8rnDipaeo0fEyVRC3Y1F/V
U3RmXojBjIumPHSJkQ537dENJEIA0Ra65u8EM/+ItUn1bcryLcIbKy1xGadrHmHdHRUoRcAodO2C
B48bNVeL0VnGg8P9ACIB04lMNzn5p6A1tPOb4Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
YDpb+UeT0rJ543Q8wCo2xSS3gpVAT+JoStgBlV5IMjJoUOWkiOPn691FGChmDi3BTq5NxC73KHHR
1galACCjeTGq6cv+0Zc2Ocm1oobdrnSPHp7TMDr5Zle8FX6WywJCiGdoWBODggZSlbOASIK/PVfY
cZM2z60M6RSvzsi3TnYHiKYHpju8THVoSgRd6r31GcbiSy9TjjARERXan0OVc79jGuAg90mmDEEq
91eqmn6NZ9yLI2fgBjFUZbtFCpmJ8WGxOL1h39niWnRK3ZXnk8jcpnZUlxLbYTPO0Z3vVr1zrvcn
RVQloU0OLqg7M95zSs7NtX5Vzvb6jGbMehWV+WMMyxWmxL2XOwsAwPSeX2dI2r77pioY7X6VzH7f
/JxMAnq9udra3WGPsUkD1G0CvPkCC3zdxjpVaflY37ztX9UONhKtzMQa8lJc1IL8GhXRY3R9Lg2c
HIeXSGkpNNuFDqKT6Khe/6Casq+SjFJq+IH9IUtz6RUZTkbFb0Xhgm2P

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q+63zFEYw/LeMgxa7g8g79GGvSyIKDKD8RvvC4DHDQuGObf6n9OGZX4e17v/E/+EDEwUhsWQHFDI
Lp/aH+6fNRmhu9BEWVjxq2WRrQSl4eQjfIaSOXu2dlYh3JjRJwiUp4LteVh8RFAf5t5sRQO4dRIK
x+h28yliSgibaWEAv5FaJQ1EFbNwmgedAaSYjgf2A3afBUcBh5Uy9VHbW/zRzdhhJdsVNBjZYcFy
CVLOcf1toCRp8J4U5FlnFMOzFegUbdXFQhq2VmIhPRxWjrfTk6iR4BcMEN9UMij/5IHRAeBdksyD
CqEKsyFxosbI5KVMRZ1Ln75Zipn0JdsGekHkxg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DPUa5DLPYRWvbPnX0U412yoWvvvHyuq43DrYmDJGTK0cR5U4U6th8icYgizC1/hUAEzt19kM/hVa
zZh7bXSWACYLpcfhPY8dRTVGDZVjpbkraw0ceBryLP7jc6Jt5JdNw88tZtZpprCB7nQ25lUL82Hf
WTwL1ZqgGIvtfHhxO0JF5L5ES5giedwQ6u5ffXG3UB6ELcpQD1NvpW5lAz4mfXyvVDCAPZN581TF
tlAy79iKbPKlJ2zFn1BS2cuRIHHe2JRxwPo+0n5VD5CXVgg+lCYxTnCxI8CdyFaTumbs4IfAKwVI
wSN/btbwDUhW9hAHWHIRo+BpdJ4qeGcTDPKtsA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mf5hcf6JE6yLm0jNCQnHMVmogjLlPz6re0FwG67yvOJ3FuEorru0emIeAKEwgOoxjUYNWvcM7QAH
/UEeB2EIdjLl6glPAUda0HjtaCU2rdncVdM8k6DSMBggc4yo18Qx5F+1TD/RoBgoo0jNkMdDy6wJ
JHjqlN+R01z3yYIMQ9f2z6ZaYncbBYEp4+YAb7g1D7CSMxP5cFRpQznRpYp0JwqJfT9CHzlKgdab
8B288NxeLM66iYodiTS+GSRGLGtDWXpz9yeiuiPe6kJxae2GJyHIMSfluO/0Slc3m24DQNdbojf8
jdc0G2UnrDe5mCUTfYiDmpOWTUJOdYo0FK0N2g==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 52736)
`pragma protect data_block
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
gABVzCvgiP2+PIs=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
