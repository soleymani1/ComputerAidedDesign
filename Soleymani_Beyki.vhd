library ieee;
use ieee.std_logic_1164.all;

entity COUNTER is
port (		Reset,Clock: in std_logic;
   		Q: out std_logic_vector(5 downto 0));
end COUNTER; 

architecture Behavior of COUNTER is
	signal s : std_logic_vector(5 downto 0);
begin
	process(Reset,Clock)
	begin
		if Reset ='1' then
			s<="000000";
		elsif (Clock'EVENT and Clock ='1') then
			case s is
				when "000000" =>
					s<="001010";
				when "001010" =>
					s<="010100";
				when "010100" =>
					s<="011110";
				when "011110" =>
					s<="101000";
				when "101000" =>
					s<="110010";
				when "110010" =>
					s<="111100";
				when others =>
					s<="000000";
			end case;
		end if;
	end process;
	Q<=s;
end Behavior;