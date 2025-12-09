library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sequencer is
    Port ( clk, res : in STD_LOGIC;
           done : in std_logic;
           LS_busy : in std_logic;
           Is_load : in std_logic;
           Start_load : out std_logic;
           Is_store   : in std_logic;
           Start_store: out std_logic;
           start : out std_logic;
           exec : out std_logic;
           clear_cw: out std_logic
    );
end sequencer;

architecture Behavioral of sequencer is
    type sequencer_state is (seq_start, seq_fetch, seq_fetch2, seq_load, seq_load2, seq_store, seq_store2, seq_ls_clear, seq_execute);
    signal current_state : sequencer_state;
    signal next_state : sequencer_state;
    signal next_state_final : sequencer_state;
    signal seq_fetch_next : sequencer_state;
    signal seq_start_next : sequencer_state;
    signal seq_fetch2_next : sequencer_state;
    signal seq_load_next : sequencer_state;
    signal seq_load2_next : sequencer_state;
    signal seq_store_next : sequencer_state;
    signal seq_store2_next : sequencer_state;
    signal seq_execute_next : sequencer_state;
    signal seq_ls_clear_next : sequencer_state;
begin
    current_state <= next_state_final when rising_edge(clk);
    
    next_state_final <= seq_fetch when res = '1' else next_state;
    
    seq_start_next <= seq_load    when Is_load = '1'  else
                        seq_store   when Is_store = '1' else
                        seq_fetch;
    
    seq_fetch_next <= seq_fetch2;
    seq_fetch2_next <= seq_execute when done = '1' else seq_fetch2;
    seq_load_next   <= seq_load2;
    seq_load2_next  <= seq_ls_clear when LS_busy = '0' else seq_load2;
    seq_store_next  <= seq_store2;
    seq_store2_next <= seq_ls_clear when LS_busy = '0' else seq_store2;
    
    seq_ls_clear_next <= seq_execute;
    seq_execute_next <= seq_start;

    with current_state select
        next_state <= seq_start_next when seq_start, 
                      seq_fetch2_next when seq_fetch2,
                      seq_load_next when seq_load,
                      seq_load2_next when seq_load2,
                      seq_store_next when seq_store,
                      seq_store2_next when seq_store2,
                      seq_ls_clear_next when seq_ls_clear,
                      seq_execute_next when seq_execute,
                      seq_fetch_next when others;
    
    -- Keep the control word intact while deciding whether a memory
    -- operation should be kicked off; otherwise the decoder output is
    -- cleared before the sequencer can see is_load/is_store asserted.
    clear_cw <= '1' when current_state = seq_ls_clear else '0';
    
    Start_load  <= '1' when current_state = seq_load  else '0';
    Start_store <= '1' when current_state = seq_store else '0';
    
    start <= '1' when current_state = seq_fetch else '0';
    exec <= '1' when current_state = seq_execute else '0';
end Behavioral;
