library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Traffic_Lights is generic (seconds: integer := 100000000);
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           red_NS: out std_logic; -- red light for north/south direction
           yellow_NS: out std_logic; -- yellow light for north/south direction
           green_NS: out std_logic; -- green light for north/south direction
           red_WE: out std_logic; -- red light for west/east direction
           yellow_WE: out std_logic; -- yellow light for west/east direction
           green_WE: out std_logic); -- green light for west/east direction
end Traffic_Lights;

architecture Behavioral of Traffic_Lights is

    type t_state is (init_NS, Start_NS, NS, Stop_NS, init_WE, Start_WE, WE, Stop_WE); -- declaring the states of the traffic lights
    
    signal state : t_state; -- "state" can be any of the states mentioned above 
    signal counter: integer range 0 to seconds * 60;
begin

    process(clk) is
    begin
        if(rising_edge(clk)) then
            if reset = '1' then
            counter <= 0;
            red_NS <= '1'; -- assigning the traffic lights on north/south direction to red 
            yellow_NS <= '0';
            green_NS <= '0';
            red_WE <= '1'; -- assigning the traffic lights on north/south direction to red 
            yellow_WE <= '0';
            green_WE <= '0';
            state <= init_NS; -- move to the next state          

            else
            -- defining the default values
            red_NS <= '0'; 
            yellow_NS <= '0';
            green_NS <= '0';
            red_WE <= '0'; 
            yellow_WE <= '0';
            green_WE <= '0';
            
            counter <= counter + 1;
            
                case state is
                    when init_NS => -- when the traffic is at north/south direction
                        red_NS <= '1'; -- assigning the traffic lights on north/south direction to red 
                        red_WE <= '1'; -- assigning the traffic lights on west/east direction to red 
                        if (counter = seconds * 5-1) then -- if counter reaches 5 seconds
                        counter <= 0;
                        state <= Start_NS;
                        end if;
                        
                    when Start_NS => -- north/south lights will be red and yellow while west/east will be red 
                        red_NS <= '1';
                        yellow_NS <= '1';
                        red_WE <= '1';
                        if (counter = seconds * 5 - 1) then 
                        counter <= 0;
                        state <= NS;    
                        end if;
                        
                    when NS => -- north/south lights will be green while west/east will be red 
                        green_NS <= '1';
                        red_WE <= '1';
                        if (counter = seconds * 60 - 1) then -- if 1 minute has passed 
                        counter <= 0;
                        state <= Stop_NS;
                        end if;
                        
                    when Stop_NS => -- north/south lights will be yellow while west/east will be red 
                        yellow_NS <= '1';
                        red_WE <= '1';
                        if (counter = seconds * 5 - 1) then 
                        counter <= 0;
                        state <= init_WE;
                        end if;
                        
                    when init_WE => -- both north/south and west/east lights will be red
                        red_NS <= '1'; 
                        red_WE <= '1';
                        if (counter = seconds * 5 - 1) then 
                        counter <= 0; 
                        state <= Start_WE;
                        end if;
                        
                    when Start_WE => -- north/south lights will be red while west/east will be red and yellow
                        red_NS <= '1';
                        red_WE <= '1';
                        yellow_WE <= '1';
                        if (counter = seconds * 5 - 1) then 
                        counter <= 0;
                        state <= WE;
                        end if;
                        
                    when WE => -- north/south lights will be red while west/east will be green
                        red_NS <= '1';
                        green_WE <= '1';
                        if (counter = seconds * 60 - 1) then 
                        counter <= 0;
                        state <= Stop_WE;
                        end if;
                        
                    when Stop_WE => -- north/south lights will be red while west/east will be yellow
                        red_NS <= '1';
                        yellow_WE <= '1';
                        if (counter = seconds * 5 - 1) then 
                        counter <= 0;
                        state <= init_NS;
                        end if;
                end case;
                
            end if;
        end if;           
    end process;

end Behavioral;
