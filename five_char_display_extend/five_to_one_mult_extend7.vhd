--真值表第七列
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY five_to_one_mult_extend7 IS 
PORT(
       S,U,V,W,X,Y:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
       
       LEDR: OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
       LEDG: OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
       M:OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END five_to_one_mult_extend7;

ARCHITECTURE Behavior OF five_to_one_mult_extend7 IS
BEGIN
    WITH S SELECT
  M<= Y WHEN "001",
      X WHEN "000",
      W WHEN "111",
      V WHEN "110",
      U WHEN "101", 
      "000" WHEN OTHERS;

      -- SW(2 DOWNTO 0) WHEN "000",
      -- SW(5 DOWNTO 3) WHEN "001",
      -- SW(8 DOWNTO 6) WHEN "010",
      -- SW(11 DOWNTO 9) WHEN "011",
      -- SW(14 DOWNTO 12) WHEN "100",--默认此为H
      -- "000" WHEN OTHERS;

END Behavior;















