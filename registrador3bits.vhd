library ieee;
use ieee.std_logic_1164.all;

entity registrador3bits is
   port ( ck, clr, load  : in  std_logic;
          D    : in  std_logic_vector(2 downto 0);
          Q   : out std_logic_vector(2 downto 0));
end registrador3bits;

architecture logica of registrador3bits is
   component reg_1bit
      port ( ck   : in  std_logic;
             clr  : in  std_logic;
             load  : in  std_logic;
             d    : in  std_logic;
             q    : out std_logic);
   end component;
begin
   reg_bit0: reg_1bit port map(ck => ck, clr => clr, load => load, d => D(0), q => Q(0));
   reg_bit1: reg_1bit port map(ck => ck, clr => clr, load => load, d => D(1), q => Q(1));
   reg_bit2: reg_1bit port map(ck => ck, clr => clr, load => load, d => D(2), q => Q(2));

 
end logica;
