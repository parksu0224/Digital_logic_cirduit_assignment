LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY d_flipflop IS
    PORT (
        d   : IN  std_logic;
        clk : IN  std_logic;
        q   : OUT std_logic
    );
END d_flipflop;

ARCHITECTURE Behavioral OF d_flipflop IS
    SIGNAL q_reg : std_logic := '0';
BEGIN
    PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            q_reg <= d;
        END IF;
    END PROCESS;

    q <= q_reg;
END Behavioral;
