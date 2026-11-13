LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY jk_flipflop IS
    PORT (
        j   : IN  std_logic;
        k   : IN  std_logic;
        clk : IN  std_logic;
        q   : OUT std_logic
    );
END jk_flipflop;

ARCHITECTURE Behavioral OF jk_flipflop IS
    SIGNAL q_reg : std_logic := '0';
BEGIN
    PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF (j = '0' AND k = '0') THEN
                NULL;
            ELSIF (j = '0' AND k = '1') THEN
                q_reg <= '0';
            ELSIF (j = '1' AND k = '0') THEN
                q_reg <= '1';
            ELSIF (j = '1' AND k = '1') THEN
                q_reg <= NOT q_reg;
            ELSE
                q_reg <= 'X';
            END IF;
        END IF;
    END PROCESS;

    q <= q_reg;
END Behavioral;
