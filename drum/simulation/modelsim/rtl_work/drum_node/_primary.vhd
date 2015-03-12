library verilog;
use verilog.vl_types.all;
entity drum_node is
    generic(
        eta             : vl_logic_vector(4 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0);
        rho             : vl_logic_vector(4 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0);
        max_row         : integer := 0;
        step1           : integer := 1;
        step2           : integer := 2;
        step3           : integer := 3;
        reset1          : integer := 5;
        reset2          : integer := 6;
        reset3          : integer := 7;
        init1           : integer := 8;
        init2           : integer := 9;
        init3           : integer := 10
    );
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        left_in         : in     vl_logic_vector(17 downto 0);
        right_in        : in     vl_logic_vector(17 downto 0);
        left_out        : out    vl_logic_vector(17 downto 0);
        right_out       : out    vl_logic_vector(17 downto 0)
    );
    attribute eta_mti_vect_attrib : integer;
    attribute eta_mti_vect_attrib of eta : constant is 0;
    attribute rho_mti_vect_attrib : integer;
    attribute rho_mti_vect_attrib of rho : constant is 0;
end drum_node;
