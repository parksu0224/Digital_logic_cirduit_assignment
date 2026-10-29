LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux8to1 IS
    PORT (
        d0 : IN std_logic;
        d1 : IN std_logic;
        d2 : IN std_logic;
        d3 : IN std_logic;
        d4 : IN std_logic;
        d5 : IN std_logic;
        d6 : IN std_logic;
        d7 : IN std_logic;

        s0 : IN std_logic;
        s1 : IN std_logic;
        s2 : IN std_logic;

        y  : OUT std_logic
    );
END mux8to1;

ARCHITECTURE Behavioral OF mux8to1 IS

    SIGNAL sel : std_logic_vector(2 DOWNTO 0);

BEGIN

    sel <= s2 & s1 & s0;

    PROCESS(d0, d1, d2, d3, d4, d5, d6, d7, sel)
    BEGIN
        CASE sel IS
            WHEN "000" => y <= d0;
            WHEN "001" => y <= d1;
            WHEN "010" => y <= d2;
            WHEN "011" => y <= d3;
            WHEN "100" => y <= d4;
            WHEN "101" => y <= d5;
            WHEN "110" => y <= d6;
            WHEN "111" => y <= d7;
            WHEN OTHERS => y <= '0';
        END CASE;
    END PROCESS;

END Behavioral;