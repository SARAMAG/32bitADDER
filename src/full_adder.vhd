
--------------------------------------------------------------
-- A FULL ADDER .
--------------------------------------------------------------

library ieee; 
use ieee.std_logic_1164.all; 


--FULL ADDER 
entity full_adder is 
  port( 
    a, b, cIn : in std_logic; 
    sum, cOut : out std_logic);
end full_adder; 

architecture imp of full_adder is 
begin 
  
  sum <= (a xor b) xor cIn;
  cOut <= (a and b) or (cIn and (a xor b));
end imp; 