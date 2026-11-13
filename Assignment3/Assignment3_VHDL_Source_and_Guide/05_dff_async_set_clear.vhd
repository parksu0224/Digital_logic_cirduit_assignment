LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dff_async_set_clear IS
    PORT (
        d   : IN  std_logic;
        clk : IN  std_logic;
        set : IN  std_logic;
        clr : IN  std_logic;
        q   : OUT std_logic
    );
END dff_async_set_clear;

ARCHITECTURE Behavioral OF dff_async_set_clear IS
    SIGNAL q_reg : std_logic := '0';
BEGIN
    PROCESS(clk, set, clr)
    BEGIN
        IF clr = '1' THEN
            q_reg <= '0';
        ELSIF set = '1' THEN
            q_reg <= '1';
        ELSIF rising_edge(clk) THEN
            q_reg <= d;
        END IF;
    END PROCESS;

    q <= q_reg;
END Behavioral;
