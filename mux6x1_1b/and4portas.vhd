library ieee;
use ieee.std_logic_1164.all;

entity and4portas is
    port (
        entrada_and_4_portas : in std_logic_vector(3 downto 0);
        saida_and_4_portas : out std_logic
    );
end and4portas;

architecture ckt of and4portas is
begin
    saida_and_4_portas <= entrada_and_4_portas(0) and entrada_and_4_portas(1) and entrada_and_4_portas(2) and entrada_and_4_portas(3);
end ckt;