library ieee;
use ieee.std_logic_1164.all;

entity and4portas is
    port (
        A : in std_logic;
        B : in std_logic;
        C : in std_logic;
        D : in std_logic;
        saida_and_4_portas : out std_logic
    );
end and4portas;

architecture ckt of and4portas is
begin
    saida_and_4_portas <= A and B and C and D;
end ckt;