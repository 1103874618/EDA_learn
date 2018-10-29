LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY seven_seg_comp IS 
PORT(
       C:IN STD_LOGIC_VECTOR(2 DOWNTO 0 );
       Dispaly: OUT STD_LOGIC_VECTOR(0 TO 6)); --0为灯亮
END seven_seg_comp;

ARCHITECTURE Behavior OF seven_seg_comp IS
BEGIN

Dispaly<="1001000" WHEN C="000" ELSE --H
         "0110000" WHEN C="001" ELSE --E
         "1110001" WHEN C="010" OR C="011" ELSE --L
         "0000001" WHEN C="100" ELSE --O
         "1111111";

END Behavior;




