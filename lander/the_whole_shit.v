//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2015 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module clocks_0_avalon_clocks_slave_arbitrator (
                                                 // inputs:
                                                  clk,
                                                  clocks_0_avalon_clocks_slave_readdata,
                                                  reset_n,
                                                  the_whole_shit_clock_0_out_address_to_slave,
                                                  the_whole_shit_clock_0_out_read,
                                                  the_whole_shit_clock_0_out_write,

                                                 // outputs:
                                                  clocks_0_avalon_clocks_slave_address,
                                                  clocks_0_avalon_clocks_slave_readdata_from_sa,
                                                  d1_clocks_0_avalon_clocks_slave_end_xfer,
                                                  the_whole_shit_clock_0_out_granted_clocks_0_avalon_clocks_slave,
                                                  the_whole_shit_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave,
                                                  the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave,
                                                  the_whole_shit_clock_0_out_requests_clocks_0_avalon_clocks_slave
                                               )
;

  output           clocks_0_avalon_clocks_slave_address;
  output  [  7: 0] clocks_0_avalon_clocks_slave_readdata_from_sa;
  output           d1_clocks_0_avalon_clocks_slave_end_xfer;
  output           the_whole_shit_clock_0_out_granted_clocks_0_avalon_clocks_slave;
  output           the_whole_shit_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave;
  output           the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave;
  output           the_whole_shit_clock_0_out_requests_clocks_0_avalon_clocks_slave;
  input            clk;
  input   [  7: 0] clocks_0_avalon_clocks_slave_readdata;
  input            reset_n;
  input            the_whole_shit_clock_0_out_address_to_slave;
  input            the_whole_shit_clock_0_out_read;
  input            the_whole_shit_clock_0_out_write;

  wire             clocks_0_avalon_clocks_slave_address;
  wire             clocks_0_avalon_clocks_slave_allgrants;
  wire             clocks_0_avalon_clocks_slave_allow_new_arb_cycle;
  wire             clocks_0_avalon_clocks_slave_any_bursting_master_saved_grant;
  wire             clocks_0_avalon_clocks_slave_any_continuerequest;
  wire             clocks_0_avalon_clocks_slave_arb_counter_enable;
  reg              clocks_0_avalon_clocks_slave_arb_share_counter;
  wire             clocks_0_avalon_clocks_slave_arb_share_counter_next_value;
  wire             clocks_0_avalon_clocks_slave_arb_share_set_values;
  wire             clocks_0_avalon_clocks_slave_beginbursttransfer_internal;
  wire             clocks_0_avalon_clocks_slave_begins_xfer;
  wire             clocks_0_avalon_clocks_slave_end_xfer;
  wire             clocks_0_avalon_clocks_slave_firsttransfer;
  wire             clocks_0_avalon_clocks_slave_grant_vector;
  wire             clocks_0_avalon_clocks_slave_in_a_read_cycle;
  wire             clocks_0_avalon_clocks_slave_in_a_write_cycle;
  wire             clocks_0_avalon_clocks_slave_master_qreq_vector;
  wire             clocks_0_avalon_clocks_slave_non_bursting_master_requests;
  wire    [  7: 0] clocks_0_avalon_clocks_slave_readdata_from_sa;
  reg              clocks_0_avalon_clocks_slave_reg_firsttransfer;
  reg              clocks_0_avalon_clocks_slave_slavearbiterlockenable;
  wire             clocks_0_avalon_clocks_slave_slavearbiterlockenable2;
  wire             clocks_0_avalon_clocks_slave_unreg_firsttransfer;
  wire             clocks_0_avalon_clocks_slave_waits_for_read;
  wire             clocks_0_avalon_clocks_slave_waits_for_write;
  reg              d1_clocks_0_avalon_clocks_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register;
  wire             the_whole_shit_clock_0_out_arbiterlock;
  wire             the_whole_shit_clock_0_out_arbiterlock2;
  wire             the_whole_shit_clock_0_out_continuerequest;
  wire             the_whole_shit_clock_0_out_granted_clocks_0_avalon_clocks_slave;
  wire             the_whole_shit_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave;
  wire             the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave;
  reg              the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register;
  wire             the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register_in;
  wire             the_whole_shit_clock_0_out_requests_clocks_0_avalon_clocks_slave;
  wire             the_whole_shit_clock_0_out_saved_grant_clocks_0_avalon_clocks_slave;
  wire             wait_for_clocks_0_avalon_clocks_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~clocks_0_avalon_clocks_slave_end_xfer;
    end


  assign clocks_0_avalon_clocks_slave_begins_xfer = ~d1_reasons_to_wait & ((the_whole_shit_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave));
  //assign clocks_0_avalon_clocks_slave_readdata_from_sa = clocks_0_avalon_clocks_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign clocks_0_avalon_clocks_slave_readdata_from_sa = clocks_0_avalon_clocks_slave_readdata;

  assign the_whole_shit_clock_0_out_requests_clocks_0_avalon_clocks_slave = ((1) & (the_whole_shit_clock_0_out_read | the_whole_shit_clock_0_out_write)) & the_whole_shit_clock_0_out_read;
  //clocks_0_avalon_clocks_slave_arb_share_counter set values, which is an e_mux
  assign clocks_0_avalon_clocks_slave_arb_share_set_values = 1;

  //clocks_0_avalon_clocks_slave_non_bursting_master_requests mux, which is an e_mux
  assign clocks_0_avalon_clocks_slave_non_bursting_master_requests = the_whole_shit_clock_0_out_requests_clocks_0_avalon_clocks_slave;

  //clocks_0_avalon_clocks_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign clocks_0_avalon_clocks_slave_any_bursting_master_saved_grant = 0;

  //clocks_0_avalon_clocks_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign clocks_0_avalon_clocks_slave_arb_share_counter_next_value = clocks_0_avalon_clocks_slave_firsttransfer ? (clocks_0_avalon_clocks_slave_arb_share_set_values - 1) : |clocks_0_avalon_clocks_slave_arb_share_counter ? (clocks_0_avalon_clocks_slave_arb_share_counter - 1) : 0;

  //clocks_0_avalon_clocks_slave_allgrants all slave grants, which is an e_mux
  assign clocks_0_avalon_clocks_slave_allgrants = |clocks_0_avalon_clocks_slave_grant_vector;

  //clocks_0_avalon_clocks_slave_end_xfer assignment, which is an e_assign
  assign clocks_0_avalon_clocks_slave_end_xfer = ~(clocks_0_avalon_clocks_slave_waits_for_read | clocks_0_avalon_clocks_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave = clocks_0_avalon_clocks_slave_end_xfer & (~clocks_0_avalon_clocks_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //clocks_0_avalon_clocks_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign clocks_0_avalon_clocks_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave & clocks_0_avalon_clocks_slave_allgrants) | (end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave & ~clocks_0_avalon_clocks_slave_non_bursting_master_requests);

  //clocks_0_avalon_clocks_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clocks_0_avalon_clocks_slave_arb_share_counter <= 0;
      else if (clocks_0_avalon_clocks_slave_arb_counter_enable)
          clocks_0_avalon_clocks_slave_arb_share_counter <= clocks_0_avalon_clocks_slave_arb_share_counter_next_value;
    end


  //clocks_0_avalon_clocks_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clocks_0_avalon_clocks_slave_slavearbiterlockenable <= 0;
      else if ((|clocks_0_avalon_clocks_slave_master_qreq_vector & end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave) | (end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave & ~clocks_0_avalon_clocks_slave_non_bursting_master_requests))
          clocks_0_avalon_clocks_slave_slavearbiterlockenable <= |clocks_0_avalon_clocks_slave_arb_share_counter_next_value;
    end


  //the_whole_shit_clock_0/out clocks_0/avalon_clocks_slave arbiterlock, which is an e_assign
  assign the_whole_shit_clock_0_out_arbiterlock = clocks_0_avalon_clocks_slave_slavearbiterlockenable & the_whole_shit_clock_0_out_continuerequest;

  //clocks_0_avalon_clocks_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign clocks_0_avalon_clocks_slave_slavearbiterlockenable2 = |clocks_0_avalon_clocks_slave_arb_share_counter_next_value;

  //the_whole_shit_clock_0/out clocks_0/avalon_clocks_slave arbiterlock2, which is an e_assign
  assign the_whole_shit_clock_0_out_arbiterlock2 = clocks_0_avalon_clocks_slave_slavearbiterlockenable2 & the_whole_shit_clock_0_out_continuerequest;

  //clocks_0_avalon_clocks_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign clocks_0_avalon_clocks_slave_any_continuerequest = 1;

  //the_whole_shit_clock_0_out_continuerequest continued request, which is an e_assign
  assign the_whole_shit_clock_0_out_continuerequest = 1;

  assign the_whole_shit_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave = the_whole_shit_clock_0_out_requests_clocks_0_avalon_clocks_slave & ~((the_whole_shit_clock_0_out_read & ((|the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register))));
  //the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register_in = the_whole_shit_clock_0_out_granted_clocks_0_avalon_clocks_slave & the_whole_shit_clock_0_out_read & ~clocks_0_avalon_clocks_slave_waits_for_read & ~(|the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register);

  //shift register p1 the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register = {the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register, the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register_in};

  //the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register <= 0;
      else 
        the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register <= p1_the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register;
    end


  //local readdatavalid the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave, which is an e_mux
  assign the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave = the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register;

  //master is always granted when requested
  assign the_whole_shit_clock_0_out_granted_clocks_0_avalon_clocks_slave = the_whole_shit_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave;

  //the_whole_shit_clock_0/out saved-grant clocks_0/avalon_clocks_slave, which is an e_assign
  assign the_whole_shit_clock_0_out_saved_grant_clocks_0_avalon_clocks_slave = the_whole_shit_clock_0_out_requests_clocks_0_avalon_clocks_slave;

  //allow new arb cycle for clocks_0/avalon_clocks_slave, which is an e_assign
  assign clocks_0_avalon_clocks_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign clocks_0_avalon_clocks_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign clocks_0_avalon_clocks_slave_master_qreq_vector = 1;

  //clocks_0_avalon_clocks_slave_firsttransfer first transaction, which is an e_assign
  assign clocks_0_avalon_clocks_slave_firsttransfer = clocks_0_avalon_clocks_slave_begins_xfer ? clocks_0_avalon_clocks_slave_unreg_firsttransfer : clocks_0_avalon_clocks_slave_reg_firsttransfer;

  //clocks_0_avalon_clocks_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign clocks_0_avalon_clocks_slave_unreg_firsttransfer = ~(clocks_0_avalon_clocks_slave_slavearbiterlockenable & clocks_0_avalon_clocks_slave_any_continuerequest);

  //clocks_0_avalon_clocks_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clocks_0_avalon_clocks_slave_reg_firsttransfer <= 1'b1;
      else if (clocks_0_avalon_clocks_slave_begins_xfer)
          clocks_0_avalon_clocks_slave_reg_firsttransfer <= clocks_0_avalon_clocks_slave_unreg_firsttransfer;
    end


  //clocks_0_avalon_clocks_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign clocks_0_avalon_clocks_slave_beginbursttransfer_internal = clocks_0_avalon_clocks_slave_begins_xfer;

  //clocks_0_avalon_clocks_slave_address mux, which is an e_mux
  assign clocks_0_avalon_clocks_slave_address = the_whole_shit_clock_0_out_address_to_slave;

  //d1_clocks_0_avalon_clocks_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_clocks_0_avalon_clocks_slave_end_xfer <= 1;
      else 
        d1_clocks_0_avalon_clocks_slave_end_xfer <= clocks_0_avalon_clocks_slave_end_xfer;
    end


  //clocks_0_avalon_clocks_slave_waits_for_read in a cycle, which is an e_mux
  assign clocks_0_avalon_clocks_slave_waits_for_read = clocks_0_avalon_clocks_slave_in_a_read_cycle & 0;

  //clocks_0_avalon_clocks_slave_in_a_read_cycle assignment, which is an e_assign
  assign clocks_0_avalon_clocks_slave_in_a_read_cycle = the_whole_shit_clock_0_out_granted_clocks_0_avalon_clocks_slave & the_whole_shit_clock_0_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = clocks_0_avalon_clocks_slave_in_a_read_cycle;

  //clocks_0_avalon_clocks_slave_waits_for_write in a cycle, which is an e_mux
  assign clocks_0_avalon_clocks_slave_waits_for_write = clocks_0_avalon_clocks_slave_in_a_write_cycle & 0;

  //clocks_0_avalon_clocks_slave_in_a_write_cycle assignment, which is an e_assign
  assign clocks_0_avalon_clocks_slave_in_a_write_cycle = the_whole_shit_clock_0_out_granted_clocks_0_avalon_clocks_slave & the_whole_shit_clock_0_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = clocks_0_avalon_clocks_slave_in_a_write_cycle;

  assign wait_for_clocks_0_avalon_clocks_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //clocks_0/avalon_clocks_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_jtag_debug_module_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_debugaccess,
                                           cpu_data_master_latency_counter,
                                           cpu_data_master_read,
                                           cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           cpu_instruction_master_address_to_slave,
                                           cpu_instruction_master_latency_counter,
                                           cpu_instruction_master_read,
                                           cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register,
                                           cpu_jtag_debug_module_readdata,
                                           cpu_jtag_debug_module_resetrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_cpu_jtag_debug_module,
                                           cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_data_master_requests_cpu_jtag_debug_module,
                                           cpu_instruction_master_granted_cpu_jtag_debug_module,
                                           cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_instruction_master_requests_cpu_jtag_debug_module,
                                           cpu_jtag_debug_module_address,
                                           cpu_jtag_debug_module_begintransfer,
                                           cpu_jtag_debug_module_byteenable,
                                           cpu_jtag_debug_module_chipselect,
                                           cpu_jtag_debug_module_debugaccess,
                                           cpu_jtag_debug_module_readdata_from_sa,
                                           cpu_jtag_debug_module_reset_n,
                                           cpu_jtag_debug_module_resetrequest_from_sa,
                                           cpu_jtag_debug_module_write,
                                           cpu_jtag_debug_module_writedata,
                                           d1_cpu_jtag_debug_module_end_xfer
                                        )
;

  output           cpu_data_master_granted_cpu_jtag_debug_module;
  output           cpu_data_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_data_master_requests_cpu_jtag_debug_module;
  output           cpu_instruction_master_granted_cpu_jtag_debug_module;
  output           cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_instruction_master_requests_cpu_jtag_debug_module;
  output  [  8: 0] cpu_jtag_debug_module_address;
  output           cpu_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_jtag_debug_module_byteenable;
  output           cpu_jtag_debug_module_chipselect;
  output           cpu_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  output           cpu_jtag_debug_module_reset_n;
  output           cpu_jtag_debug_module_resetrequest_from_sa;
  output           cpu_jtag_debug_module_write;
  output  [ 31: 0] cpu_jtag_debug_module_writedata;
  output           d1_cpu_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input            cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 22: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  input   [ 31: 0] cpu_jtag_debug_module_readdata;
  input            cpu_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_saved_grant_cpu_jtag_debug_module;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_saved_grant_cpu_jtag_debug_module;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_allgrants;
  wire             cpu_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_jtag_debug_module_arb_addend;
  wire             cpu_jtag_debug_module_arb_counter_enable;
  reg     [  2: 0] cpu_jtag_debug_module_arb_share_counter;
  wire    [  2: 0] cpu_jtag_debug_module_arb_share_counter_next_value;
  wire    [  2: 0] cpu_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_jtag_debug_module_arb_winner;
  wire             cpu_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_jtag_debug_module_begins_xfer;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_jtag_debug_module_debugaccess;
  wire             cpu_jtag_debug_module_end_xfer;
  wire             cpu_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_jtag_debug_module_grant_vector;
  wire             cpu_jtag_debug_module_in_a_read_cycle;
  wire             cpu_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_jtag_debug_module_master_qreq_vector;
  wire             cpu_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  reg              cpu_jtag_debug_module_reg_firsttransfer;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_jtag_debug_module_waits_for_read;
  wire             cpu_jtag_debug_module_waits_for_write;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  reg              d1_cpu_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
  reg              last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
  wire    [ 22: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master;
  wire    [ 22: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master;
  wire             wait_for_cpu_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_jtag_debug_module_end_xfer;
    end


  assign cpu_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_jtag_debug_module | cpu_instruction_master_qualified_request_cpu_jtag_debug_module));
  //assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata;

  assign cpu_data_master_requests_cpu_jtag_debug_module = ({cpu_data_master_address_to_slave[22 : 11] , 11'b0} == 23'h500800) & (cpu_data_master_read | cpu_data_master_write);
  //cpu_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_jtag_debug_module_arb_share_set_values = 1;

  //cpu_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_jtag_debug_module_non_bursting_master_requests = cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module |
    cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_jtag_debug_module_arb_share_counter_next_value = cpu_jtag_debug_module_firsttransfer ? (cpu_jtag_debug_module_arb_share_set_values - 1) : |cpu_jtag_debug_module_arb_share_counter ? (cpu_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_jtag_debug_module_allgrants = (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector);

  //cpu_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_jtag_debug_module_end_xfer = ~(cpu_jtag_debug_module_waits_for_read | cpu_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_jtag_debug_module = cpu_jtag_debug_module_end_xfer & (~cpu_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & cpu_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests);

  //cpu_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_jtag_debug_module_arb_counter_enable)
          cpu_jtag_debug_module_arb_share_counter <= cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests))
          cpu_jtag_debug_module_slavearbiterlockenable <= |cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu/data_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_jtag_debug_module_slavearbiterlockenable2 = |cpu_jtag_debug_module_arb_share_counter_next_value;

  //cpu/data_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= cpu_instruction_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module & cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_jtag_debug_module_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cpu_jtag_debug_module = cpu_data_master_requests_cpu_jtag_debug_module & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register))) | cpu_instruction_master_arbiterlock);
  //local readdatavalid cpu_data_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_data_master_read_data_valid_cpu_jtag_debug_module = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //cpu_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_jtag_debug_module_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_cpu_jtag_debug_module = (({cpu_instruction_master_address_to_slave[22 : 11] , 11'b0} == 23'h500800) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= cpu_data_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_data_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module & cpu_data_master_requests_cpu_jtag_debug_module;

  assign cpu_instruction_master_qualified_request_cpu_jtag_debug_module = cpu_instruction_master_requests_cpu_jtag_debug_module & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0) | (|cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register))) | cpu_data_master_arbiterlock);
  //local readdatavalid cpu_instruction_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cpu_jtag_debug_module = cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cpu_jtag_debug_module;

  //cpu/instruction_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[0];

  //cpu/instruction_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[0] && cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu/data_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[1] = cpu_data_master_qualified_request_cpu_jtag_debug_module;

  //cpu/data_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[1];

  //cpu/data_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[1] && cpu_data_master_requests_cpu_jtag_debug_module;

  //cpu/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_double_vector = {cpu_jtag_debug_module_master_qreq_vector, cpu_jtag_debug_module_master_qreq_vector} & ({~cpu_jtag_debug_module_master_qreq_vector, ~cpu_jtag_debug_module_master_qreq_vector} + cpu_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_jtag_debug_module_arb_winner = (cpu_jtag_debug_module_allow_new_arb_cycle & | cpu_jtag_debug_module_grant_vector) ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_jtag_debug_module_allow_new_arb_cycle)
          cpu_jtag_debug_module_saved_chosen_master_vector <= |cpu_jtag_debug_module_grant_vector ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_jtag_debug_module_grant_vector = {(cpu_jtag_debug_module_chosen_master_double_vector[1] | cpu_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_jtag_debug_module_chosen_master_double_vector[0] | cpu_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_rot_left = (cpu_jtag_debug_module_arb_winner << 1) ? (cpu_jtag_debug_module_arb_winner << 1) : 1;

  //cpu/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_jtag_debug_module_grant_vector)
          cpu_jtag_debug_module_arb_addend <= cpu_jtag_debug_module_end_xfer? cpu_jtag_debug_module_chosen_master_rot_left : cpu_jtag_debug_module_grant_vector;
    end


  assign cpu_jtag_debug_module_begintransfer = cpu_jtag_debug_module_begins_xfer;
  //cpu_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_jtag_debug_module_reset_n = reset_n;

  //assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest;

  assign cpu_jtag_debug_module_chipselect = cpu_data_master_granted_cpu_jtag_debug_module | cpu_instruction_master_granted_cpu_jtag_debug_module;
  //cpu_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_firsttransfer = cpu_jtag_debug_module_begins_xfer ? cpu_jtag_debug_module_unreg_firsttransfer : cpu_jtag_debug_module_reg_firsttransfer;

  //cpu_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_unreg_firsttransfer = ~(cpu_jtag_debug_module_slavearbiterlockenable & cpu_jtag_debug_module_any_continuerequest);

  //cpu_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_jtag_debug_module_begins_xfer)
          cpu_jtag_debug_module_reg_firsttransfer <= cpu_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_jtag_debug_module_beginbursttransfer_internal = cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_jtag_debug_module_arbitration_holdoff_internal = cpu_jtag_debug_module_begins_xfer & cpu_jtag_debug_module_firsttransfer;

  //cpu_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_jtag_debug_module_write = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_jtag_debug_module_address mux, which is an e_mux
  assign cpu_jtag_debug_module_address = (cpu_data_master_granted_cpu_jtag_debug_module)? (shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master >> 2) :
    (shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master >> 2);

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_cpu_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_jtag_debug_module_end_xfer <= cpu_jtag_debug_module_end_xfer;
    end


  //cpu_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_read = cpu_jtag_debug_module_in_a_read_cycle & cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_read_cycle = (cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_jtag_debug_module_in_a_read_cycle;

  //cpu_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_write = cpu_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_write_cycle = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_jtag_debug_module_counter = 0;
  //cpu_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_jtag_debug_module_byteenable = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_jtag_debug_module_debugaccess = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cpu_jtag_debug_module + cpu_instruction_master_granted_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cpu_jtag_debug_module + cpu_instruction_master_saved_grant_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_data_master_arbitrator (
                                    // inputs:
                                     clk,
                                     cpu_data_master_address,
                                     cpu_data_master_byteenable,
                                     cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave,
                                     cpu_data_master_byteenable_the_whole_shit_clock_0_in,
                                     cpu_data_master_granted_cpu_jtag_debug_module,
                                     cpu_data_master_granted_onchip_ram_s1,
                                     cpu_data_master_granted_pixel_buffer_avalon_sram_slave,
                                     cpu_data_master_granted_the_whole_shit_clock_0_in,
                                     cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_onchip_ram_s1,
                                     cpu_data_master_qualified_request_pixel_buffer_avalon_sram_slave,
                                     cpu_data_master_qualified_request_the_whole_shit_clock_0_in,
                                     cpu_data_master_qualified_request_video_pixel_buffer_dma_0_avalon_control_slave,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_onchip_ram_s1,
                                     cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave,
                                     cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register,
                                     cpu_data_master_read_data_valid_the_whole_shit_clock_0_in,
                                     cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_onchip_ram_s1,
                                     cpu_data_master_requests_pixel_buffer_avalon_sram_slave,
                                     cpu_data_master_requests_the_whole_shit_clock_0_in,
                                     cpu_data_master_requests_video_pixel_buffer_dma_0_avalon_control_slave,
                                     cpu_data_master_write,
                                     cpu_data_master_writedata,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_onchip_ram_s1_end_xfer,
                                     d1_pixel_buffer_avalon_sram_slave_end_xfer,
                                     d1_the_whole_shit_clock_0_in_end_xfer,
                                     d1_video_pixel_buffer_dma_0_avalon_control_slave_end_xfer,
                                     onchip_ram_s1_readdata_from_sa,
                                     pixel_buffer_avalon_sram_slave_readdata_from_sa,
                                     reset_n,
                                     the_whole_shit_clock_0_in_readdata_from_sa,
                                     the_whole_shit_clock_0_in_waitrequest_from_sa,
                                     video_pixel_buffer_dma_0_avalon_control_slave_readdata_from_sa,

                                    // outputs:
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_dbs_address,
                                     cpu_data_master_dbs_write_16,
                                     cpu_data_master_dbs_write_8,
                                     cpu_data_master_latency_counter,
                                     cpu_data_master_readdata,
                                     cpu_data_master_readdatavalid,
                                     cpu_data_master_waitrequest
                                  )
;

  output  [ 22: 0] cpu_data_master_address_to_slave;
  output  [  1: 0] cpu_data_master_dbs_address;
  output  [ 15: 0] cpu_data_master_dbs_write_16;
  output  [  7: 0] cpu_data_master_dbs_write_8;
  output           cpu_data_master_latency_counter;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_readdatavalid;
  output           cpu_data_master_waitrequest;
  input            clk;
  input   [ 22: 0] cpu_data_master_address;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave;
  input            cpu_data_master_byteenable_the_whole_shit_clock_0_in;
  input            cpu_data_master_granted_cpu_jtag_debug_module;
  input            cpu_data_master_granted_onchip_ram_s1;
  input            cpu_data_master_granted_pixel_buffer_avalon_sram_slave;
  input            cpu_data_master_granted_the_whole_shit_clock_0_in;
  input            cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_onchip_ram_s1;
  input            cpu_data_master_qualified_request_pixel_buffer_avalon_sram_slave;
  input            cpu_data_master_qualified_request_the_whole_shit_clock_0_in;
  input            cpu_data_master_qualified_request_video_pixel_buffer_dma_0_avalon_control_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_onchip_ram_s1;
  input            cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave;
  input            cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  input            cpu_data_master_read_data_valid_the_whole_shit_clock_0_in;
  input            cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_onchip_ram_s1;
  input            cpu_data_master_requests_pixel_buffer_avalon_sram_slave;
  input            cpu_data_master_requests_the_whole_shit_clock_0_in;
  input            cpu_data_master_requests_video_pixel_buffer_dma_0_avalon_control_slave;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_onchip_ram_s1_end_xfer;
  input            d1_pixel_buffer_avalon_sram_slave_end_xfer;
  input            d1_the_whole_shit_clock_0_in_end_xfer;
  input            d1_video_pixel_buffer_dma_0_avalon_control_slave_end_xfer;
  input   [ 31: 0] onchip_ram_s1_readdata_from_sa;
  input   [ 15: 0] pixel_buffer_avalon_sram_slave_readdata_from_sa;
  input            reset_n;
  input   [  7: 0] the_whole_shit_clock_0_in_readdata_from_sa;
  input            the_whole_shit_clock_0_in_waitrequest_from_sa;
  input   [ 31: 0] video_pixel_buffer_dma_0_avalon_control_slave_readdata_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 22: 0] cpu_data_master_address_last_time;
  wire    [ 22: 0] cpu_data_master_address_to_slave;
  reg     [  3: 0] cpu_data_master_byteenable_last_time;
  reg     [  1: 0] cpu_data_master_dbs_address;
  wire    [  1: 0] cpu_data_master_dbs_increment;
  reg     [  1: 0] cpu_data_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_data_master_dbs_rdv_counter_inc;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire    [  7: 0] cpu_data_master_dbs_write_8;
  wire             cpu_data_master_is_granted_some_slave;
  reg              cpu_data_master_latency_counter;
  wire    [  1: 0] cpu_data_master_next_dbs_rdv_counter;
  reg              cpu_data_master_read_but_no_slave_selected;
  reg              cpu_data_master_read_last_time;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_readdatavalid;
  wire             cpu_data_master_run;
  wire             cpu_data_master_waitrequest;
  reg              cpu_data_master_write_last_time;
  reg     [ 31: 0] cpu_data_master_writedata_last_time;
  reg     [  7: 0] dbs_8_reg_segment_0;
  reg     [  7: 0] dbs_8_reg_segment_1;
  reg     [  7: 0] dbs_8_reg_segment_2;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire             latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire             p1_cpu_data_master_latency_counter;
  wire    [  7: 0] p1_dbs_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_8_reg_segment_2;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_data_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_onchip_ram_s1 | ~cpu_data_master_requests_onchip_ram_s1) & (cpu_data_master_granted_onchip_ram_s1 | ~cpu_data_master_qualified_request_onchip_ram_s1) & ((~cpu_data_master_qualified_request_onchip_ram_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_onchip_ram_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_pixel_buffer_avalon_sram_slave | (cpu_data_master_write & !cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave & cpu_data_master_dbs_address[1]) | ~cpu_data_master_requests_pixel_buffer_avalon_sram_slave) & (cpu_data_master_granted_pixel_buffer_avalon_sram_slave | ~cpu_data_master_qualified_request_pixel_buffer_avalon_sram_slave) & ((~cpu_data_master_qualified_request_pixel_buffer_avalon_sram_slave | ~cpu_data_master_read | (1 & (cpu_data_master_dbs_address[1]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_pixel_buffer_avalon_sram_slave | ~cpu_data_master_write | (1 & (cpu_data_master_dbs_address[1]) & cpu_data_master_write))) & 1 & ((cpu_data_master_qualified_request_the_whole_shit_clock_0_in | ((cpu_data_master_write & !cpu_data_master_byteenable_the_whole_shit_clock_0_in & cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0])) | ~cpu_data_master_requests_the_whole_shit_clock_0_in)) & ((~cpu_data_master_qualified_request_the_whole_shit_clock_0_in | ~cpu_data_master_read | (1 & ~the_whole_shit_clock_0_in_waitrequest_from_sa & (cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_the_whole_shit_clock_0_in | ~cpu_data_master_write | (1 & ~the_whole_shit_clock_0_in_waitrequest_from_sa & (cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0]) & cpu_data_master_write))) & 1;

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = (cpu_data_master_qualified_request_video_pixel_buffer_dma_0_avalon_control_slave | ~cpu_data_master_requests_video_pixel_buffer_dma_0_avalon_control_slave) & ((~cpu_data_master_qualified_request_video_pixel_buffer_dma_0_avalon_control_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_video_pixel_buffer_dma_0_avalon_control_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write))));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[22 : 0];

  //cpu_data_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_but_no_slave_selected <= 0;
      else 
        cpu_data_master_read_but_no_slave_selected <= cpu_data_master_read & cpu_data_master_run & ~cpu_data_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_data_master_is_granted_some_slave = cpu_data_master_granted_cpu_jtag_debug_module |
    cpu_data_master_granted_onchip_ram_s1 |
    cpu_data_master_granted_pixel_buffer_avalon_sram_slave |
    cpu_data_master_granted_the_whole_shit_clock_0_in |
    cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_data_master_readdatavalid = cpu_data_master_read_data_valid_onchip_ram_s1 |
    (cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave & dbs_rdv_counter_overflow) |
    cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_data_master_readdatavalid = cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_cpu_jtag_debug_module |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    (cpu_data_master_read_data_valid_the_whole_shit_clock_0_in & dbs_counter_overflow) |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid;

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~(cpu_data_master_qualified_request_cpu_jtag_debug_module & cpu_data_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_onchip_ram_s1}} | onchip_ram_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave}} | {pixel_buffer_avalon_sram_slave_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~(cpu_data_master_qualified_request_the_whole_shit_clock_0_in & cpu_data_master_read)}} | {the_whole_shit_clock_0_in_readdata_from_sa[7 : 0],
    dbs_8_reg_segment_2,
    dbs_8_reg_segment_1,
    dbs_8_reg_segment_0}) &
    ({32 {~cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave}} | video_pixel_buffer_dma_0_avalon_control_slave_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_data_master_waitrequest = ~cpu_data_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_latency_counter <= 0;
      else 
        cpu_data_master_latency_counter <= p1_cpu_data_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_data_master_latency_counter = ((cpu_data_master_run & cpu_data_master_read))? latency_load_value :
    (cpu_data_master_latency_counter)? cpu_data_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = ({1 {cpu_data_master_requests_onchip_ram_s1}} & 1) |
    ({1 {cpu_data_master_requests_video_pixel_buffer_dma_0_avalon_control_slave}} & 1);

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~0) & cpu_data_master_requests_pixel_buffer_avalon_sram_slave & cpu_data_master_write & !cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave)) |
    (cpu_data_master_granted_pixel_buffer_avalon_sram_slave & cpu_data_master_read & 1 & 1) |
    (cpu_data_master_granted_pixel_buffer_avalon_sram_slave & cpu_data_master_write & 1 & 1) |
    (((~0) & cpu_data_master_requests_the_whole_shit_clock_0_in & cpu_data_master_write & !cpu_data_master_byteenable_the_whole_shit_clock_0_in)) |
    (cpu_data_master_granted_the_whole_shit_clock_0_in & cpu_data_master_read & 1 & 1 & ~the_whole_shit_clock_0_in_waitrequest_from_sa) |
    (cpu_data_master_granted_the_whole_shit_clock_0_in & cpu_data_master_write & 1 & 1 & ~the_whole_shit_clock_0_in_waitrequest_from_sa);

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = pixel_buffer_avalon_sram_slave_readdata_from_sa;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_data_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign cpu_data_master_dbs_write_16 = (cpu_data_master_dbs_address[1])? cpu_data_master_writedata[31 : 16] :
    cpu_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign cpu_data_master_dbs_increment = (cpu_data_master_requests_pixel_buffer_avalon_sram_slave)? 2 :
    (cpu_data_master_requests_the_whole_shit_clock_0_in)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_data_master_dbs_address + cpu_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_data_master_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign cpu_data_master_next_dbs_rdv_counter = cpu_data_master_dbs_rdv_counter + cpu_data_master_dbs_rdv_counter_inc;

  //cpu_data_master_rdv_inc_mux, which is an e_mux
  assign cpu_data_master_dbs_rdv_counter_inc = 2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_data_master_dbs_rdv_counter <= cpu_data_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_data_master_dbs_rdv_counter[1] & ~cpu_data_master_next_dbs_rdv_counter[1];

  //input to dbs-8 stored 0, which is an e_mux
  assign p1_dbs_8_reg_segment_0 = the_whole_shit_clock_0_in_readdata_from_sa;

  //dbs register for dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_data_master_dbs_address[1 : 0]) == 0))
          dbs_8_reg_segment_0 <= p1_dbs_8_reg_segment_0;
    end


  //input to dbs-8 stored 1, which is an e_mux
  assign p1_dbs_8_reg_segment_1 = the_whole_shit_clock_0_in_readdata_from_sa;

  //dbs register for dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_1 <= 0;
      else if (dbs_count_enable & ((cpu_data_master_dbs_address[1 : 0]) == 1))
          dbs_8_reg_segment_1 <= p1_dbs_8_reg_segment_1;
    end


  //input to dbs-8 stored 2, which is an e_mux
  assign p1_dbs_8_reg_segment_2 = the_whole_shit_clock_0_in_readdata_from_sa;

  //dbs register for dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_2 <= 0;
      else if (dbs_count_enable & ((cpu_data_master_dbs_address[1 : 0]) == 2))
          dbs_8_reg_segment_2 <= p1_dbs_8_reg_segment_2;
    end


  //mux write dbs 2, which is an e_mux
  assign cpu_data_master_dbs_write_8 = ((cpu_data_master_dbs_address[1 : 0] == 0))? cpu_data_master_writedata[7 : 0] :
    ((cpu_data_master_dbs_address[1 : 0] == 1))? cpu_data_master_writedata[15 : 8] :
    ((cpu_data_master_dbs_address[1 : 0] == 2))? cpu_data_master_writedata[23 : 16] :
    cpu_data_master_writedata[31 : 24];


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_data_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_address_last_time <= 0;
      else 
        cpu_data_master_address_last_time <= cpu_data_master_address;
    end


  //cpu/data_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_data_master_waitrequest & (cpu_data_master_read | cpu_data_master_write);
    end


  //cpu_data_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_address != cpu_data_master_address_last_time))
        begin
          $write("%0d ns: cpu_data_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_byteenable_last_time <= 0;
      else 
        cpu_data_master_byteenable_last_time <= cpu_data_master_byteenable;
    end


  //cpu_data_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_byteenable != cpu_data_master_byteenable_last_time))
        begin
          $write("%0d ns: cpu_data_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_last_time <= 0;
      else 
        cpu_data_master_read_last_time <= cpu_data_master_read;
    end


  //cpu_data_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_read != cpu_data_master_read_last_time))
        begin
          $write("%0d ns: cpu_data_master_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_write_last_time <= 0;
      else 
        cpu_data_master_write_last_time <= cpu_data_master_write;
    end


  //cpu_data_master_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_write != cpu_data_master_write_last_time))
        begin
          $write("%0d ns: cpu_data_master_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_writedata_last_time <= 0;
      else 
        cpu_data_master_writedata_last_time <= cpu_data_master_writedata;
    end


  //cpu_data_master_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_writedata != cpu_data_master_writedata_last_time) & cpu_data_master_write)
        begin
          $write("%0d ns: cpu_data_master_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_instruction_master_arbitrator (
                                           // inputs:
                                            clk,
                                            cpu_instruction_master_address,
                                            cpu_instruction_master_granted_cpu_jtag_debug_module,
                                            cpu_instruction_master_granted_onchip_ram_s1,
                                            cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave,
                                            cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                            cpu_instruction_master_qualified_request_onchip_ram_s1,
                                            cpu_instruction_master_qualified_request_pixel_buffer_avalon_sram_slave,
                                            cpu_instruction_master_read,
                                            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                            cpu_instruction_master_read_data_valid_onchip_ram_s1,
                                            cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave,
                                            cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register,
                                            cpu_instruction_master_requests_cpu_jtag_debug_module,
                                            cpu_instruction_master_requests_onchip_ram_s1,
                                            cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave,
                                            cpu_jtag_debug_module_readdata_from_sa,
                                            d1_cpu_jtag_debug_module_end_xfer,
                                            d1_onchip_ram_s1_end_xfer,
                                            d1_pixel_buffer_avalon_sram_slave_end_xfer,
                                            onchip_ram_s1_readdata_from_sa,
                                            pixel_buffer_avalon_sram_slave_readdata_from_sa,
                                            reset_n,

                                           // outputs:
                                            cpu_instruction_master_address_to_slave,
                                            cpu_instruction_master_dbs_address,
                                            cpu_instruction_master_latency_counter,
                                            cpu_instruction_master_readdata,
                                            cpu_instruction_master_readdatavalid,
                                            cpu_instruction_master_waitrequest
                                         )
;

  output  [ 22: 0] cpu_instruction_master_address_to_slave;
  output  [  1: 0] cpu_instruction_master_dbs_address;
  output           cpu_instruction_master_latency_counter;
  output  [ 31: 0] cpu_instruction_master_readdata;
  output           cpu_instruction_master_readdatavalid;
  output           cpu_instruction_master_waitrequest;
  input            clk;
  input   [ 22: 0] cpu_instruction_master_address;
  input            cpu_instruction_master_granted_cpu_jtag_debug_module;
  input            cpu_instruction_master_granted_onchip_ram_s1;
  input            cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave;
  input            cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_instruction_master_qualified_request_onchip_ram_s1;
  input            cpu_instruction_master_qualified_request_pixel_buffer_avalon_sram_slave;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_instruction_master_read_data_valid_onchip_ram_s1;
  input            cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave;
  input            cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  input            cpu_instruction_master_requests_cpu_jtag_debug_module;
  input            cpu_instruction_master_requests_onchip_ram_s1;
  input            cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_onchip_ram_s1_end_xfer;
  input            d1_pixel_buffer_avalon_sram_slave_end_xfer;
  input   [ 31: 0] onchip_ram_s1_readdata_from_sa;
  input   [ 15: 0] pixel_buffer_avalon_sram_slave_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 22: 0] cpu_instruction_master_address_last_time;
  wire    [ 22: 0] cpu_instruction_master_address_to_slave;
  reg     [  1: 0] cpu_instruction_master_dbs_address;
  wire    [  1: 0] cpu_instruction_master_dbs_increment;
  reg     [  1: 0] cpu_instruction_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_instruction_master_dbs_rdv_counter_inc;
  wire             cpu_instruction_master_is_granted_some_slave;
  reg              cpu_instruction_master_latency_counter;
  wire    [  1: 0] cpu_instruction_master_next_dbs_rdv_counter;
  reg              cpu_instruction_master_read_but_no_slave_selected;
  reg              cpu_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_run;
  wire             cpu_instruction_master_waitrequest;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire             latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire             p1_cpu_instruction_master_latency_counter;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_instruction_master_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read))) & 1 & (cpu_instruction_master_qualified_request_onchip_ram_s1 | ~cpu_instruction_master_requests_onchip_ram_s1) & (cpu_instruction_master_granted_onchip_ram_s1 | ~cpu_instruction_master_qualified_request_onchip_ram_s1) & ((~cpu_instruction_master_qualified_request_onchip_ram_s1 | ~(cpu_instruction_master_read) | (1 & (cpu_instruction_master_read)))) & 1 & (cpu_instruction_master_qualified_request_pixel_buffer_avalon_sram_slave | ~cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave) & (cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave | ~cpu_instruction_master_qualified_request_pixel_buffer_avalon_sram_slave) & ((~cpu_instruction_master_qualified_request_pixel_buffer_avalon_sram_slave | ~cpu_instruction_master_read | (1 & (cpu_instruction_master_dbs_address[1]) & cpu_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_instruction_master_address_to_slave = cpu_instruction_master_address[22 : 0];

  //cpu_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_instruction_master_read_but_no_slave_selected <= cpu_instruction_master_read & cpu_instruction_master_run & ~cpu_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_instruction_master_is_granted_some_slave = cpu_instruction_master_granted_cpu_jtag_debug_module |
    cpu_instruction_master_granted_onchip_ram_s1 |
    cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_instruction_master_readdatavalid = cpu_instruction_master_read_data_valid_onchip_ram_s1 |
    (cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave & dbs_rdv_counter_overflow);

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_instruction_master_readdatavalid = cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_data_valid_cpu_jtag_debug_module |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid;

  //cpu/instruction_master readdata mux, which is an e_mux
  assign cpu_instruction_master_readdata = ({32 {~(cpu_instruction_master_qualified_request_cpu_jtag_debug_module & cpu_instruction_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_instruction_master_read_data_valid_onchip_ram_s1}} | onchip_ram_s1_readdata_from_sa) &
    ({32 {~cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave}} | {pixel_buffer_avalon_sram_slave_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign cpu_instruction_master_waitrequest = ~cpu_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_latency_counter <= 0;
      else 
        cpu_instruction_master_latency_counter <= p1_cpu_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_instruction_master_latency_counter = ((cpu_instruction_master_run & cpu_instruction_master_read))? latency_load_value :
    (cpu_instruction_master_latency_counter)? cpu_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {1 {cpu_instruction_master_requests_onchip_ram_s1}} & 1;

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = pixel_buffer_avalon_sram_slave_readdata_from_sa;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_instruction_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign cpu_instruction_master_dbs_increment = (cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_instruction_master_dbs_address + cpu_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_instruction_master_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign cpu_instruction_master_next_dbs_rdv_counter = cpu_instruction_master_dbs_rdv_counter + cpu_instruction_master_dbs_rdv_counter_inc;

  //cpu_instruction_master_rdv_inc_mux, which is an e_mux
  assign cpu_instruction_master_dbs_rdv_counter_inc = 2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_instruction_master_dbs_rdv_counter <= cpu_instruction_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_instruction_master_dbs_rdv_counter[1] & ~cpu_instruction_master_next_dbs_rdv_counter[1];

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave & cpu_instruction_master_read & 1 & 1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_address_last_time <= 0;
      else 
        cpu_instruction_master_address_last_time <= cpu_instruction_master_address;
    end


  //cpu/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_instruction_master_waitrequest & (cpu_instruction_master_read);
    end


  //cpu_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_address != cpu_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_last_time <= 0;
      else 
        cpu_instruction_master_read_last_time <= cpu_instruction_master_read;
    end


  //cpu_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_read != cpu_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module dual_clock_fifo_avalon_dc_buffer_sink_arbitrator (
                                                          // inputs:
                                                           clk,
                                                           dual_clock_fifo_avalon_dc_buffer_sink_ready,
                                                           reset_n,
                                                           video_pixel_buffer_dma_0_avalon_pixel_source_data,
                                                           video_pixel_buffer_dma_0_avalon_pixel_source_endofpacket,
                                                           video_pixel_buffer_dma_0_avalon_pixel_source_startofpacket,
                                                           video_pixel_buffer_dma_0_avalon_pixel_source_valid,

                                                          // outputs:
                                                           dual_clock_fifo_avalon_dc_buffer_sink_data,
                                                           dual_clock_fifo_avalon_dc_buffer_sink_endofpacket,
                                                           dual_clock_fifo_avalon_dc_buffer_sink_ready_from_sa,
                                                           dual_clock_fifo_avalon_dc_buffer_sink_startofpacket,
                                                           dual_clock_fifo_avalon_dc_buffer_sink_valid
                                                        )
;

  output  [ 29: 0] dual_clock_fifo_avalon_dc_buffer_sink_data;
  output           dual_clock_fifo_avalon_dc_buffer_sink_endofpacket;
  output           dual_clock_fifo_avalon_dc_buffer_sink_ready_from_sa;
  output           dual_clock_fifo_avalon_dc_buffer_sink_startofpacket;
  output           dual_clock_fifo_avalon_dc_buffer_sink_valid;
  input            clk;
  input            dual_clock_fifo_avalon_dc_buffer_sink_ready;
  input            reset_n;
  input   [ 29: 0] video_pixel_buffer_dma_0_avalon_pixel_source_data;
  input            video_pixel_buffer_dma_0_avalon_pixel_source_endofpacket;
  input            video_pixel_buffer_dma_0_avalon_pixel_source_startofpacket;
  input            video_pixel_buffer_dma_0_avalon_pixel_source_valid;

  wire    [ 29: 0] dual_clock_fifo_avalon_dc_buffer_sink_data;
  wire             dual_clock_fifo_avalon_dc_buffer_sink_endofpacket;
  wire             dual_clock_fifo_avalon_dc_buffer_sink_ready_from_sa;
  wire             dual_clock_fifo_avalon_dc_buffer_sink_startofpacket;
  wire             dual_clock_fifo_avalon_dc_buffer_sink_valid;
  //mux dual_clock_fifo_avalon_dc_buffer_sink_data, which is an e_mux
  assign dual_clock_fifo_avalon_dc_buffer_sink_data = video_pixel_buffer_dma_0_avalon_pixel_source_data;

  //mux dual_clock_fifo_avalon_dc_buffer_sink_endofpacket, which is an e_mux
  assign dual_clock_fifo_avalon_dc_buffer_sink_endofpacket = video_pixel_buffer_dma_0_avalon_pixel_source_endofpacket;

  //assign dual_clock_fifo_avalon_dc_buffer_sink_ready_from_sa = dual_clock_fifo_avalon_dc_buffer_sink_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign dual_clock_fifo_avalon_dc_buffer_sink_ready_from_sa = dual_clock_fifo_avalon_dc_buffer_sink_ready;

  //mux dual_clock_fifo_avalon_dc_buffer_sink_startofpacket, which is an e_mux
  assign dual_clock_fifo_avalon_dc_buffer_sink_startofpacket = video_pixel_buffer_dma_0_avalon_pixel_source_startofpacket;

  //mux dual_clock_fifo_avalon_dc_buffer_sink_valid, which is an e_mux
  assign dual_clock_fifo_avalon_dc_buffer_sink_valid = video_pixel_buffer_dma_0_avalon_pixel_source_valid;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module dual_clock_fifo_avalon_dc_buffer_source_arbitrator (
                                                            // inputs:
                                                             clk,
                                                             dual_clock_fifo_avalon_dc_buffer_source_data,
                                                             dual_clock_fifo_avalon_dc_buffer_source_endofpacket,
                                                             dual_clock_fifo_avalon_dc_buffer_source_startofpacket,
                                                             dual_clock_fifo_avalon_dc_buffer_source_valid,
                                                             reset_n,
                                                             video_vga_controller_0_avalon_vga_sink_ready_from_sa,

                                                            // outputs:
                                                             dual_clock_fifo_avalon_dc_buffer_source_ready
                                                          )
;

  output           dual_clock_fifo_avalon_dc_buffer_source_ready;
  input            clk;
  input   [ 29: 0] dual_clock_fifo_avalon_dc_buffer_source_data;
  input            dual_clock_fifo_avalon_dc_buffer_source_endofpacket;
  input            dual_clock_fifo_avalon_dc_buffer_source_startofpacket;
  input            dual_clock_fifo_avalon_dc_buffer_source_valid;
  input            reset_n;
  input            video_vga_controller_0_avalon_vga_sink_ready_from_sa;

  wire             dual_clock_fifo_avalon_dc_buffer_source_ready;
  //mux dual_clock_fifo_avalon_dc_buffer_source_ready, which is an e_mux
  assign dual_clock_fifo_avalon_dc_buffer_source_ready = video_vga_controller_0_avalon_vga_sink_ready_from_sa;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module onchip_ram_s1_arbitrator (
                                  // inputs:
                                   clk,
                                   cpu_data_master_address_to_slave,
                                   cpu_data_master_byteenable,
                                   cpu_data_master_latency_counter,
                                   cpu_data_master_read,
                                   cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register,
                                   cpu_data_master_write,
                                   cpu_data_master_writedata,
                                   cpu_instruction_master_address_to_slave,
                                   cpu_instruction_master_latency_counter,
                                   cpu_instruction_master_read,
                                   cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register,
                                   onchip_ram_s1_readdata,
                                   reset_n,

                                  // outputs:
                                   cpu_data_master_granted_onchip_ram_s1,
                                   cpu_data_master_qualified_request_onchip_ram_s1,
                                   cpu_data_master_read_data_valid_onchip_ram_s1,
                                   cpu_data_master_requests_onchip_ram_s1,
                                   cpu_instruction_master_granted_onchip_ram_s1,
                                   cpu_instruction_master_qualified_request_onchip_ram_s1,
                                   cpu_instruction_master_read_data_valid_onchip_ram_s1,
                                   cpu_instruction_master_requests_onchip_ram_s1,
                                   d1_onchip_ram_s1_end_xfer,
                                   onchip_ram_s1_address,
                                   onchip_ram_s1_byteenable,
                                   onchip_ram_s1_chipselect,
                                   onchip_ram_s1_clken,
                                   onchip_ram_s1_readdata_from_sa,
                                   onchip_ram_s1_reset,
                                   onchip_ram_s1_write,
                                   onchip_ram_s1_writedata
                                )
;

  output           cpu_data_master_granted_onchip_ram_s1;
  output           cpu_data_master_qualified_request_onchip_ram_s1;
  output           cpu_data_master_read_data_valid_onchip_ram_s1;
  output           cpu_data_master_requests_onchip_ram_s1;
  output           cpu_instruction_master_granted_onchip_ram_s1;
  output           cpu_instruction_master_qualified_request_onchip_ram_s1;
  output           cpu_instruction_master_read_data_valid_onchip_ram_s1;
  output           cpu_instruction_master_requests_onchip_ram_s1;
  output           d1_onchip_ram_s1_end_xfer;
  output  [ 16: 0] onchip_ram_s1_address;
  output  [  3: 0] onchip_ram_s1_byteenable;
  output           onchip_ram_s1_chipselect;
  output           onchip_ram_s1_clken;
  output  [ 31: 0] onchip_ram_s1_readdata_from_sa;
  output           onchip_ram_s1_reset;
  output           onchip_ram_s1_write;
  output  [ 31: 0] onchip_ram_s1_writedata;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 22: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  input   [ 31: 0] onchip_ram_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_onchip_ram_s1;
  wire             cpu_data_master_qualified_request_onchip_ram_s1;
  wire             cpu_data_master_read_data_valid_onchip_ram_s1;
  reg              cpu_data_master_read_data_valid_onchip_ram_s1_shift_register;
  wire             cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in;
  wire             cpu_data_master_requests_onchip_ram_s1;
  wire             cpu_data_master_saved_grant_onchip_ram_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_onchip_ram_s1;
  wire             cpu_instruction_master_qualified_request_onchip_ram_s1;
  wire             cpu_instruction_master_read_data_valid_onchip_ram_s1;
  reg              cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in;
  wire             cpu_instruction_master_requests_onchip_ram_s1;
  wire             cpu_instruction_master_saved_grant_onchip_ram_s1;
  reg              d1_onchip_ram_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_ram_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_onchip_ram_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1;
  wire    [ 16: 0] onchip_ram_s1_address;
  wire             onchip_ram_s1_allgrants;
  wire             onchip_ram_s1_allow_new_arb_cycle;
  wire             onchip_ram_s1_any_bursting_master_saved_grant;
  wire             onchip_ram_s1_any_continuerequest;
  reg     [  1: 0] onchip_ram_s1_arb_addend;
  wire             onchip_ram_s1_arb_counter_enable;
  reg     [  2: 0] onchip_ram_s1_arb_share_counter;
  wire    [  2: 0] onchip_ram_s1_arb_share_counter_next_value;
  wire    [  2: 0] onchip_ram_s1_arb_share_set_values;
  wire    [  1: 0] onchip_ram_s1_arb_winner;
  wire             onchip_ram_s1_arbitration_holdoff_internal;
  wire             onchip_ram_s1_beginbursttransfer_internal;
  wire             onchip_ram_s1_begins_xfer;
  wire    [  3: 0] onchip_ram_s1_byteenable;
  wire             onchip_ram_s1_chipselect;
  wire    [  3: 0] onchip_ram_s1_chosen_master_double_vector;
  wire    [  1: 0] onchip_ram_s1_chosen_master_rot_left;
  wire             onchip_ram_s1_clken;
  wire             onchip_ram_s1_end_xfer;
  wire             onchip_ram_s1_firsttransfer;
  wire    [  1: 0] onchip_ram_s1_grant_vector;
  wire             onchip_ram_s1_in_a_read_cycle;
  wire             onchip_ram_s1_in_a_write_cycle;
  wire    [  1: 0] onchip_ram_s1_master_qreq_vector;
  wire             onchip_ram_s1_non_bursting_master_requests;
  wire    [ 31: 0] onchip_ram_s1_readdata_from_sa;
  reg              onchip_ram_s1_reg_firsttransfer;
  wire             onchip_ram_s1_reset;
  reg     [  1: 0] onchip_ram_s1_saved_chosen_master_vector;
  reg              onchip_ram_s1_slavearbiterlockenable;
  wire             onchip_ram_s1_slavearbiterlockenable2;
  wire             onchip_ram_s1_unreg_firsttransfer;
  wire             onchip_ram_s1_waits_for_read;
  wire             onchip_ram_s1_waits_for_write;
  wire             onchip_ram_s1_write;
  wire    [ 31: 0] onchip_ram_s1_writedata;
  wire             p1_cpu_data_master_read_data_valid_onchip_ram_s1_shift_register;
  wire             p1_cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register;
  wire    [ 22: 0] shifted_address_to_onchip_ram_s1_from_cpu_data_master;
  wire    [ 22: 0] shifted_address_to_onchip_ram_s1_from_cpu_instruction_master;
  wire             wait_for_onchip_ram_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~onchip_ram_s1_end_xfer;
    end


  assign onchip_ram_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_onchip_ram_s1 | cpu_instruction_master_qualified_request_onchip_ram_s1));
  //assign onchip_ram_s1_readdata_from_sa = onchip_ram_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_ram_s1_readdata_from_sa = onchip_ram_s1_readdata;

  assign cpu_data_master_requests_onchip_ram_s1 = ({cpu_data_master_address_to_slave[22 : 19] , 19'b0} == 23'h480000) & (cpu_data_master_read | cpu_data_master_write);
  //onchip_ram_s1_arb_share_counter set values, which is an e_mux
  assign onchip_ram_s1_arb_share_set_values = 1;

  //onchip_ram_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_ram_s1_non_bursting_master_requests = cpu_data_master_requests_onchip_ram_s1 |
    cpu_instruction_master_requests_onchip_ram_s1 |
    cpu_data_master_requests_onchip_ram_s1 |
    cpu_instruction_master_requests_onchip_ram_s1;

  //onchip_ram_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_ram_s1_any_bursting_master_saved_grant = 0;

  //onchip_ram_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_ram_s1_arb_share_counter_next_value = onchip_ram_s1_firsttransfer ? (onchip_ram_s1_arb_share_set_values - 1) : |onchip_ram_s1_arb_share_counter ? (onchip_ram_s1_arb_share_counter - 1) : 0;

  //onchip_ram_s1_allgrants all slave grants, which is an e_mux
  assign onchip_ram_s1_allgrants = (|onchip_ram_s1_grant_vector) |
    (|onchip_ram_s1_grant_vector) |
    (|onchip_ram_s1_grant_vector) |
    (|onchip_ram_s1_grant_vector);

  //onchip_ram_s1_end_xfer assignment, which is an e_assign
  assign onchip_ram_s1_end_xfer = ~(onchip_ram_s1_waits_for_read | onchip_ram_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_ram_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_ram_s1 = onchip_ram_s1_end_xfer & (~onchip_ram_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_ram_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_ram_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_ram_s1 & onchip_ram_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_ram_s1 & ~onchip_ram_s1_non_bursting_master_requests);

  //onchip_ram_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_arb_share_counter <= 0;
      else if (onchip_ram_s1_arb_counter_enable)
          onchip_ram_s1_arb_share_counter <= onchip_ram_s1_arb_share_counter_next_value;
    end


  //onchip_ram_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_ram_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_ram_s1) | (end_xfer_arb_share_counter_term_onchip_ram_s1 & ~onchip_ram_s1_non_bursting_master_requests))
          onchip_ram_s1_slavearbiterlockenable <= |onchip_ram_s1_arb_share_counter_next_value;
    end


  //cpu/data_master onchip_ram/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = onchip_ram_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //onchip_ram_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_ram_s1_slavearbiterlockenable2 = |onchip_ram_s1_arb_share_counter_next_value;

  //cpu/data_master onchip_ram/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = onchip_ram_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master onchip_ram/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = onchip_ram_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master onchip_ram/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = onchip_ram_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted onchip_ram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1 <= cpu_instruction_master_saved_grant_onchip_ram_s1 ? 1 : (onchip_ram_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_onchip_ram_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_onchip_ram_s1 & cpu_instruction_master_requests_onchip_ram_s1;

  //onchip_ram_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign onchip_ram_s1_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_onchip_ram_s1 = cpu_data_master_requests_onchip_ram_s1 & ~((cpu_data_master_read & ((1 < cpu_data_master_latency_counter) | (|cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register))) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in = cpu_data_master_granted_onchip_ram_s1 & cpu_data_master_read & ~onchip_ram_s1_waits_for_read;

  //shift register p1 cpu_data_master_read_data_valid_onchip_ram_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_onchip_ram_s1_shift_register = {cpu_data_master_read_data_valid_onchip_ram_s1_shift_register, cpu_data_master_read_data_valid_onchip_ram_s1_shift_register_in};

  //cpu_data_master_read_data_valid_onchip_ram_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_onchip_ram_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_onchip_ram_s1_shift_register <= p1_cpu_data_master_read_data_valid_onchip_ram_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_onchip_ram_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_onchip_ram_s1 = cpu_data_master_read_data_valid_onchip_ram_s1_shift_register;

  //onchip_ram_s1_writedata mux, which is an e_mux
  assign onchip_ram_s1_writedata = cpu_data_master_writedata;

  //mux onchip_ram_s1_clken, which is an e_mux
  assign onchip_ram_s1_clken = 1'b1;

  assign cpu_instruction_master_requests_onchip_ram_s1 = (({cpu_instruction_master_address_to_slave[22 : 19] , 19'b0} == 23'h480000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted onchip_ram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_onchip_ram_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_onchip_ram_s1 <= cpu_data_master_saved_grant_onchip_ram_s1 ? 1 : (onchip_ram_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_onchip_ram_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_onchip_ram_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_onchip_ram_s1 & cpu_data_master_requests_onchip_ram_s1;

  assign cpu_instruction_master_qualified_request_onchip_ram_s1 = cpu_instruction_master_requests_onchip_ram_s1 & ~((cpu_instruction_master_read & ((1 < cpu_instruction_master_latency_counter) | (|cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in = cpu_instruction_master_granted_onchip_ram_s1 & cpu_instruction_master_read & ~onchip_ram_s1_waits_for_read;

  //shift register p1 cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register = {cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register, cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_onchip_ram_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_onchip_ram_s1 = cpu_instruction_master_read_data_valid_onchip_ram_s1_shift_register;

  //allow new arb cycle for onchip_ram/s1, which is an e_assign
  assign onchip_ram_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for onchip_ram/s1, which is an e_assign
  assign onchip_ram_s1_master_qreq_vector[0] = cpu_instruction_master_qualified_request_onchip_ram_s1;

  //cpu/instruction_master grant onchip_ram/s1, which is an e_assign
  assign cpu_instruction_master_granted_onchip_ram_s1 = onchip_ram_s1_grant_vector[0];

  //cpu/instruction_master saved-grant onchip_ram/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_onchip_ram_s1 = onchip_ram_s1_arb_winner[0] && cpu_instruction_master_requests_onchip_ram_s1;

  //cpu/data_master assignment into master qualified-requests vector for onchip_ram/s1, which is an e_assign
  assign onchip_ram_s1_master_qreq_vector[1] = cpu_data_master_qualified_request_onchip_ram_s1;

  //cpu/data_master grant onchip_ram/s1, which is an e_assign
  assign cpu_data_master_granted_onchip_ram_s1 = onchip_ram_s1_grant_vector[1];

  //cpu/data_master saved-grant onchip_ram/s1, which is an e_assign
  assign cpu_data_master_saved_grant_onchip_ram_s1 = onchip_ram_s1_arb_winner[1] && cpu_data_master_requests_onchip_ram_s1;

  //onchip_ram/s1 chosen-master double-vector, which is an e_assign
  assign onchip_ram_s1_chosen_master_double_vector = {onchip_ram_s1_master_qreq_vector, onchip_ram_s1_master_qreq_vector} & ({~onchip_ram_s1_master_qreq_vector, ~onchip_ram_s1_master_qreq_vector} + onchip_ram_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign onchip_ram_s1_arb_winner = (onchip_ram_s1_allow_new_arb_cycle & | onchip_ram_s1_grant_vector) ? onchip_ram_s1_grant_vector : onchip_ram_s1_saved_chosen_master_vector;

  //saved onchip_ram_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_saved_chosen_master_vector <= 0;
      else if (onchip_ram_s1_allow_new_arb_cycle)
          onchip_ram_s1_saved_chosen_master_vector <= |onchip_ram_s1_grant_vector ? onchip_ram_s1_grant_vector : onchip_ram_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign onchip_ram_s1_grant_vector = {(onchip_ram_s1_chosen_master_double_vector[1] | onchip_ram_s1_chosen_master_double_vector[3]),
    (onchip_ram_s1_chosen_master_double_vector[0] | onchip_ram_s1_chosen_master_double_vector[2])};

  //onchip_ram/s1 chosen master rotated left, which is an e_assign
  assign onchip_ram_s1_chosen_master_rot_left = (onchip_ram_s1_arb_winner << 1) ? (onchip_ram_s1_arb_winner << 1) : 1;

  //onchip_ram/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_arb_addend <= 1;
      else if (|onchip_ram_s1_grant_vector)
          onchip_ram_s1_arb_addend <= onchip_ram_s1_end_xfer? onchip_ram_s1_chosen_master_rot_left : onchip_ram_s1_grant_vector;
    end


  //~onchip_ram_s1_reset assignment, which is an e_assign
  assign onchip_ram_s1_reset = ~reset_n;

  assign onchip_ram_s1_chipselect = cpu_data_master_granted_onchip_ram_s1 | cpu_instruction_master_granted_onchip_ram_s1;
  //onchip_ram_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_ram_s1_firsttransfer = onchip_ram_s1_begins_xfer ? onchip_ram_s1_unreg_firsttransfer : onchip_ram_s1_reg_firsttransfer;

  //onchip_ram_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_ram_s1_unreg_firsttransfer = ~(onchip_ram_s1_slavearbiterlockenable & onchip_ram_s1_any_continuerequest);

  //onchip_ram_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_ram_s1_reg_firsttransfer <= 1'b1;
      else if (onchip_ram_s1_begins_xfer)
          onchip_ram_s1_reg_firsttransfer <= onchip_ram_s1_unreg_firsttransfer;
    end


  //onchip_ram_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_ram_s1_beginbursttransfer_internal = onchip_ram_s1_begins_xfer;

  //onchip_ram_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign onchip_ram_s1_arbitration_holdoff_internal = onchip_ram_s1_begins_xfer & onchip_ram_s1_firsttransfer;

  //onchip_ram_s1_write assignment, which is an e_mux
  assign onchip_ram_s1_write = cpu_data_master_granted_onchip_ram_s1 & cpu_data_master_write;

  assign shifted_address_to_onchip_ram_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //onchip_ram_s1_address mux, which is an e_mux
  assign onchip_ram_s1_address = (cpu_data_master_granted_onchip_ram_s1)? (shifted_address_to_onchip_ram_s1_from_cpu_data_master >> 2) :
    (shifted_address_to_onchip_ram_s1_from_cpu_instruction_master >> 2);

  assign shifted_address_to_onchip_ram_s1_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_onchip_ram_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_ram_s1_end_xfer <= 1;
      else 
        d1_onchip_ram_s1_end_xfer <= onchip_ram_s1_end_xfer;
    end


  //onchip_ram_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_ram_s1_waits_for_read = onchip_ram_s1_in_a_read_cycle & 0;

  //onchip_ram_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_ram_s1_in_a_read_cycle = (cpu_data_master_granted_onchip_ram_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_onchip_ram_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_ram_s1_in_a_read_cycle;

  //onchip_ram_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_ram_s1_waits_for_write = onchip_ram_s1_in_a_write_cycle & 0;

  //onchip_ram_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_ram_s1_in_a_write_cycle = cpu_data_master_granted_onchip_ram_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_ram_s1_in_a_write_cycle;

  assign wait_for_onchip_ram_s1_counter = 0;
  //onchip_ram_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_ram_s1_byteenable = (cpu_data_master_granted_onchip_ram_s1)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_ram/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_onchip_ram_s1 + cpu_instruction_master_granted_onchip_ram_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_onchip_ram_s1 + cpu_instruction_master_saved_grant_onchip_ram_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_data_master_to_pixel_buffer_avalon_sram_slave_module (
                                                                               // inputs:
                                                                                clear_fifo,
                                                                                clk,
                                                                                data_in,
                                                                                read,
                                                                                reset_n,
                                                                                sync_reset,
                                                                                write,

                                                                               // outputs:
                                                                                data_out,
                                                                                empty,
                                                                                fifo_contains_ones_n,
                                                                                full
                                                                             )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_2;
  reg     [  2: 0] how_many_ones;
  wire    [  2: 0] one_count_minus_one;
  wire    [  2: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  reg              stage_0;
  reg              stage_1;
  wire    [  2: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_1;
  assign empty = !full_0;
  assign full_2 = 0;
  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    0;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_instruction_master_to_pixel_buffer_avalon_sram_slave_module (
                                                                                      // inputs:
                                                                                       clear_fifo,
                                                                                       clk,
                                                                                       data_in,
                                                                                       read,
                                                                                       reset_n,
                                                                                       sync_reset,
                                                                                       write,

                                                                                      // outputs:
                                                                                       data_out,
                                                                                       empty,
                                                                                       fifo_contains_ones_n,
                                                                                       full
                                                                                    )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_2;
  reg     [  2: 0] how_many_ones;
  wire    [  2: 0] one_count_minus_one;
  wire    [  2: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  reg              stage_0;
  reg              stage_1;
  wire    [  2: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_1;
  assign empty = !full_0;
  assign full_2 = 0;
  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    0;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_video_pixel_buffer_dma_0_avalon_pixel_dma_master_to_pixel_buffer_avalon_sram_slave_module (
                                                                                                                // inputs:
                                                                                                                 clear_fifo,
                                                                                                                 clk,
                                                                                                                 data_in,
                                                                                                                 read,
                                                                                                                 reset_n,
                                                                                                                 sync_reset,
                                                                                                                 write,

                                                                                                                // outputs:
                                                                                                                 data_out,
                                                                                                                 empty,
                                                                                                                 fifo_contains_ones_n,
                                                                                                                 full
                                                                                                              )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_2;
  reg     [  2: 0] how_many_ones;
  wire    [  2: 0] one_count_minus_one;
  wire    [  2: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  reg              stage_0;
  reg              stage_1;
  wire    [  2: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_1;
  assign empty = !full_0;
  assign full_2 = 0;
  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    0;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pixel_buffer_avalon_sram_slave_arbitrator (
                                                   // inputs:
                                                    clk,
                                                    cpu_data_master_address_to_slave,
                                                    cpu_data_master_byteenable,
                                                    cpu_data_master_dbs_address,
                                                    cpu_data_master_dbs_write_16,
                                                    cpu_data_master_latency_counter,
                                                    cpu_data_master_read,
                                                    cpu_data_master_write,
                                                    cpu_instruction_master_address_to_slave,
                                                    cpu_instruction_master_dbs_address,
                                                    cpu_instruction_master_latency_counter,
                                                    cpu_instruction_master_read,
                                                    pixel_buffer_avalon_sram_slave_readdata,
                                                    pixel_buffer_avalon_sram_slave_readdatavalid,
                                                    reset_n,
                                                    video_pixel_buffer_dma_0_avalon_pixel_dma_master_address_to_slave,
                                                    video_pixel_buffer_dma_0_avalon_pixel_dma_master_arbiterlock,
                                                    video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_address,
                                                    video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter,
                                                    video_pixel_buffer_dma_0_avalon_pixel_dma_master_read,

                                                   // outputs:
                                                    cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave,
                                                    cpu_data_master_granted_pixel_buffer_avalon_sram_slave,
                                                    cpu_data_master_qualified_request_pixel_buffer_avalon_sram_slave,
                                                    cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave,
                                                    cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register,
                                                    cpu_data_master_requests_pixel_buffer_avalon_sram_slave,
                                                    cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave,
                                                    cpu_instruction_master_qualified_request_pixel_buffer_avalon_sram_slave,
                                                    cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave,
                                                    cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register,
                                                    cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave,
                                                    d1_pixel_buffer_avalon_sram_slave_end_xfer,
                                                    pixel_buffer_avalon_sram_slave_address,
                                                    pixel_buffer_avalon_sram_slave_byteenable,
                                                    pixel_buffer_avalon_sram_slave_read,
                                                    pixel_buffer_avalon_sram_slave_readdata_from_sa,
                                                    pixel_buffer_avalon_sram_slave_reset,
                                                    pixel_buffer_avalon_sram_slave_write,
                                                    pixel_buffer_avalon_sram_slave_writedata,
                                                    video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave,
                                                    video_pixel_buffer_dma_0_avalon_pixel_dma_master_qualified_request_pixel_buffer_avalon_sram_slave,
                                                    video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave,
                                                    video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register,
                                                    video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave
                                                 )
;

  output  [  1: 0] cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave;
  output           cpu_data_master_granted_pixel_buffer_avalon_sram_slave;
  output           cpu_data_master_qualified_request_pixel_buffer_avalon_sram_slave;
  output           cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave;
  output           cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  output           cpu_data_master_requests_pixel_buffer_avalon_sram_slave;
  output           cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave;
  output           cpu_instruction_master_qualified_request_pixel_buffer_avalon_sram_slave;
  output           cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave;
  output           cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  output           cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave;
  output           d1_pixel_buffer_avalon_sram_slave_end_xfer;
  output  [ 19: 0] pixel_buffer_avalon_sram_slave_address;
  output  [  1: 0] pixel_buffer_avalon_sram_slave_byteenable;
  output           pixel_buffer_avalon_sram_slave_read;
  output  [ 15: 0] pixel_buffer_avalon_sram_slave_readdata_from_sa;
  output           pixel_buffer_avalon_sram_slave_reset;
  output           pixel_buffer_avalon_sram_slave_write;
  output  [ 15: 0] pixel_buffer_avalon_sram_slave_writedata;
  output           video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave;
  output           video_pixel_buffer_dma_0_avalon_pixel_dma_master_qualified_request_pixel_buffer_avalon_sram_slave;
  output           video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave;
  output           video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  output           video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [ 15: 0] cpu_data_master_dbs_write_16;
  input            cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 22: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input            cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input   [ 15: 0] pixel_buffer_avalon_sram_slave_readdata;
  input            pixel_buffer_avalon_sram_slave_readdatavalid;
  input            reset_n;
  input   [ 31: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_address_to_slave;
  input            video_pixel_buffer_dma_0_avalon_pixel_dma_master_arbiterlock;
  input   [  1: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_address;
  input            video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter;
  input            video_pixel_buffer_dma_0_avalon_pixel_dma_master_read;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire    [  1: 0] cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave;
  wire    [  1: 0] cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave_segment_0;
  wire    [  1: 0] cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave_segment_1;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_pixel_buffer_avalon_sram_slave;
  wire             cpu_data_master_qualified_request_pixel_buffer_avalon_sram_slave;
  wire             cpu_data_master_rdv_fifo_empty_pixel_buffer_avalon_sram_slave;
  wire             cpu_data_master_rdv_fifo_output_from_pixel_buffer_avalon_sram_slave;
  wire             cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave;
  wire             cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  wire             cpu_data_master_requests_pixel_buffer_avalon_sram_slave;
  wire             cpu_data_master_saved_grant_pixel_buffer_avalon_sram_slave;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave;
  wire             cpu_instruction_master_qualified_request_pixel_buffer_avalon_sram_slave;
  wire             cpu_instruction_master_rdv_fifo_empty_pixel_buffer_avalon_sram_slave;
  wire             cpu_instruction_master_rdv_fifo_output_from_pixel_buffer_avalon_sram_slave;
  wire             cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave;
  wire             cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  wire             cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave;
  wire             cpu_instruction_master_saved_grant_pixel_buffer_avalon_sram_slave;
  reg              d1_pixel_buffer_avalon_sram_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pixel_buffer_avalon_sram_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_pixel_buffer_avalon_sram_slave;
  reg              last_cycle_cpu_instruction_master_granted_slave_pixel_buffer_avalon_sram_slave;
  reg              last_cycle_video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_slave_pixel_buffer_avalon_sram_slave;
  wire    [ 19: 0] pixel_buffer_avalon_sram_slave_address;
  wire             pixel_buffer_avalon_sram_slave_allgrants;
  wire             pixel_buffer_avalon_sram_slave_allow_new_arb_cycle;
  wire             pixel_buffer_avalon_sram_slave_any_bursting_master_saved_grant;
  wire             pixel_buffer_avalon_sram_slave_any_continuerequest;
  reg     [  2: 0] pixel_buffer_avalon_sram_slave_arb_addend;
  wire             pixel_buffer_avalon_sram_slave_arb_counter_enable;
  reg     [  2: 0] pixel_buffer_avalon_sram_slave_arb_share_counter;
  wire    [  2: 0] pixel_buffer_avalon_sram_slave_arb_share_counter_next_value;
  wire    [  2: 0] pixel_buffer_avalon_sram_slave_arb_share_set_values;
  wire    [  2: 0] pixel_buffer_avalon_sram_slave_arb_winner;
  wire             pixel_buffer_avalon_sram_slave_arbitration_holdoff_internal;
  wire             pixel_buffer_avalon_sram_slave_beginbursttransfer_internal;
  wire             pixel_buffer_avalon_sram_slave_begins_xfer;
  wire    [  1: 0] pixel_buffer_avalon_sram_slave_byteenable;
  wire    [  5: 0] pixel_buffer_avalon_sram_slave_chosen_master_double_vector;
  wire    [  2: 0] pixel_buffer_avalon_sram_slave_chosen_master_rot_left;
  wire             pixel_buffer_avalon_sram_slave_end_xfer;
  wire             pixel_buffer_avalon_sram_slave_firsttransfer;
  wire    [  2: 0] pixel_buffer_avalon_sram_slave_grant_vector;
  wire             pixel_buffer_avalon_sram_slave_in_a_read_cycle;
  wire             pixel_buffer_avalon_sram_slave_in_a_write_cycle;
  wire    [  2: 0] pixel_buffer_avalon_sram_slave_master_qreq_vector;
  wire             pixel_buffer_avalon_sram_slave_move_on_to_next_transaction;
  wire             pixel_buffer_avalon_sram_slave_non_bursting_master_requests;
  wire             pixel_buffer_avalon_sram_slave_read;
  wire    [ 15: 0] pixel_buffer_avalon_sram_slave_readdata_from_sa;
  wire             pixel_buffer_avalon_sram_slave_readdatavalid_from_sa;
  reg              pixel_buffer_avalon_sram_slave_reg_firsttransfer;
  wire             pixel_buffer_avalon_sram_slave_reset;
  reg     [  2: 0] pixel_buffer_avalon_sram_slave_saved_chosen_master_vector;
  reg              pixel_buffer_avalon_sram_slave_slavearbiterlockenable;
  wire             pixel_buffer_avalon_sram_slave_slavearbiterlockenable2;
  wire             pixel_buffer_avalon_sram_slave_unreg_firsttransfer;
  wire             pixel_buffer_avalon_sram_slave_waits_for_read;
  wire             pixel_buffer_avalon_sram_slave_waits_for_write;
  wire             pixel_buffer_avalon_sram_slave_write;
  wire    [ 15: 0] pixel_buffer_avalon_sram_slave_writedata;
  wire             saved_chosen_master_btw_video_pixel_buffer_dma_0_avalon_pixel_dma_master_and_pixel_buffer_avalon_sram_slave;
  wire    [ 22: 0] shifted_address_to_pixel_buffer_avalon_sram_slave_from_cpu_data_master;
  wire    [ 22: 0] shifted_address_to_pixel_buffer_avalon_sram_slave_from_cpu_instruction_master;
  wire    [ 31: 0] shifted_address_to_pixel_buffer_avalon_sram_slave_from_video_pixel_buffer_dma_0_avalon_pixel_dma_master;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_arbiterlock2;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_continuerequest;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_qualified_request_pixel_buffer_avalon_sram_slave;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_rdv_fifo_empty_pixel_buffer_avalon_sram_slave;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_rdv_fifo_output_from_pixel_buffer_avalon_sram_slave;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_saved_grant_pixel_buffer_avalon_sram_slave;
  wire             wait_for_pixel_buffer_avalon_sram_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pixel_buffer_avalon_sram_slave_end_xfer;
    end


  assign pixel_buffer_avalon_sram_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_pixel_buffer_avalon_sram_slave | cpu_instruction_master_qualified_request_pixel_buffer_avalon_sram_slave | video_pixel_buffer_dma_0_avalon_pixel_dma_master_qualified_request_pixel_buffer_avalon_sram_slave));
  //assign pixel_buffer_avalon_sram_slave_readdatavalid_from_sa = pixel_buffer_avalon_sram_slave_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_readdatavalid_from_sa = pixel_buffer_avalon_sram_slave_readdatavalid;

  //assign pixel_buffer_avalon_sram_slave_readdata_from_sa = pixel_buffer_avalon_sram_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_readdata_from_sa = pixel_buffer_avalon_sram_slave_readdata;

  assign cpu_data_master_requests_pixel_buffer_avalon_sram_slave = ({cpu_data_master_address_to_slave[22 : 21] , 21'b0} == 23'h200000) & (cpu_data_master_read | cpu_data_master_write);
  //pixel_buffer_avalon_sram_slave_arb_share_counter set values, which is an e_mux
  assign pixel_buffer_avalon_sram_slave_arb_share_set_values = (cpu_data_master_granted_pixel_buffer_avalon_sram_slave)? 2 :
    (cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave)? 2 :
    (video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave)? 2 :
    (cpu_data_master_granted_pixel_buffer_avalon_sram_slave)? 2 :
    (cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave)? 2 :
    (video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave)? 2 :
    (cpu_data_master_granted_pixel_buffer_avalon_sram_slave)? 2 :
    (cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave)? 2 :
    (video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave)? 2 :
    1;

  //pixel_buffer_avalon_sram_slave_non_bursting_master_requests mux, which is an e_mux
  assign pixel_buffer_avalon_sram_slave_non_bursting_master_requests = cpu_data_master_requests_pixel_buffer_avalon_sram_slave |
    cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave |
    video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave |
    cpu_data_master_requests_pixel_buffer_avalon_sram_slave |
    cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave |
    video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave |
    cpu_data_master_requests_pixel_buffer_avalon_sram_slave |
    cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave |
    video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave;

  //pixel_buffer_avalon_sram_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign pixel_buffer_avalon_sram_slave_any_bursting_master_saved_grant = 0;

  //pixel_buffer_avalon_sram_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_arb_share_counter_next_value = pixel_buffer_avalon_sram_slave_firsttransfer ? (pixel_buffer_avalon_sram_slave_arb_share_set_values - 1) : |pixel_buffer_avalon_sram_slave_arb_share_counter ? (pixel_buffer_avalon_sram_slave_arb_share_counter - 1) : 0;

  //pixel_buffer_avalon_sram_slave_allgrants all slave grants, which is an e_mux
  assign pixel_buffer_avalon_sram_slave_allgrants = (|pixel_buffer_avalon_sram_slave_grant_vector) |
    (|pixel_buffer_avalon_sram_slave_grant_vector) |
    (|pixel_buffer_avalon_sram_slave_grant_vector) |
    (|pixel_buffer_avalon_sram_slave_grant_vector) |
    (|pixel_buffer_avalon_sram_slave_grant_vector) |
    (|pixel_buffer_avalon_sram_slave_grant_vector) |
    (|pixel_buffer_avalon_sram_slave_grant_vector) |
    (|pixel_buffer_avalon_sram_slave_grant_vector) |
    (|pixel_buffer_avalon_sram_slave_grant_vector);

  //pixel_buffer_avalon_sram_slave_end_xfer assignment, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_end_xfer = ~(pixel_buffer_avalon_sram_slave_waits_for_read | pixel_buffer_avalon_sram_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_pixel_buffer_avalon_sram_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pixel_buffer_avalon_sram_slave = pixel_buffer_avalon_sram_slave_end_xfer & (~pixel_buffer_avalon_sram_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pixel_buffer_avalon_sram_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_pixel_buffer_avalon_sram_slave & pixel_buffer_avalon_sram_slave_allgrants) | (end_xfer_arb_share_counter_term_pixel_buffer_avalon_sram_slave & ~pixel_buffer_avalon_sram_slave_non_bursting_master_requests);

  //pixel_buffer_avalon_sram_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pixel_buffer_avalon_sram_slave_arb_share_counter <= 0;
      else if (pixel_buffer_avalon_sram_slave_arb_counter_enable)
          pixel_buffer_avalon_sram_slave_arb_share_counter <= pixel_buffer_avalon_sram_slave_arb_share_counter_next_value;
    end


  //pixel_buffer_avalon_sram_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pixel_buffer_avalon_sram_slave_slavearbiterlockenable <= 0;
      else if ((|pixel_buffer_avalon_sram_slave_master_qreq_vector & end_xfer_arb_share_counter_term_pixel_buffer_avalon_sram_slave) | (end_xfer_arb_share_counter_term_pixel_buffer_avalon_sram_slave & ~pixel_buffer_avalon_sram_slave_non_bursting_master_requests))
          pixel_buffer_avalon_sram_slave_slavearbiterlockenable <= |pixel_buffer_avalon_sram_slave_arb_share_counter_next_value;
    end


  //cpu/data_master pixel_buffer/avalon_sram_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = pixel_buffer_avalon_sram_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //pixel_buffer_avalon_sram_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_slavearbiterlockenable2 = |pixel_buffer_avalon_sram_slave_arb_share_counter_next_value;

  //cpu/data_master pixel_buffer/avalon_sram_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = pixel_buffer_avalon_sram_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master pixel_buffer/avalon_sram_slave arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = pixel_buffer_avalon_sram_slave_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master pixel_buffer/avalon_sram_slave arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = pixel_buffer_avalon_sram_slave_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted pixel_buffer/avalon_sram_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_pixel_buffer_avalon_sram_slave <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_pixel_buffer_avalon_sram_slave <= cpu_instruction_master_saved_grant_pixel_buffer_avalon_sram_slave ? 1 : (pixel_buffer_avalon_sram_slave_arbitration_holdoff_internal | ~cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave) ? 0 : last_cycle_cpu_instruction_master_granted_slave_pixel_buffer_avalon_sram_slave;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = (last_cycle_cpu_instruction_master_granted_slave_pixel_buffer_avalon_sram_slave & cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave) |
    (last_cycle_cpu_instruction_master_granted_slave_pixel_buffer_avalon_sram_slave & cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave);

  //pixel_buffer_avalon_sram_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign pixel_buffer_avalon_sram_slave_any_continuerequest = cpu_instruction_master_continuerequest |
    video_pixel_buffer_dma_0_avalon_pixel_dma_master_continuerequest |
    cpu_data_master_continuerequest |
    video_pixel_buffer_dma_0_avalon_pixel_dma_master_continuerequest |
    cpu_data_master_continuerequest |
    cpu_instruction_master_continuerequest;

  //video_pixel_buffer_dma_0/avalon_pixel_dma_master pixel_buffer/avalon_sram_slave arbiterlock2, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_arbiterlock2 = pixel_buffer_avalon_sram_slave_slavearbiterlockenable2 & video_pixel_buffer_dma_0_avalon_pixel_dma_master_continuerequest;

  //video_pixel_buffer_dma_0/avalon_pixel_dma_master granted pixel_buffer/avalon_sram_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_slave_pixel_buffer_avalon_sram_slave <= 0;
      else 
        last_cycle_video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_slave_pixel_buffer_avalon_sram_slave <= video_pixel_buffer_dma_0_avalon_pixel_dma_master_saved_grant_pixel_buffer_avalon_sram_slave ? 1 : (pixel_buffer_avalon_sram_slave_arbitration_holdoff_internal | ~video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave) ? 0 : last_cycle_video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_slave_pixel_buffer_avalon_sram_slave;
    end


  //video_pixel_buffer_dma_0_avalon_pixel_dma_master_continuerequest continued request, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_continuerequest = (last_cycle_video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_slave_pixel_buffer_avalon_sram_slave & video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave) |
    (last_cycle_video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_slave_pixel_buffer_avalon_sram_slave & video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave);

  assign cpu_data_master_qualified_request_pixel_buffer_avalon_sram_slave = cpu_data_master_requests_pixel_buffer_avalon_sram_slave & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (1 < cpu_data_master_latency_counter))) | ((!cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave) & cpu_data_master_write) | cpu_instruction_master_arbiterlock | (video_pixel_buffer_dma_0_avalon_pixel_dma_master_arbiterlock & (saved_chosen_master_btw_video_pixel_buffer_dma_0_avalon_pixel_dma_master_and_pixel_buffer_avalon_sram_slave)));
  //unique name for pixel_buffer_avalon_sram_slave_move_on_to_next_transaction, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_move_on_to_next_transaction = pixel_buffer_avalon_sram_slave_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_data_master_to_pixel_buffer_avalon_sram_slave, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_data_master_to_pixel_buffer_avalon_sram_slave_module rdv_fifo_for_cpu_data_master_to_pixel_buffer_avalon_sram_slave
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_data_master_granted_pixel_buffer_avalon_sram_slave),
      .data_out             (cpu_data_master_rdv_fifo_output_from_pixel_buffer_avalon_sram_slave),
      .empty                (),
      .fifo_contains_ones_n (cpu_data_master_rdv_fifo_empty_pixel_buffer_avalon_sram_slave),
      .full                 (),
      .read                 (pixel_buffer_avalon_sram_slave_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~pixel_buffer_avalon_sram_slave_waits_for_read)
    );

  assign cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register = ~cpu_data_master_rdv_fifo_empty_pixel_buffer_avalon_sram_slave;
  //local readdatavalid cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave = (pixel_buffer_avalon_sram_slave_readdatavalid_from_sa & cpu_data_master_rdv_fifo_output_from_pixel_buffer_avalon_sram_slave) & ~ cpu_data_master_rdv_fifo_empty_pixel_buffer_avalon_sram_slave;

  //pixel_buffer_avalon_sram_slave_writedata mux, which is an e_mux
  assign pixel_buffer_avalon_sram_slave_writedata = cpu_data_master_dbs_write_16;

  assign cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave = (({cpu_instruction_master_address_to_slave[22 : 21] , 21'b0} == 23'h200000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted pixel_buffer/avalon_sram_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_pixel_buffer_avalon_sram_slave <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_pixel_buffer_avalon_sram_slave <= cpu_data_master_saved_grant_pixel_buffer_avalon_sram_slave ? 1 : (pixel_buffer_avalon_sram_slave_arbitration_holdoff_internal | ~cpu_data_master_requests_pixel_buffer_avalon_sram_slave) ? 0 : last_cycle_cpu_data_master_granted_slave_pixel_buffer_avalon_sram_slave;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = (last_cycle_cpu_data_master_granted_slave_pixel_buffer_avalon_sram_slave & cpu_data_master_requests_pixel_buffer_avalon_sram_slave) |
    (last_cycle_cpu_data_master_granted_slave_pixel_buffer_avalon_sram_slave & cpu_data_master_requests_pixel_buffer_avalon_sram_slave);

  assign cpu_instruction_master_qualified_request_pixel_buffer_avalon_sram_slave = cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0) | (1 < cpu_instruction_master_latency_counter))) | cpu_data_master_arbiterlock | (video_pixel_buffer_dma_0_avalon_pixel_dma_master_arbiterlock & (saved_chosen_master_btw_video_pixel_buffer_dma_0_avalon_pixel_dma_master_and_pixel_buffer_avalon_sram_slave)));
  //rdv_fifo_for_cpu_instruction_master_to_pixel_buffer_avalon_sram_slave, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_instruction_master_to_pixel_buffer_avalon_sram_slave_module rdv_fifo_for_cpu_instruction_master_to_pixel_buffer_avalon_sram_slave
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave),
      .data_out             (cpu_instruction_master_rdv_fifo_output_from_pixel_buffer_avalon_sram_slave),
      .empty                (),
      .fifo_contains_ones_n (cpu_instruction_master_rdv_fifo_empty_pixel_buffer_avalon_sram_slave),
      .full                 (),
      .read                 (pixel_buffer_avalon_sram_slave_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~pixel_buffer_avalon_sram_slave_waits_for_read)
    );

  assign cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register = ~cpu_instruction_master_rdv_fifo_empty_pixel_buffer_avalon_sram_slave;
  //local readdatavalid cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave, which is an e_mux
  assign cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave = (pixel_buffer_avalon_sram_slave_readdatavalid_from_sa & cpu_instruction_master_rdv_fifo_output_from_pixel_buffer_avalon_sram_slave) & ~ cpu_instruction_master_rdv_fifo_empty_pixel_buffer_avalon_sram_slave;

  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave = (({video_pixel_buffer_dma_0_avalon_pixel_dma_master_address_to_slave[31 : 21] , 21'b0} == 32'h200000) & (video_pixel_buffer_dma_0_avalon_pixel_dma_master_read)) & video_pixel_buffer_dma_0_avalon_pixel_dma_master_read;
  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_qualified_request_pixel_buffer_avalon_sram_slave = video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave & ~((video_pixel_buffer_dma_0_avalon_pixel_dma_master_read & ((video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter != 0) | (1 < video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter))) | cpu_data_master_arbiterlock | cpu_instruction_master_arbiterlock);
  //rdv_fifo_for_video_pixel_buffer_dma_0_avalon_pixel_dma_master_to_pixel_buffer_avalon_sram_slave, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_video_pixel_buffer_dma_0_avalon_pixel_dma_master_to_pixel_buffer_avalon_sram_slave_module rdv_fifo_for_video_pixel_buffer_dma_0_avalon_pixel_dma_master_to_pixel_buffer_avalon_sram_slave
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave),
      .data_out             (video_pixel_buffer_dma_0_avalon_pixel_dma_master_rdv_fifo_output_from_pixel_buffer_avalon_sram_slave),
      .empty                (),
      .fifo_contains_ones_n (video_pixel_buffer_dma_0_avalon_pixel_dma_master_rdv_fifo_empty_pixel_buffer_avalon_sram_slave),
      .full                 (),
      .read                 (pixel_buffer_avalon_sram_slave_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~pixel_buffer_avalon_sram_slave_waits_for_read)
    );

  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register = ~video_pixel_buffer_dma_0_avalon_pixel_dma_master_rdv_fifo_empty_pixel_buffer_avalon_sram_slave;
  //local readdatavalid video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave = (pixel_buffer_avalon_sram_slave_readdatavalid_from_sa & video_pixel_buffer_dma_0_avalon_pixel_dma_master_rdv_fifo_output_from_pixel_buffer_avalon_sram_slave) & ~ video_pixel_buffer_dma_0_avalon_pixel_dma_master_rdv_fifo_empty_pixel_buffer_avalon_sram_slave;

  //allow new arb cycle for pixel_buffer/avalon_sram_slave, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock & ~(video_pixel_buffer_dma_0_avalon_pixel_dma_master_arbiterlock & (saved_chosen_master_btw_video_pixel_buffer_dma_0_avalon_pixel_dma_master_and_pixel_buffer_avalon_sram_slave));

  //video_pixel_buffer_dma_0/avalon_pixel_dma_master assignment into master qualified-requests vector for pixel_buffer/avalon_sram_slave, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_master_qreq_vector[0] = video_pixel_buffer_dma_0_avalon_pixel_dma_master_qualified_request_pixel_buffer_avalon_sram_slave;

  //video_pixel_buffer_dma_0/avalon_pixel_dma_master grant pixel_buffer/avalon_sram_slave, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave = pixel_buffer_avalon_sram_slave_grant_vector[0];

  //video_pixel_buffer_dma_0/avalon_pixel_dma_master saved-grant pixel_buffer/avalon_sram_slave, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_saved_grant_pixel_buffer_avalon_sram_slave = pixel_buffer_avalon_sram_slave_arb_winner[0] && video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave;

  //saved chosen master btw video_pixel_buffer_dma_0/avalon_pixel_dma_master and pixel_buffer/avalon_sram_slave, which is an e_assign
  assign saved_chosen_master_btw_video_pixel_buffer_dma_0_avalon_pixel_dma_master_and_pixel_buffer_avalon_sram_slave = pixel_buffer_avalon_sram_slave_saved_chosen_master_vector[0];

  //cpu/instruction_master assignment into master qualified-requests vector for pixel_buffer/avalon_sram_slave, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_master_qreq_vector[1] = cpu_instruction_master_qualified_request_pixel_buffer_avalon_sram_slave;

  //cpu/instruction_master grant pixel_buffer/avalon_sram_slave, which is an e_assign
  assign cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave = pixel_buffer_avalon_sram_slave_grant_vector[1];

  //cpu/instruction_master saved-grant pixel_buffer/avalon_sram_slave, which is an e_assign
  assign cpu_instruction_master_saved_grant_pixel_buffer_avalon_sram_slave = pixel_buffer_avalon_sram_slave_arb_winner[1] && cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave;

  //cpu/data_master assignment into master qualified-requests vector for pixel_buffer/avalon_sram_slave, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_master_qreq_vector[2] = cpu_data_master_qualified_request_pixel_buffer_avalon_sram_slave;

  //cpu/data_master grant pixel_buffer/avalon_sram_slave, which is an e_assign
  assign cpu_data_master_granted_pixel_buffer_avalon_sram_slave = pixel_buffer_avalon_sram_slave_grant_vector[2];

  //cpu/data_master saved-grant pixel_buffer/avalon_sram_slave, which is an e_assign
  assign cpu_data_master_saved_grant_pixel_buffer_avalon_sram_slave = pixel_buffer_avalon_sram_slave_arb_winner[2] && cpu_data_master_requests_pixel_buffer_avalon_sram_slave;

  //pixel_buffer/avalon_sram_slave chosen-master double-vector, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_chosen_master_double_vector = {pixel_buffer_avalon_sram_slave_master_qreq_vector, pixel_buffer_avalon_sram_slave_master_qreq_vector} & ({~pixel_buffer_avalon_sram_slave_master_qreq_vector, ~pixel_buffer_avalon_sram_slave_master_qreq_vector} + pixel_buffer_avalon_sram_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign pixel_buffer_avalon_sram_slave_arb_winner = (pixel_buffer_avalon_sram_slave_allow_new_arb_cycle & | pixel_buffer_avalon_sram_slave_grant_vector) ? pixel_buffer_avalon_sram_slave_grant_vector : pixel_buffer_avalon_sram_slave_saved_chosen_master_vector;

  //saved pixel_buffer_avalon_sram_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pixel_buffer_avalon_sram_slave_saved_chosen_master_vector <= 0;
      else if (pixel_buffer_avalon_sram_slave_allow_new_arb_cycle)
          pixel_buffer_avalon_sram_slave_saved_chosen_master_vector <= |pixel_buffer_avalon_sram_slave_grant_vector ? pixel_buffer_avalon_sram_slave_grant_vector : pixel_buffer_avalon_sram_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign pixel_buffer_avalon_sram_slave_grant_vector = {(pixel_buffer_avalon_sram_slave_chosen_master_double_vector[2] | pixel_buffer_avalon_sram_slave_chosen_master_double_vector[5]),
    (pixel_buffer_avalon_sram_slave_chosen_master_double_vector[1] | pixel_buffer_avalon_sram_slave_chosen_master_double_vector[4]),
    (pixel_buffer_avalon_sram_slave_chosen_master_double_vector[0] | pixel_buffer_avalon_sram_slave_chosen_master_double_vector[3])};

  //pixel_buffer/avalon_sram_slave chosen master rotated left, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_chosen_master_rot_left = (pixel_buffer_avalon_sram_slave_arb_winner << 1) ? (pixel_buffer_avalon_sram_slave_arb_winner << 1) : 1;

  //pixel_buffer/avalon_sram_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pixel_buffer_avalon_sram_slave_arb_addend <= 1;
      else if (|pixel_buffer_avalon_sram_slave_grant_vector)
          pixel_buffer_avalon_sram_slave_arb_addend <= pixel_buffer_avalon_sram_slave_end_xfer? pixel_buffer_avalon_sram_slave_chosen_master_rot_left : pixel_buffer_avalon_sram_slave_grant_vector;
    end


  //~pixel_buffer_avalon_sram_slave_reset assignment, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_reset = ~reset_n;

  //pixel_buffer_avalon_sram_slave_firsttransfer first transaction, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_firsttransfer = pixel_buffer_avalon_sram_slave_begins_xfer ? pixel_buffer_avalon_sram_slave_unreg_firsttransfer : pixel_buffer_avalon_sram_slave_reg_firsttransfer;

  //pixel_buffer_avalon_sram_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_unreg_firsttransfer = ~(pixel_buffer_avalon_sram_slave_slavearbiterlockenable & pixel_buffer_avalon_sram_slave_any_continuerequest);

  //pixel_buffer_avalon_sram_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pixel_buffer_avalon_sram_slave_reg_firsttransfer <= 1'b1;
      else if (pixel_buffer_avalon_sram_slave_begins_xfer)
          pixel_buffer_avalon_sram_slave_reg_firsttransfer <= pixel_buffer_avalon_sram_slave_unreg_firsttransfer;
    end


  //pixel_buffer_avalon_sram_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_beginbursttransfer_internal = pixel_buffer_avalon_sram_slave_begins_xfer;

  //pixel_buffer_avalon_sram_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_arbitration_holdoff_internal = pixel_buffer_avalon_sram_slave_begins_xfer & pixel_buffer_avalon_sram_slave_firsttransfer;

  //pixel_buffer_avalon_sram_slave_read assignment, which is an e_mux
  assign pixel_buffer_avalon_sram_slave_read = (cpu_data_master_granted_pixel_buffer_avalon_sram_slave & cpu_data_master_read) | (cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave & cpu_instruction_master_read) | (video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave & video_pixel_buffer_dma_0_avalon_pixel_dma_master_read);

  //pixel_buffer_avalon_sram_slave_write assignment, which is an e_mux
  assign pixel_buffer_avalon_sram_slave_write = cpu_data_master_granted_pixel_buffer_avalon_sram_slave & cpu_data_master_write;

  assign shifted_address_to_pixel_buffer_avalon_sram_slave_from_cpu_data_master = {cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1],
    {1 {1'b0}}};

  //pixel_buffer_avalon_sram_slave_address mux, which is an e_mux
  assign pixel_buffer_avalon_sram_slave_address = (cpu_data_master_granted_pixel_buffer_avalon_sram_slave)? (shifted_address_to_pixel_buffer_avalon_sram_slave_from_cpu_data_master >> 1) :
    (cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave)? (shifted_address_to_pixel_buffer_avalon_sram_slave_from_cpu_instruction_master >> 1) :
    (shifted_address_to_pixel_buffer_avalon_sram_slave_from_video_pixel_buffer_dma_0_avalon_pixel_dma_master >> 1);

  assign shifted_address_to_pixel_buffer_avalon_sram_slave_from_cpu_instruction_master = {cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  assign shifted_address_to_pixel_buffer_avalon_sram_slave_from_video_pixel_buffer_dma_0_avalon_pixel_dma_master = {video_pixel_buffer_dma_0_avalon_pixel_dma_master_address_to_slave >> 2,
    video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_pixel_buffer_avalon_sram_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pixel_buffer_avalon_sram_slave_end_xfer <= 1;
      else 
        d1_pixel_buffer_avalon_sram_slave_end_xfer <= pixel_buffer_avalon_sram_slave_end_xfer;
    end


  //pixel_buffer_avalon_sram_slave_waits_for_read in a cycle, which is an e_mux
  assign pixel_buffer_avalon_sram_slave_waits_for_read = pixel_buffer_avalon_sram_slave_in_a_read_cycle & 0;

  //pixel_buffer_avalon_sram_slave_in_a_read_cycle assignment, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_in_a_read_cycle = (cpu_data_master_granted_pixel_buffer_avalon_sram_slave & cpu_data_master_read) | (cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave & cpu_instruction_master_read) | (video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave & video_pixel_buffer_dma_0_avalon_pixel_dma_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pixel_buffer_avalon_sram_slave_in_a_read_cycle;

  //pixel_buffer_avalon_sram_slave_waits_for_write in a cycle, which is an e_mux
  assign pixel_buffer_avalon_sram_slave_waits_for_write = pixel_buffer_avalon_sram_slave_in_a_write_cycle & 0;

  //pixel_buffer_avalon_sram_slave_in_a_write_cycle assignment, which is an e_assign
  assign pixel_buffer_avalon_sram_slave_in_a_write_cycle = cpu_data_master_granted_pixel_buffer_avalon_sram_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pixel_buffer_avalon_sram_slave_in_a_write_cycle;

  assign wait_for_pixel_buffer_avalon_sram_slave_counter = 0;
  //pixel_buffer_avalon_sram_slave_byteenable byte enable port mux, which is an e_mux
  assign pixel_buffer_avalon_sram_slave_byteenable = (cpu_data_master_granted_pixel_buffer_avalon_sram_slave)? cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave :
    -1;

  assign {cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave_segment_1,
cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave = ((cpu_data_master_dbs_address[1] == 0))? cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave_segment_0 :
    cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pixel_buffer/avalon_sram_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_pixel_buffer_avalon_sram_slave + cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave + video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_pixel_buffer_avalon_sram_slave + cpu_instruction_master_saved_grant_pixel_buffer_avalon_sram_slave + video_pixel_buffer_dma_0_avalon_pixel_dma_master_saved_grant_pixel_buffer_avalon_sram_slave > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module the_whole_shit_clock_0_in_arbitrator (
                                              // inputs:
                                               clk,
                                               cpu_data_master_address_to_slave,
                                               cpu_data_master_byteenable,
                                               cpu_data_master_dbs_address,
                                               cpu_data_master_dbs_write_8,
                                               cpu_data_master_latency_counter,
                                               cpu_data_master_read,
                                               cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register,
                                               cpu_data_master_write,
                                               reset_n,
                                               the_whole_shit_clock_0_in_endofpacket,
                                               the_whole_shit_clock_0_in_readdata,
                                               the_whole_shit_clock_0_in_waitrequest,

                                              // outputs:
                                               cpu_data_master_byteenable_the_whole_shit_clock_0_in,
                                               cpu_data_master_granted_the_whole_shit_clock_0_in,
                                               cpu_data_master_qualified_request_the_whole_shit_clock_0_in,
                                               cpu_data_master_read_data_valid_the_whole_shit_clock_0_in,
                                               cpu_data_master_requests_the_whole_shit_clock_0_in,
                                               d1_the_whole_shit_clock_0_in_end_xfer,
                                               the_whole_shit_clock_0_in_address,
                                               the_whole_shit_clock_0_in_endofpacket_from_sa,
                                               the_whole_shit_clock_0_in_nativeaddress,
                                               the_whole_shit_clock_0_in_read,
                                               the_whole_shit_clock_0_in_readdata_from_sa,
                                               the_whole_shit_clock_0_in_reset_n,
                                               the_whole_shit_clock_0_in_waitrequest_from_sa,
                                               the_whole_shit_clock_0_in_write,
                                               the_whole_shit_clock_0_in_writedata
                                            )
;

  output           cpu_data_master_byteenable_the_whole_shit_clock_0_in;
  output           cpu_data_master_granted_the_whole_shit_clock_0_in;
  output           cpu_data_master_qualified_request_the_whole_shit_clock_0_in;
  output           cpu_data_master_read_data_valid_the_whole_shit_clock_0_in;
  output           cpu_data_master_requests_the_whole_shit_clock_0_in;
  output           d1_the_whole_shit_clock_0_in_end_xfer;
  output           the_whole_shit_clock_0_in_address;
  output           the_whole_shit_clock_0_in_endofpacket_from_sa;
  output           the_whole_shit_clock_0_in_nativeaddress;
  output           the_whole_shit_clock_0_in_read;
  output  [  7: 0] the_whole_shit_clock_0_in_readdata_from_sa;
  output           the_whole_shit_clock_0_in_reset_n;
  output           the_whole_shit_clock_0_in_waitrequest_from_sa;
  output           the_whole_shit_clock_0_in_write;
  output  [  7: 0] the_whole_shit_clock_0_in_writedata;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [  7: 0] cpu_data_master_dbs_write_8;
  input            cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  input            cpu_data_master_write;
  input            reset_n;
  input            the_whole_shit_clock_0_in_endofpacket;
  input   [  7: 0] the_whole_shit_clock_0_in_readdata;
  input            the_whole_shit_clock_0_in_waitrequest;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_byteenable_the_whole_shit_clock_0_in;
  wire             cpu_data_master_byteenable_the_whole_shit_clock_0_in_segment_0;
  wire             cpu_data_master_byteenable_the_whole_shit_clock_0_in_segment_1;
  wire             cpu_data_master_byteenable_the_whole_shit_clock_0_in_segment_2;
  wire             cpu_data_master_byteenable_the_whole_shit_clock_0_in_segment_3;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_the_whole_shit_clock_0_in;
  wire             cpu_data_master_qualified_request_the_whole_shit_clock_0_in;
  wire             cpu_data_master_read_data_valid_the_whole_shit_clock_0_in;
  wire             cpu_data_master_requests_the_whole_shit_clock_0_in;
  wire             cpu_data_master_saved_grant_the_whole_shit_clock_0_in;
  reg              d1_reasons_to_wait;
  reg              d1_the_whole_shit_clock_0_in_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_the_whole_shit_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             the_whole_shit_clock_0_in_address;
  wire             the_whole_shit_clock_0_in_allgrants;
  wire             the_whole_shit_clock_0_in_allow_new_arb_cycle;
  wire             the_whole_shit_clock_0_in_any_bursting_master_saved_grant;
  wire             the_whole_shit_clock_0_in_any_continuerequest;
  wire             the_whole_shit_clock_0_in_arb_counter_enable;
  reg     [  2: 0] the_whole_shit_clock_0_in_arb_share_counter;
  wire    [  2: 0] the_whole_shit_clock_0_in_arb_share_counter_next_value;
  wire    [  2: 0] the_whole_shit_clock_0_in_arb_share_set_values;
  wire             the_whole_shit_clock_0_in_beginbursttransfer_internal;
  wire             the_whole_shit_clock_0_in_begins_xfer;
  wire             the_whole_shit_clock_0_in_end_xfer;
  wire             the_whole_shit_clock_0_in_endofpacket_from_sa;
  wire             the_whole_shit_clock_0_in_firsttransfer;
  wire             the_whole_shit_clock_0_in_grant_vector;
  wire             the_whole_shit_clock_0_in_in_a_read_cycle;
  wire             the_whole_shit_clock_0_in_in_a_write_cycle;
  wire             the_whole_shit_clock_0_in_master_qreq_vector;
  wire             the_whole_shit_clock_0_in_nativeaddress;
  wire             the_whole_shit_clock_0_in_non_bursting_master_requests;
  wire             the_whole_shit_clock_0_in_pretend_byte_enable;
  wire             the_whole_shit_clock_0_in_read;
  wire    [  7: 0] the_whole_shit_clock_0_in_readdata_from_sa;
  reg              the_whole_shit_clock_0_in_reg_firsttransfer;
  wire             the_whole_shit_clock_0_in_reset_n;
  reg              the_whole_shit_clock_0_in_slavearbiterlockenable;
  wire             the_whole_shit_clock_0_in_slavearbiterlockenable2;
  wire             the_whole_shit_clock_0_in_unreg_firsttransfer;
  wire             the_whole_shit_clock_0_in_waitrequest_from_sa;
  wire             the_whole_shit_clock_0_in_waits_for_read;
  wire             the_whole_shit_clock_0_in_waits_for_write;
  wire             the_whole_shit_clock_0_in_write;
  wire    [  7: 0] the_whole_shit_clock_0_in_writedata;
  wire             wait_for_the_whole_shit_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~the_whole_shit_clock_0_in_end_xfer;
    end


  assign the_whole_shit_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_the_whole_shit_clock_0_in));
  //assign the_whole_shit_clock_0_in_readdata_from_sa = the_whole_shit_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign the_whole_shit_clock_0_in_readdata_from_sa = the_whole_shit_clock_0_in_readdata;

  assign cpu_data_master_requests_the_whole_shit_clock_0_in = ({cpu_data_master_address_to_slave[22 : 1] , 1'b0} == 23'h501010) & (cpu_data_master_read | cpu_data_master_write);
  //assign the_whole_shit_clock_0_in_waitrequest_from_sa = the_whole_shit_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign the_whole_shit_clock_0_in_waitrequest_from_sa = the_whole_shit_clock_0_in_waitrequest;

  //the_whole_shit_clock_0_in_arb_share_counter set values, which is an e_mux
  assign the_whole_shit_clock_0_in_arb_share_set_values = (cpu_data_master_granted_the_whole_shit_clock_0_in)? 4 :
    1;

  //the_whole_shit_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign the_whole_shit_clock_0_in_non_bursting_master_requests = cpu_data_master_requests_the_whole_shit_clock_0_in;

  //the_whole_shit_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign the_whole_shit_clock_0_in_any_bursting_master_saved_grant = 0;

  //the_whole_shit_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign the_whole_shit_clock_0_in_arb_share_counter_next_value = the_whole_shit_clock_0_in_firsttransfer ? (the_whole_shit_clock_0_in_arb_share_set_values - 1) : |the_whole_shit_clock_0_in_arb_share_counter ? (the_whole_shit_clock_0_in_arb_share_counter - 1) : 0;

  //the_whole_shit_clock_0_in_allgrants all slave grants, which is an e_mux
  assign the_whole_shit_clock_0_in_allgrants = |the_whole_shit_clock_0_in_grant_vector;

  //the_whole_shit_clock_0_in_end_xfer assignment, which is an e_assign
  assign the_whole_shit_clock_0_in_end_xfer = ~(the_whole_shit_clock_0_in_waits_for_read | the_whole_shit_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_the_whole_shit_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_the_whole_shit_clock_0_in = the_whole_shit_clock_0_in_end_xfer & (~the_whole_shit_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //the_whole_shit_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign the_whole_shit_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_the_whole_shit_clock_0_in & the_whole_shit_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_the_whole_shit_clock_0_in & ~the_whole_shit_clock_0_in_non_bursting_master_requests);

  //the_whole_shit_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          the_whole_shit_clock_0_in_arb_share_counter <= 0;
      else if (the_whole_shit_clock_0_in_arb_counter_enable)
          the_whole_shit_clock_0_in_arb_share_counter <= the_whole_shit_clock_0_in_arb_share_counter_next_value;
    end


  //the_whole_shit_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          the_whole_shit_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|the_whole_shit_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_the_whole_shit_clock_0_in) | (end_xfer_arb_share_counter_term_the_whole_shit_clock_0_in & ~the_whole_shit_clock_0_in_non_bursting_master_requests))
          the_whole_shit_clock_0_in_slavearbiterlockenable <= |the_whole_shit_clock_0_in_arb_share_counter_next_value;
    end


  //cpu/data_master the_whole_shit_clock_0/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = the_whole_shit_clock_0_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //the_whole_shit_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign the_whole_shit_clock_0_in_slavearbiterlockenable2 = |the_whole_shit_clock_0_in_arb_share_counter_next_value;

  //cpu/data_master the_whole_shit_clock_0/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = the_whole_shit_clock_0_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //the_whole_shit_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign the_whole_shit_clock_0_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_the_whole_shit_clock_0_in = cpu_data_master_requests_the_whole_shit_clock_0_in & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register))) | ((!cpu_data_master_byteenable_the_whole_shit_clock_0_in) & cpu_data_master_write));
  //local readdatavalid cpu_data_master_read_data_valid_the_whole_shit_clock_0_in, which is an e_mux
  assign cpu_data_master_read_data_valid_the_whole_shit_clock_0_in = cpu_data_master_granted_the_whole_shit_clock_0_in & cpu_data_master_read & ~the_whole_shit_clock_0_in_waits_for_read;

  //the_whole_shit_clock_0_in_writedata mux, which is an e_mux
  assign the_whole_shit_clock_0_in_writedata = cpu_data_master_dbs_write_8;

  //assign the_whole_shit_clock_0_in_endofpacket_from_sa = the_whole_shit_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign the_whole_shit_clock_0_in_endofpacket_from_sa = the_whole_shit_clock_0_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_the_whole_shit_clock_0_in = cpu_data_master_qualified_request_the_whole_shit_clock_0_in;

  //cpu/data_master saved-grant the_whole_shit_clock_0/in, which is an e_assign
  assign cpu_data_master_saved_grant_the_whole_shit_clock_0_in = cpu_data_master_requests_the_whole_shit_clock_0_in;

  //allow new arb cycle for the_whole_shit_clock_0/in, which is an e_assign
  assign the_whole_shit_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign the_whole_shit_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign the_whole_shit_clock_0_in_master_qreq_vector = 1;

  //the_whole_shit_clock_0_in_reset_n assignment, which is an e_assign
  assign the_whole_shit_clock_0_in_reset_n = reset_n;

  //the_whole_shit_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign the_whole_shit_clock_0_in_firsttransfer = the_whole_shit_clock_0_in_begins_xfer ? the_whole_shit_clock_0_in_unreg_firsttransfer : the_whole_shit_clock_0_in_reg_firsttransfer;

  //the_whole_shit_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign the_whole_shit_clock_0_in_unreg_firsttransfer = ~(the_whole_shit_clock_0_in_slavearbiterlockenable & the_whole_shit_clock_0_in_any_continuerequest);

  //the_whole_shit_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          the_whole_shit_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (the_whole_shit_clock_0_in_begins_xfer)
          the_whole_shit_clock_0_in_reg_firsttransfer <= the_whole_shit_clock_0_in_unreg_firsttransfer;
    end


  //the_whole_shit_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign the_whole_shit_clock_0_in_beginbursttransfer_internal = the_whole_shit_clock_0_in_begins_xfer;

  //the_whole_shit_clock_0_in_read assignment, which is an e_mux
  assign the_whole_shit_clock_0_in_read = cpu_data_master_granted_the_whole_shit_clock_0_in & cpu_data_master_read;

  //the_whole_shit_clock_0_in_write assignment, which is an e_mux
  assign the_whole_shit_clock_0_in_write = ((cpu_data_master_granted_the_whole_shit_clock_0_in & cpu_data_master_write)) & the_whole_shit_clock_0_in_pretend_byte_enable;

  //the_whole_shit_clock_0_in_address mux, which is an e_mux
  assign the_whole_shit_clock_0_in_address = {cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1 : 0]};

  //slaveid the_whole_shit_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign the_whole_shit_clock_0_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_the_whole_shit_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_the_whole_shit_clock_0_in_end_xfer <= 1;
      else 
        d1_the_whole_shit_clock_0_in_end_xfer <= the_whole_shit_clock_0_in_end_xfer;
    end


  //the_whole_shit_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign the_whole_shit_clock_0_in_waits_for_read = the_whole_shit_clock_0_in_in_a_read_cycle & the_whole_shit_clock_0_in_waitrequest_from_sa;

  //the_whole_shit_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign the_whole_shit_clock_0_in_in_a_read_cycle = cpu_data_master_granted_the_whole_shit_clock_0_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = the_whole_shit_clock_0_in_in_a_read_cycle;

  //the_whole_shit_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign the_whole_shit_clock_0_in_waits_for_write = the_whole_shit_clock_0_in_in_a_write_cycle & the_whole_shit_clock_0_in_waitrequest_from_sa;

  //the_whole_shit_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign the_whole_shit_clock_0_in_in_a_write_cycle = cpu_data_master_granted_the_whole_shit_clock_0_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = the_whole_shit_clock_0_in_in_a_write_cycle;

  assign wait_for_the_whole_shit_clock_0_in_counter = 0;
  //the_whole_shit_clock_0_in_pretend_byte_enable byte enable port mux, which is an e_mux
  assign the_whole_shit_clock_0_in_pretend_byte_enable = (cpu_data_master_granted_the_whole_shit_clock_0_in)? cpu_data_master_byteenable_the_whole_shit_clock_0_in :
    -1;

  assign {cpu_data_master_byteenable_the_whole_shit_clock_0_in_segment_3,
cpu_data_master_byteenable_the_whole_shit_clock_0_in_segment_2,
cpu_data_master_byteenable_the_whole_shit_clock_0_in_segment_1,
cpu_data_master_byteenable_the_whole_shit_clock_0_in_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_the_whole_shit_clock_0_in = ((cpu_data_master_dbs_address[1 : 0] == 0))? cpu_data_master_byteenable_the_whole_shit_clock_0_in_segment_0 :
    ((cpu_data_master_dbs_address[1 : 0] == 1))? cpu_data_master_byteenable_the_whole_shit_clock_0_in_segment_1 :
    ((cpu_data_master_dbs_address[1 : 0] == 2))? cpu_data_master_byteenable_the_whole_shit_clock_0_in_segment_2 :
    cpu_data_master_byteenable_the_whole_shit_clock_0_in_segment_3;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //the_whole_shit_clock_0/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module the_whole_shit_clock_0_out_arbitrator (
                                               // inputs:
                                                clk,
                                                clocks_0_avalon_clocks_slave_readdata_from_sa,
                                                d1_clocks_0_avalon_clocks_slave_end_xfer,
                                                reset_n,
                                                the_whole_shit_clock_0_out_address,
                                                the_whole_shit_clock_0_out_granted_clocks_0_avalon_clocks_slave,
                                                the_whole_shit_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave,
                                                the_whole_shit_clock_0_out_read,
                                                the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave,
                                                the_whole_shit_clock_0_out_requests_clocks_0_avalon_clocks_slave,
                                                the_whole_shit_clock_0_out_write,
                                                the_whole_shit_clock_0_out_writedata,

                                               // outputs:
                                                the_whole_shit_clock_0_out_address_to_slave,
                                                the_whole_shit_clock_0_out_readdata,
                                                the_whole_shit_clock_0_out_reset_n,
                                                the_whole_shit_clock_0_out_waitrequest
                                             )
;

  output           the_whole_shit_clock_0_out_address_to_slave;
  output  [  7: 0] the_whole_shit_clock_0_out_readdata;
  output           the_whole_shit_clock_0_out_reset_n;
  output           the_whole_shit_clock_0_out_waitrequest;
  input            clk;
  input   [  7: 0] clocks_0_avalon_clocks_slave_readdata_from_sa;
  input            d1_clocks_0_avalon_clocks_slave_end_xfer;
  input            reset_n;
  input            the_whole_shit_clock_0_out_address;
  input            the_whole_shit_clock_0_out_granted_clocks_0_avalon_clocks_slave;
  input            the_whole_shit_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave;
  input            the_whole_shit_clock_0_out_read;
  input            the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave;
  input            the_whole_shit_clock_0_out_requests_clocks_0_avalon_clocks_slave;
  input            the_whole_shit_clock_0_out_write;
  input   [  7: 0] the_whole_shit_clock_0_out_writedata;

  reg              active_and_waiting_last_time;
  wire             r_0;
  reg              the_whole_shit_clock_0_out_address_last_time;
  wire             the_whole_shit_clock_0_out_address_to_slave;
  reg              the_whole_shit_clock_0_out_read_last_time;
  wire    [  7: 0] the_whole_shit_clock_0_out_readdata;
  wire             the_whole_shit_clock_0_out_reset_n;
  wire             the_whole_shit_clock_0_out_run;
  wire             the_whole_shit_clock_0_out_waitrequest;
  reg              the_whole_shit_clock_0_out_write_last_time;
  reg     [  7: 0] the_whole_shit_clock_0_out_writedata_last_time;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (the_whole_shit_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave | the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave | ~the_whole_shit_clock_0_out_requests_clocks_0_avalon_clocks_slave) & ((~the_whole_shit_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave | ~the_whole_shit_clock_0_out_read | (the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave & the_whole_shit_clock_0_out_read))) & ((~the_whole_shit_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave | ~(the_whole_shit_clock_0_out_read | the_whole_shit_clock_0_out_write) | (1 & (the_whole_shit_clock_0_out_read | the_whole_shit_clock_0_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign the_whole_shit_clock_0_out_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign the_whole_shit_clock_0_out_address_to_slave = the_whole_shit_clock_0_out_address;

  //the_whole_shit_clock_0/out readdata mux, which is an e_mux
  assign the_whole_shit_clock_0_out_readdata = clocks_0_avalon_clocks_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign the_whole_shit_clock_0_out_waitrequest = ~the_whole_shit_clock_0_out_run;

  //the_whole_shit_clock_0_out_reset_n assignment, which is an e_assign
  assign the_whole_shit_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //the_whole_shit_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          the_whole_shit_clock_0_out_address_last_time <= 0;
      else 
        the_whole_shit_clock_0_out_address_last_time <= the_whole_shit_clock_0_out_address;
    end


  //the_whole_shit_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= the_whole_shit_clock_0_out_waitrequest & (the_whole_shit_clock_0_out_read | the_whole_shit_clock_0_out_write);
    end


  //the_whole_shit_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (the_whole_shit_clock_0_out_address != the_whole_shit_clock_0_out_address_last_time))
        begin
          $write("%0d ns: the_whole_shit_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //the_whole_shit_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          the_whole_shit_clock_0_out_read_last_time <= 0;
      else 
        the_whole_shit_clock_0_out_read_last_time <= the_whole_shit_clock_0_out_read;
    end


  //the_whole_shit_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (the_whole_shit_clock_0_out_read != the_whole_shit_clock_0_out_read_last_time))
        begin
          $write("%0d ns: the_whole_shit_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //the_whole_shit_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          the_whole_shit_clock_0_out_write_last_time <= 0;
      else 
        the_whole_shit_clock_0_out_write_last_time <= the_whole_shit_clock_0_out_write;
    end


  //the_whole_shit_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (the_whole_shit_clock_0_out_write != the_whole_shit_clock_0_out_write_last_time))
        begin
          $write("%0d ns: the_whole_shit_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //the_whole_shit_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          the_whole_shit_clock_0_out_writedata_last_time <= 0;
      else 
        the_whole_shit_clock_0_out_writedata_last_time <= the_whole_shit_clock_0_out_writedata;
    end


  //the_whole_shit_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (the_whole_shit_clock_0_out_writedata != the_whole_shit_clock_0_out_writedata_last_time) & the_whole_shit_clock_0_out_write)
        begin
          $write("%0d ns: the_whole_shit_clock_0_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_pixel_buffer_dma_0_avalon_control_slave_arbitrator (
                                                                  // inputs:
                                                                   clk,
                                                                   cpu_data_master_address_to_slave,
                                                                   cpu_data_master_byteenable,
                                                                   cpu_data_master_latency_counter,
                                                                   cpu_data_master_read,
                                                                   cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register,
                                                                   cpu_data_master_write,
                                                                   cpu_data_master_writedata,
                                                                   reset_n,
                                                                   video_pixel_buffer_dma_0_avalon_control_slave_readdata,

                                                                  // outputs:
                                                                   cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave,
                                                                   cpu_data_master_qualified_request_video_pixel_buffer_dma_0_avalon_control_slave,
                                                                   cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave,
                                                                   cpu_data_master_requests_video_pixel_buffer_dma_0_avalon_control_slave,
                                                                   d1_video_pixel_buffer_dma_0_avalon_control_slave_end_xfer,
                                                                   video_pixel_buffer_dma_0_avalon_control_slave_address,
                                                                   video_pixel_buffer_dma_0_avalon_control_slave_byteenable,
                                                                   video_pixel_buffer_dma_0_avalon_control_slave_read,
                                                                   video_pixel_buffer_dma_0_avalon_control_slave_readdata_from_sa,
                                                                   video_pixel_buffer_dma_0_avalon_control_slave_write,
                                                                   video_pixel_buffer_dma_0_avalon_control_slave_writedata
                                                                )
;

  output           cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave;
  output           cpu_data_master_qualified_request_video_pixel_buffer_dma_0_avalon_control_slave;
  output           cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave;
  output           cpu_data_master_requests_video_pixel_buffer_dma_0_avalon_control_slave;
  output           d1_video_pixel_buffer_dma_0_avalon_control_slave_end_xfer;
  output  [  1: 0] video_pixel_buffer_dma_0_avalon_control_slave_address;
  output  [  3: 0] video_pixel_buffer_dma_0_avalon_control_slave_byteenable;
  output           video_pixel_buffer_dma_0_avalon_control_slave_read;
  output  [ 31: 0] video_pixel_buffer_dma_0_avalon_control_slave_readdata_from_sa;
  output           video_pixel_buffer_dma_0_avalon_control_slave_write;
  output  [ 31: 0] video_pixel_buffer_dma_0_avalon_control_slave_writedata;
  input            clk;
  input   [ 22: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input   [ 31: 0] video_pixel_buffer_dma_0_avalon_control_slave_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave;
  wire             cpu_data_master_qualified_request_video_pixel_buffer_dma_0_avalon_control_slave;
  wire             cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave;
  reg              cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave_shift_register;
  wire             cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave_shift_register_in;
  wire             cpu_data_master_requests_video_pixel_buffer_dma_0_avalon_control_slave;
  wire             cpu_data_master_saved_grant_video_pixel_buffer_dma_0_avalon_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_video_pixel_buffer_dma_0_avalon_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_video_pixel_buffer_dma_0_avalon_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave_shift_register;
  wire    [ 22: 0] shifted_address_to_video_pixel_buffer_dma_0_avalon_control_slave_from_cpu_data_master;
  wire    [  1: 0] video_pixel_buffer_dma_0_avalon_control_slave_address;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_allgrants;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_allow_new_arb_cycle;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_any_bursting_master_saved_grant;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_any_continuerequest;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_arb_counter_enable;
  reg     [  2: 0] video_pixel_buffer_dma_0_avalon_control_slave_arb_share_counter;
  wire    [  2: 0] video_pixel_buffer_dma_0_avalon_control_slave_arb_share_counter_next_value;
  wire    [  2: 0] video_pixel_buffer_dma_0_avalon_control_slave_arb_share_set_values;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_beginbursttransfer_internal;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_begins_xfer;
  wire    [  3: 0] video_pixel_buffer_dma_0_avalon_control_slave_byteenable;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_end_xfer;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_firsttransfer;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_grant_vector;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_in_a_read_cycle;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_in_a_write_cycle;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_master_qreq_vector;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_non_bursting_master_requests;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_read;
  wire    [ 31: 0] video_pixel_buffer_dma_0_avalon_control_slave_readdata_from_sa;
  reg              video_pixel_buffer_dma_0_avalon_control_slave_reg_firsttransfer;
  reg              video_pixel_buffer_dma_0_avalon_control_slave_slavearbiterlockenable;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_slavearbiterlockenable2;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_unreg_firsttransfer;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_waits_for_read;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_waits_for_write;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_write;
  wire    [ 31: 0] video_pixel_buffer_dma_0_avalon_control_slave_writedata;
  wire             wait_for_video_pixel_buffer_dma_0_avalon_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~video_pixel_buffer_dma_0_avalon_control_slave_end_xfer;
    end


  assign video_pixel_buffer_dma_0_avalon_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_video_pixel_buffer_dma_0_avalon_control_slave));
  //assign video_pixel_buffer_dma_0_avalon_control_slave_readdata_from_sa = video_pixel_buffer_dma_0_avalon_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_control_slave_readdata_from_sa = video_pixel_buffer_dma_0_avalon_control_slave_readdata;

  assign cpu_data_master_requests_video_pixel_buffer_dma_0_avalon_control_slave = ({cpu_data_master_address_to_slave[22 : 4] , 4'b0} == 23'h501000) & (cpu_data_master_read | cpu_data_master_write);
  //video_pixel_buffer_dma_0_avalon_control_slave_arb_share_counter set values, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_control_slave_arb_share_set_values = 1;

  //video_pixel_buffer_dma_0_avalon_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_control_slave_non_bursting_master_requests = cpu_data_master_requests_video_pixel_buffer_dma_0_avalon_control_slave;

  //video_pixel_buffer_dma_0_avalon_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_control_slave_any_bursting_master_saved_grant = 0;

  //video_pixel_buffer_dma_0_avalon_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_control_slave_arb_share_counter_next_value = video_pixel_buffer_dma_0_avalon_control_slave_firsttransfer ? (video_pixel_buffer_dma_0_avalon_control_slave_arb_share_set_values - 1) : |video_pixel_buffer_dma_0_avalon_control_slave_arb_share_counter ? (video_pixel_buffer_dma_0_avalon_control_slave_arb_share_counter - 1) : 0;

  //video_pixel_buffer_dma_0_avalon_control_slave_allgrants all slave grants, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_control_slave_allgrants = |video_pixel_buffer_dma_0_avalon_control_slave_grant_vector;

  //video_pixel_buffer_dma_0_avalon_control_slave_end_xfer assignment, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_control_slave_end_xfer = ~(video_pixel_buffer_dma_0_avalon_control_slave_waits_for_read | video_pixel_buffer_dma_0_avalon_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_video_pixel_buffer_dma_0_avalon_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_video_pixel_buffer_dma_0_avalon_control_slave = video_pixel_buffer_dma_0_avalon_control_slave_end_xfer & (~video_pixel_buffer_dma_0_avalon_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //video_pixel_buffer_dma_0_avalon_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_video_pixel_buffer_dma_0_avalon_control_slave & video_pixel_buffer_dma_0_avalon_control_slave_allgrants) | (end_xfer_arb_share_counter_term_video_pixel_buffer_dma_0_avalon_control_slave & ~video_pixel_buffer_dma_0_avalon_control_slave_non_bursting_master_requests);

  //video_pixel_buffer_dma_0_avalon_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_pixel_buffer_dma_0_avalon_control_slave_arb_share_counter <= 0;
      else if (video_pixel_buffer_dma_0_avalon_control_slave_arb_counter_enable)
          video_pixel_buffer_dma_0_avalon_control_slave_arb_share_counter <= video_pixel_buffer_dma_0_avalon_control_slave_arb_share_counter_next_value;
    end


  //video_pixel_buffer_dma_0_avalon_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_pixel_buffer_dma_0_avalon_control_slave_slavearbiterlockenable <= 0;
      else if ((|video_pixel_buffer_dma_0_avalon_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_video_pixel_buffer_dma_0_avalon_control_slave) | (end_xfer_arb_share_counter_term_video_pixel_buffer_dma_0_avalon_control_slave & ~video_pixel_buffer_dma_0_avalon_control_slave_non_bursting_master_requests))
          video_pixel_buffer_dma_0_avalon_control_slave_slavearbiterlockenable <= |video_pixel_buffer_dma_0_avalon_control_slave_arb_share_counter_next_value;
    end


  //cpu/data_master video_pixel_buffer_dma_0/avalon_control_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = video_pixel_buffer_dma_0_avalon_control_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //video_pixel_buffer_dma_0_avalon_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_control_slave_slavearbiterlockenable2 = |video_pixel_buffer_dma_0_avalon_control_slave_arb_share_counter_next_value;

  //cpu/data_master video_pixel_buffer_dma_0/avalon_control_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = video_pixel_buffer_dma_0_avalon_control_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //video_pixel_buffer_dma_0_avalon_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_control_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_video_pixel_buffer_dma_0_avalon_control_slave = cpu_data_master_requests_video_pixel_buffer_dma_0_avalon_control_slave & ~((cpu_data_master_read & ((1 < cpu_data_master_latency_counter) | (|cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register))));
  //cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave_shift_register_in = cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave & cpu_data_master_read & ~video_pixel_buffer_dma_0_avalon_control_slave_waits_for_read;

  //shift register p1 cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave_shift_register = {cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave_shift_register, cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave_shift_register_in};

  //cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave_shift_register <= p1_cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave = cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave_shift_register;

  //video_pixel_buffer_dma_0_avalon_control_slave_writedata mux, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_control_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave = cpu_data_master_qualified_request_video_pixel_buffer_dma_0_avalon_control_slave;

  //cpu/data_master saved-grant video_pixel_buffer_dma_0/avalon_control_slave, which is an e_assign
  assign cpu_data_master_saved_grant_video_pixel_buffer_dma_0_avalon_control_slave = cpu_data_master_requests_video_pixel_buffer_dma_0_avalon_control_slave;

  //allow new arb cycle for video_pixel_buffer_dma_0/avalon_control_slave, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign video_pixel_buffer_dma_0_avalon_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign video_pixel_buffer_dma_0_avalon_control_slave_master_qreq_vector = 1;

  //video_pixel_buffer_dma_0_avalon_control_slave_firsttransfer first transaction, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_control_slave_firsttransfer = video_pixel_buffer_dma_0_avalon_control_slave_begins_xfer ? video_pixel_buffer_dma_0_avalon_control_slave_unreg_firsttransfer : video_pixel_buffer_dma_0_avalon_control_slave_reg_firsttransfer;

  //video_pixel_buffer_dma_0_avalon_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_control_slave_unreg_firsttransfer = ~(video_pixel_buffer_dma_0_avalon_control_slave_slavearbiterlockenable & video_pixel_buffer_dma_0_avalon_control_slave_any_continuerequest);

  //video_pixel_buffer_dma_0_avalon_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_pixel_buffer_dma_0_avalon_control_slave_reg_firsttransfer <= 1'b1;
      else if (video_pixel_buffer_dma_0_avalon_control_slave_begins_xfer)
          video_pixel_buffer_dma_0_avalon_control_slave_reg_firsttransfer <= video_pixel_buffer_dma_0_avalon_control_slave_unreg_firsttransfer;
    end


  //video_pixel_buffer_dma_0_avalon_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_control_slave_beginbursttransfer_internal = video_pixel_buffer_dma_0_avalon_control_slave_begins_xfer;

  //video_pixel_buffer_dma_0_avalon_control_slave_read assignment, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_control_slave_read = cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave & cpu_data_master_read;

  //video_pixel_buffer_dma_0_avalon_control_slave_write assignment, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_control_slave_write = cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave & cpu_data_master_write;

  assign shifted_address_to_video_pixel_buffer_dma_0_avalon_control_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //video_pixel_buffer_dma_0_avalon_control_slave_address mux, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_control_slave_address = shifted_address_to_video_pixel_buffer_dma_0_avalon_control_slave_from_cpu_data_master >> 2;

  //d1_video_pixel_buffer_dma_0_avalon_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_video_pixel_buffer_dma_0_avalon_control_slave_end_xfer <= 1;
      else 
        d1_video_pixel_buffer_dma_0_avalon_control_slave_end_xfer <= video_pixel_buffer_dma_0_avalon_control_slave_end_xfer;
    end


  //video_pixel_buffer_dma_0_avalon_control_slave_waits_for_read in a cycle, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_control_slave_waits_for_read = video_pixel_buffer_dma_0_avalon_control_slave_in_a_read_cycle & 0;

  //video_pixel_buffer_dma_0_avalon_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_control_slave_in_a_read_cycle = cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = video_pixel_buffer_dma_0_avalon_control_slave_in_a_read_cycle;

  //video_pixel_buffer_dma_0_avalon_control_slave_waits_for_write in a cycle, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_control_slave_waits_for_write = video_pixel_buffer_dma_0_avalon_control_slave_in_a_write_cycle & 0;

  //video_pixel_buffer_dma_0_avalon_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_control_slave_in_a_write_cycle = cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = video_pixel_buffer_dma_0_avalon_control_slave_in_a_write_cycle;

  assign wait_for_video_pixel_buffer_dma_0_avalon_control_slave_counter = 0;
  //video_pixel_buffer_dma_0_avalon_control_slave_byteenable byte enable port mux, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_control_slave_byteenable = (cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //video_pixel_buffer_dma_0/avalon_control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_pixel_buffer_dma_0_avalon_pixel_dma_master_arbitrator (
                                                                     // inputs:
                                                                      clk,
                                                                      d1_pixel_buffer_avalon_sram_slave_end_xfer,
                                                                      pixel_buffer_avalon_sram_slave_readdata_from_sa,
                                                                      reset_n,
                                                                      video_pixel_buffer_dma_0_avalon_pixel_dma_master_address,
                                                                      video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave,
                                                                      video_pixel_buffer_dma_0_avalon_pixel_dma_master_qualified_request_pixel_buffer_avalon_sram_slave,
                                                                      video_pixel_buffer_dma_0_avalon_pixel_dma_master_read,
                                                                      video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave,
                                                                      video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register,
                                                                      video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave,

                                                                     // outputs:
                                                                      video_pixel_buffer_dma_0_avalon_pixel_dma_master_address_to_slave,
                                                                      video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_address,
                                                                      video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter,
                                                                      video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdata,
                                                                      video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdatavalid,
                                                                      video_pixel_buffer_dma_0_avalon_pixel_dma_master_reset,
                                                                      video_pixel_buffer_dma_0_avalon_pixel_dma_master_waitrequest
                                                                   )
;

  output  [ 31: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_address_to_slave;
  output  [  1: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_address;
  output           video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter;
  output  [ 31: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdata;
  output           video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdatavalid;
  output           video_pixel_buffer_dma_0_avalon_pixel_dma_master_reset;
  output           video_pixel_buffer_dma_0_avalon_pixel_dma_master_waitrequest;
  input            clk;
  input            d1_pixel_buffer_avalon_sram_slave_end_xfer;
  input   [ 15: 0] pixel_buffer_avalon_sram_slave_readdata_from_sa;
  input            reset_n;
  input   [ 31: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_address;
  input            video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave;
  input            video_pixel_buffer_dma_0_avalon_pixel_dma_master_qualified_request_pixel_buffer_avalon_sram_slave;
  input            video_pixel_buffer_dma_0_avalon_pixel_dma_master_read;
  input            video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave;
  input            video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  input            video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave;

  reg              active_and_waiting_last_time;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire             latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             p1_video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter;
  wire             pre_dbs_count_enable;
  wire             pre_flush_video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdatavalid;
  wire             r_0;
  reg     [ 31: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_address_last_time;
  wire    [ 31: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_address_to_slave;
  reg     [  1: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_address;
  wire    [  1: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_increment;
  reg     [  1: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_rdv_counter;
  wire    [  1: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_rdv_counter_inc;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_is_granted_some_slave;
  reg              video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter;
  wire    [  1: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_next_dbs_rdv_counter;
  reg              video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_but_no_slave_selected;
  reg              video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_last_time;
  wire    [ 31: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdata;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdatavalid;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_reset;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_run;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_waitrequest;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (video_pixel_buffer_dma_0_avalon_pixel_dma_master_qualified_request_pixel_buffer_avalon_sram_slave | ~video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave) & (video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave | ~video_pixel_buffer_dma_0_avalon_pixel_dma_master_qualified_request_pixel_buffer_avalon_sram_slave) & ((~video_pixel_buffer_dma_0_avalon_pixel_dma_master_qualified_request_pixel_buffer_avalon_sram_slave | ~video_pixel_buffer_dma_0_avalon_pixel_dma_master_read | (1 & (video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_address[1]) & video_pixel_buffer_dma_0_avalon_pixel_dma_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_address_to_slave = {11'b1,
    video_pixel_buffer_dma_0_avalon_pixel_dma_master_address[20 : 0]};

  //video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_but_no_slave_selected <= 0;
      else 
        video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_but_no_slave_selected <= video_pixel_buffer_dma_0_avalon_pixel_dma_master_read & video_pixel_buffer_dma_0_avalon_pixel_dma_master_run & ~video_pixel_buffer_dma_0_avalon_pixel_dma_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_is_granted_some_slave = video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdatavalid = video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave & dbs_rdv_counter_overflow;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdatavalid = video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_but_no_slave_selected |
    pre_flush_video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdatavalid;

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = pixel_buffer_avalon_sram_slave_readdata_from_sa;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //video_pixel_buffer_dma_0/avalon_pixel_dma_master readdata mux, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdata = {pixel_buffer_avalon_sram_slave_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0};

  //actual waitrequest port, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_waitrequest = ~video_pixel_buffer_dma_0_avalon_pixel_dma_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter <= 0;
      else 
        video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter <= p1_video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter = ((video_pixel_buffer_dma_0_avalon_pixel_dma_master_run & video_pixel_buffer_dma_0_avalon_pixel_dma_master_read))? latency_load_value :
    (video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter)? video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;

  //~video_pixel_buffer_dma_0_avalon_pixel_dma_master_reset assignment, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_reset = ~reset_n;

  //dbs count increment, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_increment = (video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_address + video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_address <= 0;
      else if (dbs_count_enable)
          video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_next_dbs_rdv_counter = video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_rdv_counter + video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_rdv_counter_inc;

  //video_pixel_buffer_dma_0_avalon_pixel_dma_master_rdv_inc_mux, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_rdv_counter_inc = 2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_rdv_counter <= video_pixel_buffer_dma_0_avalon_pixel_dma_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_rdv_counter[1] & ~video_pixel_buffer_dma_0_avalon_pixel_dma_master_next_dbs_rdv_counter[1];

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave & video_pixel_buffer_dma_0_avalon_pixel_dma_master_read & 1 & 1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //video_pixel_buffer_dma_0_avalon_pixel_dma_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_pixel_buffer_dma_0_avalon_pixel_dma_master_address_last_time <= 0;
      else 
        video_pixel_buffer_dma_0_avalon_pixel_dma_master_address_last_time <= video_pixel_buffer_dma_0_avalon_pixel_dma_master_address;
    end


  //video_pixel_buffer_dma_0/avalon_pixel_dma_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= video_pixel_buffer_dma_0_avalon_pixel_dma_master_waitrequest & (video_pixel_buffer_dma_0_avalon_pixel_dma_master_read);
    end


  //video_pixel_buffer_dma_0_avalon_pixel_dma_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (video_pixel_buffer_dma_0_avalon_pixel_dma_master_address != video_pixel_buffer_dma_0_avalon_pixel_dma_master_address_last_time))
        begin
          $write("%0d ns: video_pixel_buffer_dma_0_avalon_pixel_dma_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //video_pixel_buffer_dma_0_avalon_pixel_dma_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_last_time <= 0;
      else 
        video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_last_time <= video_pixel_buffer_dma_0_avalon_pixel_dma_master_read;
    end


  //video_pixel_buffer_dma_0_avalon_pixel_dma_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (video_pixel_buffer_dma_0_avalon_pixel_dma_master_read != video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_last_time))
        begin
          $write("%0d ns: video_pixel_buffer_dma_0_avalon_pixel_dma_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_pixel_buffer_dma_0_avalon_pixel_source_arbitrator (
                                                                 // inputs:
                                                                  clk,
                                                                  dual_clock_fifo_avalon_dc_buffer_sink_ready_from_sa,
                                                                  reset_n,
                                                                  video_pixel_buffer_dma_0_avalon_pixel_source_data,
                                                                  video_pixel_buffer_dma_0_avalon_pixel_source_endofpacket,
                                                                  video_pixel_buffer_dma_0_avalon_pixel_source_startofpacket,
                                                                  video_pixel_buffer_dma_0_avalon_pixel_source_valid,

                                                                 // outputs:
                                                                  video_pixel_buffer_dma_0_avalon_pixel_source_ready
                                                               )
;

  output           video_pixel_buffer_dma_0_avalon_pixel_source_ready;
  input            clk;
  input            dual_clock_fifo_avalon_dc_buffer_sink_ready_from_sa;
  input            reset_n;
  input   [ 29: 0] video_pixel_buffer_dma_0_avalon_pixel_source_data;
  input            video_pixel_buffer_dma_0_avalon_pixel_source_endofpacket;
  input            video_pixel_buffer_dma_0_avalon_pixel_source_startofpacket;
  input            video_pixel_buffer_dma_0_avalon_pixel_source_valid;

  wire             video_pixel_buffer_dma_0_avalon_pixel_source_ready;
  //mux video_pixel_buffer_dma_0_avalon_pixel_source_ready, which is an e_mux
  assign video_pixel_buffer_dma_0_avalon_pixel_source_ready = dual_clock_fifo_avalon_dc_buffer_sink_ready_from_sa;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module video_vga_controller_0_avalon_vga_sink_arbitrator (
                                                           // inputs:
                                                            clk,
                                                            dual_clock_fifo_avalon_dc_buffer_source_data,
                                                            dual_clock_fifo_avalon_dc_buffer_source_endofpacket,
                                                            dual_clock_fifo_avalon_dc_buffer_source_startofpacket,
                                                            dual_clock_fifo_avalon_dc_buffer_source_valid,
                                                            reset_n,
                                                            video_vga_controller_0_avalon_vga_sink_ready,

                                                           // outputs:
                                                            video_vga_controller_0_avalon_vga_sink_data,
                                                            video_vga_controller_0_avalon_vga_sink_endofpacket,
                                                            video_vga_controller_0_avalon_vga_sink_ready_from_sa,
                                                            video_vga_controller_0_avalon_vga_sink_reset,
                                                            video_vga_controller_0_avalon_vga_sink_startofpacket,
                                                            video_vga_controller_0_avalon_vga_sink_valid
                                                         )
;

  output  [ 29: 0] video_vga_controller_0_avalon_vga_sink_data;
  output           video_vga_controller_0_avalon_vga_sink_endofpacket;
  output           video_vga_controller_0_avalon_vga_sink_ready_from_sa;
  output           video_vga_controller_0_avalon_vga_sink_reset;
  output           video_vga_controller_0_avalon_vga_sink_startofpacket;
  output           video_vga_controller_0_avalon_vga_sink_valid;
  input            clk;
  input   [ 29: 0] dual_clock_fifo_avalon_dc_buffer_source_data;
  input            dual_clock_fifo_avalon_dc_buffer_source_endofpacket;
  input            dual_clock_fifo_avalon_dc_buffer_source_startofpacket;
  input            dual_clock_fifo_avalon_dc_buffer_source_valid;
  input            reset_n;
  input            video_vga_controller_0_avalon_vga_sink_ready;

  wire    [ 29: 0] video_vga_controller_0_avalon_vga_sink_data;
  wire             video_vga_controller_0_avalon_vga_sink_endofpacket;
  wire             video_vga_controller_0_avalon_vga_sink_ready_from_sa;
  wire             video_vga_controller_0_avalon_vga_sink_reset;
  wire             video_vga_controller_0_avalon_vga_sink_startofpacket;
  wire             video_vga_controller_0_avalon_vga_sink_valid;
  //mux video_vga_controller_0_avalon_vga_sink_data, which is an e_mux
  assign video_vga_controller_0_avalon_vga_sink_data = dual_clock_fifo_avalon_dc_buffer_source_data;

  //mux video_vga_controller_0_avalon_vga_sink_endofpacket, which is an e_mux
  assign video_vga_controller_0_avalon_vga_sink_endofpacket = dual_clock_fifo_avalon_dc_buffer_source_endofpacket;

  //assign video_vga_controller_0_avalon_vga_sink_ready_from_sa = video_vga_controller_0_avalon_vga_sink_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign video_vga_controller_0_avalon_vga_sink_ready_from_sa = video_vga_controller_0_avalon_vga_sink_ready;

  //mux video_vga_controller_0_avalon_vga_sink_startofpacket, which is an e_mux
  assign video_vga_controller_0_avalon_vga_sink_startofpacket = dual_clock_fifo_avalon_dc_buffer_source_startofpacket;

  //mux video_vga_controller_0_avalon_vga_sink_valid, which is an e_mux
  assign video_vga_controller_0_avalon_vga_sink_valid = dual_clock_fifo_avalon_dc_buffer_source_valid;

  //~video_vga_controller_0_avalon_vga_sink_reset assignment, which is an e_assign
  assign video_vga_controller_0_avalon_vga_sink_reset = ~reset_n;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module the_whole_shit_reset_clk_0_domain_synch_module (
                                                        // inputs:
                                                         clk,
                                                         data_in,
                                                         reset_n,

                                                        // outputs:
                                                         data_out
                                                      )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module the_whole_shit_reset_clocks_0_sys_clk_out_domain_synch_module (
                                                                       // inputs:
                                                                        clk,
                                                                        data_in,
                                                                        reset_n,

                                                                       // outputs:
                                                                        data_out
                                                                     )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module the_whole_shit_reset_clocks_0_VGA_CLK_out_domain_synch_module (
                                                                       // inputs:
                                                                        clk,
                                                                        data_in,
                                                                        reset_n,

                                                                       // outputs:
                                                                        data_out
                                                                     )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module the_whole_shit (
                        // 1) global signals:
                         clk_0,
                         clocks_0_VGA_CLK_out,
                         clocks_0_sys_clk_out,
                         reset_n,

                        // the_pixel_buffer
                         SRAM_ADDR_from_the_pixel_buffer,
                         SRAM_CE_N_from_the_pixel_buffer,
                         SRAM_DQ_to_and_from_the_pixel_buffer,
                         SRAM_LB_N_from_the_pixel_buffer,
                         SRAM_OE_N_from_the_pixel_buffer,
                         SRAM_UB_N_from_the_pixel_buffer,
                         SRAM_WE_N_from_the_pixel_buffer,

                        // the_video_vga_controller_0
                         VGA_BLANK_from_the_video_vga_controller_0,
                         VGA_B_from_the_video_vga_controller_0,
                         VGA_CLK_from_the_video_vga_controller_0,
                         VGA_G_from_the_video_vga_controller_0,
                         VGA_HS_from_the_video_vga_controller_0,
                         VGA_R_from_the_video_vga_controller_0,
                         VGA_SYNC_from_the_video_vga_controller_0,
                         VGA_VS_from_the_video_vga_controller_0
                      )
;

  output  [ 19: 0] SRAM_ADDR_from_the_pixel_buffer;
  output           SRAM_CE_N_from_the_pixel_buffer;
  inout   [ 15: 0] SRAM_DQ_to_and_from_the_pixel_buffer;
  output           SRAM_LB_N_from_the_pixel_buffer;
  output           SRAM_OE_N_from_the_pixel_buffer;
  output           SRAM_UB_N_from_the_pixel_buffer;
  output           SRAM_WE_N_from_the_pixel_buffer;
  output           VGA_BLANK_from_the_video_vga_controller_0;
  output  [  7: 0] VGA_B_from_the_video_vga_controller_0;
  output           VGA_CLK_from_the_video_vga_controller_0;
  output  [  7: 0] VGA_G_from_the_video_vga_controller_0;
  output           VGA_HS_from_the_video_vga_controller_0;
  output  [  7: 0] VGA_R_from_the_video_vga_controller_0;
  output           VGA_SYNC_from_the_video_vga_controller_0;
  output           VGA_VS_from_the_video_vga_controller_0;
  output           clocks_0_VGA_CLK_out;
  output           clocks_0_sys_clk_out;
  input            clk_0;
  input            reset_n;

  wire    [ 19: 0] SRAM_ADDR_from_the_pixel_buffer;
  wire             SRAM_CE_N_from_the_pixel_buffer;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_pixel_buffer;
  wire             SRAM_LB_N_from_the_pixel_buffer;
  wire             SRAM_OE_N_from_the_pixel_buffer;
  wire             SRAM_UB_N_from_the_pixel_buffer;
  wire             SRAM_WE_N_from_the_pixel_buffer;
  wire             VGA_BLANK_from_the_video_vga_controller_0;
  wire    [  7: 0] VGA_B_from_the_video_vga_controller_0;
  wire             VGA_CLK_from_the_video_vga_controller_0;
  wire    [  7: 0] VGA_G_from_the_video_vga_controller_0;
  wire             VGA_HS_from_the_video_vga_controller_0;
  wire    [  7: 0] VGA_R_from_the_video_vga_controller_0;
  wire             VGA_SYNC_from_the_video_vga_controller_0;
  wire             VGA_VS_from_the_video_vga_controller_0;
  wire             clk_0_reset_n;
  wire             clocks_0_VGA_CLK_out;
  wire             clocks_0_VGA_CLK_out_reset_n;
  wire             clocks_0_avalon_clocks_slave_address;
  wire    [  7: 0] clocks_0_avalon_clocks_slave_readdata;
  wire    [  7: 0] clocks_0_avalon_clocks_slave_readdata_from_sa;
  wire             clocks_0_sys_clk_out;
  wire             clocks_0_sys_clk_out_reset_n;
  wire    [ 22: 0] cpu_data_master_address;
  wire    [ 22: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire    [  1: 0] cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave;
  wire             cpu_data_master_byteenable_the_whole_shit_clock_0_in;
  wire    [  1: 0] cpu_data_master_dbs_address;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire    [  7: 0] cpu_data_master_dbs_write_8;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_onchip_ram_s1;
  wire             cpu_data_master_granted_pixel_buffer_avalon_sram_slave;
  wire             cpu_data_master_granted_the_whole_shit_clock_0_in;
  wire             cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_latency_counter;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_onchip_ram_s1;
  wire             cpu_data_master_qualified_request_pixel_buffer_avalon_sram_slave;
  wire             cpu_data_master_qualified_request_the_whole_shit_clock_0_in;
  wire             cpu_data_master_qualified_request_video_pixel_buffer_dma_0_avalon_control_slave;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_onchip_ram_s1;
  wire             cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave;
  wire             cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  wire             cpu_data_master_read_data_valid_the_whole_shit_clock_0_in;
  wire             cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_readdatavalid;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_onchip_ram_s1;
  wire             cpu_data_master_requests_pixel_buffer_avalon_sram_slave;
  wire             cpu_data_master_requests_the_whole_shit_clock_0_in;
  wire             cpu_data_master_requests_video_pixel_buffer_dma_0_avalon_control_slave;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 22: 0] cpu_instruction_master_address;
  wire    [ 22: 0] cpu_instruction_master_address_to_slave;
  wire    [  1: 0] cpu_instruction_master_dbs_address;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_granted_onchip_ram_s1;
  wire             cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave;
  wire             cpu_instruction_master_latency_counter;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_onchip_ram_s1;
  wire             cpu_instruction_master_qualified_request_pixel_buffer_avalon_sram_slave;
  wire             cpu_instruction_master_read;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_onchip_ram_s1;
  wire             cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave;
  wire             cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_onchip_ram_s1;
  wire             cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave;
  wire             cpu_instruction_master_waitrequest;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire             cpu_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  wire             d1_clocks_0_avalon_clocks_slave_end_xfer;
  wire             d1_cpu_jtag_debug_module_end_xfer;
  wire             d1_onchip_ram_s1_end_xfer;
  wire             d1_pixel_buffer_avalon_sram_slave_end_xfer;
  wire             d1_the_whole_shit_clock_0_in_end_xfer;
  wire             d1_video_pixel_buffer_dma_0_avalon_control_slave_end_xfer;
  wire    [ 29: 0] dual_clock_fifo_avalon_dc_buffer_sink_data;
  wire             dual_clock_fifo_avalon_dc_buffer_sink_endofpacket;
  wire             dual_clock_fifo_avalon_dc_buffer_sink_ready;
  wire             dual_clock_fifo_avalon_dc_buffer_sink_ready_from_sa;
  wire             dual_clock_fifo_avalon_dc_buffer_sink_startofpacket;
  wire             dual_clock_fifo_avalon_dc_buffer_sink_valid;
  wire    [ 29: 0] dual_clock_fifo_avalon_dc_buffer_source_data;
  wire             dual_clock_fifo_avalon_dc_buffer_source_endofpacket;
  wire             dual_clock_fifo_avalon_dc_buffer_source_ready;
  wire             dual_clock_fifo_avalon_dc_buffer_source_startofpacket;
  wire             dual_clock_fifo_avalon_dc_buffer_source_valid;
  wire    [ 16: 0] onchip_ram_s1_address;
  wire    [  3: 0] onchip_ram_s1_byteenable;
  wire             onchip_ram_s1_chipselect;
  wire             onchip_ram_s1_clken;
  wire    [ 31: 0] onchip_ram_s1_readdata;
  wire    [ 31: 0] onchip_ram_s1_readdata_from_sa;
  wire             onchip_ram_s1_reset;
  wire             onchip_ram_s1_write;
  wire    [ 31: 0] onchip_ram_s1_writedata;
  wire             out_clk_clocks_0_VGA_CLK;
  wire             out_clk_clocks_0_sys_clk;
  wire    [ 19: 0] pixel_buffer_avalon_sram_slave_address;
  wire    [  1: 0] pixel_buffer_avalon_sram_slave_byteenable;
  wire             pixel_buffer_avalon_sram_slave_read;
  wire    [ 15: 0] pixel_buffer_avalon_sram_slave_readdata;
  wire    [ 15: 0] pixel_buffer_avalon_sram_slave_readdata_from_sa;
  wire             pixel_buffer_avalon_sram_slave_readdatavalid;
  wire             pixel_buffer_avalon_sram_slave_reset;
  wire             pixel_buffer_avalon_sram_slave_write;
  wire    [ 15: 0] pixel_buffer_avalon_sram_slave_writedata;
  wire             reset_n_sources;
  wire             the_whole_shit_clock_0_in_address;
  wire             the_whole_shit_clock_0_in_endofpacket;
  wire             the_whole_shit_clock_0_in_endofpacket_from_sa;
  wire             the_whole_shit_clock_0_in_nativeaddress;
  wire             the_whole_shit_clock_0_in_read;
  wire    [  7: 0] the_whole_shit_clock_0_in_readdata;
  wire    [  7: 0] the_whole_shit_clock_0_in_readdata_from_sa;
  wire             the_whole_shit_clock_0_in_reset_n;
  wire             the_whole_shit_clock_0_in_waitrequest;
  wire             the_whole_shit_clock_0_in_waitrequest_from_sa;
  wire             the_whole_shit_clock_0_in_write;
  wire    [  7: 0] the_whole_shit_clock_0_in_writedata;
  wire             the_whole_shit_clock_0_out_address;
  wire             the_whole_shit_clock_0_out_address_to_slave;
  wire             the_whole_shit_clock_0_out_endofpacket;
  wire             the_whole_shit_clock_0_out_granted_clocks_0_avalon_clocks_slave;
  wire             the_whole_shit_clock_0_out_nativeaddress;
  wire             the_whole_shit_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave;
  wire             the_whole_shit_clock_0_out_read;
  wire             the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave;
  wire    [  7: 0] the_whole_shit_clock_0_out_readdata;
  wire             the_whole_shit_clock_0_out_requests_clocks_0_avalon_clocks_slave;
  wire             the_whole_shit_clock_0_out_reset_n;
  wire             the_whole_shit_clock_0_out_waitrequest;
  wire             the_whole_shit_clock_0_out_write;
  wire    [  7: 0] the_whole_shit_clock_0_out_writedata;
  wire    [  1: 0] video_pixel_buffer_dma_0_avalon_control_slave_address;
  wire    [  3: 0] video_pixel_buffer_dma_0_avalon_control_slave_byteenable;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_read;
  wire    [ 31: 0] video_pixel_buffer_dma_0_avalon_control_slave_readdata;
  wire    [ 31: 0] video_pixel_buffer_dma_0_avalon_control_slave_readdata_from_sa;
  wire             video_pixel_buffer_dma_0_avalon_control_slave_write;
  wire    [ 31: 0] video_pixel_buffer_dma_0_avalon_control_slave_writedata;
  wire    [ 31: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_address;
  wire    [ 31: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_address_to_slave;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_arbiterlock;
  wire    [  1: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_address;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_qualified_request_pixel_buffer_avalon_sram_slave;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_read;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register;
  wire    [ 31: 0] video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdata;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdatavalid;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_reset;
  wire             video_pixel_buffer_dma_0_avalon_pixel_dma_master_waitrequest;
  wire    [ 29: 0] video_pixel_buffer_dma_0_avalon_pixel_source_data;
  wire             video_pixel_buffer_dma_0_avalon_pixel_source_endofpacket;
  wire             video_pixel_buffer_dma_0_avalon_pixel_source_ready;
  wire             video_pixel_buffer_dma_0_avalon_pixel_source_startofpacket;
  wire             video_pixel_buffer_dma_0_avalon_pixel_source_valid;
  wire    [ 29: 0] video_vga_controller_0_avalon_vga_sink_data;
  wire             video_vga_controller_0_avalon_vga_sink_endofpacket;
  wire             video_vga_controller_0_avalon_vga_sink_ready;
  wire             video_vga_controller_0_avalon_vga_sink_ready_from_sa;
  wire             video_vga_controller_0_avalon_vga_sink_reset;
  wire             video_vga_controller_0_avalon_vga_sink_startofpacket;
  wire             video_vga_controller_0_avalon_vga_sink_valid;
  clocks_0_avalon_clocks_slave_arbitrator the_clocks_0_avalon_clocks_slave
    (
      .clk                                                                       (clk_0),
      .clocks_0_avalon_clocks_slave_address                                      (clocks_0_avalon_clocks_slave_address),
      .clocks_0_avalon_clocks_slave_readdata                                     (clocks_0_avalon_clocks_slave_readdata),
      .clocks_0_avalon_clocks_slave_readdata_from_sa                             (clocks_0_avalon_clocks_slave_readdata_from_sa),
      .d1_clocks_0_avalon_clocks_slave_end_xfer                                  (d1_clocks_0_avalon_clocks_slave_end_xfer),
      .reset_n                                                                   (clk_0_reset_n),
      .the_whole_shit_clock_0_out_address_to_slave                               (the_whole_shit_clock_0_out_address_to_slave),
      .the_whole_shit_clock_0_out_granted_clocks_0_avalon_clocks_slave           (the_whole_shit_clock_0_out_granted_clocks_0_avalon_clocks_slave),
      .the_whole_shit_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave (the_whole_shit_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave),
      .the_whole_shit_clock_0_out_read                                           (the_whole_shit_clock_0_out_read),
      .the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave   (the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave),
      .the_whole_shit_clock_0_out_requests_clocks_0_avalon_clocks_slave          (the_whole_shit_clock_0_out_requests_clocks_0_avalon_clocks_slave),
      .the_whole_shit_clock_0_out_write                                          (the_whole_shit_clock_0_out_write)
    );

  //clocks_0_VGA_CLK_out out_clk assignment, which is an e_assign
  assign clocks_0_VGA_CLK_out = out_clk_clocks_0_VGA_CLK;

  //clocks_0_sys_clk_out out_clk assignment, which is an e_assign
  assign clocks_0_sys_clk_out = out_clk_clocks_0_sys_clk;

  clocks_0 the_clocks_0
    (
      .CLOCK_50 (clk_0),
      .VGA_CLK  (out_clk_clocks_0_VGA_CLK),
      .address  (clocks_0_avalon_clocks_slave_address),
      .readdata (clocks_0_avalon_clocks_slave_readdata),
      .sys_clk  (out_clk_clocks_0_sys_clk)
    );

  cpu_jtag_debug_module_arbitrator the_cpu_jtag_debug_module
    (
      .clk                                                                                  (clocks_0_sys_clk_out),
      .cpu_data_master_address_to_slave                                                     (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                           (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                                          (cpu_data_master_debugaccess),
      .cpu_data_master_granted_cpu_jtag_debug_module                                        (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_latency_counter                                                      (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module                              (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_read                                                                 (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module                                (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register        (cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register),
      .cpu_data_master_requests_cpu_jtag_debug_module                                       (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_write                                                                (cpu_data_master_write),
      .cpu_data_master_writedata                                                            (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                                              (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module                                 (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_latency_counter                                               (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module                       (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                                          (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module                         (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register (cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register),
      .cpu_instruction_master_requests_cpu_jtag_debug_module                                (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_jtag_debug_module_address                                                        (cpu_jtag_debug_module_address),
      .cpu_jtag_debug_module_begintransfer                                                  (cpu_jtag_debug_module_begintransfer),
      .cpu_jtag_debug_module_byteenable                                                     (cpu_jtag_debug_module_byteenable),
      .cpu_jtag_debug_module_chipselect                                                     (cpu_jtag_debug_module_chipselect),
      .cpu_jtag_debug_module_debugaccess                                                    (cpu_jtag_debug_module_debugaccess),
      .cpu_jtag_debug_module_readdata                                                       (cpu_jtag_debug_module_readdata),
      .cpu_jtag_debug_module_readdata_from_sa                                               (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_jtag_debug_module_reset_n                                                        (cpu_jtag_debug_module_reset_n),
      .cpu_jtag_debug_module_resetrequest                                                   (cpu_jtag_debug_module_resetrequest),
      .cpu_jtag_debug_module_resetrequest_from_sa                                           (cpu_jtag_debug_module_resetrequest_from_sa),
      .cpu_jtag_debug_module_write                                                          (cpu_jtag_debug_module_write),
      .cpu_jtag_debug_module_writedata                                                      (cpu_jtag_debug_module_writedata),
      .d1_cpu_jtag_debug_module_end_xfer                                                    (d1_cpu_jtag_debug_module_end_xfer),
      .reset_n                                                                              (clocks_0_sys_clk_out_reset_n)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .clk                                                                             (clocks_0_sys_clk_out),
      .cpu_data_master_address                                                         (cpu_data_master_address),
      .cpu_data_master_address_to_slave                                                (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                      (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave                       (cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave),
      .cpu_data_master_byteenable_the_whole_shit_clock_0_in                            (cpu_data_master_byteenable_the_whole_shit_clock_0_in),
      .cpu_data_master_dbs_address                                                     (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                                    (cpu_data_master_dbs_write_16),
      .cpu_data_master_dbs_write_8                                                     (cpu_data_master_dbs_write_8),
      .cpu_data_master_granted_cpu_jtag_debug_module                                   (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_onchip_ram_s1                                           (cpu_data_master_granted_onchip_ram_s1),
      .cpu_data_master_granted_pixel_buffer_avalon_sram_slave                          (cpu_data_master_granted_pixel_buffer_avalon_sram_slave),
      .cpu_data_master_granted_the_whole_shit_clock_0_in                               (cpu_data_master_granted_the_whole_shit_clock_0_in),
      .cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave           (cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave),
      .cpu_data_master_latency_counter                                                 (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module                         (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_onchip_ram_s1                                 (cpu_data_master_qualified_request_onchip_ram_s1),
      .cpu_data_master_qualified_request_pixel_buffer_avalon_sram_slave                (cpu_data_master_qualified_request_pixel_buffer_avalon_sram_slave),
      .cpu_data_master_qualified_request_the_whole_shit_clock_0_in                     (cpu_data_master_qualified_request_the_whole_shit_clock_0_in),
      .cpu_data_master_qualified_request_video_pixel_buffer_dma_0_avalon_control_slave (cpu_data_master_qualified_request_video_pixel_buffer_dma_0_avalon_control_slave),
      .cpu_data_master_read                                                            (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module                           (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_onchip_ram_s1                                   (cpu_data_master_read_data_valid_onchip_ram_s1),
      .cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave                  (cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave),
      .cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register   (cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register),
      .cpu_data_master_read_data_valid_the_whole_shit_clock_0_in                       (cpu_data_master_read_data_valid_the_whole_shit_clock_0_in),
      .cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave   (cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave),
      .cpu_data_master_readdata                                                        (cpu_data_master_readdata),
      .cpu_data_master_readdatavalid                                                   (cpu_data_master_readdatavalid),
      .cpu_data_master_requests_cpu_jtag_debug_module                                  (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_onchip_ram_s1                                          (cpu_data_master_requests_onchip_ram_s1),
      .cpu_data_master_requests_pixel_buffer_avalon_sram_slave                         (cpu_data_master_requests_pixel_buffer_avalon_sram_slave),
      .cpu_data_master_requests_the_whole_shit_clock_0_in                              (cpu_data_master_requests_the_whole_shit_clock_0_in),
      .cpu_data_master_requests_video_pixel_buffer_dma_0_avalon_control_slave          (cpu_data_master_requests_video_pixel_buffer_dma_0_avalon_control_slave),
      .cpu_data_master_waitrequest                                                     (cpu_data_master_waitrequest),
      .cpu_data_master_write                                                           (cpu_data_master_write),
      .cpu_data_master_writedata                                                       (cpu_data_master_writedata),
      .cpu_jtag_debug_module_readdata_from_sa                                          (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                                               (d1_cpu_jtag_debug_module_end_xfer),
      .d1_onchip_ram_s1_end_xfer                                                       (d1_onchip_ram_s1_end_xfer),
      .d1_pixel_buffer_avalon_sram_slave_end_xfer                                      (d1_pixel_buffer_avalon_sram_slave_end_xfer),
      .d1_the_whole_shit_clock_0_in_end_xfer                                           (d1_the_whole_shit_clock_0_in_end_xfer),
      .d1_video_pixel_buffer_dma_0_avalon_control_slave_end_xfer                       (d1_video_pixel_buffer_dma_0_avalon_control_slave_end_xfer),
      .onchip_ram_s1_readdata_from_sa                                                  (onchip_ram_s1_readdata_from_sa),
      .pixel_buffer_avalon_sram_slave_readdata_from_sa                                 (pixel_buffer_avalon_sram_slave_readdata_from_sa),
      .reset_n                                                                         (clocks_0_sys_clk_out_reset_n),
      .the_whole_shit_clock_0_in_readdata_from_sa                                      (the_whole_shit_clock_0_in_readdata_from_sa),
      .the_whole_shit_clock_0_in_waitrequest_from_sa                                   (the_whole_shit_clock_0_in_waitrequest_from_sa),
      .video_pixel_buffer_dma_0_avalon_control_slave_readdata_from_sa                  (video_pixel_buffer_dma_0_avalon_control_slave_readdata_from_sa)
    );

  cpu_instruction_master_arbitrator the_cpu_instruction_master
    (
      .clk                                                                                  (clocks_0_sys_clk_out),
      .cpu_instruction_master_address                                                       (cpu_instruction_master_address),
      .cpu_instruction_master_address_to_slave                                              (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                                                   (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_cpu_jtag_debug_module                                 (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_granted_onchip_ram_s1                                         (cpu_instruction_master_granted_onchip_ram_s1),
      .cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave                        (cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave),
      .cpu_instruction_master_latency_counter                                               (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module                       (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_onchip_ram_s1                               (cpu_instruction_master_qualified_request_onchip_ram_s1),
      .cpu_instruction_master_qualified_request_pixel_buffer_avalon_sram_slave              (cpu_instruction_master_qualified_request_pixel_buffer_avalon_sram_slave),
      .cpu_instruction_master_read                                                          (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module                         (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_onchip_ram_s1                                 (cpu_instruction_master_read_data_valid_onchip_ram_s1),
      .cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave                (cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave),
      .cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register (cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register),
      .cpu_instruction_master_readdata                                                      (cpu_instruction_master_readdata),
      .cpu_instruction_master_readdatavalid                                                 (cpu_instruction_master_readdatavalid),
      .cpu_instruction_master_requests_cpu_jtag_debug_module                                (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_onchip_ram_s1                                        (cpu_instruction_master_requests_onchip_ram_s1),
      .cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave                       (cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave),
      .cpu_instruction_master_waitrequest                                                   (cpu_instruction_master_waitrequest),
      .cpu_jtag_debug_module_readdata_from_sa                                               (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                                                    (d1_cpu_jtag_debug_module_end_xfer),
      .d1_onchip_ram_s1_end_xfer                                                            (d1_onchip_ram_s1_end_xfer),
      .d1_pixel_buffer_avalon_sram_slave_end_xfer                                           (d1_pixel_buffer_avalon_sram_slave_end_xfer),
      .onchip_ram_s1_readdata_from_sa                                                       (onchip_ram_s1_readdata_from_sa),
      .pixel_buffer_avalon_sram_slave_readdata_from_sa                                      (pixel_buffer_avalon_sram_slave_readdata_from_sa),
      .reset_n                                                                              (clocks_0_sys_clk_out_reset_n)
    );

  cpu the_cpu
    (
      .clk                                   (clocks_0_sys_clk_out),
      .d_address                             (cpu_data_master_address),
      .d_byteenable                          (cpu_data_master_byteenable),
      .d_irq                                 (cpu_data_master_irq),
      .d_read                                (cpu_data_master_read),
      .d_readdata                            (cpu_data_master_readdata),
      .d_readdatavalid                       (cpu_data_master_readdatavalid),
      .d_waitrequest                         (cpu_data_master_waitrequest),
      .d_write                               (cpu_data_master_write),
      .d_writedata                           (cpu_data_master_writedata),
      .i_address                             (cpu_instruction_master_address),
      .i_read                                (cpu_instruction_master_read),
      .i_readdata                            (cpu_instruction_master_readdata),
      .i_readdatavalid                       (cpu_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_jtag_debug_module_writedata),
      .reset_n                               (cpu_jtag_debug_module_reset_n)
    );

  dual_clock_fifo_avalon_dc_buffer_sink_arbitrator the_dual_clock_fifo_avalon_dc_buffer_sink
    (
      .clk                                                        (clocks_0_sys_clk_out),
      .dual_clock_fifo_avalon_dc_buffer_sink_data                 (dual_clock_fifo_avalon_dc_buffer_sink_data),
      .dual_clock_fifo_avalon_dc_buffer_sink_endofpacket          (dual_clock_fifo_avalon_dc_buffer_sink_endofpacket),
      .dual_clock_fifo_avalon_dc_buffer_sink_ready                (dual_clock_fifo_avalon_dc_buffer_sink_ready),
      .dual_clock_fifo_avalon_dc_buffer_sink_ready_from_sa        (dual_clock_fifo_avalon_dc_buffer_sink_ready_from_sa),
      .dual_clock_fifo_avalon_dc_buffer_sink_startofpacket        (dual_clock_fifo_avalon_dc_buffer_sink_startofpacket),
      .dual_clock_fifo_avalon_dc_buffer_sink_valid                (dual_clock_fifo_avalon_dc_buffer_sink_valid),
      .reset_n                                                    (clocks_0_sys_clk_out_reset_n),
      .video_pixel_buffer_dma_0_avalon_pixel_source_data          (video_pixel_buffer_dma_0_avalon_pixel_source_data),
      .video_pixel_buffer_dma_0_avalon_pixel_source_endofpacket   (video_pixel_buffer_dma_0_avalon_pixel_source_endofpacket),
      .video_pixel_buffer_dma_0_avalon_pixel_source_startofpacket (video_pixel_buffer_dma_0_avalon_pixel_source_startofpacket),
      .video_pixel_buffer_dma_0_avalon_pixel_source_valid         (video_pixel_buffer_dma_0_avalon_pixel_source_valid)
    );

  dual_clock_fifo_avalon_dc_buffer_source_arbitrator the_dual_clock_fifo_avalon_dc_buffer_source
    (
      .clk                                                   (clocks_0_VGA_CLK_out),
      .dual_clock_fifo_avalon_dc_buffer_source_data          (dual_clock_fifo_avalon_dc_buffer_source_data),
      .dual_clock_fifo_avalon_dc_buffer_source_endofpacket   (dual_clock_fifo_avalon_dc_buffer_source_endofpacket),
      .dual_clock_fifo_avalon_dc_buffer_source_ready         (dual_clock_fifo_avalon_dc_buffer_source_ready),
      .dual_clock_fifo_avalon_dc_buffer_source_startofpacket (dual_clock_fifo_avalon_dc_buffer_source_startofpacket),
      .dual_clock_fifo_avalon_dc_buffer_source_valid         (dual_clock_fifo_avalon_dc_buffer_source_valid),
      .reset_n                                               (clocks_0_VGA_CLK_out_reset_n),
      .video_vga_controller_0_avalon_vga_sink_ready_from_sa  (video_vga_controller_0_avalon_vga_sink_ready_from_sa)
    );

  dual_clock_fifo the_dual_clock_fifo
    (
      .clk_stream_in            (clocks_0_sys_clk_out),
      .clk_stream_out           (clocks_0_VGA_CLK_out),
      .stream_in_data           (dual_clock_fifo_avalon_dc_buffer_sink_data),
      .stream_in_endofpacket    (dual_clock_fifo_avalon_dc_buffer_sink_endofpacket),
      .stream_in_ready          (dual_clock_fifo_avalon_dc_buffer_sink_ready),
      .stream_in_startofpacket  (dual_clock_fifo_avalon_dc_buffer_sink_startofpacket),
      .stream_in_valid          (dual_clock_fifo_avalon_dc_buffer_sink_valid),
      .stream_out_data          (dual_clock_fifo_avalon_dc_buffer_source_data),
      .stream_out_endofpacket   (dual_clock_fifo_avalon_dc_buffer_source_endofpacket),
      .stream_out_ready         (dual_clock_fifo_avalon_dc_buffer_source_ready),
      .stream_out_startofpacket (dual_clock_fifo_avalon_dc_buffer_source_startofpacket),
      .stream_out_valid         (dual_clock_fifo_avalon_dc_buffer_source_valid)
    );

  onchip_ram_s1_arbitrator the_onchip_ram_s1
    (
      .clk                                                                                  (clocks_0_sys_clk_out),
      .cpu_data_master_address_to_slave                                                     (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                           (cpu_data_master_byteenable),
      .cpu_data_master_granted_onchip_ram_s1                                                (cpu_data_master_granted_onchip_ram_s1),
      .cpu_data_master_latency_counter                                                      (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_onchip_ram_s1                                      (cpu_data_master_qualified_request_onchip_ram_s1),
      .cpu_data_master_read                                                                 (cpu_data_master_read),
      .cpu_data_master_read_data_valid_onchip_ram_s1                                        (cpu_data_master_read_data_valid_onchip_ram_s1),
      .cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register        (cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register),
      .cpu_data_master_requests_onchip_ram_s1                                               (cpu_data_master_requests_onchip_ram_s1),
      .cpu_data_master_write                                                                (cpu_data_master_write),
      .cpu_data_master_writedata                                                            (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                                              (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_onchip_ram_s1                                         (cpu_instruction_master_granted_onchip_ram_s1),
      .cpu_instruction_master_latency_counter                                               (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_onchip_ram_s1                               (cpu_instruction_master_qualified_request_onchip_ram_s1),
      .cpu_instruction_master_read                                                          (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_onchip_ram_s1                                 (cpu_instruction_master_read_data_valid_onchip_ram_s1),
      .cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register (cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register),
      .cpu_instruction_master_requests_onchip_ram_s1                                        (cpu_instruction_master_requests_onchip_ram_s1),
      .d1_onchip_ram_s1_end_xfer                                                            (d1_onchip_ram_s1_end_xfer),
      .onchip_ram_s1_address                                                                (onchip_ram_s1_address),
      .onchip_ram_s1_byteenable                                                             (onchip_ram_s1_byteenable),
      .onchip_ram_s1_chipselect                                                             (onchip_ram_s1_chipselect),
      .onchip_ram_s1_clken                                                                  (onchip_ram_s1_clken),
      .onchip_ram_s1_readdata                                                               (onchip_ram_s1_readdata),
      .onchip_ram_s1_readdata_from_sa                                                       (onchip_ram_s1_readdata_from_sa),
      .onchip_ram_s1_reset                                                                  (onchip_ram_s1_reset),
      .onchip_ram_s1_write                                                                  (onchip_ram_s1_write),
      .onchip_ram_s1_writedata                                                              (onchip_ram_s1_writedata),
      .reset_n                                                                              (clocks_0_sys_clk_out_reset_n)
    );

  onchip_ram the_onchip_ram
    (
      .address    (onchip_ram_s1_address),
      .byteenable (onchip_ram_s1_byteenable),
      .chipselect (onchip_ram_s1_chipselect),
      .clk        (clocks_0_sys_clk_out),
      .clken      (onchip_ram_s1_clken),
      .readdata   (onchip_ram_s1_readdata),
      .reset      (onchip_ram_s1_reset),
      .write      (onchip_ram_s1_write),
      .writedata  (onchip_ram_s1_writedata)
    );

  pixel_buffer_avalon_sram_slave_arbitrator the_pixel_buffer_avalon_sram_slave
    (
      .clk                                                                                                            (clocks_0_sys_clk_out),
      .cpu_data_master_address_to_slave                                                                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                                                     (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave                                                      (cpu_data_master_byteenable_pixel_buffer_avalon_sram_slave),
      .cpu_data_master_dbs_address                                                                                    (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                                                                   (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_pixel_buffer_avalon_sram_slave                                                         (cpu_data_master_granted_pixel_buffer_avalon_sram_slave),
      .cpu_data_master_latency_counter                                                                                (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_pixel_buffer_avalon_sram_slave                                               (cpu_data_master_qualified_request_pixel_buffer_avalon_sram_slave),
      .cpu_data_master_read                                                                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave                                                 (cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave),
      .cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register                                  (cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register),
      .cpu_data_master_requests_pixel_buffer_avalon_sram_slave                                                        (cpu_data_master_requests_pixel_buffer_avalon_sram_slave),
      .cpu_data_master_write                                                                                          (cpu_data_master_write),
      .cpu_instruction_master_address_to_slave                                                                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                                                                             (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave                                                  (cpu_instruction_master_granted_pixel_buffer_avalon_sram_slave),
      .cpu_instruction_master_latency_counter                                                                         (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_pixel_buffer_avalon_sram_slave                                        (cpu_instruction_master_qualified_request_pixel_buffer_avalon_sram_slave),
      .cpu_instruction_master_read                                                                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave                                          (cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave),
      .cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register                           (cpu_instruction_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register),
      .cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave                                                 (cpu_instruction_master_requests_pixel_buffer_avalon_sram_slave),
      .d1_pixel_buffer_avalon_sram_slave_end_xfer                                                                     (d1_pixel_buffer_avalon_sram_slave_end_xfer),
      .pixel_buffer_avalon_sram_slave_address                                                                         (pixel_buffer_avalon_sram_slave_address),
      .pixel_buffer_avalon_sram_slave_byteenable                                                                      (pixel_buffer_avalon_sram_slave_byteenable),
      .pixel_buffer_avalon_sram_slave_read                                                                            (pixel_buffer_avalon_sram_slave_read),
      .pixel_buffer_avalon_sram_slave_readdata                                                                        (pixel_buffer_avalon_sram_slave_readdata),
      .pixel_buffer_avalon_sram_slave_readdata_from_sa                                                                (pixel_buffer_avalon_sram_slave_readdata_from_sa),
      .pixel_buffer_avalon_sram_slave_readdatavalid                                                                   (pixel_buffer_avalon_sram_slave_readdatavalid),
      .pixel_buffer_avalon_sram_slave_reset                                                                           (pixel_buffer_avalon_sram_slave_reset),
      .pixel_buffer_avalon_sram_slave_write                                                                           (pixel_buffer_avalon_sram_slave_write),
      .pixel_buffer_avalon_sram_slave_writedata                                                                       (pixel_buffer_avalon_sram_slave_writedata),
      .reset_n                                                                                                        (clocks_0_sys_clk_out_reset_n),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_address_to_slave                                              (video_pixel_buffer_dma_0_avalon_pixel_dma_master_address_to_slave),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_arbiterlock                                                   (video_pixel_buffer_dma_0_avalon_pixel_dma_master_arbiterlock),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_address                                                   (video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_address),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave                        (video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter                                               (video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_qualified_request_pixel_buffer_avalon_sram_slave              (video_pixel_buffer_dma_0_avalon_pixel_dma_master_qualified_request_pixel_buffer_avalon_sram_slave),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_read                                                          (video_pixel_buffer_dma_0_avalon_pixel_dma_master_read),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave                (video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register (video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave                       (video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave)
    );

  pixel_buffer the_pixel_buffer
    (
      .SRAM_ADDR     (SRAM_ADDR_from_the_pixel_buffer),
      .SRAM_CE_N     (SRAM_CE_N_from_the_pixel_buffer),
      .SRAM_DQ       (SRAM_DQ_to_and_from_the_pixel_buffer),
      .SRAM_LB_N     (SRAM_LB_N_from_the_pixel_buffer),
      .SRAM_OE_N     (SRAM_OE_N_from_the_pixel_buffer),
      .SRAM_UB_N     (SRAM_UB_N_from_the_pixel_buffer),
      .SRAM_WE_N     (SRAM_WE_N_from_the_pixel_buffer),
      .address       (pixel_buffer_avalon_sram_slave_address),
      .byteenable    (pixel_buffer_avalon_sram_slave_byteenable),
      .clk           (clocks_0_sys_clk_out),
      .read          (pixel_buffer_avalon_sram_slave_read),
      .readdata      (pixel_buffer_avalon_sram_slave_readdata),
      .readdatavalid (pixel_buffer_avalon_sram_slave_readdatavalid),
      .reset         (pixel_buffer_avalon_sram_slave_reset),
      .write         (pixel_buffer_avalon_sram_slave_write),
      .writedata     (pixel_buffer_avalon_sram_slave_writedata)
    );

  the_whole_shit_clock_0_in_arbitrator the_the_whole_shit_clock_0_in
    (
      .clk                                                                           (clocks_0_sys_clk_out),
      .cpu_data_master_address_to_slave                                              (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                    (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_the_whole_shit_clock_0_in                          (cpu_data_master_byteenable_the_whole_shit_clock_0_in),
      .cpu_data_master_dbs_address                                                   (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_8                                                   (cpu_data_master_dbs_write_8),
      .cpu_data_master_granted_the_whole_shit_clock_0_in                             (cpu_data_master_granted_the_whole_shit_clock_0_in),
      .cpu_data_master_latency_counter                                               (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_the_whole_shit_clock_0_in                   (cpu_data_master_qualified_request_the_whole_shit_clock_0_in),
      .cpu_data_master_read                                                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register (cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register),
      .cpu_data_master_read_data_valid_the_whole_shit_clock_0_in                     (cpu_data_master_read_data_valid_the_whole_shit_clock_0_in),
      .cpu_data_master_requests_the_whole_shit_clock_0_in                            (cpu_data_master_requests_the_whole_shit_clock_0_in),
      .cpu_data_master_write                                                         (cpu_data_master_write),
      .d1_the_whole_shit_clock_0_in_end_xfer                                         (d1_the_whole_shit_clock_0_in_end_xfer),
      .reset_n                                                                       (clocks_0_sys_clk_out_reset_n),
      .the_whole_shit_clock_0_in_address                                             (the_whole_shit_clock_0_in_address),
      .the_whole_shit_clock_0_in_endofpacket                                         (the_whole_shit_clock_0_in_endofpacket),
      .the_whole_shit_clock_0_in_endofpacket_from_sa                                 (the_whole_shit_clock_0_in_endofpacket_from_sa),
      .the_whole_shit_clock_0_in_nativeaddress                                       (the_whole_shit_clock_0_in_nativeaddress),
      .the_whole_shit_clock_0_in_read                                                (the_whole_shit_clock_0_in_read),
      .the_whole_shit_clock_0_in_readdata                                            (the_whole_shit_clock_0_in_readdata),
      .the_whole_shit_clock_0_in_readdata_from_sa                                    (the_whole_shit_clock_0_in_readdata_from_sa),
      .the_whole_shit_clock_0_in_reset_n                                             (the_whole_shit_clock_0_in_reset_n),
      .the_whole_shit_clock_0_in_waitrequest                                         (the_whole_shit_clock_0_in_waitrequest),
      .the_whole_shit_clock_0_in_waitrequest_from_sa                                 (the_whole_shit_clock_0_in_waitrequest_from_sa),
      .the_whole_shit_clock_0_in_write                                               (the_whole_shit_clock_0_in_write),
      .the_whole_shit_clock_0_in_writedata                                           (the_whole_shit_clock_0_in_writedata)
    );

  the_whole_shit_clock_0_out_arbitrator the_the_whole_shit_clock_0_out
    (
      .clk                                                                       (clk_0),
      .clocks_0_avalon_clocks_slave_readdata_from_sa                             (clocks_0_avalon_clocks_slave_readdata_from_sa),
      .d1_clocks_0_avalon_clocks_slave_end_xfer                                  (d1_clocks_0_avalon_clocks_slave_end_xfer),
      .reset_n                                                                   (clk_0_reset_n),
      .the_whole_shit_clock_0_out_address                                        (the_whole_shit_clock_0_out_address),
      .the_whole_shit_clock_0_out_address_to_slave                               (the_whole_shit_clock_0_out_address_to_slave),
      .the_whole_shit_clock_0_out_granted_clocks_0_avalon_clocks_slave           (the_whole_shit_clock_0_out_granted_clocks_0_avalon_clocks_slave),
      .the_whole_shit_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave (the_whole_shit_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave),
      .the_whole_shit_clock_0_out_read                                           (the_whole_shit_clock_0_out_read),
      .the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave   (the_whole_shit_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave),
      .the_whole_shit_clock_0_out_readdata                                       (the_whole_shit_clock_0_out_readdata),
      .the_whole_shit_clock_0_out_requests_clocks_0_avalon_clocks_slave          (the_whole_shit_clock_0_out_requests_clocks_0_avalon_clocks_slave),
      .the_whole_shit_clock_0_out_reset_n                                        (the_whole_shit_clock_0_out_reset_n),
      .the_whole_shit_clock_0_out_waitrequest                                    (the_whole_shit_clock_0_out_waitrequest),
      .the_whole_shit_clock_0_out_write                                          (the_whole_shit_clock_0_out_write),
      .the_whole_shit_clock_0_out_writedata                                      (the_whole_shit_clock_0_out_writedata)
    );

  the_whole_shit_clock_0 the_the_whole_shit_clock_0
    (
      .master_address       (the_whole_shit_clock_0_out_address),
      .master_clk           (clk_0),
      .master_endofpacket   (the_whole_shit_clock_0_out_endofpacket),
      .master_nativeaddress (the_whole_shit_clock_0_out_nativeaddress),
      .master_read          (the_whole_shit_clock_0_out_read),
      .master_readdata      (the_whole_shit_clock_0_out_readdata),
      .master_reset_n       (the_whole_shit_clock_0_out_reset_n),
      .master_waitrequest   (the_whole_shit_clock_0_out_waitrequest),
      .master_write         (the_whole_shit_clock_0_out_write),
      .master_writedata     (the_whole_shit_clock_0_out_writedata),
      .slave_address        (the_whole_shit_clock_0_in_address),
      .slave_clk            (clocks_0_sys_clk_out),
      .slave_endofpacket    (the_whole_shit_clock_0_in_endofpacket),
      .slave_nativeaddress  (the_whole_shit_clock_0_in_nativeaddress),
      .slave_read           (the_whole_shit_clock_0_in_read),
      .slave_readdata       (the_whole_shit_clock_0_in_readdata),
      .slave_reset_n        (the_whole_shit_clock_0_in_reset_n),
      .slave_waitrequest    (the_whole_shit_clock_0_in_waitrequest),
      .slave_write          (the_whole_shit_clock_0_in_write),
      .slave_writedata      (the_whole_shit_clock_0_in_writedata)
    );

  video_pixel_buffer_dma_0_avalon_control_slave_arbitrator the_video_pixel_buffer_dma_0_avalon_control_slave
    (
      .clk                                                                             (clocks_0_sys_clk_out),
      .cpu_data_master_address_to_slave                                                (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                      (cpu_data_master_byteenable),
      .cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave           (cpu_data_master_granted_video_pixel_buffer_dma_0_avalon_control_slave),
      .cpu_data_master_latency_counter                                                 (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_video_pixel_buffer_dma_0_avalon_control_slave (cpu_data_master_qualified_request_video_pixel_buffer_dma_0_avalon_control_slave),
      .cpu_data_master_read                                                            (cpu_data_master_read),
      .cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register   (cpu_data_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register),
      .cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave   (cpu_data_master_read_data_valid_video_pixel_buffer_dma_0_avalon_control_slave),
      .cpu_data_master_requests_video_pixel_buffer_dma_0_avalon_control_slave          (cpu_data_master_requests_video_pixel_buffer_dma_0_avalon_control_slave),
      .cpu_data_master_write                                                           (cpu_data_master_write),
      .cpu_data_master_writedata                                                       (cpu_data_master_writedata),
      .d1_video_pixel_buffer_dma_0_avalon_control_slave_end_xfer                       (d1_video_pixel_buffer_dma_0_avalon_control_slave_end_xfer),
      .reset_n                                                                         (clocks_0_sys_clk_out_reset_n),
      .video_pixel_buffer_dma_0_avalon_control_slave_address                           (video_pixel_buffer_dma_0_avalon_control_slave_address),
      .video_pixel_buffer_dma_0_avalon_control_slave_byteenable                        (video_pixel_buffer_dma_0_avalon_control_slave_byteenable),
      .video_pixel_buffer_dma_0_avalon_control_slave_read                              (video_pixel_buffer_dma_0_avalon_control_slave_read),
      .video_pixel_buffer_dma_0_avalon_control_slave_readdata                          (video_pixel_buffer_dma_0_avalon_control_slave_readdata),
      .video_pixel_buffer_dma_0_avalon_control_slave_readdata_from_sa                  (video_pixel_buffer_dma_0_avalon_control_slave_readdata_from_sa),
      .video_pixel_buffer_dma_0_avalon_control_slave_write                             (video_pixel_buffer_dma_0_avalon_control_slave_write),
      .video_pixel_buffer_dma_0_avalon_control_slave_writedata                         (video_pixel_buffer_dma_0_avalon_control_slave_writedata)
    );

  video_pixel_buffer_dma_0_avalon_pixel_dma_master_arbitrator the_video_pixel_buffer_dma_0_avalon_pixel_dma_master
    (
      .clk                                                                                                            (clocks_0_sys_clk_out),
      .d1_pixel_buffer_avalon_sram_slave_end_xfer                                                                     (d1_pixel_buffer_avalon_sram_slave_end_xfer),
      .pixel_buffer_avalon_sram_slave_readdata_from_sa                                                                (pixel_buffer_avalon_sram_slave_readdata_from_sa),
      .reset_n                                                                                                        (clocks_0_sys_clk_out_reset_n),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_address                                                       (video_pixel_buffer_dma_0_avalon_pixel_dma_master_address),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_address_to_slave                                              (video_pixel_buffer_dma_0_avalon_pixel_dma_master_address_to_slave),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_address                                                   (video_pixel_buffer_dma_0_avalon_pixel_dma_master_dbs_address),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave                        (video_pixel_buffer_dma_0_avalon_pixel_dma_master_granted_pixel_buffer_avalon_sram_slave),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter                                               (video_pixel_buffer_dma_0_avalon_pixel_dma_master_latency_counter),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_qualified_request_pixel_buffer_avalon_sram_slave              (video_pixel_buffer_dma_0_avalon_pixel_dma_master_qualified_request_pixel_buffer_avalon_sram_slave),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_read                                                          (video_pixel_buffer_dma_0_avalon_pixel_dma_master_read),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave                (video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register (video_pixel_buffer_dma_0_avalon_pixel_dma_master_read_data_valid_pixel_buffer_avalon_sram_slave_shift_register),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdata                                                      (video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdata),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdatavalid                                                 (video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdatavalid),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave                       (video_pixel_buffer_dma_0_avalon_pixel_dma_master_requests_pixel_buffer_avalon_sram_slave),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_reset                                                         (video_pixel_buffer_dma_0_avalon_pixel_dma_master_reset),
      .video_pixel_buffer_dma_0_avalon_pixel_dma_master_waitrequest                                                   (video_pixel_buffer_dma_0_avalon_pixel_dma_master_waitrequest)
    );

  video_pixel_buffer_dma_0_avalon_pixel_source_arbitrator the_video_pixel_buffer_dma_0_avalon_pixel_source
    (
      .clk                                                        (clocks_0_sys_clk_out),
      .dual_clock_fifo_avalon_dc_buffer_sink_ready_from_sa        (dual_clock_fifo_avalon_dc_buffer_sink_ready_from_sa),
      .reset_n                                                    (clocks_0_sys_clk_out_reset_n),
      .video_pixel_buffer_dma_0_avalon_pixel_source_data          (video_pixel_buffer_dma_0_avalon_pixel_source_data),
      .video_pixel_buffer_dma_0_avalon_pixel_source_endofpacket   (video_pixel_buffer_dma_0_avalon_pixel_source_endofpacket),
      .video_pixel_buffer_dma_0_avalon_pixel_source_ready         (video_pixel_buffer_dma_0_avalon_pixel_source_ready),
      .video_pixel_buffer_dma_0_avalon_pixel_source_startofpacket (video_pixel_buffer_dma_0_avalon_pixel_source_startofpacket),
      .video_pixel_buffer_dma_0_avalon_pixel_source_valid         (video_pixel_buffer_dma_0_avalon_pixel_source_valid)
    );

  video_pixel_buffer_dma_0 the_video_pixel_buffer_dma_0
    (
      .clk                  (clocks_0_sys_clk_out),
      .master_address       (video_pixel_buffer_dma_0_avalon_pixel_dma_master_address),
      .master_arbiterlock   (video_pixel_buffer_dma_0_avalon_pixel_dma_master_arbiterlock),
      .master_read          (video_pixel_buffer_dma_0_avalon_pixel_dma_master_read),
      .master_readdata      (video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdata),
      .master_readdatavalid (video_pixel_buffer_dma_0_avalon_pixel_dma_master_readdatavalid),
      .master_waitrequest   (video_pixel_buffer_dma_0_avalon_pixel_dma_master_waitrequest),
      .reset                (video_pixel_buffer_dma_0_avalon_pixel_dma_master_reset),
      .slave_address        (video_pixel_buffer_dma_0_avalon_control_slave_address),
      .slave_byteenable     (video_pixel_buffer_dma_0_avalon_control_slave_byteenable),
      .slave_read           (video_pixel_buffer_dma_0_avalon_control_slave_read),
      .slave_readdata       (video_pixel_buffer_dma_0_avalon_control_slave_readdata),
      .slave_write          (video_pixel_buffer_dma_0_avalon_control_slave_write),
      .slave_writedata      (video_pixel_buffer_dma_0_avalon_control_slave_writedata),
      .stream_data          (video_pixel_buffer_dma_0_avalon_pixel_source_data),
      .stream_endofpacket   (video_pixel_buffer_dma_0_avalon_pixel_source_endofpacket),
      .stream_ready         (video_pixel_buffer_dma_0_avalon_pixel_source_ready),
      .stream_startofpacket (video_pixel_buffer_dma_0_avalon_pixel_source_startofpacket),
      .stream_valid         (video_pixel_buffer_dma_0_avalon_pixel_source_valid)
    );

  video_vga_controller_0_avalon_vga_sink_arbitrator the_video_vga_controller_0_avalon_vga_sink
    (
      .clk                                                   (clocks_0_VGA_CLK_out),
      .dual_clock_fifo_avalon_dc_buffer_source_data          (dual_clock_fifo_avalon_dc_buffer_source_data),
      .dual_clock_fifo_avalon_dc_buffer_source_endofpacket   (dual_clock_fifo_avalon_dc_buffer_source_endofpacket),
      .dual_clock_fifo_avalon_dc_buffer_source_startofpacket (dual_clock_fifo_avalon_dc_buffer_source_startofpacket),
      .dual_clock_fifo_avalon_dc_buffer_source_valid         (dual_clock_fifo_avalon_dc_buffer_source_valid),
      .reset_n                                               (clocks_0_VGA_CLK_out_reset_n),
      .video_vga_controller_0_avalon_vga_sink_data           (video_vga_controller_0_avalon_vga_sink_data),
      .video_vga_controller_0_avalon_vga_sink_endofpacket    (video_vga_controller_0_avalon_vga_sink_endofpacket),
      .video_vga_controller_0_avalon_vga_sink_ready          (video_vga_controller_0_avalon_vga_sink_ready),
      .video_vga_controller_0_avalon_vga_sink_ready_from_sa  (video_vga_controller_0_avalon_vga_sink_ready_from_sa),
      .video_vga_controller_0_avalon_vga_sink_reset          (video_vga_controller_0_avalon_vga_sink_reset),
      .video_vga_controller_0_avalon_vga_sink_startofpacket  (video_vga_controller_0_avalon_vga_sink_startofpacket),
      .video_vga_controller_0_avalon_vga_sink_valid          (video_vga_controller_0_avalon_vga_sink_valid)
    );

  video_vga_controller_0 the_video_vga_controller_0
    (
      .VGA_B         (VGA_B_from_the_video_vga_controller_0),
      .VGA_BLANK     (VGA_BLANK_from_the_video_vga_controller_0),
      .VGA_CLK       (VGA_CLK_from_the_video_vga_controller_0),
      .VGA_G         (VGA_G_from_the_video_vga_controller_0),
      .VGA_HS        (VGA_HS_from_the_video_vga_controller_0),
      .VGA_R         (VGA_R_from_the_video_vga_controller_0),
      .VGA_SYNC      (VGA_SYNC_from_the_video_vga_controller_0),
      .VGA_VS        (VGA_VS_from_the_video_vga_controller_0),
      .clk           (clocks_0_VGA_CLK_out),
      .data          (video_vga_controller_0_avalon_vga_sink_data),
      .endofpacket   (video_vga_controller_0_avalon_vga_sink_endofpacket),
      .ready         (video_vga_controller_0_avalon_vga_sink_ready),
      .reset         (video_vga_controller_0_avalon_vga_sink_reset),
      .startofpacket (video_vga_controller_0_avalon_vga_sink_startofpacket),
      .valid         (video_vga_controller_0_avalon_vga_sink_valid)
    );

  //reset is asserted asynchronously and deasserted synchronously
  the_whole_shit_reset_clk_0_domain_synch_module the_whole_shit_reset_clk_0_domain_synch
    (
      .clk      (clk_0),
      .data_in  (1'b1),
      .data_out (clk_0_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    0 |
    cpu_jtag_debug_module_resetrequest_from_sa |
    cpu_jtag_debug_module_resetrequest_from_sa |
    0);

  //reset is asserted asynchronously and deasserted synchronously
  the_whole_shit_reset_clocks_0_sys_clk_out_domain_synch_module the_whole_shit_reset_clocks_0_sys_clk_out_domain_synch
    (
      .clk      (clocks_0_sys_clk_out),
      .data_in  (1'b1),
      .data_out (clocks_0_sys_clk_out_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset is asserted asynchronously and deasserted synchronously
  the_whole_shit_reset_clocks_0_VGA_CLK_out_domain_synch_module the_whole_shit_reset_clocks_0_VGA_CLK_out_domain_synch
    (
      .clk      (clocks_0_VGA_CLK_out),
      .data_in  (1'b1),
      .data_out (clocks_0_VGA_CLK_out_reset_n),
      .reset_n  (reset_n_sources)
    );

  //cpu_data_master_irq of type irq does not connect to anything so wire it to default (0)
  assign cpu_data_master_irq = 0;

  //the_whole_shit_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign the_whole_shit_clock_0_out_endofpacket = 0;


endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "c:/altera/11.0/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/11.0/quartus/eda/sim_lib/220model.v"
`include "c:/altera/11.0/quartus/eda/sim_lib/sgate.v"
`include "video_vga_controller_0.v"
`include "clocks_0.v"
`include "dual_clock_fifo.v"
`include "pixel_buffer.v"
`include "video_pixel_buffer_dma_0.v"
`include "cpu_test_bench.v"
`include "cpu_mult_cell.v"
`include "cpu_oci_test_bench.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "the_whole_shit_clock_0.v"
`include "onchip_ram.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire    [ 19: 0] SRAM_ADDR_from_the_pixel_buffer;
  wire             SRAM_CE_N_from_the_pixel_buffer;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_pixel_buffer;
  wire             SRAM_LB_N_from_the_pixel_buffer;
  wire             SRAM_OE_N_from_the_pixel_buffer;
  wire             SRAM_UB_N_from_the_pixel_buffer;
  wire             SRAM_WE_N_from_the_pixel_buffer;
  wire             VGA_BLANK_from_the_video_vga_controller_0;
  wire    [  7: 0] VGA_B_from_the_video_vga_controller_0;
  wire             VGA_CLK_from_the_video_vga_controller_0;
  wire    [  7: 0] VGA_G_from_the_video_vga_controller_0;
  wire             VGA_HS_from_the_video_vga_controller_0;
  wire    [  7: 0] VGA_R_from_the_video_vga_controller_0;
  wire             VGA_SYNC_from_the_video_vga_controller_0;
  wire             VGA_VS_from_the_video_vga_controller_0;
  wire             clk;
  reg              clk_0;
  wire             clocks_0_VGA_CLK_out;
  wire             clocks_0_sys_clk_out;
  wire    [ 31: 0] cpu_data_master_irq;
  reg              reset_n;
  wire             the_whole_shit_clock_0_in_endofpacket_from_sa;
  wire             the_whole_shit_clock_0_out_endofpacket;
  wire             the_whole_shit_clock_0_out_nativeaddress;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  the_whole_shit DUT
    (
      .SRAM_ADDR_from_the_pixel_buffer           (SRAM_ADDR_from_the_pixel_buffer),
      .SRAM_CE_N_from_the_pixel_buffer           (SRAM_CE_N_from_the_pixel_buffer),
      .SRAM_DQ_to_and_from_the_pixel_buffer      (SRAM_DQ_to_and_from_the_pixel_buffer),
      .SRAM_LB_N_from_the_pixel_buffer           (SRAM_LB_N_from_the_pixel_buffer),
      .SRAM_OE_N_from_the_pixel_buffer           (SRAM_OE_N_from_the_pixel_buffer),
      .SRAM_UB_N_from_the_pixel_buffer           (SRAM_UB_N_from_the_pixel_buffer),
      .SRAM_WE_N_from_the_pixel_buffer           (SRAM_WE_N_from_the_pixel_buffer),
      .VGA_BLANK_from_the_video_vga_controller_0 (VGA_BLANK_from_the_video_vga_controller_0),
      .VGA_B_from_the_video_vga_controller_0     (VGA_B_from_the_video_vga_controller_0),
      .VGA_CLK_from_the_video_vga_controller_0   (VGA_CLK_from_the_video_vga_controller_0),
      .VGA_G_from_the_video_vga_controller_0     (VGA_G_from_the_video_vga_controller_0),
      .VGA_HS_from_the_video_vga_controller_0    (VGA_HS_from_the_video_vga_controller_0),
      .VGA_R_from_the_video_vga_controller_0     (VGA_R_from_the_video_vga_controller_0),
      .VGA_SYNC_from_the_video_vga_controller_0  (VGA_SYNC_from_the_video_vga_controller_0),
      .VGA_VS_from_the_video_vga_controller_0    (VGA_VS_from_the_video_vga_controller_0),
      .clk_0                                     (clk_0),
      .clocks_0_VGA_CLK_out                      (clocks_0_VGA_CLK_out),
      .clocks_0_sys_clk_out                      (clocks_0_sys_clk_out),
      .reset_n                                   (reset_n)
    );

  initial
    clk_0 = 1'b0;
  always
    #10 clk_0 <= ~clk_0;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on