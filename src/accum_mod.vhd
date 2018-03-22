--------------------------------------------------------------
-- Written by Hakeem Buchanan 
-- January 24 2018
--------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity accum_mod is
port (
 i_switch : in std_logic_vector(7 downto 0);
      i_trigger : in std_logic;
      i_reset_n : in std_logic;
      i_clk : in std_logic;
      o_accumulator : out std_logic_vector(15 downto 0));
	  
	  end entity accum_mod;
	  
	  architecture beh of accum_mod is
	  signal accum_sig : std_logic_vector(15 downto 0);
	  signal switch_sig : std_logic_vector(15 downto 0);
	  -- Append zeros to switch input, for the accumulator
begin
	  switch_sig<="00000000"&i_switch;
	  
	  
	  AKUMA:process(i_clk,i_reset_n,i_trigger)
begin
 
  if (i_reset_n = '0') then
   accum_sig<=(others => '0');
   elsif (rising_edge(i_clk)) then
	if i_trigger='1' then 
  accum_sig<=unsigned(accum_sig)+unsigned(switch_sig);
 end if; 
 end if; 
 
 end process; 
 o_accumulator<= accum_sig;
 end beh; 
  
	  