library ieee;
use ieee.std_logic_1164.all;

entity splitter is
    port (
        entrada_splitter : in std_logic;
        saida_splitter : out std_logic_vector(9 downto 0)
    );
end splitter;

architecture ckt of splitter is
begin
    saida_splitter(0) <= entrada_splitter;
    saida_splitter(1) <= entrada_splitter;
    saida_splitter(2) <= entrada_splitter;
    saida_splitter(3) <= entrada_splitter;
    saida_splitter(4) <= entrada_splitter;
    saida_splitter(5) <= entrada_splitter;
    saida_splitter(6) <= entrada_splitter;
    saida_splitter(7) <= entrada_splitter;
    saida_splitter(8) <= entrada_splitter;
    saida_splitter(9) <= entrada_splitter;
end ckt;