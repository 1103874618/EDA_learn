LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY seven_seg_comp IS 
PORT(
       Dispaly: OUT STD_LOGIC_VECTOR(0 TO 6);--0为灯亮
       C:IN STD_LOGIC_VECTOR(2 DOWNTO 0 ));
END seven_seg_comp;

ARCHITECTURE Behavior OF seven_seg_comp IS
BEGIN

Dispaly<="1001000" WHEN C(2 DOWNTO 1)="00" ELSE
         "0110000" WHEN C(2 DOWNTO 1)="01" ELSE
         "1110001" WHEN C(2 DOWNTO 1)="10" ELSE
         "0000001" WHEN C(2 DOWNTO 1)="11" ELSE
         "1111111";

END Behavior;




