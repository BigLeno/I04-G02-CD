--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity somador10bits is
	port(
		A,B: in std_logic_vector (9 downto 0);
		CIN: in std_logic;
		S: out std_logic_vector (9 downto 0);
		COUT: out std_logic
	);

end somador10bits;

--arquitetura
architecture estrutura of somador10bits is
	signal vai_um : std_logic_vector (0 to 8);
	
	component somadorCompleto is
		port(
			a,b: in std_logic;
			cin: in std_logic;
			s: out std_logic;
			cout: out std_logic
		);
	end component;
	
begin
	S0: somadorCompleto port map(A(0),B(0),CIN,S(0),vai_um(0));
	S1: somadorCompleto port map(A(1),B(1),vai_um(0),S(1),vai_um(1));
	S2: somadorCompleto port map(A(2),B(2),vai_um(1),S(2),vai_um(2));
	S3: somadorCompleto port map(A(3),B(3),vai_um(2),S(3),vai_um(3));
	S4: somadorCompleto port map(A(4),B(4),vai_um(3),S(4),vai_um(4));
	S5: somadorCompleto port map(A(5),B(5),vai_um(4),S(5),vai_um(5));
	S6: somadorCompleto port map(A(6),B(6),vai_um(5),S(6),vai_um(6));
	S7: somadorCompleto port map(A(7),B(7),vai_um(6),S(7),vai_um(7));
	s8: somadorCompleto port map(A(8),B(8),vai_um(7),S(8),vai_um(8));
	s9: somadorCompleto port map(A(9),B(9),vai_um(8),S(9),COUT);

end estrutura;