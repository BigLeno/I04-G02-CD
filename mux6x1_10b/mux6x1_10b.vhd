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
            entrada_not : in std_logic_vector(9 downto 0);
            saida_not : out std_logic_vector(9 downto 0)
        );
    end component;

    component splitter
        port (
            entrada_splitter : in std_logic_vector(2 downto 0);
            A, B, C : out std_logic_vector(9 downto 0)
        );
    end component;

    -- Criando os sinais de saída das portas AND
    signal s1 : std_logic_vector(9 downto 0);
    signal s2 : std_logic_vector(9 downto 0);
    signal s3 : std_logic_vector(9 downto 0);
    signal s4 : std_logic_vector(9 downto 0);
    signal s5 : std_logic_vector(9 downto 0);
    signal s6 : std_logic_vector(9 downto 0);

    -- Sinais para ampliar o seletor para 10 bits
    signal seletor_0_10b : std_logic_vector(9 downto 0);
    signal seletor_1_10b : std_logic_vector(9 downto 0);
    signal seletor_2_10b : std_logic_vector(9 downto 0);

    -- Sinais para negar o seletor já com 10 bits
    signal seletor_0_not_10b : std_logic_vector(9 downto 0);
    signal seletor_1_not_10b : std_logic_vector(9 downto 0);
    signal seletor_2_not_10b : std_logic_vector(9 downto 0);

begin

    -- Ampliando o seletor para 10 bits
    u_splitter00 : splitter port map(
        entrada_splitter => seletor_mux6x1_10b, 
        A => seletor_0_10b,
        B => seletor_1_10b,
        C => seletor_2_10b
    );
    
    -- Negando o seletor
    u1 : portaNot port map(
        entrada_not => seletor_0_10b, 
        saida_not => seletor_0_not_10b
    );
    u2 : portaNot port map(
        entrada_not => seletor_1_10b, 
        saida_not => seletor_1_not_10b
    );
    u3 : portaNot port map(
        entrada_not => seletor_2_10b, 
        saida_not => seletor_2_not_10b
    );

    -- Criando as portas AND
    u_and1 : and4portas port map(
        A => seletor_1_not_10b,
        B => seletor_2_not_10b,
        C => seletor_0_not_10b,
        D => C1,
        saida_and_4_portas => s1
    );

    u_and2 : and4portas port map(
        A => seletor_1_not_10b,
        B => seletor_2_not_10b,
        C => seletor_0_10b,
        D => C2,
        saida_and_4_portas => s2
    );

    u_and3 : and4portas port map(
        A => seletor_1_10b,
        B => seletor_2_not_10b,
        C => seletor_0_not_10b,
        D => C3,
        saida_and_4_portas => s3
    );

    u_and4 : and4portas port map(
        A => seletor_1_10b,
        B => seletor_2_not_10b,
        C => seletor_0_10b,
        D => C4,
        saida_and_4_portas => s4
    );

    u_and5 : and4portas port map(
        A => seletor_1_not_10b,
        B => seletor_2_10b,
        C => seletor_0_not_10b,
        D => C5,
        saida_and_4_portas => s5
    );

    u_and6 : and4portas port map(
        A => C6,
        B => seletor_2_10b,
        C => seletor_1_not_10b,
        D => seletor_0_10b,
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