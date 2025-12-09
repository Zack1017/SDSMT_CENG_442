library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity riscv_micro_interrupt_tb is
end riscv_micro_interrupt_tb;

architecture Behavioral of riscv_micro_interrupt_tb is
    constant CLK_PERIOD : time := 10 ns;

    signal clk : std_logic := '0';
    signal reset : std_logic := '1';
    signal interrupt : std_logic := '0';

    signal I_M_AXI_AWID    : std_logic_vector(0 downto 0);
    signal I_M_AXI_AWADDR  : std_logic_vector(31 downto 0);
    signal I_M_AXI_AWLEN   : std_logic_vector(7 downto 0);
    signal I_M_AXI_AWSIZE  : std_logic_vector(2 downto 0);
    signal I_M_AXI_AWBURST : std_logic_vector(1 downto 0);
    signal I_M_AXI_AWLOCK  : std_logic;
    signal I_M_AXI_AWCACHE : std_logic_vector(3 downto 0);
    signal I_M_AXI_AWPROT  : std_logic_vector(2 downto 0);
    signal I_M_AXI_AWQOS   : std_logic_vector(3 downto 0);
    signal I_M_AXI_AWUSER  : std_logic_vector(31 downto 0);
    signal I_M_AXI_AWVALID : std_logic;
    signal I_M_AXI_AWREADY : std_logic := '0';

    signal I_M_AXI_WDATA   : std_logic_vector(31 downto 0);
    signal I_M_AXI_WSTRB   : std_logic_vector(3 downto 0);
    signal I_M_AXI_WLAST   : std_logic;
    signal I_M_AXI_WUSER   : std_logic_vector(31 downto 0);
    signal I_M_AXI_WVALID  : std_logic;
    signal I_M_AXI_WREADY  : std_logic := '0';

    signal I_M_AXI_BID     : std_logic_vector(0 downto 0) := (others => '0');
    signal I_M_AXI_BRESP   : std_logic_vector(1 downto 0) := (others => '0');
    signal I_M_AXI_BUSER   : std_logic_vector(31 downto 0) := (others => '0');
    signal I_M_AXI_BVALID  : std_logic := '0';
    signal I_M_AXI_BREADY  : std_logic;

    signal I_M_AXI_ARID    : std_logic_vector(0 downto 0);
    signal I_M_AXI_ARADDR  : std_logic_vector(31 downto 0);
    signal I_M_AXI_ARLEN   : std_logic_vector(7 downto 0);
    signal I_M_AXI_ARSIZE  : std_logic_vector(2 downto 0);
    signal I_M_AXI_ARBURST : std_logic_vector(1 downto 0);
    signal I_M_AXI_ARLOCK  : std_logic;
    signal I_M_AXI_ARCACHE : std_logic_vector(3 downto 0);
    signal I_M_AXI_ARPROT  : std_logic_vector(2 downto 0);
    signal I_M_AXI_ARQOS   : std_logic_vector(3 downto 0);
    signal I_M_AXI_ARUSER  : std_logic_vector(31 downto 0);
    signal I_M_AXI_ARVALID : std_logic;
    signal I_M_AXI_ARREADY : std_logic := '1';

    signal I_M_AXI_RID     : std_logic_vector(0 downto 0) := (others => '0');
    signal I_M_AXI_RDATA   : std_logic_vector(31 downto 0) := (others => '0');
    signal I_M_AXI_RRESP   : std_logic_vector(1 downto 0) := (others => '0');
    signal I_M_AXI_RLAST   : std_logic := '1';
    signal I_M_AXI_RUSER   : std_logic_vector(31 downto 0) := (others => '0');
    signal I_M_AXI_RVALID  : std_logic := '0';
    signal I_M_AXI_RREADY  : std_logic;

    signal D_M_AXI_AWID    : std_logic_vector(0 downto 0);
    signal D_M_AXI_AWADDR  : std_logic_vector(31 downto 0);
    signal D_M_AXI_AWLEN   : std_logic_vector(7 downto 0);
    signal D_M_AXI_AWSIZE  : std_logic_vector(2 downto 0);
    signal D_M_AXI_AWBURST : std_logic_vector(1 downto 0);
    signal D_M_AXI_AWLOCK  : std_logic;
    signal D_M_AXI_AWCACHE : std_logic_vector(3 downto 0);
    signal D_M_AXI_AWPROT  : std_logic_vector(2 downto 0);
    signal D_M_AXI_AWQOS   : std_logic_vector(3 downto 0);
    signal D_M_AXI_AWUSER  : std_logic_vector(31 downto 0);
    signal D_M_AXI_AWVALID : std_logic;
    signal D_M_AXI_AWREADY : std_logic := '1';

    signal D_M_AXI_WDATA   : std_logic_vector(31 downto 0);
    signal D_M_AXI_WSTRB   : std_logic_vector(3 downto 0);
    signal D_M_AXI_WLAST   : std_logic;
    signal D_M_AXI_WUSER   : std_logic_vector(31 downto 0);
    signal D_M_AXI_WVALID  : std_logic;
    signal D_M_AXI_WREADY  : std_logic := '1';

    signal D_M_AXI_BID     : std_logic_vector(0 downto 0) := (others => '0');
    signal D_M_AXI_BRESP   : std_logic_vector(1 downto 0) := (others => '0');
    signal D_M_AXI_BUSER   : std_logic_vector(31 downto 0) := (others => '0');
    signal D_M_AXI_BVALID  : std_logic := '0';
    signal D_M_AXI_BREADY  : std_logic;

    signal D_M_AXI_ARID    : std_logic_vector(0 downto 0);
    signal D_M_AXI_ARADDR  : std_logic_vector(31 downto 0);
    signal D_M_AXI_ARLEN   : std_logic_vector(7 downto 0);
    signal D_M_AXI_ARSIZE  : std_logic_vector(2 downto 0);
    signal D_M_AXI_ARBURST : std_logic_vector(1 downto 0);
    signal D_M_AXI_ARLOCK  : std_logic;
    signal D_M_AXI_ARCACHE : std_logic_vector(3 downto 0);
    signal D_M_AXI_ARPROT  : std_logic_vector(2 downto 0);
    signal D_M_AXI_ARQOS   : std_logic_vector(3 downto 0);
    signal D_M_AXI_ARUSER  : std_logic_vector(31 downto 0);
    signal D_M_AXI_ARVALID : std_logic;
    signal D_M_AXI_ARREADY : std_logic := '1';

    signal D_M_AXI_RID     : std_logic_vector(0 downto 0) := (others => '0');
    signal D_M_AXI_RDATA   : std_logic_vector(31 downto 0) := (others => '0');
    signal D_M_AXI_RRESP   : std_logic_vector(1 downto 0) := (others => '0');
    signal D_M_AXI_RLAST   : std_logic := '1';
    signal D_M_AXI_RUSER   : std_logic_vector(31 downto 0) := (others => '0');
    signal D_M_AXI_RVALID  : std_logic := '0';
    signal D_M_AXI_RREADY  : std_logic;

    type addr_log_t is array (natural range <>) of std_logic_vector(31 downto 0);
    signal fetch_log : addr_log_t(0 to 3);
    signal fetch_count : integer := 0;

    function instruction_at(addr : std_logic_vector(31 downto 0)) return std_logic_vector is
    begin
        case addr is
            when x"00000000" => return x"00000013"; -- nop
            when x"00000004" => return x"00000013"; -- nop (interrupted)
            when x"00000080" => return x"30200073"; -- mret
            when others => return x"00000013";
        end case;
    end function;
begin
    clk <= not clk after CLK_PERIOD/2;

    reset <= '1', '0' after 40 ns;

    uut: entity work.riscv_micro
        port map (
            CLK => clk,
            RESET => reset,
            INTERRUPT => interrupt,
            I_M_AXI_AWID => I_M_AXI_AWID,
            I_M_AXI_AWADDR => I_M_AXI_AWADDR,
            I_M_AXI_AWLEN => I_M_AXI_AWLEN,
            I_M_AXI_AWSIZE => I_M_AXI_AWSIZE,
            I_M_AXI_AWBURST => I_M_AXI_AWBURST,
            I_M_AXI_AWLOCK => I_M_AXI_AWLOCK,
            I_M_AXI_AWCACHE => I_M_AXI_AWCACHE,
            I_M_AXI_AWPROT => I_M_AXI_AWPROT,
            I_M_AXI_AWQOS => I_M_AXI_AWQOS,
            I_M_AXI_AWUSER => I_M_AXI_AWUSER,
            I_M_AXI_AWVALID => I_M_AXI_AWVALID,
            I_M_AXI_AWREADY => I_M_AXI_AWREADY,
            I_M_AXI_WDATA => I_M_AXI_WDATA,
            I_M_AXI_WSTRB => I_M_AXI_WSTRB,
            I_M_AXI_WLAST => I_M_AXI_WLAST,
            I_M_AXI_WUSER => I_M_AXI_WUSER,
            I_M_AXI_WVALID => I_M_AXI_WVALID,
            I_M_AXI_WREADY => I_M_AXI_WREADY,
            I_M_AXI_BID => I_M_AXI_BID,
            I_M_AXI_BRESP => I_M_AXI_BRESP,
            I_M_AXI_BUSER => I_M_AXI_BUSER,
            I_M_AXI_BVALID => I_M_AXI_BVALID,
            I_M_AXI_BREADY => I_M_AXI_BREADY,
            I_M_AXI_ARID => I_M_AXI_ARID,
            I_M_AXI_ARADDR => I_M_AXI_ARADDR,
            I_M_AXI_ARLEN => I_M_AXI_ARLEN,
            I_M_AXI_ARSIZE => I_M_AXI_ARSIZE,
            I_M_AXI_ARBURST => I_M_AXI_ARBURST,
            I_M_AXI_ARLOCK => I_M_AXI_ARLOCK,
            I_M_AXI_ARCACHE => I_M_AXI_ARCACHE,
            I_M_AXI_ARPROT => I_M_AXI_ARPROT,
            I_M_AXI_ARQOS => I_M_AXI_ARQOS,
            I_M_AXI_ARUSER => I_M_AXI_ARUSER,
            I_M_AXI_ARVALID => I_M_AXI_ARVALID,
            I_M_AXI_ARREADY => I_M_AXI_ARREADY,
            I_M_AXI_RID => I_M_AXI_RID,
            I_M_AXI_RDATA => I_M_AXI_RDATA,
            I_M_AXI_RRESP => I_M_AXI_RRESP,
            I_M_AXI_RLAST => I_M_AXI_RLAST,
            I_M_AXI_RUSER => I_M_AXI_RUSER,
            I_M_AXI_RVALID => I_M_AXI_RVALID,
            I_M_AXI_RREADY => I_M_AXI_RREADY,
            D_M_AXI_AWID => D_M_AXI_AWID,
            D_M_AXI_AWADDR => D_M_AXI_AWADDR,
            D_M_AXI_AWLEN => D_M_AXI_AWLEN,
            D_M_AXI_AWSIZE => D_M_AXI_AWSIZE,
            D_M_AXI_AWBURST => D_M_AXI_AWBURST,
            D_M_AXI_AWLOCK => D_M_AXI_AWLOCK,
            D_M_AXI_AWCACHE => D_M_AXI_AWCACHE,
            D_M_AXI_AWPROT => D_M_AXI_AWPROT,
            D_M_AXI_AWQOS => D_M_AXI_AWQOS,
            D_M_AXI_AWUSER => D_M_AXI_AWUSER,
            D_M_AXI_AWVALID => D_M_AXI_AWVALID,
            D_M_AXI_AWREADY => D_M_AXI_AWREADY,
            D_M_AXI_WDATA => D_M_AXI_WDATA,
            D_M_AXI_WSTRB => D_M_AXI_WSTRB,
            D_M_AXI_WLAST => D_M_AXI_WLAST,
            D_M_AXI_WUSER => D_M_AXI_WUSER,
            D_M_AXI_WVALID => D_M_AXI_WVALID,
            D_M_AXI_WREADY => D_M_AXI_WREADY,
            D_M_AXI_BID => D_M_AXI_BID,
            D_M_AXI_BRESP => D_M_AXI_BRESP,
            D_M_AXI_BUSER => D_M_AXI_BUSER,
            D_M_AXI_BVALID => D_M_AXI_BVALID,
            D_M_AXI_BREADY => D_M_AXI_BREADY,
            D_M_AXI_ARID => D_M_AXI_ARID,
            D_M_AXI_ARADDR => D_M_AXI_ARADDR,
            D_M_AXI_ARLEN => D_M_AXI_ARLEN,
            D_M_AXI_ARSIZE => D_M_AXI_ARSIZE,
            D_M_AXI_ARBURST => D_M_AXI_ARBURST,
            D_M_AXI_ARLOCK => D_M_AXI_ARLOCK,
            D_M_AXI_ARCACHE => D_M_AXI_ARCACHE,
            D_M_AXI_ARPROT => D_M_AXI_ARPROT,
            D_M_AXI_ARQOS => D_M_AXI_ARQOS,
            D_M_AXI_ARUSER => D_M_AXI_ARUSER,
            D_M_AXI_ARVALID => D_M_AXI_ARVALID,
            D_M_AXI_ARREADY => D_M_AXI_ARREADY,
            D_M_AXI_RID => D_M_AXI_RID,
            D_M_AXI_RDATA => D_M_AXI_RDATA,
            D_M_AXI_RRESP => D_M_AXI_RRESP,
            D_M_AXI_RLAST => D_M_AXI_RLAST,
            D_M_AXI_RUSER => D_M_AXI_RUSER,
            D_M_AXI_RVALID => D_M_AXI_RVALID,
            D_M_AXI_RREADY => D_M_AXI_RREADY
        );

    axi_instruction_memory : process(clk)
        variable pending_addr : std_logic_vector(31 downto 0);
    begin
        if rising_edge(clk) then
            if I_M_AXI_ARVALID = '1' and I_M_AXI_ARREADY = '1' then
                pending_addr := I_M_AXI_ARADDR;
                I_M_AXI_RDATA <= instruction_at(pending_addr);
                I_M_AXI_RVALID <= '1';
                if fetch_count <= fetch_log'high then
                    fetch_log(fetch_count) <= pending_addr;
                end if;
                fetch_count <= fetch_count + 1;
                if fetch_count = 1 then
                    interrupt <= '1';
                end if;
            elsif I_M_AXI_RVALID = '1' and I_M_AXI_RREADY = '1' then
                I_M_AXI_RVALID <= '0';
            end if;
        end if;
    end process;

    data_channel_defaults : process(all)
    begin
        I_M_AXI_BVALID <= '0';
        D_M_AXI_BVALID <= '0';
        D_M_AXI_RVALID <= '0';
    end process;

    stop_sim : process
    begin
        wait for 500 ns;
        assert fetch_count >= 4 report "Insufficient fetches for interrupt test" severity failure;
        assert fetch_log(0) = x"00000000" report "First fetch did not start at reset PC" severity failure;
        assert fetch_log(1) = x"00000004" report "Second fetch did not advance PC" severity failure;
        assert fetch_log(2) = x"00000080" report "Interrupt did not vector to 0x80" severity failure;
        assert fetch_log(3) = x"00000004" report "MRET did not return to MEPC" severity failure;
        report "Interrupt flow test passed" severity note;
        wait;
    end process;
end Behavioral;
