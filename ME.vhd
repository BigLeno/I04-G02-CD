--
-- Copyright (C) 2023 Samaherni M. D.
-- Laboratory of Automation, Control and Instrumentation (LACI)
-- Federal University of Rio Grande do Norte (UFRN)
-- 
-- This file is part of ELE2715 project (https://github.com/sama-md/ELE2715/). 
-- It is subject to the license terms in the LICENSE file found in the top-level 
-- directory of this distribution. 
--
-- Licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 
-- 4.0 International License;
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--  (EN)  https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode
--  (PT)  https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode.pt
--
-- Unless otherwise separately undertaken by the Licensor, to the extent possible, 
-- the Licensor offers the Licensed Material "as-is" and "as-available", and makes
-- no representations or warranties of any kind concerning the Licensed Material, 
-- whether express, implied, statutory, or other.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

library ieee;
use ieee.std_logic_1164.all;
entity ME is
   port (ck, rst : in  std_logic;
			T, comp, Cx, X, Vzero: in std_logic;
          SV, SX, Vld, Xld, EnM: out std_logic;
			 SF: out std_logic_vector(1 downto 0);
			 out_estado: out std_logic_vector(2 downto 0));
end ME;

architecture logica of ME is
  type st is (init, check, lib, check_V, check_fail, fail, reset, next_x);  
  signal estado : st;  
  signal q: std_logic_vector(2 downto 0);
  
begin
  process (ck, rst)
  begin
    if rst = '1' then                 
      estado <= init;                   
    elsif (ck'event and ck ='1') then    
      case estado is
		
        when init =>                         
          if T = '1' then estado <= check; 
          else            estado <= init; 
          end if;
			 
        when check =>                         
          if comp = '1' and Cx = '1' then estado <= lib; 
          else            	  estado <= check_V;
          end if;
			 
        when lib => estado <= check;
          
        when check_V =>                         
          if Vzero = '1' then estado <= init;
          else            estado <= check_fail;
          end if;
			 
		  when check_fail =>                         
          if X = '0' AND Cx = '0' then estado <= fail;
          else                        estado <= next_x;
          end if;
			 
		  when fail =>                         
          if T = '1' then estado <= reset;
          else            estado <= fail;
          end if;
			 
		  when reset => estado <= check;
         
		  when next_x => estado <= check;
       end case;
    end if;
  end process;
  with estado select  
    q <= "000" when init,
         "001" when check, 
         "010" when lib, 
         "011" when check_V,
			"100" when check_fail,
         "101" when fail, 
         "110" when reset, 
         "111" when next_x; 
	
	with estado select  
    SF <= "00" when init,
          "11" when check, 
          "11" when lib, 
          "11" when check_V,
			 "11" when check_fail,
          "01" when fail, 
          "01" when reset, 
          "11" when next_x; 
	
	out_estado <= q;	
	
	--- zero sempre que estiver no estado init ou reset
	SV <= '0' when estado = init or estado = reset else '1';
	--- zero sempre que estiver no estado init ou reset
	SX <= '0' when estado = init or estado = reset else '1';
	-- ativado SOMENTE quando for subtrair o valor ou registrar um novo valor 
	Vld <= '1' when estado = init or estado = reset or estado = lib else '0';
	-- ativado SOMENTE quando for mudar a moeda ou registrar um novo valor
	Xld <= '1' when estado = init or estado = reset or estado = next_xx else '0';
	-- liberar a moeda sempre que subtrair o valor 
	EnM <= '1' when estado = lib else '0';	 

end logica; 