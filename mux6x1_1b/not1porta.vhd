library ieee;
use ieee.std_logic_1164.all;

entity portaNot is
    port (
        entrada_not: in std_logic;
        saida_not: out std_logic);
end portaNot;

architecture ckt of portaNot is
begin
    saida_not <= not entrada_not;
end ckt;