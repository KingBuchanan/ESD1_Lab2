library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity hexDisplayDriver is
 port (
      i_hex : in std_logic_vector(3 downto 0);
      o_sevenSeg : out std_logic_vector(6 downto 0)
    );
end  entity hexDisplayDriver;


    Architecture behav of hexDisplayDriver is
   
	signal BCD0   :STD_Logic_vector(3 downto 0);
Constant Zero: Std_logic_Vector(6 downto 0):="1000000";
Constant One: Std_logic_Vector(6 downto 0):="1111001";
Constant Two: Std_logic_Vector(6 downto 0):="0100100";
Constant Three: Std_logic_Vector(6 downto 0):="0110000";
Constant Four: Std_logic_Vector(6 downto 0):="0011001";
Constant Five: Std_logic_Vector(6 downto 0):="0010010";
Constant Six: Std_logic_Vector(6 downto 0):="0000010";
Constant Eight: Std_logic_Vector(6 downto 0):="0000000";
Constant Seven: Std_logic_Vector(6 downto 0):="1111000";
Constant Nine: Std_logic_Vector(6 downto 0):="0011000";
Constant  Aa: Std_logic_Vector(6 downto 0):="0001000";
Constant Bb: Std_logic_Vector(6 downto 0):="0000011";
Constant Cc: Std_logic_Vector(6 downto 0):="0100111";
Constant  Dd: Std_logic_Vector(6 downto 0):="0100001";
Constant Ee: Std_logic_Vector(6 downto 0):="0000110";
Constant Ff: Std_logic_Vector(6 downto 0):="0001110";
   -- Change the values of the seven seg display a-f . 
begin

BCD0<=i_hex;
process(BCD0)
begin
        Case BCD0 is 
      when "0000"=>o_sevenSeg<=Zero;
      when "0001"=>o_sevenSeg<=One;
      when "0010"=>o_sevenSeg<=Two;
      when "0011"=>o_sevenSeg<=Three;
      when "0100"=>o_sevenSeg<=Four;
      when "0101"=>o_sevenSeg<=Five;
      when "0110"=>o_sevenSeg<=Six;
      when "0111"=>o_sevenSeg<=Seven;
      when "1000"=>o_sevenSeg<=Eight;
      when "1001"=>o_sevenSeg<=Nine;
      when "1010"=>o_sevenSeg<=Aa;
      when "1011"=>o_sevenSeg<=Bb;
      when "1100"=>o_sevenSeg<=Cc;
      when "1101"=>o_sevenSeg<=Dd;
      when "1110"=>o_sevenSeg<=Ee;
      when "1111"=>o_sevenSeg<=Ff;
      when others=>o_sevenSeg<=Zero;
      end case;
		end process; 
	end behav;