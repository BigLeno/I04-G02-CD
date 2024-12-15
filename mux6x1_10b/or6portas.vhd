library ieee;
use ieee.std_logic_1164.all;

entity or6portas is
    port (
        A : in std_logic_vector(9 downto 0);
        B : in std_logic_vector(9 downto 0);
        C : in std_logic_vector(9 downto 0);
        D : in std_logic_vector(9 downto 0);
        E : in std_logic_vector(9 downto 0);
        F : in std_logic_vector(9 downto 0);
        saida_or_6_portas : out std_logic_vector(9 downto 0)
    );
end or6portas;

architecture ckt of or6portas is
begin
    saida_or_6_portas <= A or B or C or D or E or F;
end ckt;