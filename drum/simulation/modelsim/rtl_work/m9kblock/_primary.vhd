library verilog;
use verilog.vl_types.all;
entity m9kblock is
    port(
        address_a       : in     vl_logic_vector(6 downto 0);
        address_b       : in     vl_logic_vector(6 downto 0);
        clock           : in     vl_logic;
        data_a          : in     vl_logic_vector(17 downto 0);
        data_b          : in     vl_logic_vector(17 downto 0);
        wren_a          : in     vl_logic;
        wren_b          : in     vl_logic;
        q_a             : out    vl_logic_vector(17 downto 0);
        q_b             : out    vl_logic_vector(17 downto 0)
    );
end m9kblock;
