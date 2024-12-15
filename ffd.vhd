library ieee;
use ieee.std_logic_1164.all;

entity ffd is
   port (ck, clr, set, d : in  std_logic;
                       q : out std_logic);
end ffd;

architecture logica of ffd is

begin
   process(ck, clr, set)
   begin
      if    (set = '0')            then q <= '1';
      elsif (clr = '1')            then q <= '0';
      elsif (ck'event and ck ='1') then q <= d;   
      end if;   
   end process;   
end logica;