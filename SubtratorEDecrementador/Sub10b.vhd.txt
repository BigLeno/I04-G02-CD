--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity Sub10b is
	port(
		VALOR: in std_logic_vector (9 downto 0);
		MOEDA: in std_logic_vector (9 downto 0);
		S: out std_logic_vector (9 downto 0);
		COMP: out std_logic
	);

end Sub10b;

--arquitetura
architecture estrutura of Sub10b is
	component somador10bits is
	port(
		A,B: in std_logic_vector (9 downto 0);
		CIN: in std_logic;
		S: out std_logic_vector (9 downto 0);
		COUT: out std_logic
	);
	end component;
	
	signal notMOEDA: std_logic_vector(9 downto 0);
begin
	notMOEDA <= NOT MOEDA;
	subtrator:  somador10bits port map(VALOR,notMOEDA,'1',S,COMP);
	
end estrutura;