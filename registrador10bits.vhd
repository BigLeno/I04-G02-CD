library ieee;
use ieee.std_logic_1164.all;

entity registrador10bits is
   port ( ck, clr, load  : in  std_logic;
          D   : in  std_logic_vector(9 downto 0);
          Q   : out std_logic_vector(9 downto 0));
end registrador10bits;

architecture logica of registrador10bits is
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
   reg_bit3: reg_1bit port map(ck => ck, clr => clr, load => load, d => D(3), q => Q(3));
   reg_bit4: reg_1bit port map(ck => ck, clr => clr, load => load, d => D(4), q => Q(4));
   reg_bit5: reg_1bit port map(ck => ck, clr => clr, load => load, d => D(5), q => Q(5));
   reg_bit6: reg_1bit port map(ck => ck, clr => clr, load => load, d => D(6), q => Q(6));
   reg_bit7: reg_1bit port map(ck => ck, clr => clr, load => load, d => D(7), q => Q(7));
   reg_bit8: reg_1bit port map(ck => ck, clr => clr, load => load, d => D(8), q => Q(8));
   reg_bit9: reg_1bit port map(ck => ck, clr => clr, load => load, d => D(9), q => Q(9));


 
end logica;
