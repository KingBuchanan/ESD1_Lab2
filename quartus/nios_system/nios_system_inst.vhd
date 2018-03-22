	component nios_system is
		port (
			clk_clk              : in  std_logic                     := 'X';             -- clk
			i_switches_export    : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			i_triggers_export    : in  std_logic                     := 'X';             -- export
			o_accumulator_export : out std_logic_vector(15 downto 0);                    -- export
			reset_reset_n        : in  std_logic                     := 'X'              -- reset_n
		);
	end component nios_system;

	u0 : component nios_system
		port map (
			clk_clk              => CONNECTED_TO_clk_clk,              --           clk.clk
			i_switches_export    => CONNECTED_TO_i_switches_export,    --    i_switches.export
			i_triggers_export    => CONNECTED_TO_i_triggers_export,    --    i_triggers.export
			o_accumulator_export => CONNECTED_TO_o_accumulator_export, -- o_accumulator.export
			reset_reset_n        => CONNECTED_TO_reset_reset_n         --         reset.reset_n
		);

