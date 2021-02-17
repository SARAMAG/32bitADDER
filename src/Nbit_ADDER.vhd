-------------------------------------------
--32BIT ADDER USING BEHAVOURAL TECH 
-------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--------------------------------------------------------

entity nbit_ADDER is

generic(n: integer :=32);

port(	A:	in std_logic_vector(n-1 downto 0); ---A IS 32 BIT 1ST INPUT 
	B:	in std_logic_vector(n-1 downto 0); ----B IS 32 BIT 2ND INPUT 
	carry:	out std_logic;                ----SINGLE OUTPUT BIT CARRY 

	sum:	out std_logic_vector(n-1 downto 0) ---32 BIT OUTPUT SUM RESULT 
);

end nbit_ADDER;


architecture behv of nbit_ADDER is

-----TEMP RESULT VECTOR OF 33 BIT OUTPUT 

signal result: std_logic_vector(n downto 0);---33    >>32+1
 
begin					  
    result <= ('0' & A)+('0' & B);--33bit 32>>sum + 1>>carry
	
    sum <= result(n-1 downto 0); ---32 BIT OUTPUT SUM 
    carry <= result(n);         ---MSB OF RESULT IS THE CARRY OUTPUT 

end behv;
