--------------------------------------------
--32BIT  RIPPLE ADDER USInG PORT MAP 
--------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Adder_32b IS
  GENERIC(constant n: INTEGER := 4;
          constant m: INTEGER := 32);

  --GENERIC(constant m: INTEGER := 32);
  
  PORT(
    a, b: In STD_LOGIC_VECTOR(m-1 DOWNTO 0); --(31 downto 0)
                                             
    cIn: in STD_LOGIC; --1bit 
    sum: OUT STD_LOGIC_VECTOR(m-1 DOWNTO 0); -- (31 downto 0)
    cOut: OUT STD_LOGIC -- i bit 
  );
END Adder_32b;

---------------------------

ARCHITECTURE imp OF Adder_32b IS
-- 4 BIT ADDER FROM Adder_4b.vhd 
  COMPONENT Adder_4b
    PORT(
        a, b: In STD_LOGIC_VECTOR(n-1 DOWNTO 0); --(3 downto 0)
                                             
        cIn: in STD_LOGIC; --1bit 
        sum: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0); -- (3 downto 0)
        cOut: OUT STD_LOGIC -- i bit 
	);
  END COMPONENT;
  --SIGNAL s_carry: std_logic_vector(m-1 DOWNTO 0);--32 bit 
  SIGNAL s1,s2,s3,s4,s5,s6,s7: std_logic;
BEGIN

  add1: Adder_4b port map (a(3 downto 0), b(3 downto 0), cIn, sum(3 downto 0), s1);
  
  add2: Adder_4b port map (a(7 downto 4), b(7 downto 4),s1, sum(7 downto 4), s2);
  
  add3: Adder_4b port map (a(11 downto 8), b(11 downto 8),s2, sum(11 downto 8),s3);
  
  add4: Adder_4b port map (a(15 downto 12), b(15 downto 12),s3, sum(15 downto 12),s4 );
  
  add5: Adder_4b port map (a(19 downto 16), b(19 downto 16),s4, sum(19 downto 16),s5 );
  
  add6: Adder_4b port map (a(23 downto 20), b(23 downto 20), s5, sum(23 downto 20),s6  );
  
  add7: Adder_4b port map (a(27 downto 24), b(27 downto 24), s6, sum(27 downto 24),s7 );
  
  add8: Adder_4b port map (a(31 downto 28), b(31 downto 28), s7, sum(31 downto 28),cOut );

END imp;