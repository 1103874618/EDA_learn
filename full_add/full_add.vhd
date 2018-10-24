
--一位二进制全加器
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY o_r IS      --注意实体名不能带数字,否则会报错             --two_or
 PORT (a,b:IN STD_LOGIC;
         c:OUT STD_LOGIC);
END ENTITY o_r;
ARCHITECTURE ful OF o_r IS
 BEGIN
  c<= a OR b;
END ARCHITECTURE ful;
         
   --half_adder
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY h_adder IS
 PORT(a,b:IN STD_LOGIC;
      co,so:OUT STD_LOGIC);
END ENTITY h_adder;
ARCHITECTURE h_add_arch OF h_adder IS
 BEGIN 
  so<=(a OR b)AND(a NAND b);
  co<=NOT(a NAND b);
END ARCHITECTURE h_add_arch;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY full_add IS
 PORT (ain,bin, cin:IN STD_LOGIC;--a,b分别为要相加的数,cin为进位输入
       cout,sum    :OUT STD_LOGIC);--sum为何,co为进位输出
END ENTITY full_add;
ARCHITECTURE f_add_arch OF full_add IS 
  COMPONENT h_adder
    PORT(a,b:IN STD_LOGIC;
         co,so:OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT o_r
    PORT(a,b: IN STD_LOGIC;
           c:OUT STD_LOGIC);
  END COMPONENT;

  SIGNAL d,e,f:STD_LOGIC;
    BEGIN
      u1:h_adder PORT MAP(a=>ain , b=>bin , co=>d , so=>e);
      u2:h_adder PORT MAP(a=>e , b=>cin , co=>f , so=>sum);
      u3: o_r    PORT MAP(a=>d , b=>f , c=>cout);
END ARCHITECTURE f_add_arch;









