LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY five_char_dis IS
PORT(
  SW:IN STD_LOGIC_VECTOR(17 DOWNTO 0);
  HEX0:OUT STD_LOGIC_VECTOR(0 TO 6);
  HEX1:OUT STD_LOGIC_VECTOR(0 TO 6);
  HEX2:OUT STD_LOGIC_VECTOR(0 TO 6);
  HEX3:OUT STD_LOGIC_VECTOR(0 TO 6);
  HEX4:OUT STD_LOGIC_VECTOR(0 TO 6);
  LEDR:OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
  LEDG:OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
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
SIGNAL M_S_one : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL M_S_two : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL M_S_three : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL M_S_four : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN
  M0: five_to_one_mult_comp PORT MAP (SW(17 DOWNTO 15), SW(14 DOWNTO  12), SW(11 DOWNTO 9), SW(8 DOWNTO 6), SW(5 DOWNTO 3), SW(2 DOWNTO 0), M);--H first

  M1: five_to_one_mult_comp PORT MAP (SW(17 DOWNTO 15), SW(2 DOWNTO 0),SW(14 DOWNTO  12), SW(11 DOWNTO 9), SW(8 DOWNTO 6), SW(5 DOWNTO 3),  M_S_one);--E first

  M2: five_to_one_mult_comp PORT MAP (SW(17 DOWNTO 15),  SW(5 DOWNTO 3),SW(2 DOWNTO 0),SW(14 DOWNTO  12), SW(11 DOWNTO 9), SW(8 DOWNTO 6),  M_S_two);-- L first

  M3: five_to_one_mult_comp PORT MAP (SW(17 DOWNTO 15), SW(8 DOWNTO 6),  SW(5 DOWNTO 3),SW(2 DOWNTO 0),SW(14 DOWNTO  12), SW(11 DOWNTO 9),  M_S_three);-- L2 frst 

  M4: five_to_one_mult_comp PORT MAP (SW(17 DOWNTO 15),SW(11 DOWNTO 9), SW(8 DOWNTO 6),  SW(5 DOWNTO 3),SW(2 DOWNTO 0),SW(14 DOWNTO  12),  M_S_four);-- O first

  H0: seven_seg_comp PORT MAP (M, HEX0);--signal M选择
  H1: seven_seg_comp PORT MAP (M_S_one, HEX1);
  H2: seven_seg_comp PORT MAP (M_S_two, HEX2);
  H3: seven_seg_comp PORT MAP (M_S_three, HEX3);
  H4: seven_seg_comp PORT MAP (M_S_four, HEX4);

  LEDR<=SW;
  LEDG(2 DOWNTO 0)<=M;
  LEDG(5 DOWNTO 3)<=M_S_one;
  LEDG(8 DOWNTO 6)<=M_S_two;
  LEDG(11 DOWNTO 9)<=M_S_three;
  LEDG(14 DOWNTO 12)<=M_S_four;
END five_char_dis_arch;


