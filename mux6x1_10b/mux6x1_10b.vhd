library ieee;
use ieee.std_logic_1164.all;

entity mux6x1_10b is
    port (
        C1 : in std_logic_vector(9 downto 0);
        C2 : in std_logic_vector(9 downto 0);
        C3 : in std_logic_vector(9 downto 0);
        C4 : in std_logic_vector(9 downto 0);
        C5 : in std_logic_vector(9 downto 0);
        C6 : in std_logic_vector(9 downto 0);
        seletor_mux6x1_10b : in std_logic_vector(2 downto 0);
        saida_mux6x1_10b : out std_logic_vector(9 downto 0)
    );
end mux6x1_10b;

architecture Behavioral of mux6x1_10b is
    component or6portas
        port (
            A : in std_logic_vector(9 downto 0);
            B : in std_logic_vector(9 downto 0);
            C : in std_logic_vector(9 downto 0);
            D : in std_logic_vector(9 downto 0);
            E : in std_logic_vector(9 downto 0);
            F : in std_logic_vector(9 downto 0);
            saida_or_6_portas : out std_logic_vector(9 downto 0)
        );
    end component;

    component and4portas
        port (
            A : in std_logic_vector(9 downto 0);
            B : in std_logic_vector(9 downto 0);
            C : in std_logic_vector(9 downto 0);
            D : in std_logic_vector(9 downto 0);
            saida_and_4_portas : out std_logic_vector(9 downto 0)
        );
    end component;

    component portaNot
        port (
            entrada_not : in std_logic;
            saida_not : out std_logic
        );
    end component;

    component splitter
        port (
            entrada_splitter : in std_logic;
            saida_splitter : out std_logic_vector(9 downto 0)
        );
    end component;

    -- Criando os sinais
    signal s1 : std_logic_vector(9 downto 0);
    signal s2 : std_logic_vector(9 downto 0);
    signal s3 : std_logic_vector(9 downto 0);
    signal s4 : std_logic_vector(9 downto 0);
    signal s5 : std_logic_vector(9 downto 0);
    signal s6 : std_logic_vector(9 downto 0);
    signal seletor_not : std_logic_vector(2 downto 0);
    signal seletor_not_10b : std_logic_vector(29 downto 0); -- 3 sinais de 10 bits
    signal and_inputs1 : std_logic_vector(39 downto 0);
    signal and_inputs2 : std_logic_vector(39 downto 0);
    signal and_inputs3 : std_logic_vector(39 downto 0);
    signal and_inputs4 : std_logic_vector(39 downto 0);
    signal and_inputs5 : std_logic_vector(39 downto 0);
    signal and_inputs6 : std_logic_vector(39 downto 0);

begin
    -- Negando o seletor
    u1 : portaNot port map(entrada_not => seletor_mux6x1_10b(0), saida_not => seletor_not(0));
    u2 : portaNot port map(entrada_not => seletor_mux6x1_10b(1), saida_not => seletor_not(1));
    u3 : portaNot port map(entrada_not => seletor_mux6x1_10b(2), saida_not => seletor_not(2));

    -- Transformando os bits negados em 10 bits
    u_splitter1 : splitter port map(entrada_splitter => seletor_not(0), saida_splitter => seletor_not_10b(9 downto 0));
    u_splitter2 : splitter port map(entrada_splitter => seletor_not(1), saida_splitter => seletor_not_10b(19 downto 10));
    u_splitter3 : splitter port map(entrada_splitter => seletor_not(2), saida_splitter => seletor_not_10b(29 downto 20));

    -- Criando as portas AND
    and_inputs1 <= seletor_not_10b(29 downto 20) & seletor_not_10b(19 downto 10) & seletor_not_10b(9 downto 0) & C1;
    u_and1 : and4portas port map(
        A => and_inputs1(9 downto 0),
        B => and_inputs1(19 downto 10),
        C => and_inputs1(29 downto 20),
        D => C1,
        saida_and_4_portas => s1
    );

    and_inputs2 <= seletor_not_10b(29 downto 20) & seletor_not_10b(19 downto 10) & seletor_mux6x1_10b(0) & C2;
    u_and2 : and4portas port map(
        A => and_inputs2(9 downto 0),
        B => and_inputs2(19 downto 10),
        C => and_inputs2(29 downto 20),
        D => C2,
        saida_and_4_portas => s2
    );

    and_inputs3 <= seletor_not_10b(29 downto 20) & seletor_mux6x1_10b(1) & seletor_not_10b(9 downto 0) & C3;
    u_and3 : and4portas port map(
        A => and_inputs3(9 downto 0),
        B => and_inputs3(19 downto 10),
        C => and_inputs3(29 downto 20),
        D => C3,
        saida_and_4_portas => s3
    );

    and_inputs4 <= seletor_not_10b(29 downto 20) & seletor_mux6x1_10b(1) & seletor_mux6x1_10b(0) & C4;
    u_and4 : and4portas port map(
        A => and_inputs4(9 downto 0),
        B => and_inputs4(19 downto 10),
        C => and_inputs4(29 downto 20),
        D => C4,
        saida_and_4_portas => s4
    );

    and_inputs5 <= seletor_mux6x1_10b(2) & seletor_not_10b(19 downto 10) & seletor_not_10b(9 downto 0) & C5;
    u_and5 : and4portas port map(
        A => and_inputs5(9 downto 0),
        B => and_inputs5(19 downto 10),
        C => and_inputs5(29 downto 20),
        D => C5,
        saida_and_4_portas => s5
    );

    and_inputs6 <= seletor_mux6x1_10b(2) & seletor_mux6x1_10b(1) & seletor_not_10b(9 downto 0) & C6;
    u_and6 : and4portas port map(
        A => and_inputs6(9 downto 0),
        B => and_inputs6(19 downto 10),
        C => and_inputs6(29 downto 20),
        D => C6,
        saida_and_4_portas => s6
    );

    -- Criando a porta OR
    u_or : or6portas port map(
        A => s1,
        B => s2,
        C => s3,
        D => s4,
        E => s5,
        F => s6,
        saida_or_6_portas => saida_mux6x1_10b
    );

end Behavioral;