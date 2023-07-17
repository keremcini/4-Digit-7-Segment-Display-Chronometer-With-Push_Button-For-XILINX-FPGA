library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity test1 is
 Port (
  CLK: in std_logic;
  BTN1 : in std_logic;
LED1 : out std_logic;
LED2 : out std_logic;
LED3 : out std_logic;
anot : out std_logic_vector(3 downto 0);
segment:out std_logic_vector(7 downto 0)
  );
end test1;

architecture Behavioral of test1 is



constant c_timer1mslim			: integer := 50000000;
 signal onlar : integer :=0;
 signal yuzler : integer :=0;
 signal binler : integer :=0;
 signal sayac : integer :=0;
signal segmentt : std_logic_vector(7 downto 0);
 signal counter: unsigned(27 downto 0) := (others => '0');
 signal counter2: unsigned(27 downto 0) := (others => '0');
 signal counter3: unsigned(27 downto 0) := (others => '0');
 signal tick: std_logic;
  signal aaa: std_logic;
  signal bbb: std_logic;
 signal led11 :std_logic;
  signal led22 :std_logic;
   signal led33 :std_logic;
signal timer1ms					: integer range 0 to c_timer1mslim ;

signal anott: std_logic_vector(3 downto 0) :="1110";

procedure set(
signal saya : in integer;
signal segmenttt :inout  std_logic_vector(7 downto 0)
 )is

 begin

  case saya is
  when 0=>
  segmenttt <= x"40";

  when 1 =>
  segmenttt <= x"F9";
   
   when 2 =>
  segmenttt <= x"24"; 
   when 3 =>
  segmenttt <= x"30"; 
   when 4 =>
  segmenttt <= x"19"; 
   when 5 =>
  segmenttt <= x"12"; 
   when 6 =>
  segmenttt <= x"02";   
   when 7 =>
  segmenttt <= x"F8";
   when 8 =>
  segmenttt <= x"00";
   when 9 =>
  segmenttt <= x"10";
  
  when others =>
  segmenttt <= x"47";
  end case;

 end set;


begin
 tick <= '1' when counter2 = 150000000 else '0'; 
 aaa <= '1' when counter= 50000 else '0';
 bbb <= '1' when counter= 500000000 else '0';
 

 
 
 P_ANODES : process (clk) begin
if (rising_edge(clk)) then
if (timer1ms = c_timer1mslim-1) then
		led22<= not led22;
	else
		timer1ms				<= timer1ms + 1;
	end if;

end if;
end process;



 main : process(clk)

 variable saniye : integer :=0;
variable i: integer range 0 to 2:=0 ;
 begin
  if rising_edge(CLK) then
  if BTN1 = '0' then
    
	  
	  if i=0 then
	      sayac <=0;
    onlar <=0;
    yuzler <= 0;
    binler <=0;
	 counter2 <= (others => '0');
	i:=i+1;
	end if;
	 
	 
    if aaa = '1' then
    sayac<= sayac+1; 
      
    if sayac = 10 then
    sayac <= 0;
    onlar <= onlar+1;
    end if;
    
    if onlar = 10 then
    onlar <=0;
    yuzler <=yuzler+1;
    end if;
    
    if yuzler = 10 then 
    yuzler <= 0;
    binler <= binler+1;
    end if;
    
    if binler = 10 then
    saniye := saniye+1;
    binler <=0;
    end if;
    LED11 <= not LED11;

     counter <= (others => '0');
   else
     counter <= counter + 1;


  if (anott(0) = '0') then
  
  set(sayac,segmentt);  


 end if;
 
     
     
     
     

  if (anott(1) = '0') then
set(onlar,segmentt);


  end if;
----  end if;
 

  if (anott(2) = '0') then
set(yuzler,segmentt);

 
  end if;

    if (anott(3) = '0') then
    set(binler,segmentt);

    end if;
 
  end if; --aaa
  --------------------------------------------------------------------------------------------------------------------
  
  elsif BTN1 = '1' then
i:=0;
if (anott(0) = '0') then
set(sayac,segmentt);


 end if;
  if (anott(1) = '0') then
set(onlar,segmentt);


  end if;
  if (anott(2) = '0') then
set(yuzler,segmentt);

 
  end if;
    if (anott(3) = '0') then
    set(binler,segmentt);

  end if;
  
  
  if tick = '1'  then
        sayac <=0;
    onlar <=0;
    yuzler <= 0;
    binler <=0;

counter2 <= (others => '0');
   
 
 else    counter2 <= counter2 + 1;
    end if;
	 
	 
 
  


  
  end if;-- btn
  
  -------------------------------------------------------

  end if;-- rising
  
  end process;
 


segment <= segmentt;
anot <=anott;
led1<= led11;
led2<= led22;
led3<= led33;
end Behavioral;
