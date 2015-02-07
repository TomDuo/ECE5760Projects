// nios2processor.v


`timescale 1 ps / 1 ps
module nios2processor (
		input  wire  reset_reset_n, // reset.reset_n
		input  wire  clk_clk        //   clk.clk
	);

	wire         cpu_instruction_master_waitrequest;                                                               // cpu_instruction_master_translator:av_waitrequest -> cpu:i_waitrequest
	wire  [19:0] cpu_instruction_master_address;                                                                   // cpu:i_address -> cpu_instruction_master_translator:av_address
	wire         cpu_instruction_master_read;                                                                      // cpu:i_read -> cpu_instruction_master_translator:av_read
	wire  [31:0] cpu_instruction_master_readdata;                                                                  // cpu_instruction_master_translator:av_readdata -> cpu:i_readdata
	wire         cpu_instruction_master_readdatavalid;                                                             // cpu_instruction_master_translator:av_readdatavalid -> cpu:i_readdatavalid
	wire         cpu_data_master_waitrequest;                                                                      // cpu_data_master_translator:av_waitrequest -> cpu:d_waitrequest
	wire  [31:0] cpu_data_master_writedata;                                                                        // cpu:d_writedata -> cpu_data_master_translator:av_writedata
	wire  [19:0] cpu_data_master_address;                                                                          // cpu:d_address -> cpu_data_master_translator:av_address
	wire         cpu_data_master_write;                                                                            // cpu:d_write -> cpu_data_master_translator:av_write
	wire         cpu_data_master_read;                                                                             // cpu:d_read -> cpu_data_master_translator:av_read
	wire  [31:0] cpu_data_master_readdata;                                                                         // cpu_data_master_translator:av_readdata -> cpu:d_readdata
	wire         cpu_data_master_debugaccess;                                                                      // cpu:jtag_debug_module_debugaccess_to_roms -> cpu_data_master_translator:av_debugaccess
	wire         cpu_data_master_readdatavalid;                                                                    // cpu_data_master_translator:av_readdatavalid -> cpu:d_readdatavalid
	wire   [3:0] cpu_data_master_byteenable;                                                                       // cpu:d_byteenable -> cpu_data_master_translator:av_byteenable
	wire  [31:0] cpu_jtag_debug_module_translator_avalon_anti_slave_0_writedata;                                   // cpu_jtag_debug_module_translator:av_writedata -> cpu:jtag_debug_module_writedata
	wire   [8:0] cpu_jtag_debug_module_translator_avalon_anti_slave_0_address;                                     // cpu_jtag_debug_module_translator:av_address -> cpu:jtag_debug_module_address
	wire         cpu_jtag_debug_module_translator_avalon_anti_slave_0_chipselect;                                  // cpu_jtag_debug_module_translator:av_chipselect -> cpu:jtag_debug_module_select
	wire         cpu_jtag_debug_module_translator_avalon_anti_slave_0_write;                                       // cpu_jtag_debug_module_translator:av_write -> cpu:jtag_debug_module_write
	wire  [31:0] cpu_jtag_debug_module_translator_avalon_anti_slave_0_readdata;                                    // cpu:jtag_debug_module_readdata -> cpu_jtag_debug_module_translator:av_readdata
	wire         cpu_jtag_debug_module_translator_avalon_anti_slave_0_begintransfer;                               // cpu_jtag_debug_module_translator:av_begintransfer -> cpu:jtag_debug_module_begintransfer
	wire         cpu_jtag_debug_module_translator_avalon_anti_slave_0_debugaccess;                                 // cpu_jtag_debug_module_translator:av_debugaccess -> cpu:jtag_debug_module_debugaccess
	wire   [3:0] cpu_jtag_debug_module_translator_avalon_anti_slave_0_byteenable;                                  // cpu_jtag_debug_module_translator:av_byteenable -> cpu:jtag_debug_module_byteenable
	wire  [31:0] memory_s1_translator_avalon_anti_slave_0_writedata;                                               // memory_s1_translator:av_writedata -> memory:writedata
	wire  [15:0] memory_s1_translator_avalon_anti_slave_0_address;                                                 // memory_s1_translator:av_address -> memory:address
	wire         memory_s1_translator_avalon_anti_slave_0_chipselect;                                              // memory_s1_translator:av_chipselect -> memory:chipselect
	wire         memory_s1_translator_avalon_anti_slave_0_clken;                                                   // memory_s1_translator:av_clken -> memory:clken
	wire         memory_s1_translator_avalon_anti_slave_0_write;                                                   // memory_s1_translator:av_write -> memory:write
	wire  [31:0] memory_s1_translator_avalon_anti_slave_0_readdata;                                                // memory:readdata -> memory_s1_translator:av_readdata
	wire   [3:0] memory_s1_translator_avalon_anti_slave_0_byteenable;                                              // memory_s1_translator:av_byteenable -> memory:byteenable
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_waitrequest;                           // jtag_uart:av_waitrequest -> jtag_uart_avalon_jtag_slave_translator:av_waitrequest
	wire  [31:0] jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_writedata;                             // jtag_uart_avalon_jtag_slave_translator:av_writedata -> jtag_uart:av_writedata
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_address;                               // jtag_uart_avalon_jtag_slave_translator:av_address -> jtag_uart:av_address
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_chipselect;                            // jtag_uart_avalon_jtag_slave_translator:av_chipselect -> jtag_uart:av_chipselect
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_write;                                 // jtag_uart_avalon_jtag_slave_translator:av_write -> jtag_uart:av_write_n
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_read;                                  // jtag_uart_avalon_jtag_slave_translator:av_read -> jtag_uart:av_read_n
	wire  [31:0] jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_readdata;                              // jtag_uart:av_readdata -> jtag_uart_avalon_jtag_slave_translator:av_readdata
	wire   [7:0] lcd_0_control_slave_translator_avalon_anti_slave_0_writedata;                                     // lcd_0_control_slave_translator:av_writedata -> lcd_0:writedata
	wire   [1:0] lcd_0_control_slave_translator_avalon_anti_slave_0_address;                                       // lcd_0_control_slave_translator:av_address -> lcd_0:address
	wire         lcd_0_control_slave_translator_avalon_anti_slave_0_write;                                         // lcd_0_control_slave_translator:av_write -> lcd_0:write
	wire         lcd_0_control_slave_translator_avalon_anti_slave_0_read;                                          // lcd_0_control_slave_translator:av_read -> lcd_0:read
	wire   [7:0] lcd_0_control_slave_translator_avalon_anti_slave_0_readdata;                                      // lcd_0:readdata -> lcd_0_control_slave_translator:av_readdata
	wire         lcd_0_control_slave_translator_avalon_anti_slave_0_begintransfer;                                 // lcd_0_control_slave_translator:av_begintransfer -> lcd_0:begintransfer
	wire         cpu_instruction_master_translator_avalon_universal_master_0_waitrequest;                          // cpu_instruction_master_translator_avalon_universal_master_0_agent:av_waitrequest -> cpu_instruction_master_translator:uav_waitrequest
	wire   [2:0] cpu_instruction_master_translator_avalon_universal_master_0_burstcount;                           // cpu_instruction_master_translator:uav_burstcount -> cpu_instruction_master_translator_avalon_universal_master_0_agent:av_burstcount
	wire  [31:0] cpu_instruction_master_translator_avalon_universal_master_0_writedata;                            // cpu_instruction_master_translator:uav_writedata -> cpu_instruction_master_translator_avalon_universal_master_0_agent:av_writedata
	wire  [19:0] cpu_instruction_master_translator_avalon_universal_master_0_address;                              // cpu_instruction_master_translator:uav_address -> cpu_instruction_master_translator_avalon_universal_master_0_agent:av_address
	wire         cpu_instruction_master_translator_avalon_universal_master_0_lock;                                 // cpu_instruction_master_translator:uav_lock -> cpu_instruction_master_translator_avalon_universal_master_0_agent:av_lock
	wire         cpu_instruction_master_translator_avalon_universal_master_0_write;                                // cpu_instruction_master_translator:uav_write -> cpu_instruction_master_translator_avalon_universal_master_0_agent:av_write
	wire         cpu_instruction_master_translator_avalon_universal_master_0_read;                                 // cpu_instruction_master_translator:uav_read -> cpu_instruction_master_translator_avalon_universal_master_0_agent:av_read
	wire  [31:0] cpu_instruction_master_translator_avalon_universal_master_0_readdata;                             // cpu_instruction_master_translator_avalon_universal_master_0_agent:av_readdata -> cpu_instruction_master_translator:uav_readdata
	wire         cpu_instruction_master_translator_avalon_universal_master_0_debugaccess;                          // cpu_instruction_master_translator:uav_debugaccess -> cpu_instruction_master_translator_avalon_universal_master_0_agent:av_debugaccess
	wire   [3:0] cpu_instruction_master_translator_avalon_universal_master_0_byteenable;                           // cpu_instruction_master_translator:uav_byteenable -> cpu_instruction_master_translator_avalon_universal_master_0_agent:av_byteenable
	wire         cpu_instruction_master_translator_avalon_universal_master_0_readdatavalid;                        // cpu_instruction_master_translator_avalon_universal_master_0_agent:av_readdatavalid -> cpu_instruction_master_translator:uav_readdatavalid
	wire         cpu_data_master_translator_avalon_universal_master_0_waitrequest;                                 // cpu_data_master_translator_avalon_universal_master_0_agent:av_waitrequest -> cpu_data_master_translator:uav_waitrequest
	wire   [2:0] cpu_data_master_translator_avalon_universal_master_0_burstcount;                                  // cpu_data_master_translator:uav_burstcount -> cpu_data_master_translator_avalon_universal_master_0_agent:av_burstcount
	wire  [31:0] cpu_data_master_translator_avalon_universal_master_0_writedata;                                   // cpu_data_master_translator:uav_writedata -> cpu_data_master_translator_avalon_universal_master_0_agent:av_writedata
	wire  [19:0] cpu_data_master_translator_avalon_universal_master_0_address;                                     // cpu_data_master_translator:uav_address -> cpu_data_master_translator_avalon_universal_master_0_agent:av_address
	wire         cpu_data_master_translator_avalon_universal_master_0_lock;                                        // cpu_data_master_translator:uav_lock -> cpu_data_master_translator_avalon_universal_master_0_agent:av_lock
	wire         cpu_data_master_translator_avalon_universal_master_0_write;                                       // cpu_data_master_translator:uav_write -> cpu_data_master_translator_avalon_universal_master_0_agent:av_write
	wire         cpu_data_master_translator_avalon_universal_master_0_read;                                        // cpu_data_master_translator:uav_read -> cpu_data_master_translator_avalon_universal_master_0_agent:av_read
	wire  [31:0] cpu_data_master_translator_avalon_universal_master_0_readdata;                                    // cpu_data_master_translator_avalon_universal_master_0_agent:av_readdata -> cpu_data_master_translator:uav_readdata
	wire         cpu_data_master_translator_avalon_universal_master_0_debugaccess;                                 // cpu_data_master_translator:uav_debugaccess -> cpu_data_master_translator_avalon_universal_master_0_agent:av_debugaccess
	wire   [3:0] cpu_data_master_translator_avalon_universal_master_0_byteenable;                                  // cpu_data_master_translator:uav_byteenable -> cpu_data_master_translator_avalon_universal_master_0_agent:av_byteenable
	wire         cpu_data_master_translator_avalon_universal_master_0_readdatavalid;                               // cpu_data_master_translator_avalon_universal_master_0_agent:av_readdatavalid -> cpu_data_master_translator:uav_readdatavalid
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_waitrequest;                   // cpu_jtag_debug_module_translator:uav_waitrequest -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_burstcount;                    // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_burstcount -> cpu_jtag_debug_module_translator:uav_burstcount
	wire  [31:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_writedata;                     // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_writedata -> cpu_jtag_debug_module_translator:uav_writedata
	wire  [19:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_address;                       // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_address -> cpu_jtag_debug_module_translator:uav_address
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_write;                         // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_write -> cpu_jtag_debug_module_translator:uav_write
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_lock;                          // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_lock -> cpu_jtag_debug_module_translator:uav_lock
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_read;                          // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_read -> cpu_jtag_debug_module_translator:uav_read
	wire  [31:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdata;                      // cpu_jtag_debug_module_translator:uav_readdata -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                 // cpu_jtag_debug_module_translator:uav_readdatavalid -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_debugaccess;                   // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_debugaccess -> cpu_jtag_debug_module_translator:uav_debugaccess
	wire   [3:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_byteenable;                    // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_byteenable -> cpu_jtag_debug_module_translator:uav_byteenable
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;            // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_valid;                  // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_valid -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;          // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [75:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_data;                   // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_data -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_ready;                  // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;         // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;               // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;       // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [75:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;               // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_ready -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;             // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;              // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;             // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         memory_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest;                               // memory_s1_translator:uav_waitrequest -> memory_s1_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] memory_s1_translator_avalon_universal_slave_0_agent_m0_burstcount;                                // memory_s1_translator_avalon_universal_slave_0_agent:m0_burstcount -> memory_s1_translator:uav_burstcount
	wire  [31:0] memory_s1_translator_avalon_universal_slave_0_agent_m0_writedata;                                 // memory_s1_translator_avalon_universal_slave_0_agent:m0_writedata -> memory_s1_translator:uav_writedata
	wire  [19:0] memory_s1_translator_avalon_universal_slave_0_agent_m0_address;                                   // memory_s1_translator_avalon_universal_slave_0_agent:m0_address -> memory_s1_translator:uav_address
	wire         memory_s1_translator_avalon_universal_slave_0_agent_m0_write;                                     // memory_s1_translator_avalon_universal_slave_0_agent:m0_write -> memory_s1_translator:uav_write
	wire         memory_s1_translator_avalon_universal_slave_0_agent_m0_lock;                                      // memory_s1_translator_avalon_universal_slave_0_agent:m0_lock -> memory_s1_translator:uav_lock
	wire         memory_s1_translator_avalon_universal_slave_0_agent_m0_read;                                      // memory_s1_translator_avalon_universal_slave_0_agent:m0_read -> memory_s1_translator:uav_read
	wire  [31:0] memory_s1_translator_avalon_universal_slave_0_agent_m0_readdata;                                  // memory_s1_translator:uav_readdata -> memory_s1_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         memory_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                             // memory_s1_translator:uav_readdatavalid -> memory_s1_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         memory_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess;                               // memory_s1_translator_avalon_universal_slave_0_agent:m0_debugaccess -> memory_s1_translator:uav_debugaccess
	wire   [3:0] memory_s1_translator_avalon_universal_slave_0_agent_m0_byteenable;                                // memory_s1_translator_avalon_universal_slave_0_agent:m0_byteenable -> memory_s1_translator:uav_byteenable
	wire         memory_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                        // memory_s1_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         memory_s1_translator_avalon_universal_slave_0_agent_rf_source_valid;                              // memory_s1_translator_avalon_universal_slave_0_agent:rf_source_valid -> memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         memory_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                      // memory_s1_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [75:0] memory_s1_translator_avalon_universal_slave_0_agent_rf_source_data;                               // memory_s1_translator_avalon_universal_slave_0_agent:rf_source_data -> memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         memory_s1_translator_avalon_universal_slave_0_agent_rf_source_ready;                              // memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> memory_s1_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                     // memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> memory_s1_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                           // memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> memory_s1_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;                   // memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> memory_s1_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [75:0] memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                            // memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> memory_s1_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                           // memory_s1_translator_avalon_universal_slave_0_agent:rf_sink_ready -> memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         memory_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                         // memory_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> memory_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] memory_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                          // memory_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> memory_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         memory_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                         // memory_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> memory_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest;             // jtag_uart_avalon_jtag_slave_translator:uav_waitrequest -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_burstcount;              // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_burstcount -> jtag_uart_avalon_jtag_slave_translator:uav_burstcount
	wire  [31:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_writedata;               // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_writedata -> jtag_uart_avalon_jtag_slave_translator:uav_writedata
	wire  [19:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_address;                 // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_address -> jtag_uart_avalon_jtag_slave_translator:uav_address
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_write;                   // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_write -> jtag_uart_avalon_jtag_slave_translator:uav_write
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_lock;                    // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_lock -> jtag_uart_avalon_jtag_slave_translator:uav_lock
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_read;                    // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_read -> jtag_uart_avalon_jtag_slave_translator:uav_read
	wire  [31:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdata;                // jtag_uart_avalon_jtag_slave_translator:uav_readdata -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid;           // jtag_uart_avalon_jtag_slave_translator:uav_readdatavalid -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess;             // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_debugaccess -> jtag_uart_avalon_jtag_slave_translator:uav_debugaccess
	wire   [3:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_byteenable;              // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_byteenable -> jtag_uart_avalon_jtag_slave_translator:uav_byteenable
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;      // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_valid;            // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_valid -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;    // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [75:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_data;             // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_data -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_ready;            // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;   // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;         // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket; // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [75:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;          // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;         // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_ready -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;       // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;        // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;       // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest;                     // lcd_0_control_slave_translator:uav_waitrequest -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_burstcount;                      // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_burstcount -> lcd_0_control_slave_translator:uav_burstcount
	wire  [31:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_writedata;                       // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_writedata -> lcd_0_control_slave_translator:uav_writedata
	wire  [19:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_address;                         // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_address -> lcd_0_control_slave_translator:uav_address
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_write;                           // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_write -> lcd_0_control_slave_translator:uav_write
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_lock;                            // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_lock -> lcd_0_control_slave_translator:uav_lock
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_read;                            // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_read -> lcd_0_control_slave_translator:uav_read
	wire  [31:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdata;                        // lcd_0_control_slave_translator:uav_readdata -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                   // lcd_0_control_slave_translator:uav_readdatavalid -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess;                     // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_debugaccess -> lcd_0_control_slave_translator:uav_debugaccess
	wire   [3:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_byteenable;                      // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_byteenable -> lcd_0_control_slave_translator:uav_byteenable
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;              // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_valid;                    // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_source_valid -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;            // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [75:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_data;                     // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_source_data -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_ready;                    // lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;           // lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                 // lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;         // lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [75:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                  // lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                 // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_sink_ready -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;               // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;               // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_endofpacket;                 // cpu_instruction_master_translator_avalon_universal_master_0_agent:cp_endofpacket -> addr_router:sink_endofpacket
	wire         cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_valid;                       // cpu_instruction_master_translator_avalon_universal_master_0_agent:cp_valid -> addr_router:sink_valid
	wire         cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_startofpacket;               // cpu_instruction_master_translator_avalon_universal_master_0_agent:cp_startofpacket -> addr_router:sink_startofpacket
	wire  [74:0] cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_data;                        // cpu_instruction_master_translator_avalon_universal_master_0_agent:cp_data -> addr_router:sink_data
	wire         cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_ready;                       // addr_router:sink_ready -> cpu_instruction_master_translator_avalon_universal_master_0_agent:cp_ready
	wire         cpu_data_master_translator_avalon_universal_master_0_agent_cp_endofpacket;                        // cpu_data_master_translator_avalon_universal_master_0_agent:cp_endofpacket -> addr_router_001:sink_endofpacket
	wire         cpu_data_master_translator_avalon_universal_master_0_agent_cp_valid;                              // cpu_data_master_translator_avalon_universal_master_0_agent:cp_valid -> addr_router_001:sink_valid
	wire         cpu_data_master_translator_avalon_universal_master_0_agent_cp_startofpacket;                      // cpu_data_master_translator_avalon_universal_master_0_agent:cp_startofpacket -> addr_router_001:sink_startofpacket
	wire  [74:0] cpu_data_master_translator_avalon_universal_master_0_agent_cp_data;                               // cpu_data_master_translator_avalon_universal_master_0_agent:cp_data -> addr_router_001:sink_data
	wire         cpu_data_master_translator_avalon_universal_master_0_agent_cp_ready;                              // addr_router_001:sink_ready -> cpu_data_master_translator_avalon_universal_master_0_agent:cp_ready
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_endofpacket;                   // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router:sink_endofpacket
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_valid;                         // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_valid -> id_router:sink_valid
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_startofpacket;                 // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router:sink_startofpacket
	wire  [74:0] cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_data;                          // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_data -> id_router:sink_data
	wire         cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_ready;                         // id_router:sink_ready -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_ready
	wire         memory_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket;                               // memory_s1_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_001:sink_endofpacket
	wire         memory_s1_translator_avalon_universal_slave_0_agent_rp_valid;                                     // memory_s1_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_001:sink_valid
	wire         memory_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket;                             // memory_s1_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_001:sink_startofpacket
	wire  [74:0] memory_s1_translator_avalon_universal_slave_0_agent_rp_data;                                      // memory_s1_translator_avalon_universal_slave_0_agent:rp_data -> id_router_001:sink_data
	wire         memory_s1_translator_avalon_universal_slave_0_agent_rp_ready;                                     // id_router_001:sink_ready -> memory_s1_translator_avalon_universal_slave_0_agent:rp_ready
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket;             // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_002:sink_endofpacket
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_valid;                   // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_002:sink_valid
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket;           // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_002:sink_startofpacket
	wire  [74:0] jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_data;                    // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_data -> id_router_002:sink_data
	wire         jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_ready;                   // id_router_002:sink_ready -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_ready
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket;                     // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_003:sink_endofpacket
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_valid;                           // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_003:sink_valid
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket;                   // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_003:sink_startofpacket
	wire  [74:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_data;                            // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rp_data -> id_router_003:sink_data
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_ready;                           // id_router_003:sink_ready -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rp_ready
	wire         addr_router_src_endofpacket;                                                                      // addr_router:src_endofpacket -> limiter:cmd_sink_endofpacket
	wire         addr_router_src_valid;                                                                            // addr_router:src_valid -> limiter:cmd_sink_valid
	wire         addr_router_src_startofpacket;                                                                    // addr_router:src_startofpacket -> limiter:cmd_sink_startofpacket
	wire  [74:0] addr_router_src_data;                                                                             // addr_router:src_data -> limiter:cmd_sink_data
	wire   [3:0] addr_router_src_channel;                                                                          // addr_router:src_channel -> limiter:cmd_sink_channel
	wire         addr_router_src_ready;                                                                            // limiter:cmd_sink_ready -> addr_router:src_ready
	wire         limiter_rsp_src_endofpacket;                                                                      // limiter:rsp_src_endofpacket -> cpu_instruction_master_translator_avalon_universal_master_0_agent:rp_endofpacket
	wire         limiter_rsp_src_valid;                                                                            // limiter:rsp_src_valid -> cpu_instruction_master_translator_avalon_universal_master_0_agent:rp_valid
	wire         limiter_rsp_src_startofpacket;                                                                    // limiter:rsp_src_startofpacket -> cpu_instruction_master_translator_avalon_universal_master_0_agent:rp_startofpacket
	wire  [74:0] limiter_rsp_src_data;                                                                             // limiter:rsp_src_data -> cpu_instruction_master_translator_avalon_universal_master_0_agent:rp_data
	wire   [3:0] limiter_rsp_src_channel;                                                                          // limiter:rsp_src_channel -> cpu_instruction_master_translator_avalon_universal_master_0_agent:rp_channel
	wire         limiter_rsp_src_ready;                                                                            // cpu_instruction_master_translator_avalon_universal_master_0_agent:rp_ready -> limiter:rsp_src_ready
	wire         addr_router_001_src_endofpacket;                                                                  // addr_router_001:src_endofpacket -> limiter_001:cmd_sink_endofpacket
	wire         addr_router_001_src_valid;                                                                        // addr_router_001:src_valid -> limiter_001:cmd_sink_valid
	wire         addr_router_001_src_startofpacket;                                                                // addr_router_001:src_startofpacket -> limiter_001:cmd_sink_startofpacket
	wire  [74:0] addr_router_001_src_data;                                                                         // addr_router_001:src_data -> limiter_001:cmd_sink_data
	wire   [3:0] addr_router_001_src_channel;                                                                      // addr_router_001:src_channel -> limiter_001:cmd_sink_channel
	wire         addr_router_001_src_ready;                                                                        // limiter_001:cmd_sink_ready -> addr_router_001:src_ready
	wire         limiter_001_rsp_src_endofpacket;                                                                  // limiter_001:rsp_src_endofpacket -> cpu_data_master_translator_avalon_universal_master_0_agent:rp_endofpacket
	wire         limiter_001_rsp_src_valid;                                                                        // limiter_001:rsp_src_valid -> cpu_data_master_translator_avalon_universal_master_0_agent:rp_valid
	wire         limiter_001_rsp_src_startofpacket;                                                                // limiter_001:rsp_src_startofpacket -> cpu_data_master_translator_avalon_universal_master_0_agent:rp_startofpacket
	wire  [74:0] limiter_001_rsp_src_data;                                                                         // limiter_001:rsp_src_data -> cpu_data_master_translator_avalon_universal_master_0_agent:rp_data
	wire   [3:0] limiter_001_rsp_src_channel;                                                                      // limiter_001:rsp_src_channel -> cpu_data_master_translator_avalon_universal_master_0_agent:rp_channel
	wire         limiter_001_rsp_src_ready;                                                                        // cpu_data_master_translator_avalon_universal_master_0_agent:rp_ready -> limiter_001:rsp_src_ready
	wire         rst_controller_reset_out_reset;                                                                   // rst_controller:reset_out -> [addr_router:reset, addr_router_001:reset, cmd_xbar_demux:reset, cmd_xbar_demux_001:reset, cmd_xbar_mux:reset, cmd_xbar_mux_001:reset, cpu:reset_n, cpu_data_master_translator:reset, cpu_data_master_translator_avalon_universal_master_0_agent:reset, cpu_instruction_master_translator:reset, cpu_instruction_master_translator_avalon_universal_master_0_agent:reset, cpu_jtag_debug_module_translator:reset, cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:reset, cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, id_router:reset, id_router_001:reset, id_router_002:reset, id_router_003:reset, irq_mapper:reset, jtag_uart:rst_n, jtag_uart_avalon_jtag_slave_translator:reset, jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:reset, jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, lcd_0:reset_n, lcd_0_control_slave_translator:reset, lcd_0_control_slave_translator_avalon_universal_slave_0_agent:reset, lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, limiter:reset, limiter_001:reset, memory:reset, memory_s1_translator:reset, memory_s1_translator_avalon_universal_slave_0_agent:reset, memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, rsp_xbar_demux:reset, rsp_xbar_demux_001:reset, rsp_xbar_demux_002:reset, rsp_xbar_demux_003:reset, rsp_xbar_mux:reset, rsp_xbar_mux_001:reset]
	wire         cmd_xbar_demux_src0_endofpacket;                                                                  // cmd_xbar_demux:src0_endofpacket -> cmd_xbar_mux:sink0_endofpacket
	wire         cmd_xbar_demux_src0_valid;                                                                        // cmd_xbar_demux:src0_valid -> cmd_xbar_mux:sink0_valid
	wire         cmd_xbar_demux_src0_startofpacket;                                                                // cmd_xbar_demux:src0_startofpacket -> cmd_xbar_mux:sink0_startofpacket
	wire  [74:0] cmd_xbar_demux_src0_data;                                                                         // cmd_xbar_demux:src0_data -> cmd_xbar_mux:sink0_data
	wire   [3:0] cmd_xbar_demux_src0_channel;                                                                      // cmd_xbar_demux:src0_channel -> cmd_xbar_mux:sink0_channel
	wire         cmd_xbar_demux_src0_ready;                                                                        // cmd_xbar_mux:sink0_ready -> cmd_xbar_demux:src0_ready
	wire         cmd_xbar_demux_src1_endofpacket;                                                                  // cmd_xbar_demux:src1_endofpacket -> cmd_xbar_mux_001:sink0_endofpacket
	wire         cmd_xbar_demux_src1_valid;                                                                        // cmd_xbar_demux:src1_valid -> cmd_xbar_mux_001:sink0_valid
	wire         cmd_xbar_demux_src1_startofpacket;                                                                // cmd_xbar_demux:src1_startofpacket -> cmd_xbar_mux_001:sink0_startofpacket
	wire  [74:0] cmd_xbar_demux_src1_data;                                                                         // cmd_xbar_demux:src1_data -> cmd_xbar_mux_001:sink0_data
	wire   [3:0] cmd_xbar_demux_src1_channel;                                                                      // cmd_xbar_demux:src1_channel -> cmd_xbar_mux_001:sink0_channel
	wire         cmd_xbar_demux_src1_ready;                                                                        // cmd_xbar_mux_001:sink0_ready -> cmd_xbar_demux:src1_ready
	wire         cmd_xbar_demux_001_src0_endofpacket;                                                              // cmd_xbar_demux_001:src0_endofpacket -> cmd_xbar_mux:sink1_endofpacket
	wire         cmd_xbar_demux_001_src0_valid;                                                                    // cmd_xbar_demux_001:src0_valid -> cmd_xbar_mux:sink1_valid
	wire         cmd_xbar_demux_001_src0_startofpacket;                                                            // cmd_xbar_demux_001:src0_startofpacket -> cmd_xbar_mux:sink1_startofpacket
	wire  [74:0] cmd_xbar_demux_001_src0_data;                                                                     // cmd_xbar_demux_001:src0_data -> cmd_xbar_mux:sink1_data
	wire   [3:0] cmd_xbar_demux_001_src0_channel;                                                                  // cmd_xbar_demux_001:src0_channel -> cmd_xbar_mux:sink1_channel
	wire         cmd_xbar_demux_001_src0_ready;                                                                    // cmd_xbar_mux:sink1_ready -> cmd_xbar_demux_001:src0_ready
	wire         cmd_xbar_demux_001_src1_endofpacket;                                                              // cmd_xbar_demux_001:src1_endofpacket -> cmd_xbar_mux_001:sink1_endofpacket
	wire         cmd_xbar_demux_001_src1_valid;                                                                    // cmd_xbar_demux_001:src1_valid -> cmd_xbar_mux_001:sink1_valid
	wire         cmd_xbar_demux_001_src1_startofpacket;                                                            // cmd_xbar_demux_001:src1_startofpacket -> cmd_xbar_mux_001:sink1_startofpacket
	wire  [74:0] cmd_xbar_demux_001_src1_data;                                                                     // cmd_xbar_demux_001:src1_data -> cmd_xbar_mux_001:sink1_data
	wire   [3:0] cmd_xbar_demux_001_src1_channel;                                                                  // cmd_xbar_demux_001:src1_channel -> cmd_xbar_mux_001:sink1_channel
	wire         cmd_xbar_demux_001_src1_ready;                                                                    // cmd_xbar_mux_001:sink1_ready -> cmd_xbar_demux_001:src1_ready
	wire         cmd_xbar_demux_001_src2_endofpacket;                                                              // cmd_xbar_demux_001:src2_endofpacket -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src2_valid;                                                                    // cmd_xbar_demux_001:src2_valid -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src2_startofpacket;                                                            // cmd_xbar_demux_001:src2_startofpacket -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [74:0] cmd_xbar_demux_001_src2_data;                                                                     // cmd_xbar_demux_001:src2_data -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_data
	wire   [3:0] cmd_xbar_demux_001_src2_channel;                                                                  // cmd_xbar_demux_001:src2_channel -> jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_demux_001_src3_endofpacket;                                                              // cmd_xbar_demux_001:src3_endofpacket -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src3_valid;                                                                    // cmd_xbar_demux_001:src3_valid -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src3_startofpacket;                                                            // cmd_xbar_demux_001:src3_startofpacket -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [74:0] cmd_xbar_demux_001_src3_data;                                                                     // cmd_xbar_demux_001:src3_data -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:cp_data
	wire   [3:0] cmd_xbar_demux_001_src3_channel;                                                                  // cmd_xbar_demux_001:src3_channel -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:cp_channel
	wire         rsp_xbar_demux_src0_endofpacket;                                                                  // rsp_xbar_demux:src0_endofpacket -> rsp_xbar_mux:sink0_endofpacket
	wire         rsp_xbar_demux_src0_valid;                                                                        // rsp_xbar_demux:src0_valid -> rsp_xbar_mux:sink0_valid
	wire         rsp_xbar_demux_src0_startofpacket;                                                                // rsp_xbar_demux:src0_startofpacket -> rsp_xbar_mux:sink0_startofpacket
	wire  [74:0] rsp_xbar_demux_src0_data;                                                                         // rsp_xbar_demux:src0_data -> rsp_xbar_mux:sink0_data
	wire   [3:0] rsp_xbar_demux_src0_channel;                                                                      // rsp_xbar_demux:src0_channel -> rsp_xbar_mux:sink0_channel
	wire         rsp_xbar_demux_src0_ready;                                                                        // rsp_xbar_mux:sink0_ready -> rsp_xbar_demux:src0_ready
	wire         rsp_xbar_demux_src1_endofpacket;                                                                  // rsp_xbar_demux:src1_endofpacket -> rsp_xbar_mux_001:sink0_endofpacket
	wire         rsp_xbar_demux_src1_valid;                                                                        // rsp_xbar_demux:src1_valid -> rsp_xbar_mux_001:sink0_valid
	wire         rsp_xbar_demux_src1_startofpacket;                                                                // rsp_xbar_demux:src1_startofpacket -> rsp_xbar_mux_001:sink0_startofpacket
	wire  [74:0] rsp_xbar_demux_src1_data;                                                                         // rsp_xbar_demux:src1_data -> rsp_xbar_mux_001:sink0_data
	wire   [3:0] rsp_xbar_demux_src1_channel;                                                                      // rsp_xbar_demux:src1_channel -> rsp_xbar_mux_001:sink0_channel
	wire         rsp_xbar_demux_src1_ready;                                                                        // rsp_xbar_mux_001:sink0_ready -> rsp_xbar_demux:src1_ready
	wire         rsp_xbar_demux_001_src0_endofpacket;                                                              // rsp_xbar_demux_001:src0_endofpacket -> rsp_xbar_mux:sink1_endofpacket
	wire         rsp_xbar_demux_001_src0_valid;                                                                    // rsp_xbar_demux_001:src0_valid -> rsp_xbar_mux:sink1_valid
	wire         rsp_xbar_demux_001_src0_startofpacket;                                                            // rsp_xbar_demux_001:src0_startofpacket -> rsp_xbar_mux:sink1_startofpacket
	wire  [74:0] rsp_xbar_demux_001_src0_data;                                                                     // rsp_xbar_demux_001:src0_data -> rsp_xbar_mux:sink1_data
	wire   [3:0] rsp_xbar_demux_001_src0_channel;                                                                  // rsp_xbar_demux_001:src0_channel -> rsp_xbar_mux:sink1_channel
	wire         rsp_xbar_demux_001_src0_ready;                                                                    // rsp_xbar_mux:sink1_ready -> rsp_xbar_demux_001:src0_ready
	wire         rsp_xbar_demux_001_src1_endofpacket;                                                              // rsp_xbar_demux_001:src1_endofpacket -> rsp_xbar_mux_001:sink1_endofpacket
	wire         rsp_xbar_demux_001_src1_valid;                                                                    // rsp_xbar_demux_001:src1_valid -> rsp_xbar_mux_001:sink1_valid
	wire         rsp_xbar_demux_001_src1_startofpacket;                                                            // rsp_xbar_demux_001:src1_startofpacket -> rsp_xbar_mux_001:sink1_startofpacket
	wire  [74:0] rsp_xbar_demux_001_src1_data;                                                                     // rsp_xbar_demux_001:src1_data -> rsp_xbar_mux_001:sink1_data
	wire   [3:0] rsp_xbar_demux_001_src1_channel;                                                                  // rsp_xbar_demux_001:src1_channel -> rsp_xbar_mux_001:sink1_channel
	wire         rsp_xbar_demux_001_src1_ready;                                                                    // rsp_xbar_mux_001:sink1_ready -> rsp_xbar_demux_001:src1_ready
	wire         rsp_xbar_demux_002_src0_endofpacket;                                                              // rsp_xbar_demux_002:src0_endofpacket -> rsp_xbar_mux_001:sink2_endofpacket
	wire         rsp_xbar_demux_002_src0_valid;                                                                    // rsp_xbar_demux_002:src0_valid -> rsp_xbar_mux_001:sink2_valid
	wire         rsp_xbar_demux_002_src0_startofpacket;                                                            // rsp_xbar_demux_002:src0_startofpacket -> rsp_xbar_mux_001:sink2_startofpacket
	wire  [74:0] rsp_xbar_demux_002_src0_data;                                                                     // rsp_xbar_demux_002:src0_data -> rsp_xbar_mux_001:sink2_data
	wire   [3:0] rsp_xbar_demux_002_src0_channel;                                                                  // rsp_xbar_demux_002:src0_channel -> rsp_xbar_mux_001:sink2_channel
	wire         rsp_xbar_demux_002_src0_ready;                                                                    // rsp_xbar_mux_001:sink2_ready -> rsp_xbar_demux_002:src0_ready
	wire         rsp_xbar_demux_003_src0_endofpacket;                                                              // rsp_xbar_demux_003:src0_endofpacket -> rsp_xbar_mux_001:sink3_endofpacket
	wire         rsp_xbar_demux_003_src0_valid;                                                                    // rsp_xbar_demux_003:src0_valid -> rsp_xbar_mux_001:sink3_valid
	wire         rsp_xbar_demux_003_src0_startofpacket;                                                            // rsp_xbar_demux_003:src0_startofpacket -> rsp_xbar_mux_001:sink3_startofpacket
	wire  [74:0] rsp_xbar_demux_003_src0_data;                                                                     // rsp_xbar_demux_003:src0_data -> rsp_xbar_mux_001:sink3_data
	wire   [3:0] rsp_xbar_demux_003_src0_channel;                                                                  // rsp_xbar_demux_003:src0_channel -> rsp_xbar_mux_001:sink3_channel
	wire         rsp_xbar_demux_003_src0_ready;                                                                    // rsp_xbar_mux_001:sink3_ready -> rsp_xbar_demux_003:src0_ready
	wire         limiter_cmd_src_endofpacket;                                                                      // limiter:cmd_src_endofpacket -> cmd_xbar_demux:sink_endofpacket
	wire         limiter_cmd_src_startofpacket;                                                                    // limiter:cmd_src_startofpacket -> cmd_xbar_demux:sink_startofpacket
	wire  [74:0] limiter_cmd_src_data;                                                                             // limiter:cmd_src_data -> cmd_xbar_demux:sink_data
	wire   [3:0] limiter_cmd_src_channel;                                                                          // limiter:cmd_src_channel -> cmd_xbar_demux:sink_channel
	wire         limiter_cmd_src_ready;                                                                            // cmd_xbar_demux:sink_ready -> limiter:cmd_src_ready
	wire         rsp_xbar_mux_src_endofpacket;                                                                     // rsp_xbar_mux:src_endofpacket -> limiter:rsp_sink_endofpacket
	wire         rsp_xbar_mux_src_valid;                                                                           // rsp_xbar_mux:src_valid -> limiter:rsp_sink_valid
	wire         rsp_xbar_mux_src_startofpacket;                                                                   // rsp_xbar_mux:src_startofpacket -> limiter:rsp_sink_startofpacket
	wire  [74:0] rsp_xbar_mux_src_data;                                                                            // rsp_xbar_mux:src_data -> limiter:rsp_sink_data
	wire   [3:0] rsp_xbar_mux_src_channel;                                                                         // rsp_xbar_mux:src_channel -> limiter:rsp_sink_channel
	wire         rsp_xbar_mux_src_ready;                                                                           // limiter:rsp_sink_ready -> rsp_xbar_mux:src_ready
	wire         limiter_001_cmd_src_endofpacket;                                                                  // limiter_001:cmd_src_endofpacket -> cmd_xbar_demux_001:sink_endofpacket
	wire         limiter_001_cmd_src_startofpacket;                                                                // limiter_001:cmd_src_startofpacket -> cmd_xbar_demux_001:sink_startofpacket
	wire  [74:0] limiter_001_cmd_src_data;                                                                         // limiter_001:cmd_src_data -> cmd_xbar_demux_001:sink_data
	wire   [3:0] limiter_001_cmd_src_channel;                                                                      // limiter_001:cmd_src_channel -> cmd_xbar_demux_001:sink_channel
	wire         limiter_001_cmd_src_ready;                                                                        // cmd_xbar_demux_001:sink_ready -> limiter_001:cmd_src_ready
	wire         rsp_xbar_mux_001_src_endofpacket;                                                                 // rsp_xbar_mux_001:src_endofpacket -> limiter_001:rsp_sink_endofpacket
	wire         rsp_xbar_mux_001_src_valid;                                                                       // rsp_xbar_mux_001:src_valid -> limiter_001:rsp_sink_valid
	wire         rsp_xbar_mux_001_src_startofpacket;                                                               // rsp_xbar_mux_001:src_startofpacket -> limiter_001:rsp_sink_startofpacket
	wire  [74:0] rsp_xbar_mux_001_src_data;                                                                        // rsp_xbar_mux_001:src_data -> limiter_001:rsp_sink_data
	wire   [3:0] rsp_xbar_mux_001_src_channel;                                                                     // rsp_xbar_mux_001:src_channel -> limiter_001:rsp_sink_channel
	wire         rsp_xbar_mux_001_src_ready;                                                                       // limiter_001:rsp_sink_ready -> rsp_xbar_mux_001:src_ready
	wire         cmd_xbar_mux_src_endofpacket;                                                                     // cmd_xbar_mux:src_endofpacket -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_mux_src_valid;                                                                           // cmd_xbar_mux:src_valid -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_mux_src_startofpacket;                                                                   // cmd_xbar_mux:src_startofpacket -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [74:0] cmd_xbar_mux_src_data;                                                                            // cmd_xbar_mux:src_data -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_data
	wire   [3:0] cmd_xbar_mux_src_channel;                                                                         // cmd_xbar_mux:src_channel -> cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_mux_src_ready;                                                                           // cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_mux:src_ready
	wire         id_router_src_endofpacket;                                                                        // id_router:src_endofpacket -> rsp_xbar_demux:sink_endofpacket
	wire         id_router_src_valid;                                                                              // id_router:src_valid -> rsp_xbar_demux:sink_valid
	wire         id_router_src_startofpacket;                                                                      // id_router:src_startofpacket -> rsp_xbar_demux:sink_startofpacket
	wire  [74:0] id_router_src_data;                                                                               // id_router:src_data -> rsp_xbar_demux:sink_data
	wire   [3:0] id_router_src_channel;                                                                            // id_router:src_channel -> rsp_xbar_demux:sink_channel
	wire         id_router_src_ready;                                                                              // rsp_xbar_demux:sink_ready -> id_router:src_ready
	wire         cmd_xbar_mux_001_src_endofpacket;                                                                 // cmd_xbar_mux_001:src_endofpacket -> memory_s1_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_mux_001_src_valid;                                                                       // cmd_xbar_mux_001:src_valid -> memory_s1_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_mux_001_src_startofpacket;                                                               // cmd_xbar_mux_001:src_startofpacket -> memory_s1_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [74:0] cmd_xbar_mux_001_src_data;                                                                        // cmd_xbar_mux_001:src_data -> memory_s1_translator_avalon_universal_slave_0_agent:cp_data
	wire   [3:0] cmd_xbar_mux_001_src_channel;                                                                     // cmd_xbar_mux_001:src_channel -> memory_s1_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_mux_001_src_ready;                                                                       // memory_s1_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_mux_001:src_ready
	wire         id_router_001_src_endofpacket;                                                                    // id_router_001:src_endofpacket -> rsp_xbar_demux_001:sink_endofpacket
	wire         id_router_001_src_valid;                                                                          // id_router_001:src_valid -> rsp_xbar_demux_001:sink_valid
	wire         id_router_001_src_startofpacket;                                                                  // id_router_001:src_startofpacket -> rsp_xbar_demux_001:sink_startofpacket
	wire  [74:0] id_router_001_src_data;                                                                           // id_router_001:src_data -> rsp_xbar_demux_001:sink_data
	wire   [3:0] id_router_001_src_channel;                                                                        // id_router_001:src_channel -> rsp_xbar_demux_001:sink_channel
	wire         id_router_001_src_ready;                                                                          // rsp_xbar_demux_001:sink_ready -> id_router_001:src_ready
	wire         cmd_xbar_demux_001_src2_ready;                                                                    // jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src2_ready
	wire         id_router_002_src_endofpacket;                                                                    // id_router_002:src_endofpacket -> rsp_xbar_demux_002:sink_endofpacket
	wire         id_router_002_src_valid;                                                                          // id_router_002:src_valid -> rsp_xbar_demux_002:sink_valid
	wire         id_router_002_src_startofpacket;                                                                  // id_router_002:src_startofpacket -> rsp_xbar_demux_002:sink_startofpacket
	wire  [74:0] id_router_002_src_data;                                                                           // id_router_002:src_data -> rsp_xbar_demux_002:sink_data
	wire   [3:0] id_router_002_src_channel;                                                                        // id_router_002:src_channel -> rsp_xbar_demux_002:sink_channel
	wire         id_router_002_src_ready;                                                                          // rsp_xbar_demux_002:sink_ready -> id_router_002:src_ready
	wire         cmd_xbar_demux_001_src3_ready;                                                                    // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src3_ready
	wire         id_router_003_src_endofpacket;                                                                    // id_router_003:src_endofpacket -> rsp_xbar_demux_003:sink_endofpacket
	wire         id_router_003_src_valid;                                                                          // id_router_003:src_valid -> rsp_xbar_demux_003:sink_valid
	wire         id_router_003_src_startofpacket;                                                                  // id_router_003:src_startofpacket -> rsp_xbar_demux_003:sink_startofpacket
	wire  [74:0] id_router_003_src_data;                                                                           // id_router_003:src_data -> rsp_xbar_demux_003:sink_data
	wire   [3:0] id_router_003_src_channel;                                                                        // id_router_003:src_channel -> rsp_xbar_demux_003:sink_channel
	wire         id_router_003_src_ready;                                                                          // rsp_xbar_demux_003:sink_ready -> id_router_003:src_ready
	wire   [3:0] limiter_cmd_valid_data;                                                                           // limiter:cmd_src_valid -> cmd_xbar_demux:sink_valid
	wire   [3:0] limiter_001_cmd_valid_data;                                                                       // limiter_001:cmd_src_valid -> cmd_xbar_demux_001:sink_valid
	wire         irq_mapper_receiver0_irq;                                                                         // jtag_uart:av_irq -> irq_mapper:receiver0_irq
	wire  [31:0] cpu_d_irq_irq;                                                                                    // irq_mapper:sender_irq -> cpu:d_irq

	nios2processor_cpu cpu (
		.clk                                   (clk_clk),                                                            //                       clk.clk
		.reset_n                               (~rst_controller_reset_out_reset),                                    //                   reset_n.reset_n
		.d_address                             (cpu_data_master_address),                                            //               data_master.address
		.d_byteenable                          (cpu_data_master_byteenable),                                         //                          .byteenable
		.d_read                                (cpu_data_master_read),                                               //                          .read
		.d_readdata                            (cpu_data_master_readdata),                                           //                          .readdata
		.d_waitrequest                         (cpu_data_master_waitrequest),                                        //                          .waitrequest
		.d_write                               (cpu_data_master_write),                                              //                          .write
		.d_writedata                           (cpu_data_master_writedata),                                          //                          .writedata
		.d_readdatavalid                       (cpu_data_master_readdatavalid),                                      //                          .readdatavalid
		.jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),                                        //                          .debugaccess
		.i_address                             (cpu_instruction_master_address),                                     //        instruction_master.address
		.i_read                                (cpu_instruction_master_read),                                        //                          .read
		.i_readdata                            (cpu_instruction_master_readdata),                                    //                          .readdata
		.i_waitrequest                         (cpu_instruction_master_waitrequest),                                 //                          .waitrequest
		.i_readdatavalid                       (cpu_instruction_master_readdatavalid),                               //                          .readdatavalid
		.d_irq                                 (cpu_d_irq_irq),                                                      //                     d_irq.irq
		.jtag_debug_module_resetrequest        (),                                                                   //   jtag_debug_module_reset.reset
		.jtag_debug_module_address             (cpu_jtag_debug_module_translator_avalon_anti_slave_0_address),       //         jtag_debug_module.address
		.jtag_debug_module_begintransfer       (cpu_jtag_debug_module_translator_avalon_anti_slave_0_begintransfer), //                          .begintransfer
		.jtag_debug_module_byteenable          (cpu_jtag_debug_module_translator_avalon_anti_slave_0_byteenable),    //                          .byteenable
		.jtag_debug_module_debugaccess         (cpu_jtag_debug_module_translator_avalon_anti_slave_0_debugaccess),   //                          .debugaccess
		.jtag_debug_module_readdata            (cpu_jtag_debug_module_translator_avalon_anti_slave_0_readdata),      //                          .readdata
		.jtag_debug_module_select              (cpu_jtag_debug_module_translator_avalon_anti_slave_0_chipselect),    //                          .chipselect
		.jtag_debug_module_write               (cpu_jtag_debug_module_translator_avalon_anti_slave_0_write),         //                          .write
		.jtag_debug_module_writedata           (cpu_jtag_debug_module_translator_avalon_anti_slave_0_writedata),     //                          .writedata
		.no_ci_readra                          ()                                                                    // custom_instruction_master.readra
	);

	nios2processor_memory memory (
		.clk        (clk_clk),                                             //   clk1.clk
		.address    (memory_s1_translator_avalon_anti_slave_0_address),    //     s1.address
		.chipselect (memory_s1_translator_avalon_anti_slave_0_chipselect), //       .chipselect
		.clken      (memory_s1_translator_avalon_anti_slave_0_clken),      //       .clken
		.readdata   (memory_s1_translator_avalon_anti_slave_0_readdata),   //       .readdata
		.write      (memory_s1_translator_avalon_anti_slave_0_write),      //       .write
		.writedata  (memory_s1_translator_avalon_anti_slave_0_writedata),  //       .writedata
		.byteenable (memory_s1_translator_avalon_anti_slave_0_byteenable), //       .byteenable
		.reset      (rst_controller_reset_out_reset)                       // reset1.reset
	);

	nios2processor_jtag_uart jtag_uart (
		.clk            (clk_clk),                                                                //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                                        //             reset.reset_n
		.av_chipselect  (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_address),     //                  .address
		.av_read_n      (~jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_read),       //                  .read_n
		.av_readdata    (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_readdata),    //                  .readdata
		.av_write_n     (~jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_write),      //                  .write_n
		.av_writedata   (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_writedata),   //                  .writedata
		.av_waitrequest (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_waitrequest), //                  .waitrequest
		.dataavailable  (),                                                                       //                  .dataavailable
		.readyfordata   (),                                                                       //                  .readyfordata
		.av_irq         (irq_mapper_receiver0_irq)                                                //               irq.irq
	);

	nios2processor_lcd_0 lcd_0 (
		.clk           (clk_clk),                                                          //           clk.clk
		.reset_n       (~rst_controller_reset_out_reset),                                  //         reset.reset_n
		.address       (lcd_0_control_slave_translator_avalon_anti_slave_0_address),       // control_slave.address
		.begintransfer (lcd_0_control_slave_translator_avalon_anti_slave_0_begintransfer), //              .begintransfer
		.read          (lcd_0_control_slave_translator_avalon_anti_slave_0_read),          //              .read
		.readdata      (lcd_0_control_slave_translator_avalon_anti_slave_0_readdata),      //              .readdata
		.write         (lcd_0_control_slave_translator_avalon_anti_slave_0_write),         //              .write
		.writedata     (lcd_0_control_slave_translator_avalon_anti_slave_0_writedata),     //              .writedata
		.LCD_data      (),                                                                 //      external.export
		.LCD_E         (),                                                                 //              .export
		.LCD_RS        (),                                                                 //              .export
		.LCD_RW        ()                                                                  //              .export
	);

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (20),
		.AV_DATA_W                   (32),
		.AV_BURSTCOUNT_W             (1),
		.AV_BYTEENABLE_W             (4),
		.UAV_ADDRESS_W               (20),
		.UAV_BURSTCOUNT_W            (3),
		.USE_READ                    (1),
		.USE_WRITE                   (0),
		.USE_BEGINBURSTTRANSFER      (0),
		.USE_BEGINTRANSFER           (0),
		.USE_CHIPSELECT              (0),
		.USE_BURSTCOUNT              (0),
		.USE_READDATAVALID           (1),
		.USE_WAITREQUEST             (1),
		.AV_SYMBOLS_PER_WORD         (4),
		.AV_ADDRESS_SYMBOLS          (1),
		.AV_BURSTCOUNT_SYMBOLS       (0),
		.AV_CONSTANT_BURST_BEHAVIOR  (0),
		.UAV_CONSTANT_BURST_BEHAVIOR (0),
		.AV_LINEWRAPBURSTS           (1),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) cpu_instruction_master_translator (
		.clk                   (clk_clk),                                                                   //                       clk.clk
		.reset                 (rst_controller_reset_out_reset),                                            //                     reset.reset
		.uav_address           (cpu_instruction_master_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount        (cpu_instruction_master_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read              (cpu_instruction_master_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write             (cpu_instruction_master_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest       (cpu_instruction_master_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid     (cpu_instruction_master_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable        (cpu_instruction_master_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata          (cpu_instruction_master_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata         (cpu_instruction_master_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock              (cpu_instruction_master_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess       (cpu_instruction_master_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address            (cpu_instruction_master_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest        (cpu_instruction_master_waitrequest),                                        //                          .waitrequest
		.av_read               (cpu_instruction_master_read),                                               //                          .read
		.av_readdata           (cpu_instruction_master_readdata),                                           //                          .readdata
		.av_readdatavalid      (cpu_instruction_master_readdatavalid),                                      //                          .readdatavalid
		.av_burstcount         (1'b1),                                                                      //               (terminated)
		.av_byteenable         (4'b1111),                                                                   //               (terminated)
		.av_beginbursttransfer (1'b0),                                                                      //               (terminated)
		.av_begintransfer      (1'b0),                                                                      //               (terminated)
		.av_chipselect         (1'b0),                                                                      //               (terminated)
		.av_write              (1'b0),                                                                      //               (terminated)
		.av_writedata          (32'b00000000000000000000000000000000),                                      //               (terminated)
		.av_lock               (1'b0),                                                                      //               (terminated)
		.av_debugaccess        (1'b0),                                                                      //               (terminated)
		.uav_clken             (),                                                                          //               (terminated)
		.av_clken              (1'b1)                                                                       //               (terminated)
	);

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (20),
		.AV_DATA_W                   (32),
		.AV_BURSTCOUNT_W             (1),
		.AV_BYTEENABLE_W             (4),
		.UAV_ADDRESS_W               (20),
		.UAV_BURSTCOUNT_W            (3),
		.USE_READ                    (1),
		.USE_WRITE                   (1),
		.USE_BEGINBURSTTRANSFER      (0),
		.USE_BEGINTRANSFER           (0),
		.USE_CHIPSELECT              (0),
		.USE_BURSTCOUNT              (0),
		.USE_READDATAVALID           (1),
		.USE_WAITREQUEST             (1),
		.AV_SYMBOLS_PER_WORD         (4),
		.AV_ADDRESS_SYMBOLS          (1),
		.AV_BURSTCOUNT_SYMBOLS       (0),
		.AV_CONSTANT_BURST_BEHAVIOR  (0),
		.UAV_CONSTANT_BURST_BEHAVIOR (0),
		.AV_LINEWRAPBURSTS           (0),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) cpu_data_master_translator (
		.clk                   (clk_clk),                                                            //                       clk.clk
		.reset                 (rst_controller_reset_out_reset),                                     //                     reset.reset
		.uav_address           (cpu_data_master_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount        (cpu_data_master_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read              (cpu_data_master_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write             (cpu_data_master_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest       (cpu_data_master_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid     (cpu_data_master_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable        (cpu_data_master_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata          (cpu_data_master_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata         (cpu_data_master_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock              (cpu_data_master_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess       (cpu_data_master_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address            (cpu_data_master_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest        (cpu_data_master_waitrequest),                                        //                          .waitrequest
		.av_byteenable         (cpu_data_master_byteenable),                                         //                          .byteenable
		.av_read               (cpu_data_master_read),                                               //                          .read
		.av_readdata           (cpu_data_master_readdata),                                           //                          .readdata
		.av_readdatavalid      (cpu_data_master_readdatavalid),                                      //                          .readdatavalid
		.av_write              (cpu_data_master_write),                                              //                          .write
		.av_writedata          (cpu_data_master_writedata),                                          //                          .writedata
		.av_debugaccess        (cpu_data_master_debugaccess),                                        //                          .debugaccess
		.av_burstcount         (1'b1),                                                               //               (terminated)
		.av_beginbursttransfer (1'b0),                                                               //               (terminated)
		.av_begintransfer      (1'b0),                                                               //               (terminated)
		.av_chipselect         (1'b0),                                                               //               (terminated)
		.av_lock               (1'b0),                                                               //               (terminated)
		.uav_clken             (),                                                                   //               (terminated)
		.av_clken              (1'b1)                                                                //               (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (9),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (20),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) cpu_jtag_debug_module_translator (
		.clk                   (clk_clk),                                                                          //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                   //                    reset.reset
		.uav_address           (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (cpu_jtag_debug_module_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (cpu_jtag_debug_module_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_readdata           (cpu_jtag_debug_module_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (cpu_jtag_debug_module_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_begintransfer      (cpu_jtag_debug_module_translator_avalon_anti_slave_0_begintransfer),               //                         .begintransfer
		.av_byteenable         (cpu_jtag_debug_module_translator_avalon_anti_slave_0_byteenable),                  //                         .byteenable
		.av_chipselect         (cpu_jtag_debug_module_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_debugaccess        (cpu_jtag_debug_module_translator_avalon_anti_slave_0_debugaccess),                 //                         .debugaccess
		.av_read               (),                                                                                 //              (terminated)
		.av_beginbursttransfer (),                                                                                 //              (terminated)
		.av_burstcount         (),                                                                                 //              (terminated)
		.av_readdatavalid      (1'b0),                                                                             //              (terminated)
		.av_waitrequest        (1'b0),                                                                             //              (terminated)
		.av_writebyteenable    (),                                                                                 //              (terminated)
		.av_lock               (),                                                                                 //              (terminated)
		.av_clken              (),                                                                                 //              (terminated)
		.uav_clken             (1'b0),                                                                             //              (terminated)
		.av_outputenable       ()                                                                                  //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (16),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (20),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (1),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (0),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) memory_s1_translator (
		.clk                   (clk_clk),                                                              //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                       //                    reset.reset
		.uav_address           (memory_s1_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (memory_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (memory_s1_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (memory_s1_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (memory_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (memory_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (memory_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (memory_s1_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (memory_s1_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (memory_s1_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (memory_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (memory_s1_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (memory_s1_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_readdata           (memory_s1_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (memory_s1_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_byteenable         (memory_s1_translator_avalon_anti_slave_0_byteenable),                  //                         .byteenable
		.av_chipselect         (memory_s1_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_clken              (memory_s1_translator_avalon_anti_slave_0_clken),                       //                         .clken
		.av_read               (),                                                                     //              (terminated)
		.av_begintransfer      (),                                                                     //              (terminated)
		.av_beginbursttransfer (),                                                                     //              (terminated)
		.av_burstcount         (),                                                                     //              (terminated)
		.av_readdatavalid      (1'b0),                                                                 //              (terminated)
		.av_waitrequest        (1'b0),                                                                 //              (terminated)
		.av_writebyteenable    (),                                                                     //              (terminated)
		.av_lock               (),                                                                     //              (terminated)
		.uav_clken             (1'b0),                                                                 //              (terminated)
		.av_debugaccess        (),                                                                     //              (terminated)
		.av_outputenable       ()                                                                      //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (1),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (1),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (20),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (1),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) jtag_uart_avalon_jtag_slave_translator (
		.clk                   (clk_clk),                                                                                //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                         //                    reset.reset
		.uav_address           (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_read               (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_read),                        //                         .read
		.av_readdata           (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_waitrequest        (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_waitrequest),                 //                         .waitrequest
		.av_chipselect         (jtag_uart_avalon_jtag_slave_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_begintransfer      (),                                                                                       //              (terminated)
		.av_beginbursttransfer (),                                                                                       //              (terminated)
		.av_burstcount         (),                                                                                       //              (terminated)
		.av_byteenable         (),                                                                                       //              (terminated)
		.av_readdatavalid      (1'b0),                                                                                   //              (terminated)
		.av_writebyteenable    (),                                                                                       //              (terminated)
		.av_lock               (),                                                                                       //              (terminated)
		.av_clken              (),                                                                                       //              (terminated)
		.uav_clken             (1'b0),                                                                                   //              (terminated)
		.av_debugaccess        (),                                                                                       //              (terminated)
		.av_outputenable       ()                                                                                        //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (2),
		.AV_DATA_W                      (8),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (1),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (20),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (13),
		.AV_WRITE_WAIT_CYCLES           (13),
		.AV_SETUP_WAIT_CYCLES           (13),
		.AV_DATA_HOLD_CYCLES            (13)
	) lcd_0_control_slave_translator (
		.clk                   (clk_clk),                                                                        //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                 //                    reset.reset
		.uav_address           (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (lcd_0_control_slave_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (lcd_0_control_slave_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_read               (lcd_0_control_slave_translator_avalon_anti_slave_0_read),                        //                         .read
		.av_readdata           (lcd_0_control_slave_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (lcd_0_control_slave_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_begintransfer      (lcd_0_control_slave_translator_avalon_anti_slave_0_begintransfer),               //                         .begintransfer
		.av_beginbursttransfer (),                                                                               //              (terminated)
		.av_burstcount         (),                                                                               //              (terminated)
		.av_byteenable         (),                                                                               //              (terminated)
		.av_readdatavalid      (1'b0),                                                                           //              (terminated)
		.av_waitrequest        (1'b0),                                                                           //              (terminated)
		.av_writebyteenable    (),                                                                               //              (terminated)
		.av_lock               (),                                                                               //              (terminated)
		.av_chipselect         (),                                                                               //              (terminated)
		.av_clken              (),                                                                               //              (terminated)
		.uav_clken             (1'b0),                                                                           //              (terminated)
		.av_debugaccess        (),                                                                               //              (terminated)
		.av_outputenable       ()                                                                                //              (terminated)
	);

	altera_merlin_master_agent #(
		.PKT_PROTECTION_H          (74),
		.PKT_PROTECTION_L          (74),
		.PKT_BEGIN_BURST           (67),
		.PKT_BURSTWRAP_H           (66),
		.PKT_BURSTWRAP_L           (64),
		.PKT_BYTE_CNT_H            (63),
		.PKT_BYTE_CNT_L            (61),
		.PKT_ADDR_H                (55),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (56),
		.PKT_TRANS_POSTED          (57),
		.PKT_TRANS_WRITE           (58),
		.PKT_TRANS_READ            (59),
		.PKT_TRANS_LOCK            (60),
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_SRC_ID_H              (70),
		.PKT_SRC_ID_L              (68),
		.PKT_DEST_ID_H             (73),
		.PKT_DEST_ID_L             (71),
		.ST_DATA_W                 (75),
		.ST_CHANNEL_W              (4),
		.AV_BURSTCOUNT_W           (3),
		.SUPPRESS_0_BYTEEN_RSP     (0),
		.ID                        (1),
		.BURSTWRAP_VALUE           (3)
	) cpu_instruction_master_translator_avalon_universal_master_0_agent (
		.clk              (clk_clk),                                                                            //       clk.clk
		.reset            (rst_controller_reset_out_reset),                                                     // clk_reset.reset
		.av_address       (cpu_instruction_master_translator_avalon_universal_master_0_address),                //        av.address
		.av_write         (cpu_instruction_master_translator_avalon_universal_master_0_write),                  //          .write
		.av_read          (cpu_instruction_master_translator_avalon_universal_master_0_read),                   //          .read
		.av_writedata     (cpu_instruction_master_translator_avalon_universal_master_0_writedata),              //          .writedata
		.av_readdata      (cpu_instruction_master_translator_avalon_universal_master_0_readdata),               //          .readdata
		.av_waitrequest   (cpu_instruction_master_translator_avalon_universal_master_0_waitrequest),            //          .waitrequest
		.av_readdatavalid (cpu_instruction_master_translator_avalon_universal_master_0_readdatavalid),          //          .readdatavalid
		.av_byteenable    (cpu_instruction_master_translator_avalon_universal_master_0_byteenable),             //          .byteenable
		.av_burstcount    (cpu_instruction_master_translator_avalon_universal_master_0_burstcount),             //          .burstcount
		.av_debugaccess   (cpu_instruction_master_translator_avalon_universal_master_0_debugaccess),            //          .debugaccess
		.av_lock          (cpu_instruction_master_translator_avalon_universal_master_0_lock),                   //          .lock
		.cp_valid         (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_valid),         //        cp.valid
		.cp_data          (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.cp_startofpacket (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.cp_endofpacket   (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.cp_ready         (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_ready),         //          .ready
		.rp_valid         (limiter_rsp_src_valid),                                                              //        rp.valid
		.rp_data          (limiter_rsp_src_data),                                                               //          .data
		.rp_channel       (limiter_rsp_src_channel),                                                            //          .channel
		.rp_startofpacket (limiter_rsp_src_startofpacket),                                                      //          .startofpacket
		.rp_endofpacket   (limiter_rsp_src_endofpacket),                                                        //          .endofpacket
		.rp_ready         (limiter_rsp_src_ready)                                                               //          .ready
	);

	altera_merlin_master_agent #(
		.PKT_PROTECTION_H          (74),
		.PKT_PROTECTION_L          (74),
		.PKT_BEGIN_BURST           (67),
		.PKT_BURSTWRAP_H           (66),
		.PKT_BURSTWRAP_L           (64),
		.PKT_BYTE_CNT_H            (63),
		.PKT_BYTE_CNT_L            (61),
		.PKT_ADDR_H                (55),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (56),
		.PKT_TRANS_POSTED          (57),
		.PKT_TRANS_WRITE           (58),
		.PKT_TRANS_READ            (59),
		.PKT_TRANS_LOCK            (60),
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_SRC_ID_H              (70),
		.PKT_SRC_ID_L              (68),
		.PKT_DEST_ID_H             (73),
		.PKT_DEST_ID_L             (71),
		.ST_DATA_W                 (75),
		.ST_CHANNEL_W              (4),
		.AV_BURSTCOUNT_W           (3),
		.SUPPRESS_0_BYTEEN_RSP     (0),
		.ID                        (2),
		.BURSTWRAP_VALUE           (7)
	) cpu_data_master_translator_avalon_universal_master_0_agent (
		.clk              (clk_clk),                                                                     //       clk.clk
		.reset            (rst_controller_reset_out_reset),                                              // clk_reset.reset
		.av_address       (cpu_data_master_translator_avalon_universal_master_0_address),                //        av.address
		.av_write         (cpu_data_master_translator_avalon_universal_master_0_write),                  //          .write
		.av_read          (cpu_data_master_translator_avalon_universal_master_0_read),                   //          .read
		.av_writedata     (cpu_data_master_translator_avalon_universal_master_0_writedata),              //          .writedata
		.av_readdata      (cpu_data_master_translator_avalon_universal_master_0_readdata),               //          .readdata
		.av_waitrequest   (cpu_data_master_translator_avalon_universal_master_0_waitrequest),            //          .waitrequest
		.av_readdatavalid (cpu_data_master_translator_avalon_universal_master_0_readdatavalid),          //          .readdatavalid
		.av_byteenable    (cpu_data_master_translator_avalon_universal_master_0_byteenable),             //          .byteenable
		.av_burstcount    (cpu_data_master_translator_avalon_universal_master_0_burstcount),             //          .burstcount
		.av_debugaccess   (cpu_data_master_translator_avalon_universal_master_0_debugaccess),            //          .debugaccess
		.av_lock          (cpu_data_master_translator_avalon_universal_master_0_lock),                   //          .lock
		.cp_valid         (cpu_data_master_translator_avalon_universal_master_0_agent_cp_valid),         //        cp.valid
		.cp_data          (cpu_data_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.cp_startofpacket (cpu_data_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.cp_endofpacket   (cpu_data_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.cp_ready         (cpu_data_master_translator_avalon_universal_master_0_agent_cp_ready),         //          .ready
		.rp_valid         (limiter_001_rsp_src_valid),                                                   //        rp.valid
		.rp_data          (limiter_001_rsp_src_data),                                                    //          .data
		.rp_channel       (limiter_001_rsp_src_channel),                                                 //          .channel
		.rp_startofpacket (limiter_001_rsp_src_startofpacket),                                           //          .startofpacket
		.rp_endofpacket   (limiter_001_rsp_src_endofpacket),                                             //          .endofpacket
		.rp_ready         (limiter_001_rsp_src_ready)                                                    //          .ready
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (67),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (55),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (56),
		.PKT_TRANS_POSTED          (57),
		.PKT_TRANS_WRITE           (58),
		.PKT_TRANS_READ            (59),
		.PKT_TRANS_LOCK            (60),
		.PKT_SRC_ID_H              (70),
		.PKT_SRC_ID_L              (68),
		.PKT_DEST_ID_H             (73),
		.PKT_DEST_ID_L             (71),
		.PKT_BURSTWRAP_H           (66),
		.PKT_BURSTWRAP_L           (64),
		.PKT_BYTE_CNT_H            (63),
		.PKT_BYTE_CNT_L            (61),
		.PKT_PROTECTION_H          (74),
		.PKT_PROTECTION_L          (74),
		.ST_CHANNEL_W              (4),
		.ST_DATA_W                 (75),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent (
		.clk                     (clk_clk),                                                                                    //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                             //       clk_reset.reset
		.m0_address              (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_mux_src_ready),                                                                     //              cp.ready
		.cp_valid                (cmd_xbar_mux_src_valid),                                                                     //                .valid
		.cp_data                 (cmd_xbar_mux_src_data),                                                                      //                .data
		.cp_startofpacket        (cmd_xbar_mux_src_startofpacket),                                                             //                .startofpacket
		.cp_endofpacket          (cmd_xbar_mux_src_endofpacket),                                                               //                .endofpacket
		.cp_channel              (cmd_xbar_mux_src_channel),                                                                   //                .channel
		.rf_sink_ready           (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (76),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (clk_clk),                                                                                    //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                             // clk_reset.reset
		.in_data           (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                      // (terminated)
		.csr_read          (1'b0),                                                                                       // (terminated)
		.csr_write         (1'b0),                                                                                       // (terminated)
		.csr_readdata      (),                                                                                           // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                       // (terminated)
		.almost_full_data  (),                                                                                           // (terminated)
		.almost_empty_data (),                                                                                           // (terminated)
		.in_empty          (1'b0),                                                                                       // (terminated)
		.out_empty         (),                                                                                           // (terminated)
		.in_error          (1'b0),                                                                                       // (terminated)
		.out_error         (),                                                                                           // (terminated)
		.in_channel        (1'b0),                                                                                       // (terminated)
		.out_channel       ()                                                                                            // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (67),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (55),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (56),
		.PKT_TRANS_POSTED          (57),
		.PKT_TRANS_WRITE           (58),
		.PKT_TRANS_READ            (59),
		.PKT_TRANS_LOCK            (60),
		.PKT_SRC_ID_H              (70),
		.PKT_SRC_ID_L              (68),
		.PKT_DEST_ID_H             (73),
		.PKT_DEST_ID_L             (71),
		.PKT_BURSTWRAP_H           (66),
		.PKT_BURSTWRAP_L           (64),
		.PKT_BYTE_CNT_H            (63),
		.PKT_BYTE_CNT_L            (61),
		.PKT_PROTECTION_H          (74),
		.PKT_PROTECTION_L          (74),
		.ST_CHANNEL_W              (4),
		.ST_DATA_W                 (75),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) memory_s1_translator_avalon_universal_slave_0_agent (
		.clk                     (clk_clk),                                                                        //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                 //       clk_reset.reset
		.m0_address              (memory_s1_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (memory_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (memory_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (memory_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (memory_s1_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (memory_s1_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (memory_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (memory_s1_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (memory_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (memory_s1_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (memory_s1_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (memory_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (memory_s1_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (memory_s1_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (memory_s1_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (memory_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_mux_001_src_ready),                                                     //              cp.ready
		.cp_valid                (cmd_xbar_mux_001_src_valid),                                                     //                .valid
		.cp_data                 (cmd_xbar_mux_001_src_data),                                                      //                .data
		.cp_startofpacket        (cmd_xbar_mux_001_src_startofpacket),                                             //                .startofpacket
		.cp_endofpacket          (cmd_xbar_mux_001_src_endofpacket),                                               //                .endofpacket
		.cp_channel              (cmd_xbar_mux_001_src_channel),                                                   //                .channel
		.rf_sink_ready           (memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (memory_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (memory_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (memory_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (memory_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (memory_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (memory_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (memory_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (memory_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (memory_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (memory_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (memory_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (76),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (clk_clk),                                                                        //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                 // clk_reset.reset
		.in_data           (memory_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (memory_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (memory_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (memory_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (memory_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                          // (terminated)
		.csr_read          (1'b0),                                                                           // (terminated)
		.csr_write         (1'b0),                                                                           // (terminated)
		.csr_readdata      (),                                                                               // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                           // (terminated)
		.almost_full_data  (),                                                                               // (terminated)
		.almost_empty_data (),                                                                               // (terminated)
		.in_empty          (1'b0),                                                                           // (terminated)
		.out_empty         (),                                                                               // (terminated)
		.in_error          (1'b0),                                                                           // (terminated)
		.out_error         (),                                                                               // (terminated)
		.in_channel        (1'b0),                                                                           // (terminated)
		.out_channel       ()                                                                                // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (67),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (55),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (56),
		.PKT_TRANS_POSTED          (57),
		.PKT_TRANS_WRITE           (58),
		.PKT_TRANS_READ            (59),
		.PKT_TRANS_LOCK            (60),
		.PKT_SRC_ID_H              (70),
		.PKT_SRC_ID_L              (68),
		.PKT_DEST_ID_H             (73),
		.PKT_DEST_ID_L             (71),
		.PKT_BURSTWRAP_H           (66),
		.PKT_BURSTWRAP_L           (64),
		.PKT_BYTE_CNT_H            (63),
		.PKT_BYTE_CNT_L            (61),
		.PKT_PROTECTION_H          (74),
		.PKT_PROTECTION_L          (74),
		.ST_CHANNEL_W              (4),
		.ST_DATA_W                 (75),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent (
		.clk                     (clk_clk),                                                                                          //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                                   //       clk_reset.reset
		.m0_address              (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_demux_001_src2_ready),                                                                    //              cp.ready
		.cp_valid                (cmd_xbar_demux_001_src2_valid),                                                                    //                .valid
		.cp_data                 (cmd_xbar_demux_001_src2_data),                                                                     //                .data
		.cp_startofpacket        (cmd_xbar_demux_001_src2_startofpacket),                                                            //                .startofpacket
		.cp_endofpacket          (cmd_xbar_demux_001_src2_endofpacket),                                                              //                .endofpacket
		.cp_channel              (cmd_xbar_demux_001_src2_channel),                                                                  //                .channel
		.rf_sink_ready           (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (76),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (clk_clk),                                                                                          //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                                   // clk_reset.reset
		.in_data           (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                            // (terminated)
		.csr_read          (1'b0),                                                                                             // (terminated)
		.csr_write         (1'b0),                                                                                             // (terminated)
		.csr_readdata      (),                                                                                                 // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                             // (terminated)
		.almost_full_data  (),                                                                                                 // (terminated)
		.almost_empty_data (),                                                                                                 // (terminated)
		.in_empty          (1'b0),                                                                                             // (terminated)
		.out_empty         (),                                                                                                 // (terminated)
		.in_error          (1'b0),                                                                                             // (terminated)
		.out_error         (),                                                                                                 // (terminated)
		.in_channel        (1'b0),                                                                                             // (terminated)
		.out_channel       ()                                                                                                  // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (67),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (55),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (56),
		.PKT_TRANS_POSTED          (57),
		.PKT_TRANS_WRITE           (58),
		.PKT_TRANS_READ            (59),
		.PKT_TRANS_LOCK            (60),
		.PKT_SRC_ID_H              (70),
		.PKT_SRC_ID_L              (68),
		.PKT_DEST_ID_H             (73),
		.PKT_DEST_ID_L             (71),
		.PKT_BURSTWRAP_H           (66),
		.PKT_BURSTWRAP_L           (64),
		.PKT_BYTE_CNT_H            (63),
		.PKT_BYTE_CNT_L            (61),
		.PKT_PROTECTION_H          (74),
		.PKT_PROTECTION_L          (74),
		.ST_CHANNEL_W              (4),
		.ST_DATA_W                 (75),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) lcd_0_control_slave_translator_avalon_universal_slave_0_agent (
		.clk                     (clk_clk),                                                                                  //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                           //       clk_reset.reset
		.m0_address              (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_demux_001_src3_ready),                                                            //              cp.ready
		.cp_valid                (cmd_xbar_demux_001_src3_valid),                                                            //                .valid
		.cp_data                 (cmd_xbar_demux_001_src3_data),                                                             //                .data
		.cp_startofpacket        (cmd_xbar_demux_001_src3_startofpacket),                                                    //                .startofpacket
		.cp_endofpacket          (cmd_xbar_demux_001_src3_endofpacket),                                                      //                .endofpacket
		.cp_channel              (cmd_xbar_demux_001_src3_channel),                                                          //                .channel
		.rf_sink_ready           (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (76),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (clk_clk),                                                                                  //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                           // clk_reset.reset
		.in_data           (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                    // (terminated)
		.csr_read          (1'b0),                                                                                     // (terminated)
		.csr_write         (1'b0),                                                                                     // (terminated)
		.csr_readdata      (),                                                                                         // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                     // (terminated)
		.almost_full_data  (),                                                                                         // (terminated)
		.almost_empty_data (),                                                                                         // (terminated)
		.in_empty          (1'b0),                                                                                     // (terminated)
		.out_empty         (),                                                                                         // (terminated)
		.in_error          (1'b0),                                                                                     // (terminated)
		.out_error         (),                                                                                         // (terminated)
		.in_channel        (1'b0),                                                                                     // (terminated)
		.out_channel       ()                                                                                          // (terminated)
	);

	nios2processor_addr_router addr_router (
		.sink_ready         (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_ready),         //      sink.ready
		.sink_valid         (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_valid),         //          .valid
		.sink_data          (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.sink_startofpacket (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.sink_endofpacket   (cpu_instruction_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                            //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                     // clk_reset.reset
		.src_ready          (addr_router_src_ready),                                                              //       src.ready
		.src_valid          (addr_router_src_valid),                                                              //          .valid
		.src_data           (addr_router_src_data),                                                               //          .data
		.src_channel        (addr_router_src_channel),                                                            //          .channel
		.src_startofpacket  (addr_router_src_startofpacket),                                                      //          .startofpacket
		.src_endofpacket    (addr_router_src_endofpacket)                                                         //          .endofpacket
	);

	nios2processor_addr_router_001 addr_router_001 (
		.sink_ready         (cpu_data_master_translator_avalon_universal_master_0_agent_cp_ready),         //      sink.ready
		.sink_valid         (cpu_data_master_translator_avalon_universal_master_0_agent_cp_valid),         //          .valid
		.sink_data          (cpu_data_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.sink_startofpacket (cpu_data_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.sink_endofpacket   (cpu_data_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                     //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                              // clk_reset.reset
		.src_ready          (addr_router_001_src_ready),                                                   //       src.ready
		.src_valid          (addr_router_001_src_valid),                                                   //          .valid
		.src_data           (addr_router_001_src_data),                                                    //          .data
		.src_channel        (addr_router_001_src_channel),                                                 //          .channel
		.src_startofpacket  (addr_router_001_src_startofpacket),                                           //          .startofpacket
		.src_endofpacket    (addr_router_001_src_endofpacket)                                              //          .endofpacket
	);

	nios2processor_id_router id_router (
		.sink_ready         (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                          //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                   // clk_reset.reset
		.src_ready          (id_router_src_ready),                                                              //       src.ready
		.src_valid          (id_router_src_valid),                                                              //          .valid
		.src_data           (id_router_src_data),                                                               //          .data
		.src_channel        (id_router_src_channel),                                                            //          .channel
		.src_startofpacket  (id_router_src_startofpacket),                                                      //          .startofpacket
		.src_endofpacket    (id_router_src_endofpacket)                                                         //          .endofpacket
	);

	nios2processor_id_router id_router_001 (
		.sink_ready         (memory_s1_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (memory_s1_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (memory_s1_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (memory_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (memory_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                              //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                       // clk_reset.reset
		.src_ready          (id_router_001_src_ready),                                              //       src.ready
		.src_valid          (id_router_001_src_valid),                                              //          .valid
		.src_data           (id_router_001_src_data),                                               //          .data
		.src_channel        (id_router_001_src_channel),                                            //          .channel
		.src_startofpacket  (id_router_001_src_startofpacket),                                      //          .startofpacket
		.src_endofpacket    (id_router_001_src_endofpacket)                                         //          .endofpacket
	);

	nios2processor_id_router_002 id_router_002 (
		.sink_ready         (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (jtag_uart_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                                //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                         // clk_reset.reset
		.src_ready          (id_router_002_src_ready),                                                                //       src.ready
		.src_valid          (id_router_002_src_valid),                                                                //          .valid
		.src_data           (id_router_002_src_data),                                                                 //          .data
		.src_channel        (id_router_002_src_channel),                                                              //          .channel
		.src_startofpacket  (id_router_002_src_startofpacket),                                                        //          .startofpacket
		.src_endofpacket    (id_router_002_src_endofpacket)                                                           //          .endofpacket
	);

	nios2processor_id_router_002 id_router_003 (
		.sink_ready         (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                        //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                 // clk_reset.reset
		.src_ready          (id_router_003_src_ready),                                                        //       src.ready
		.src_valid          (id_router_003_src_valid),                                                        //          .valid
		.src_data           (id_router_003_src_data),                                                         //          .data
		.src_channel        (id_router_003_src_channel),                                                      //          .channel
		.src_startofpacket  (id_router_003_src_startofpacket),                                                //          .startofpacket
		.src_endofpacket    (id_router_003_src_endofpacket)                                                   //          .endofpacket
	);

	altera_merlin_traffic_limiter #(
		.PKT_DEST_ID_H             (73),
		.PKT_DEST_ID_L             (71),
		.PKT_TRANS_POSTED          (57),
		.MAX_OUTSTANDING_RESPONSES (5),
		.PIPELINED                 (0),
		.ST_DATA_W                 (75),
		.ST_CHANNEL_W              (4),
		.VALID_WIDTH               (4),
		.ENFORCE_ORDER             (1),
		.PKT_BYTE_CNT_H            (63),
		.PKT_BYTE_CNT_L            (61),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32)
	) limiter (
		.clk                    (clk_clk),                        //       clk.clk
		.reset                  (rst_controller_reset_out_reset), // clk_reset.reset
		.cmd_sink_ready         (addr_router_src_ready),          //  cmd_sink.ready
		.cmd_sink_valid         (addr_router_src_valid),          //          .valid
		.cmd_sink_data          (addr_router_src_data),           //          .data
		.cmd_sink_channel       (addr_router_src_channel),        //          .channel
		.cmd_sink_startofpacket (addr_router_src_startofpacket),  //          .startofpacket
		.cmd_sink_endofpacket   (addr_router_src_endofpacket),    //          .endofpacket
		.cmd_src_ready          (limiter_cmd_src_ready),          //   cmd_src.ready
		.cmd_src_data           (limiter_cmd_src_data),           //          .data
		.cmd_src_channel        (limiter_cmd_src_channel),        //          .channel
		.cmd_src_startofpacket  (limiter_cmd_src_startofpacket),  //          .startofpacket
		.cmd_src_endofpacket    (limiter_cmd_src_endofpacket),    //          .endofpacket
		.rsp_sink_ready         (rsp_xbar_mux_src_ready),         //  rsp_sink.ready
		.rsp_sink_valid         (rsp_xbar_mux_src_valid),         //          .valid
		.rsp_sink_channel       (rsp_xbar_mux_src_channel),       //          .channel
		.rsp_sink_data          (rsp_xbar_mux_src_data),          //          .data
		.rsp_sink_startofpacket (rsp_xbar_mux_src_startofpacket), //          .startofpacket
		.rsp_sink_endofpacket   (rsp_xbar_mux_src_endofpacket),   //          .endofpacket
		.rsp_src_ready          (limiter_rsp_src_ready),          //   rsp_src.ready
		.rsp_src_valid          (limiter_rsp_src_valid),          //          .valid
		.rsp_src_data           (limiter_rsp_src_data),           //          .data
		.rsp_src_channel        (limiter_rsp_src_channel),        //          .channel
		.rsp_src_startofpacket  (limiter_rsp_src_startofpacket),  //          .startofpacket
		.rsp_src_endofpacket    (limiter_rsp_src_endofpacket),    //          .endofpacket
		.cmd_src_valid          (limiter_cmd_valid_data)          // cmd_valid.data
	);

	altera_merlin_traffic_limiter #(
		.PKT_DEST_ID_H             (73),
		.PKT_DEST_ID_L             (71),
		.PKT_TRANS_POSTED          (57),
		.MAX_OUTSTANDING_RESPONSES (5),
		.PIPELINED                 (0),
		.ST_DATA_W                 (75),
		.ST_CHANNEL_W              (4),
		.VALID_WIDTH               (4),
		.ENFORCE_ORDER             (1),
		.PKT_BYTE_CNT_H            (63),
		.PKT_BYTE_CNT_L            (61),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32)
	) limiter_001 (
		.clk                    (clk_clk),                            //       clk.clk
		.reset                  (rst_controller_reset_out_reset),     // clk_reset.reset
		.cmd_sink_ready         (addr_router_001_src_ready),          //  cmd_sink.ready
		.cmd_sink_valid         (addr_router_001_src_valid),          //          .valid
		.cmd_sink_data          (addr_router_001_src_data),           //          .data
		.cmd_sink_channel       (addr_router_001_src_channel),        //          .channel
		.cmd_sink_startofpacket (addr_router_001_src_startofpacket),  //          .startofpacket
		.cmd_sink_endofpacket   (addr_router_001_src_endofpacket),    //          .endofpacket
		.cmd_src_ready          (limiter_001_cmd_src_ready),          //   cmd_src.ready
		.cmd_src_data           (limiter_001_cmd_src_data),           //          .data
		.cmd_src_channel        (limiter_001_cmd_src_channel),        //          .channel
		.cmd_src_startofpacket  (limiter_001_cmd_src_startofpacket),  //          .startofpacket
		.cmd_src_endofpacket    (limiter_001_cmd_src_endofpacket),    //          .endofpacket
		.rsp_sink_ready         (rsp_xbar_mux_001_src_ready),         //  rsp_sink.ready
		.rsp_sink_valid         (rsp_xbar_mux_001_src_valid),         //          .valid
		.rsp_sink_channel       (rsp_xbar_mux_001_src_channel),       //          .channel
		.rsp_sink_data          (rsp_xbar_mux_001_src_data),          //          .data
		.rsp_sink_startofpacket (rsp_xbar_mux_001_src_startofpacket), //          .startofpacket
		.rsp_sink_endofpacket   (rsp_xbar_mux_001_src_endofpacket),   //          .endofpacket
		.rsp_src_ready          (limiter_001_rsp_src_ready),          //   rsp_src.ready
		.rsp_src_valid          (limiter_001_rsp_src_valid),          //          .valid
		.rsp_src_data           (limiter_001_rsp_src_data),           //          .data
		.rsp_src_channel        (limiter_001_rsp_src_channel),        //          .channel
		.rsp_src_startofpacket  (limiter_001_rsp_src_startofpacket),  //          .startofpacket
		.rsp_src_endofpacket    (limiter_001_rsp_src_endofpacket),    //          .endofpacket
		.cmd_src_valid          (limiter_001_cmd_valid_data)          // cmd_valid.data
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS        (1),
		.OUTPUT_RESET_SYNC_EDGES ("deassert"),
		.SYNC_DEPTH              (2)
	) rst_controller (
		.reset_in0  (~reset_reset_n),                 // reset_in0.reset
		.clk        (clk_clk),                        //       clk.clk
		.reset_out  (rst_controller_reset_out_reset), // reset_out.reset
		.reset_in1  (1'b0),                           // (terminated)
		.reset_in2  (1'b0),                           // (terminated)
		.reset_in3  (1'b0),                           // (terminated)
		.reset_in4  (1'b0),                           // (terminated)
		.reset_in5  (1'b0),                           // (terminated)
		.reset_in6  (1'b0),                           // (terminated)
		.reset_in7  (1'b0),                           // (terminated)
		.reset_in8  (1'b0),                           // (terminated)
		.reset_in9  (1'b0),                           // (terminated)
		.reset_in10 (1'b0),                           // (terminated)
		.reset_in11 (1'b0),                           // (terminated)
		.reset_in12 (1'b0),                           // (terminated)
		.reset_in13 (1'b0),                           // (terminated)
		.reset_in14 (1'b0),                           // (terminated)
		.reset_in15 (1'b0)                            // (terminated)
	);

	nios2processor_cmd_xbar_demux cmd_xbar_demux (
		.clk                (clk_clk),                           //        clk.clk
		.reset              (rst_controller_reset_out_reset),    //  clk_reset.reset
		.sink_ready         (limiter_cmd_src_ready),             //       sink.ready
		.sink_channel       (limiter_cmd_src_channel),           //           .channel
		.sink_data          (limiter_cmd_src_data),              //           .data
		.sink_startofpacket (limiter_cmd_src_startofpacket),     //           .startofpacket
		.sink_endofpacket   (limiter_cmd_src_endofpacket),       //           .endofpacket
		.sink_valid         (limiter_cmd_valid_data),            // sink_valid.data
		.src0_ready         (cmd_xbar_demux_src0_ready),         //       src0.ready
		.src0_valid         (cmd_xbar_demux_src0_valid),         //           .valid
		.src0_data          (cmd_xbar_demux_src0_data),          //           .data
		.src0_channel       (cmd_xbar_demux_src0_channel),       //           .channel
		.src0_startofpacket (cmd_xbar_demux_src0_startofpacket), //           .startofpacket
		.src0_endofpacket   (cmd_xbar_demux_src0_endofpacket),   //           .endofpacket
		.src1_ready         (cmd_xbar_demux_src1_ready),         //       src1.ready
		.src1_valid         (cmd_xbar_demux_src1_valid),         //           .valid
		.src1_data          (cmd_xbar_demux_src1_data),          //           .data
		.src1_channel       (cmd_xbar_demux_src1_channel),       //           .channel
		.src1_startofpacket (cmd_xbar_demux_src1_startofpacket), //           .startofpacket
		.src1_endofpacket   (cmd_xbar_demux_src1_endofpacket)    //           .endofpacket
	);

	nios2processor_cmd_xbar_demux_001 cmd_xbar_demux_001 (
		.clk                (clk_clk),                               //        clk.clk
		.reset              (rst_controller_reset_out_reset),        //  clk_reset.reset
		.sink_ready         (limiter_001_cmd_src_ready),             //       sink.ready
		.sink_channel       (limiter_001_cmd_src_channel),           //           .channel
		.sink_data          (limiter_001_cmd_src_data),              //           .data
		.sink_startofpacket (limiter_001_cmd_src_startofpacket),     //           .startofpacket
		.sink_endofpacket   (limiter_001_cmd_src_endofpacket),       //           .endofpacket
		.sink_valid         (limiter_001_cmd_valid_data),            // sink_valid.data
		.src0_ready         (cmd_xbar_demux_001_src0_ready),         //       src0.ready
		.src0_valid         (cmd_xbar_demux_001_src0_valid),         //           .valid
		.src0_data          (cmd_xbar_demux_001_src0_data),          //           .data
		.src0_channel       (cmd_xbar_demux_001_src0_channel),       //           .channel
		.src0_startofpacket (cmd_xbar_demux_001_src0_startofpacket), //           .startofpacket
		.src0_endofpacket   (cmd_xbar_demux_001_src0_endofpacket),   //           .endofpacket
		.src1_ready         (cmd_xbar_demux_001_src1_ready),         //       src1.ready
		.src1_valid         (cmd_xbar_demux_001_src1_valid),         //           .valid
		.src1_data          (cmd_xbar_demux_001_src1_data),          //           .data
		.src1_channel       (cmd_xbar_demux_001_src1_channel),       //           .channel
		.src1_startofpacket (cmd_xbar_demux_001_src1_startofpacket), //           .startofpacket
		.src1_endofpacket   (cmd_xbar_demux_001_src1_endofpacket),   //           .endofpacket
		.src2_ready         (cmd_xbar_demux_001_src2_ready),         //       src2.ready
		.src2_valid         (cmd_xbar_demux_001_src2_valid),         //           .valid
		.src2_data          (cmd_xbar_demux_001_src2_data),          //           .data
		.src2_channel       (cmd_xbar_demux_001_src2_channel),       //           .channel
		.src2_startofpacket (cmd_xbar_demux_001_src2_startofpacket), //           .startofpacket
		.src2_endofpacket   (cmd_xbar_demux_001_src2_endofpacket),   //           .endofpacket
		.src3_ready         (cmd_xbar_demux_001_src3_ready),         //       src3.ready
		.src3_valid         (cmd_xbar_demux_001_src3_valid),         //           .valid
		.src3_data          (cmd_xbar_demux_001_src3_data),          //           .data
		.src3_channel       (cmd_xbar_demux_001_src3_channel),       //           .channel
		.src3_startofpacket (cmd_xbar_demux_001_src3_startofpacket), //           .startofpacket
		.src3_endofpacket   (cmd_xbar_demux_001_src3_endofpacket)    //           .endofpacket
	);

	nios2processor_cmd_xbar_mux cmd_xbar_mux (
		.clk                 (clk_clk),                               //       clk.clk
		.reset               (rst_controller_reset_out_reset),        // clk_reset.reset
		.src_ready           (cmd_xbar_mux_src_ready),                //       src.ready
		.src_valid           (cmd_xbar_mux_src_valid),                //          .valid
		.src_data            (cmd_xbar_mux_src_data),                 //          .data
		.src_channel         (cmd_xbar_mux_src_channel),              //          .channel
		.src_startofpacket   (cmd_xbar_mux_src_startofpacket),        //          .startofpacket
		.src_endofpacket     (cmd_xbar_mux_src_endofpacket),          //          .endofpacket
		.sink0_ready         (cmd_xbar_demux_src0_ready),             //     sink0.ready
		.sink0_valid         (cmd_xbar_demux_src0_valid),             //          .valid
		.sink0_channel       (cmd_xbar_demux_src0_channel),           //          .channel
		.sink0_data          (cmd_xbar_demux_src0_data),              //          .data
		.sink0_startofpacket (cmd_xbar_demux_src0_startofpacket),     //          .startofpacket
		.sink0_endofpacket   (cmd_xbar_demux_src0_endofpacket),       //          .endofpacket
		.sink1_ready         (cmd_xbar_demux_001_src0_ready),         //     sink1.ready
		.sink1_valid         (cmd_xbar_demux_001_src0_valid),         //          .valid
		.sink1_channel       (cmd_xbar_demux_001_src0_channel),       //          .channel
		.sink1_data          (cmd_xbar_demux_001_src0_data),          //          .data
		.sink1_startofpacket (cmd_xbar_demux_001_src0_startofpacket), //          .startofpacket
		.sink1_endofpacket   (cmd_xbar_demux_001_src0_endofpacket)    //          .endofpacket
	);

	nios2processor_cmd_xbar_mux cmd_xbar_mux_001 (
		.clk                 (clk_clk),                               //       clk.clk
		.reset               (rst_controller_reset_out_reset),        // clk_reset.reset
		.src_ready           (cmd_xbar_mux_001_src_ready),            //       src.ready
		.src_valid           (cmd_xbar_mux_001_src_valid),            //          .valid
		.src_data            (cmd_xbar_mux_001_src_data),             //          .data
		.src_channel         (cmd_xbar_mux_001_src_channel),          //          .channel
		.src_startofpacket   (cmd_xbar_mux_001_src_startofpacket),    //          .startofpacket
		.src_endofpacket     (cmd_xbar_mux_001_src_endofpacket),      //          .endofpacket
		.sink0_ready         (cmd_xbar_demux_src1_ready),             //     sink0.ready
		.sink0_valid         (cmd_xbar_demux_src1_valid),             //          .valid
		.sink0_channel       (cmd_xbar_demux_src1_channel),           //          .channel
		.sink0_data          (cmd_xbar_demux_src1_data),              //          .data
		.sink0_startofpacket (cmd_xbar_demux_src1_startofpacket),     //          .startofpacket
		.sink0_endofpacket   (cmd_xbar_demux_src1_endofpacket),       //          .endofpacket
		.sink1_ready         (cmd_xbar_demux_001_src1_ready),         //     sink1.ready
		.sink1_valid         (cmd_xbar_demux_001_src1_valid),         //          .valid
		.sink1_channel       (cmd_xbar_demux_001_src1_channel),       //          .channel
		.sink1_data          (cmd_xbar_demux_001_src1_data),          //          .data
		.sink1_startofpacket (cmd_xbar_demux_001_src1_startofpacket), //          .startofpacket
		.sink1_endofpacket   (cmd_xbar_demux_001_src1_endofpacket)    //          .endofpacket
	);

	nios2processor_rsp_xbar_demux rsp_xbar_demux (
		.clk                (clk_clk),                           //       clk.clk
		.reset              (rst_controller_reset_out_reset),    // clk_reset.reset
		.sink_ready         (id_router_src_ready),               //      sink.ready
		.sink_channel       (id_router_src_channel),             //          .channel
		.sink_data          (id_router_src_data),                //          .data
		.sink_startofpacket (id_router_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_src0_endofpacket),   //          .endofpacket
		.src1_ready         (rsp_xbar_demux_src1_ready),         //      src1.ready
		.src1_valid         (rsp_xbar_demux_src1_valid),         //          .valid
		.src1_data          (rsp_xbar_demux_src1_data),          //          .data
		.src1_channel       (rsp_xbar_demux_src1_channel),       //          .channel
		.src1_startofpacket (rsp_xbar_demux_src1_startofpacket), //          .startofpacket
		.src1_endofpacket   (rsp_xbar_demux_src1_endofpacket)    //          .endofpacket
	);

	nios2processor_rsp_xbar_demux rsp_xbar_demux_001 (
		.clk                (clk_clk),                               //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_001_src_ready),               //      sink.ready
		.sink_channel       (id_router_001_src_channel),             //          .channel
		.sink_data          (id_router_001_src_data),                //          .data
		.sink_startofpacket (id_router_001_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_001_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_001_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_001_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_001_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_001_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_001_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_001_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_001_src0_endofpacket),   //          .endofpacket
		.src1_ready         (rsp_xbar_demux_001_src1_ready),         //      src1.ready
		.src1_valid         (rsp_xbar_demux_001_src1_valid),         //          .valid
		.src1_data          (rsp_xbar_demux_001_src1_data),          //          .data
		.src1_channel       (rsp_xbar_demux_001_src1_channel),       //          .channel
		.src1_startofpacket (rsp_xbar_demux_001_src1_startofpacket), //          .startofpacket
		.src1_endofpacket   (rsp_xbar_demux_001_src1_endofpacket)    //          .endofpacket
	);

	nios2processor_rsp_xbar_demux_002 rsp_xbar_demux_002 (
		.clk                (clk_clk),                               //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_002_src_ready),               //      sink.ready
		.sink_channel       (id_router_002_src_channel),             //          .channel
		.sink_data          (id_router_002_src_data),                //          .data
		.sink_startofpacket (id_router_002_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_002_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_002_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_002_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_002_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_002_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_002_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_002_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_002_src0_endofpacket)    //          .endofpacket
	);

	nios2processor_rsp_xbar_demux_002 rsp_xbar_demux_003 (
		.clk                (clk_clk),                               //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_003_src_ready),               //      sink.ready
		.sink_channel       (id_router_003_src_channel),             //          .channel
		.sink_data          (id_router_003_src_data),                //          .data
		.sink_startofpacket (id_router_003_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_003_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_003_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_003_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_003_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_003_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_003_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_003_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_003_src0_endofpacket)    //          .endofpacket
	);

	nios2processor_rsp_xbar_mux rsp_xbar_mux (
		.clk                 (clk_clk),                               //       clk.clk
		.reset               (rst_controller_reset_out_reset),        // clk_reset.reset
		.src_ready           (rsp_xbar_mux_src_ready),                //       src.ready
		.src_valid           (rsp_xbar_mux_src_valid),                //          .valid
		.src_data            (rsp_xbar_mux_src_data),                 //          .data
		.src_channel         (rsp_xbar_mux_src_channel),              //          .channel
		.src_startofpacket   (rsp_xbar_mux_src_startofpacket),        //          .startofpacket
		.src_endofpacket     (rsp_xbar_mux_src_endofpacket),          //          .endofpacket
		.sink0_ready         (rsp_xbar_demux_src0_ready),             //     sink0.ready
		.sink0_valid         (rsp_xbar_demux_src0_valid),             //          .valid
		.sink0_channel       (rsp_xbar_demux_src0_channel),           //          .channel
		.sink0_data          (rsp_xbar_demux_src0_data),              //          .data
		.sink0_startofpacket (rsp_xbar_demux_src0_startofpacket),     //          .startofpacket
		.sink0_endofpacket   (rsp_xbar_demux_src0_endofpacket),       //          .endofpacket
		.sink1_ready         (rsp_xbar_demux_001_src0_ready),         //     sink1.ready
		.sink1_valid         (rsp_xbar_demux_001_src0_valid),         //          .valid
		.sink1_channel       (rsp_xbar_demux_001_src0_channel),       //          .channel
		.sink1_data          (rsp_xbar_demux_001_src0_data),          //          .data
		.sink1_startofpacket (rsp_xbar_demux_001_src0_startofpacket), //          .startofpacket
		.sink1_endofpacket   (rsp_xbar_demux_001_src0_endofpacket)    //          .endofpacket
	);

	nios2processor_rsp_xbar_mux_001 rsp_xbar_mux_001 (
		.clk                 (clk_clk),                               //       clk.clk
		.reset               (rst_controller_reset_out_reset),        // clk_reset.reset
		.src_ready           (rsp_xbar_mux_001_src_ready),            //       src.ready
		.src_valid           (rsp_xbar_mux_001_src_valid),            //          .valid
		.src_data            (rsp_xbar_mux_001_src_data),             //          .data
		.src_channel         (rsp_xbar_mux_001_src_channel),          //          .channel
		.src_startofpacket   (rsp_xbar_mux_001_src_startofpacket),    //          .startofpacket
		.src_endofpacket     (rsp_xbar_mux_001_src_endofpacket),      //          .endofpacket
		.sink0_ready         (rsp_xbar_demux_src1_ready),             //     sink0.ready
		.sink0_valid         (rsp_xbar_demux_src1_valid),             //          .valid
		.sink0_channel       (rsp_xbar_demux_src1_channel),           //          .channel
		.sink0_data          (rsp_xbar_demux_src1_data),              //          .data
		.sink0_startofpacket (rsp_xbar_demux_src1_startofpacket),     //          .startofpacket
		.sink0_endofpacket   (rsp_xbar_demux_src1_endofpacket),       //          .endofpacket
		.sink1_ready         (rsp_xbar_demux_001_src1_ready),         //     sink1.ready
		.sink1_valid         (rsp_xbar_demux_001_src1_valid),         //          .valid
		.sink1_channel       (rsp_xbar_demux_001_src1_channel),       //          .channel
		.sink1_data          (rsp_xbar_demux_001_src1_data),          //          .data
		.sink1_startofpacket (rsp_xbar_demux_001_src1_startofpacket), //          .startofpacket
		.sink1_endofpacket   (rsp_xbar_demux_001_src1_endofpacket),   //          .endofpacket
		.sink2_ready         (rsp_xbar_demux_002_src0_ready),         //     sink2.ready
		.sink2_valid         (rsp_xbar_demux_002_src0_valid),         //          .valid
		.sink2_channel       (rsp_xbar_demux_002_src0_channel),       //          .channel
		.sink2_data          (rsp_xbar_demux_002_src0_data),          //          .data
		.sink2_startofpacket (rsp_xbar_demux_002_src0_startofpacket), //          .startofpacket
		.sink2_endofpacket   (rsp_xbar_demux_002_src0_endofpacket),   //          .endofpacket
		.sink3_ready         (rsp_xbar_demux_003_src0_ready),         //     sink3.ready
		.sink3_valid         (rsp_xbar_demux_003_src0_valid),         //          .valid
		.sink3_channel       (rsp_xbar_demux_003_src0_channel),       //          .channel
		.sink3_data          (rsp_xbar_demux_003_src0_data),          //          .data
		.sink3_startofpacket (rsp_xbar_demux_003_src0_startofpacket), //          .startofpacket
		.sink3_endofpacket   (rsp_xbar_demux_003_src0_endofpacket)    //          .endofpacket
	);

	nios2processor_irq_mapper irq_mapper (
		.clk           (clk_clk),                        //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.sender_irq    (cpu_d_irq_irq)                   //    sender.irq
	);

endmodule
