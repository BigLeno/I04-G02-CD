library ieee;
use ieee.std_logic_1164.all;

entity decoder3x6 is
    port (
        X : in std_logic_vector(2 downto 0);
        E : in std_logic;
        i1, i2, i3, i4, i5, i6 : out std_logic
    );
end decoder3x6;

architecture ckt of decoder3x6 is
    component portaNot
        port (
            entrada_not: in std_logic;
            saida_not: out std_logic
        );
    end component;

    component and4portas
        port (
            A : in std_logic;
            B : in std_logic;
            C : in std_logic;
            D : in std_logic;
            saida_and_4_portas : out std_logic
        );
    end component;

    signal not_entrada0, not_entrada1, not_entrada2, not_enable: std_logic;

begin
    -- Instâncias das portas NOT
    u1: portaNot port map (X(0), not_entrada0);
    u2: portaNot port map (X(1), not_entrada1);
    u3: portaNot port map (X(2), not_entrada2);
    enable : portaNot port map (E, not_enable);

    -- Instâncias das portas AND
    u4: and4portas port map (X(2), E, not_entrada1, X(0), i6);
    u5: and4portas port map (X(2), E, not_entrada1, not_entrada0, i5);
    u6: and4portas port map (not_entrada2, E, X(1), X(0), i4);
    u7: and4portas port map (not_entrada2, E, X(1), not_entrada0, i3);
    u8: and4portas port map (not_entrada2, E, not_entrada1, X(0), i2);
    u9: and4portas port map (not_entrada2, E, not_entrada1, not_entrada0, i1);
    
end ckt;

