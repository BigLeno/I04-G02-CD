library ieee;
use ieee.std_logic_1164.all;

entity splitter is
    port (
        entrada_splitter : in std_logic_vector(2 downto 0);
        A, B, C : out std_logic_vector(9 downto 0)
    );
end splitter;

architecture ckt of splitter is
begin
    A <= entrada_splitter(0) & entrada_splitter(0) & entrada_splitter(0) & entrada_splitter(0) & entrada_splitter(0) & entrada_splitter(0) & entrada_splitter(0) & entrada_splitter(0) & entrada_splitter(0) & entrada_splitter(0);
    B <= entrada_splitter(1) & entrada_splitter(1) & entrada_splitter(1) & entrada_splitter(1) & entrada_splitter(1) & entrada_splitter(1) & entrada_splitter(1) & entrada_splitter(1) & entrada_splitter(1) & entrada_splitter(1);
    C <= entrada_splitter(2) & entrada_splitter(2) & entrada_splitter(2) & entrada_splitter(2) & entrada_splitter(2) & entrada_splitter(2) & entrada_splitter(2) & entrada_splitter(2) & entrada_splitter(2) & entrada_splitter(2);
end ckt;