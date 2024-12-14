library ieee;
use ieee.std_logic_1164.all;

entity reg_1bit is
   port ( ck   : in  std_logic;
          clr  : in  std_logic;
          load  : in  std_logic;
          d    : in  std_logic;
          q    : out std_logic);
end reg_1bit;

architecture logica of reg_1bit is

   component ffd
      port ( ck, clr, set, d  : in  std_logic;
             q   : out std_logic);
   end component;

 signal aux1, aux2 : std_logic;

begin
	aux1 <= (not(load) and aux2) or (load and d); 
	--load (0) aux1 assume o valor de aux2(anterior)
	--load (1) aux1 assume o valor de d(novo)
   flipflop: ffd  port map(ck, clr, '1', aux1, aux2);
	q <= aux2;
end logica;