
module nios_system (
	clk_clk,
	i_switches_export,
	i_triggers_export,
	o_accumulator_export,
	reset_reset_n);	

	input		clk_clk;
	input	[7:0]	i_switches_export;
	input		i_triggers_export;
	output	[15:0]	o_accumulator_export;
	input		reset_reset_n;
endmodule
