LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

--simple module that connects the SW switchs and the LEDR lights
ENTITY DE2_board IS 
  PORT(SW:IN STD_LOGIC_VECTOR(17 DOWNTO 0 );
       LEDR: OUT STD_LOGIC_VECTOR(17 DOWNTO 0));--red leds
END DE2_board;

ARCHITECTURE Behavior OF DE2_board IS
BEGIN 
  LEDR <=SW;
END Behavior;
