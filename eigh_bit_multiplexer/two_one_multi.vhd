LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY two_one_multi IS 
  PORT(
       SW:IN STD_LOGIC_VECTOR(17 DOWNTO 0 );
       LEDR: OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
       LEDG: OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
       m:BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0));
END two_one_multi;

ARCHITECTURE Behavior OF two_one_multi IS

BEGIN
  PROCESS(SW)
  BEGIN
    IF SW(17)='0' THEN
      m<=SW(7 DOWNTO 0);
    ELSE IF SW(17)='1' THEN
      m<=SW(15 DOWNTO 8);
    ELSE
      m<="00000000";
      END IF;
    END IF;
  END PROCESS;

  --m <= (NOT(SW(17) AND SW(7 DOWNTO 0)) OR (SW(17) AND SW(15 DOWNTO 8)));

  LEDR <= SW;
  LEDG(7 DOWNTO 0) <= m;
END Behavior;






