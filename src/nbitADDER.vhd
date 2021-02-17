
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--------------------------------------------------------

entity nbit_ADDER is

generic(n: integer :=4);

port(	A:	in std_logic_vector(n-1 downto 0);
	B:	in std_logic_vector(n-1 downto 0);
	carry:	out std_logic;
	sum:	out std_logic_vector(n-1 downto 0)
);

end nbit_ADDER;

--------------------------------------------------------

architecture behv of nbit_ADDER is



signal result: std_logic_vector(n downto 0);---5
 
begin					  
 
    
   
    result <= ('0' & A)+('0' & B);--5bit 4>>sum + 1>>carry
    sum <= result(n-1 downto 0);
    carry <= result(n);

end behv;
