--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity Dec_3b is
	port(
		X: in std_logic_vector (2 downto 0);
		S: out std_logic_vector (2 downto 0);
		X_igual_0: out std_logic
	);

end Dec_3b;

--arquitetura
architecture estrutura of Dec_3b is
	component somadorCompleto is
	port(
		a,b: in std_logic;
		cin: in std_logic;
		s: out std_logic;
		cout: out std_logic
	);
	end component;
	
	signal um_barrado: std_logic_vector(2 downto 0);
	signal cout1,cout2: std_logic;
	signal xigualzero: std_logic;
begin
	um_barrado <= "110";

	somador1: somadorCompleto port map(X(0),um_barrado(0),'1',S(0),cout1);
	somador2: somadorCompleto port map(X(1),um_barrado(1),cout1,S(1),cout2);
	somador3: somadorCompleto port map(X(2),um_barrado(2),cout2,S(2),xigualzero);

	X_igual_0 <= NOT xigualzero;
end estrutura;