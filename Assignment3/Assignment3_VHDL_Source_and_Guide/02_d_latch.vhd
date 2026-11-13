LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY d_latch IS
    PORT (
        d  : IN  std_logic;
        en : IN  std_logic;
        q  : OUT std_logic
    );
END d_latch;

ARCHITECTURE Behavioral OF d_latch IS
    SIGNAL q_reg : std_logic := '0';
BEGIN
    PROCESS(d, en)
    BEGIN
        IF en = '1' THEN
            q_reg <= d;
        END IF;
    END PROCESS;

    q <= q_reg;
END Behavioral;
