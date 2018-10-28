LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY five_char_dis IS
PORT(
  SW:IN STD_LOGIC_VECTOR(17 DOWNTO 0);
  HEX0:OUT STD_LOGIC_VECTOR(0 TO 6)
);
END five_char_dis;

ARCHITECTURE five_char_dis_arch OF five_char_dis IS
  COMPONENT five_to_one_mult_comp 
    PORT(
      S,U,V,W,X,Y:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      M:OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT seven_seg_comp
    PORT(
      C:IN STD_LOGIC_VECTOR(2 DOWNTO 0 );
      Dispaly: OUT STD_LOGIC_VECTOR(0 TO 6)--0为灯亮
    );
  END COMPONENT;

SIGNAL M : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN
  M0: five_to_one_mult_comp PORT MAP (SW(17 DOWNTO 15), SW(14 DOWNTO  12), SW(11 DOWNTO 9), SW(8 DOWNTO 6), SW(5 DOWNTO 3), SW(2 DOWNTO 0), M);--signal M
  --SW has use but not declared ?  ..bcause the arch's blong is wrong .....
  H0: seven_seg_comp PORT MAP (M, HEX0);--signal M选择
END five_char_dis_arch;


