--------------------------------------------
--4 BIT ADDER USInG PORT MAP 
--------------------------------------------


LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 

ENTITY Adder_4b IS

  GENERIC(constant n: INTEGER := 4);
  
  PORT(
    a, b: In STD_LOGIC_VECTOR(n-1 DOWNTO 0); --(3 downto 0)
                                             
    cIn: in STD_LOGIC; --1bit 
    sum: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0); -- (3 downto 0)
    cOut: OUT STD_LOGIC -- i bit 
  );
END Adder_4b;

ARCHITECTURE imp OF Adder_4b IS
-- FULL ADDER from full_adder.vhd
  COMPONENT full_adder
    PORT(
      a, b, cIn : in STD_LOGIC;
      sum, cOut : out STD_LOGIC);
  END COMPONENT;
  SIGNAL s1, s2, s3: std_logic;--_vector(n-1 DOWNTO 0);--4 bit 
BEGIN

  A1: full_adder port map (a(0), b(0), cIn, sum(0), s1);
  A2: full_adder port map (a(1), b(1), s1, sum(1), s2);
  A3: full_adder port map (a(2), b(2), s2, sum(2), s3);
  A4: full_adder port map (a(3), b(3), s3, sum(3), cOut);

END imp;