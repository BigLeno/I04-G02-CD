library ieee;
use ieee.std_logic_1164.all;

entity mux6x1_1b is
    port (
        entrada_mux6x1_1b : in std_logic_vector(5 downto 0);
        seletor_mux6x1_1b : in std_logic_vector(2 downto 0);
        saida_mux6x1_1b : out std_logic
    );
end mux6x1_1b;

architecture Behavioral of mux6x1_1b is
    component or6portas
        port (
            entrada_or_6_portas : in std_logic_vector(5 downto 0);
            saida_or_6_portas : out std_logic
        );
    end component;

    component and4portas
        port (
            entrada_and_4_portas : in std_logic_vector(3 downto 0);
            saida_and_4_portas : out std_logic
        );
    end component;

    component portaNot
        port (
            entrada_not : in std_logic;
            saida_not : out std_logic
        );
    end component;

    -- Criando os sinais
    signal s : std_logic_vector(5 downto 0);
    signal seletor_not : std_logic_vector(2 downto 0);
    signal and_inputs1 : std_logic_vector(3 downto 0);
    signal and_inputs2 : std_logic_vector(3 downto 0);
    signal and_inputs3 : std_logic_vector(3 downto 0);
    signal and_inputs4 : std_logic_vector(3 downto 0);
    signal and_inputs5 : std_logic_vector(3 downto 0);
    signal and_inputs6 : std_logic_vector(3 downto 0);

begin
    -- Negando o seletor
    u1 : portaNot port map(entrada_not => seletor_mux6x1_1b(0), saida_not => seletor_not(0));
    u2 : portaNot port map(entrada_not => seletor_mux6x1_1b(1), saida_not => seletor_not(1));
    u3 : portaNot port map(entrada_not => seletor_mux6x1_1b(2), saida_not => seletor_not(2));

    -- Criando as portas AND
    and_inputs1 <= seletor_not(1) & seletor_not(2) & seletor_not(0) & entrada_mux6x1_1b(0);
    u_and1 : and4portas port map(
        entrada_and_4_portas => and_inputs1,
        saida_and_4_portas => s(0)
    );

    and_inputs2 <= seletor_not(1) & seletor_not(2) & seletor_mux6x1_1b(0) & entrada_mux6x1_1b(1);
    u_and2 : and4portas port map(
        entrada_and_4_portas => and_inputs2,
        saida_and_4_portas => s(1)
    );

    and_inputs3 <= seletor_mux6x1_1b(1) & seletor_not(2) & seletor_not(0) & entrada_mux6x1_1b(2);
    u_and3 : and4portas port map(
        entrada_and_4_portas => and_inputs3,
        saida_and_4_portas => s(2)
    );

    and_inputs4 <= seletor_mux6x1_1b(1) & seletor_not(2) & seletor_mux6x1_1b(0) & entrada_mux6x1_1b(3);
    u_and4 : and4portas port map(
        entrada_and_4_portas => and_inputs4,
        saida_and_4_portas => s(3)
    );

    and_inputs5 <= seletor_not(1) & seletor_mux6x1_1b(2) & seletor_not(0) & entrada_mux6x1_1b(4);
    u_and5 : and4portas port map(
        entrada_and_4_portas => and_inputs5,
        saida_and_4_portas => s(4)
    );

    and_inputs6 <= seletor_mux6x1_1b(1) & seletor_mux6x1_1b(2) & seletor_not(0) & entrada_mux6x1_1b(5);
    u_and6 : and4portas port map(
        entrada_and_4_portas => and_inputs6,
        saida_and_4_portas => s(5)
    );

    -- Criando a porta OR
    u_or : or6portas port map(
        entrada_or_6_portas => s,
        saida_or_6_portas => saida_mux6x1_1b
    );

end Behavioral;