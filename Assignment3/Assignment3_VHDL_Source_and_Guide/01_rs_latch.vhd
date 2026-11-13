LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY rs_latch IS
    PORT (
        s     : IN  std_logic;
        r     : IN  std_logic;
        q     : OUT std_logic;
        q_bar : OUT std_logic
    );
END rs_latch;

ARCHITECTURE Behavioral OF rs_latch IS
    SIGNAL q_reg  : std_logic := '0';
    SIGNAL qb_reg : std_logic := '1';
BEGIN
    PROCESS(s, r)
    BEGIN
        IF (s = '1' AND r = '0') THEN
            q_reg  <= '1';
            qb_reg <= '0';
        ELSIF (s = '0' AND r = '1') THEN
            q_reg  <= '0';
            qb_reg <= '1';
        ELSIF (s = '0' AND r = '0') THEN
            NULL;
        ELSE
            q_reg  <= '0';
            qb_reg <= '0';
        END IF;
    END PROCESS;

    q     <= q_reg;
    q_bar <= qb_reg;
END Behavioral;
