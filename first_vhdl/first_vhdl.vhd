ENTITY first_vhdl IS
 PORT (a1:IN BIT;
	   b1:IN BIT;
	   q1:OUT BIT);
END;
ARCHITECTURE one OF first_vhdl IS
 BEGIN 
  PROCESS(a1,b1)
   BEGIN 
    IF a1>b1 THEN q1<='1';
     ELSE q1<='0';
    END IF;
   END PROCESS;
  END;