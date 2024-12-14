library ieee;

use ieee.std_logic_1164.all;

entity comparador10bits is

port(
	A_comparacao, B_comparacao: IN std_logic_vector(11 downto 0);
	V_igual_zero: OUT std_logic
);

end comparador10bits;

architecture comparador of comparador10bits is

signal P_XNor_1, P_XNor_2,P_XNor_3,P_XNor_4,P_XNor_5,P_XNor_6, P_XNor_7, P_XNor_8, P_XNor_9, P_XNor_10, P_And, P_Or, P_Nor: std_logic;


begin



P_XNor_1 <= A_comparacao(9) xnor B_comparacao(9);

P_XNor_2 <= A_comparacao(8) xnor B_comparacao(8);

P_XNor_3 <= A_comparacao(7) xnor B_comparacao(7);

P_XNor_4 <= A_comparacao(6) xnor B_comparacao(6);

P_XNor_5 <= A_comparacao(5) xnor B_comparacao(5);

P_XNor_6 <= A_comparacao(4) xnor B_comparacao(4);

P_XNor_7 <= A_comparacao(3) xnor B_comparacao(3);

P_XNor_8 <= A_comparacao(2) xnor B_comparacao(2);

P_XNor_9<= A_comparacao(1) xnor B_comparacao(1);

P_XNor_10 <= A_comparacao(0) xnor B_comparacao(0);



P_And <= P_XNor_9 and P_XNor_8 and P_XNor_7 and P_XNor_6 and P_XNor_5 and P_XNor_4 and P_XNor_3 and P_XNor_2 and P_XNor_1 ;




V_igual_zero <= P_And;





end comparador;
