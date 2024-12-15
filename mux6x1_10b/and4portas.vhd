library ieee;
use ieee.std_logic_1164.all;

entity and4portas is
    port (
        A : in std_logic_vector(9 downto 0);
        B : in std_logic_vector(9 downto 0);
        C : in std_logic_vector(9 downto 0);
        D : in std_logic_vector(9 downto 0);
        saida_and_4_portas : out std_logic_vector(9 downto 0)
    );
end and4portas;

architecture ckt of and4portas is
begin
    saida_and_4_portas <= A and B and C and D;
end ckt;