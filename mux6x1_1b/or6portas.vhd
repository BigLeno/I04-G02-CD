library ieee;
use ieee.std_logic_1164.all;

entity or6portas is
    port (
        entrada_or_6_portas : in std_logic_vector(5 downto 0);
        saida_or_6_portas : out std_logic
    );
end or6portas;

architecture ckt of or6portas is
begin
    saida_or_6_portas <= entrada_or_6_portas(0) or entrada_or_6_portas(1) or entrada_or_6_portas(2) or entrada_or_6_portas(3) or entrada_or_6_portas(4) or entrada_or_6_portas(5);
end ckt;