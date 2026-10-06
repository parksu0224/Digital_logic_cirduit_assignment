LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY test IS
    PORT (
        a : IN std_logic;
        y : OUT std_logic
    );
END test;

ARCHITECTURE TypeArchitecture OF test IS
BEGIN

    y <= NOT a;

END TypeArchitecture;