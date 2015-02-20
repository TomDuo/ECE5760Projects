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

module CPU_jtag_debug_module_arbitrator (
                                          // inputs:
                                           CPU_data_master_address_to_slave,
                                           CPU_data_master_byteenable,
                                           CPU_data_master_debugaccess,
                                           CPU_data_master_read,
                                           CPU_data_master_waitrequest,
                                           CPU_data_master_write,
                                           CPU_data_master_writedata,
                                           CPU_instruction_master_address_to_slave,
                                           CPU_instruction_master_read,
                                           CPU_jtag_debug_module_readdata,
                                           CPU_jtag_debug_module_resetrequest,
                                           clk,
                                           reset_n,

                                          // outputs:
                                           CPU_data_master_granted_CPU_jtag_debug_module,
                                           CPU_data_master_qualified_request_CPU_jtag_debug_module,
                                           CPU_data_master_read_data_valid_CPU_jtag_debug_module,
                                           CPU_data_master_requests_CPU_jtag_debug_module,
                                           CPU_instruction_master_granted_CPU_jtag_debug_module,
                                           CPU_instruction_master_qualified_request_CPU_jtag_debug_module,
                                           CPU_instruction_master_read_data_valid_CPU_jtag_debug_module,
                                           CPU_instruction_master_requests_CPU_jtag_debug_module,
                                           CPU_jtag_debug_module_address,
                                           CPU_jtag_debug_module_begintransfer,
                                           CPU_jtag_debug_module_byteenable,
                                           CPU_jtag_debug_module_chipselect,
                                           CPU_jtag_debug_module_debugaccess,
                                           CPU_jtag_debug_module_readdata_from_sa,
                                           CPU_jtag_debug_module_reset_n,
                                           CPU_jtag_debug_module_resetrequest_from_sa,
                                           CPU_jtag_debug_module_write,
                                           CPU_jtag_debug_module_writedata,
                                           d1_CPU_jtag_debug_module_end_xfer
                                        )
;

  output           CPU_data_master_granted_CPU_jtag_debug_module;
  output           CPU_data_master_qualified_request_CPU_jtag_debug_module;
  output           CPU_data_master_read_data_valid_CPU_jtag_debug_module;
  output           CPU_data_master_requests_CPU_jtag_debug_module;
  output           CPU_instruction_master_granted_CPU_jtag_debug_module;
  output           CPU_instruction_master_qualified_request_CPU_jtag_debug_module;
  output           CPU_instruction_master_read_data_valid_CPU_jtag_debug_module;
  output           CPU_instruction_master_requests_CPU_jtag_debug_module;
  output  [  8: 0] CPU_jtag_debug_module_address;
  output           CPU_jtag_debug_module_begintransfer;
  output  [  3: 0] CPU_jtag_debug_module_byteenable;
  output           CPU_jtag_debug_module_chipselect;
  output           CPU_jtag_debug_module_debugaccess;
  output  [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  output           CPU_jtag_debug_module_reset_n;
  output           CPU_jtag_debug_module_resetrequest_from_sa;
  output           CPU_jtag_debug_module_write;
  output  [ 31: 0] CPU_jtag_debug_module_writedata;
  output           d1_CPU_jtag_debug_module_end_xfer;
  input   [ 21: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_debugaccess;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 21: 0] CPU_instruction_master_address_to_slave;
  input            CPU_instruction_master_read;
  input   [ 31: 0] CPU_jtag_debug_module_readdata;
  input            CPU_jtag_debug_module_resetrequest;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_CPU_jtag_debug_module;
  wire             CPU_data_master_qualified_request_CPU_jtag_debug_module;
  wire             CPU_data_master_read_data_valid_CPU_jtag_debug_module;
  wire             CPU_data_master_requests_CPU_jtag_debug_module;
  wire             CPU_data_master_saved_grant_CPU_jtag_debug_module;
  wire             CPU_instruction_master_arbiterlock;
  wire             CPU_instruction_master_arbiterlock2;
  wire             CPU_instruction_master_continuerequest;
  wire             CPU_instruction_master_granted_CPU_jtag_debug_module;
  wire             CPU_instruction_master_qualified_request_CPU_jtag_debug_module;
  wire             CPU_instruction_master_read_data_valid_CPU_jtag_debug_module;
  wire             CPU_instruction_master_requests_CPU_jtag_debug_module;
  wire             CPU_instruction_master_saved_grant_CPU_jtag_debug_module;
  wire    [  8: 0] CPU_jtag_debug_module_address;
  wire             CPU_jtag_debug_module_allgrants;
  wire             CPU_jtag_debug_module_allow_new_arb_cycle;
  wire             CPU_jtag_debug_module_any_bursting_master_saved_grant;
  wire             CPU_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] CPU_jtag_debug_module_arb_addend;
  wire             CPU_jtag_debug_module_arb_counter_enable;
  reg     [  2: 0] CPU_jtag_debug_module_arb_share_counter;
  wire    [  2: 0] CPU_jtag_debug_module_arb_share_counter_next_value;
  wire    [  2: 0] CPU_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] CPU_jtag_debug_module_arb_winner;
  wire             CPU_jtag_debug_module_arbitration_holdoff_internal;
  wire             CPU_jtag_debug_module_beginbursttransfer_internal;
  wire             CPU_jtag_debug_module_begins_xfer;
  wire             CPU_jtag_debug_module_begintransfer;
  wire    [  3: 0] CPU_jtag_debug_module_byteenable;
  wire             CPU_jtag_debug_module_chipselect;
  wire    [  3: 0] CPU_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] CPU_jtag_debug_module_chosen_master_rot_left;
  wire             CPU_jtag_debug_module_debugaccess;
  wire             CPU_jtag_debug_module_end_xfer;
  wire             CPU_jtag_debug_module_firsttransfer;
  wire    [  1: 0] CPU_jtag_debug_module_grant_vector;
  wire             CPU_jtag_debug_module_in_a_read_cycle;
  wire             CPU_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] CPU_jtag_debug_module_master_qreq_vector;
  wire             CPU_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  reg              CPU_jtag_debug_module_reg_firsttransfer;
  wire             CPU_jtag_debug_module_reset_n;
  wire             CPU_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] CPU_jtag_debug_module_saved_chosen_master_vector;
  reg              CPU_jtag_debug_module_slavearbiterlockenable;
  wire             CPU_jtag_debug_module_slavearbiterlockenable2;
  wire             CPU_jtag_debug_module_unreg_firsttransfer;
  wire             CPU_jtag_debug_module_waits_for_read;
  wire             CPU_jtag_debug_module_waits_for_write;
  wire             CPU_jtag_debug_module_write;
  wire    [ 31: 0] CPU_jtag_debug_module_writedata;
  reg              d1_CPU_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_CPU_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module;
  reg              last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module;
  wire    [ 21: 0] shifted_address_to_CPU_jtag_debug_module_from_CPU_data_master;
  wire    [ 21: 0] shifted_address_to_CPU_jtag_debug_module_from_CPU_instruction_master;
  wire             wait_for_CPU_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~CPU_jtag_debug_module_end_xfer;
    end


  assign CPU_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_CPU_jtag_debug_module | CPU_instruction_master_qualified_request_CPU_jtag_debug_module));
  //assign CPU_jtag_debug_module_readdata_from_sa = CPU_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign CPU_jtag_debug_module_readdata_from_sa = CPU_jtag_debug_module_readdata;

  assign CPU_data_master_requests_CPU_jtag_debug_module = ({CPU_data_master_address_to_slave[21 : 11] , 11'b0} == 22'h300800) & (CPU_data_master_read | CPU_data_master_write);
  //CPU_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign CPU_jtag_debug_module_arb_share_set_values = 1;

  //CPU_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign CPU_jtag_debug_module_non_bursting_master_requests = CPU_data_master_requests_CPU_jtag_debug_module |
    CPU_instruction_master_requests_CPU_jtag_debug_module |
    CPU_data_master_requests_CPU_jtag_debug_module |
    CPU_instruction_master_requests_CPU_jtag_debug_module;

  //CPU_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign CPU_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //CPU_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign CPU_jtag_debug_module_arb_share_counter_next_value = CPU_jtag_debug_module_firsttransfer ? (CPU_jtag_debug_module_arb_share_set_values - 1) : |CPU_jtag_debug_module_arb_share_counter ? (CPU_jtag_debug_module_arb_share_counter - 1) : 0;

  //CPU_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign CPU_jtag_debug_module_allgrants = (|CPU_jtag_debug_module_grant_vector) |
    (|CPU_jtag_debug_module_grant_vector) |
    (|CPU_jtag_debug_module_grant_vector) |
    (|CPU_jtag_debug_module_grant_vector);

  //CPU_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign CPU_jtag_debug_module_end_xfer = ~(CPU_jtag_debug_module_waits_for_read | CPU_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_CPU_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_CPU_jtag_debug_module = CPU_jtag_debug_module_end_xfer & (~CPU_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //CPU_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign CPU_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_CPU_jtag_debug_module & CPU_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_CPU_jtag_debug_module & ~CPU_jtag_debug_module_non_bursting_master_requests);

  //CPU_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_arb_share_counter <= 0;
      else if (CPU_jtag_debug_module_arb_counter_enable)
          CPU_jtag_debug_module_arb_share_counter <= CPU_jtag_debug_module_arb_share_counter_next_value;
    end


  //CPU_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|CPU_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_CPU_jtag_debug_module) | (end_xfer_arb_share_counter_term_CPU_jtag_debug_module & ~CPU_jtag_debug_module_non_bursting_master_requests))
          CPU_jtag_debug_module_slavearbiterlockenable <= |CPU_jtag_debug_module_arb_share_counter_next_value;
    end


  //CPU/data_master CPU/jtag_debug_module arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = CPU_jtag_debug_module_slavearbiterlockenable & CPU_data_master_continuerequest;

  //CPU_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign CPU_jtag_debug_module_slavearbiterlockenable2 = |CPU_jtag_debug_module_arb_share_counter_next_value;

  //CPU/data_master CPU/jtag_debug_module arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = CPU_jtag_debug_module_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //CPU/instruction_master CPU/jtag_debug_module arbiterlock, which is an e_assign
  assign CPU_instruction_master_arbiterlock = CPU_jtag_debug_module_slavearbiterlockenable & CPU_instruction_master_continuerequest;

  //CPU/instruction_master CPU/jtag_debug_module arbiterlock2, which is an e_assign
  assign CPU_instruction_master_arbiterlock2 = CPU_jtag_debug_module_slavearbiterlockenable2 & CPU_instruction_master_continuerequest;

  //CPU/instruction_master granted CPU/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module <= 0;
      else 
        last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module <= CPU_instruction_master_saved_grant_CPU_jtag_debug_module ? 1 : (CPU_jtag_debug_module_arbitration_holdoff_internal | ~CPU_instruction_master_requests_CPU_jtag_debug_module) ? 0 : last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module;
    end


  //CPU_instruction_master_continuerequest continued request, which is an e_mux
  assign CPU_instruction_master_continuerequest = last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module & CPU_instruction_master_requests_CPU_jtag_debug_module;

  //CPU_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign CPU_jtag_debug_module_any_continuerequest = CPU_instruction_master_continuerequest |
    CPU_data_master_continuerequest;

  assign CPU_data_master_qualified_request_CPU_jtag_debug_module = CPU_data_master_requests_CPU_jtag_debug_module & ~(((~CPU_data_master_waitrequest) & CPU_data_master_write) | CPU_instruction_master_arbiterlock);
  //CPU_jtag_debug_module_writedata mux, which is an e_mux
  assign CPU_jtag_debug_module_writedata = CPU_data_master_writedata;

  assign CPU_instruction_master_requests_CPU_jtag_debug_module = (({CPU_instruction_master_address_to_slave[21 : 11] , 11'b0} == 22'h300800) & (CPU_instruction_master_read)) & CPU_instruction_master_read;
  //CPU/data_master granted CPU/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module <= 0;
      else 
        last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module <= CPU_data_master_saved_grant_CPU_jtag_debug_module ? 1 : (CPU_jtag_debug_module_arbitration_holdoff_internal | ~CPU_data_master_requests_CPU_jtag_debug_module) ? 0 : last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module;
    end


  //CPU_data_master_continuerequest continued request, which is an e_mux
  assign CPU_data_master_continuerequest = last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module & CPU_data_master_requests_CPU_jtag_debug_module;

  assign CPU_instruction_master_qualified_request_CPU_jtag_debug_module = CPU_instruction_master_requests_CPU_jtag_debug_module & ~(CPU_data_master_arbiterlock);
  //allow new arb cycle for CPU/jtag_debug_module, which is an e_assign
  assign CPU_jtag_debug_module_allow_new_arb_cycle = ~CPU_data_master_arbiterlock & ~CPU_instruction_master_arbiterlock;

  //CPU/instruction_master assignment into master qualified-requests vector for CPU/jtag_debug_module, which is an e_assign
  assign CPU_jtag_debug_module_master_qreq_vector[0] = CPU_instruction_master_qualified_request_CPU_jtag_debug_module;

  //CPU/instruction_master grant CPU/jtag_debug_module, which is an e_assign
  assign CPU_instruction_master_granted_CPU_jtag_debug_module = CPU_jtag_debug_module_grant_vector[0];

  //CPU/instruction_master saved-grant CPU/jtag_debug_module, which is an e_assign
  assign CPU_instruction_master_saved_grant_CPU_jtag_debug_module = CPU_jtag_debug_module_arb_winner[0] && CPU_instruction_master_requests_CPU_jtag_debug_module;

  //CPU/data_master assignment into master qualified-requests vector for CPU/jtag_debug_module, which is an e_assign
  assign CPU_jtag_debug_module_master_qreq_vector[1] = CPU_data_master_qualified_request_CPU_jtag_debug_module;

  //CPU/data_master grant CPU/jtag_debug_module, which is an e_assign
  assign CPU_data_master_granted_CPU_jtag_debug_module = CPU_jtag_debug_module_grant_vector[1];

  //CPU/data_master saved-grant CPU/jtag_debug_module, which is an e_assign
  assign CPU_data_master_saved_grant_CPU_jtag_debug_module = CPU_jtag_debug_module_arb_winner[1] && CPU_data_master_requests_CPU_jtag_debug_module;

  //CPU/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign CPU_jtag_debug_module_chosen_master_double_vector = {CPU_jtag_debug_module_master_qreq_vector, CPU_jtag_debug_module_master_qreq_vector} & ({~CPU_jtag_debug_module_master_qreq_vector, ~CPU_jtag_debug_module_master_qreq_vector} + CPU_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign CPU_jtag_debug_module_arb_winner = (CPU_jtag_debug_module_allow_new_arb_cycle & | CPU_jtag_debug_module_grant_vector) ? CPU_jtag_debug_module_grant_vector : CPU_jtag_debug_module_saved_chosen_master_vector;

  //saved CPU_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (CPU_jtag_debug_module_allow_new_arb_cycle)
          CPU_jtag_debug_module_saved_chosen_master_vector <= |CPU_jtag_debug_module_grant_vector ? CPU_jtag_debug_module_grant_vector : CPU_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign CPU_jtag_debug_module_grant_vector = {(CPU_jtag_debug_module_chosen_master_double_vector[1] | CPU_jtag_debug_module_chosen_master_double_vector[3]),
    (CPU_jtag_debug_module_chosen_master_double_vector[0] | CPU_jtag_debug_module_chosen_master_double_vector[2])};

  //CPU/jtag_debug_module chosen master rotated left, which is an e_assign
  assign CPU_jtag_debug_module_chosen_master_rot_left = (CPU_jtag_debug_module_arb_winner << 1) ? (CPU_jtag_debug_module_arb_winner << 1) : 1;

  //CPU/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_arb_addend <= 1;
      else if (|CPU_jtag_debug_module_grant_vector)
          CPU_jtag_debug_module_arb_addend <= CPU_jtag_debug_module_end_xfer? CPU_jtag_debug_module_chosen_master_rot_left : CPU_jtag_debug_module_grant_vector;
    end


  assign CPU_jtag_debug_module_begintransfer = CPU_jtag_debug_module_begins_xfer;
  //CPU_jtag_debug_module_reset_n assignment, which is an e_assign
  assign CPU_jtag_debug_module_reset_n = reset_n;

  //assign CPU_jtag_debug_module_resetrequest_from_sa = CPU_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign CPU_jtag_debug_module_resetrequest_from_sa = CPU_jtag_debug_module_resetrequest;

  assign CPU_jtag_debug_module_chipselect = CPU_data_master_granted_CPU_jtag_debug_module | CPU_instruction_master_granted_CPU_jtag_debug_module;
  //CPU_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign CPU_jtag_debug_module_firsttransfer = CPU_jtag_debug_module_begins_xfer ? CPU_jtag_debug_module_unreg_firsttransfer : CPU_jtag_debug_module_reg_firsttransfer;

  //CPU_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign CPU_jtag_debug_module_unreg_firsttransfer = ~(CPU_jtag_debug_module_slavearbiterlockenable & CPU_jtag_debug_module_any_continuerequest);

  //CPU_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (CPU_jtag_debug_module_begins_xfer)
          CPU_jtag_debug_module_reg_firsttransfer <= CPU_jtag_debug_module_unreg_firsttransfer;
    end


  //CPU_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign CPU_jtag_debug_module_beginbursttransfer_internal = CPU_jtag_debug_module_begins_xfer;

  //CPU_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign CPU_jtag_debug_module_arbitration_holdoff_internal = CPU_jtag_debug_module_begins_xfer & CPU_jtag_debug_module_firsttransfer;

  //CPU_jtag_debug_module_write assignment, which is an e_mux
  assign CPU_jtag_debug_module_write = CPU_data_master_granted_CPU_jtag_debug_module & CPU_data_master_write;

  assign shifted_address_to_CPU_jtag_debug_module_from_CPU_data_master = CPU_data_master_address_to_slave;
  //CPU_jtag_debug_module_address mux, which is an e_mux
  assign CPU_jtag_debug_module_address = (CPU_data_master_granted_CPU_jtag_debug_module)? (shifted_address_to_CPU_jtag_debug_module_from_CPU_data_master >> 2) :
    (shifted_address_to_CPU_jtag_debug_module_from_CPU_instruction_master >> 2);

  assign shifted_address_to_CPU_jtag_debug_module_from_CPU_instruction_master = CPU_instruction_master_address_to_slave;
  //d1_CPU_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_CPU_jtag_debug_module_end_xfer <= 1;
      else 
        d1_CPU_jtag_debug_module_end_xfer <= CPU_jtag_debug_module_end_xfer;
    end


  //CPU_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign CPU_jtag_debug_module_waits_for_read = CPU_jtag_debug_module_in_a_read_cycle & CPU_jtag_debug_module_begins_xfer;

  //CPU_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign CPU_jtag_debug_module_in_a_read_cycle = (CPU_data_master_granted_CPU_jtag_debug_module & CPU_data_master_read) | (CPU_instruction_master_granted_CPU_jtag_debug_module & CPU_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = CPU_jtag_debug_module_in_a_read_cycle;

  //CPU_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign CPU_jtag_debug_module_waits_for_write = CPU_jtag_debug_module_in_a_write_cycle & 0;

  //CPU_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign CPU_jtag_debug_module_in_a_write_cycle = CPU_data_master_granted_CPU_jtag_debug_module & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = CPU_jtag_debug_module_in_a_write_cycle;

  assign wait_for_CPU_jtag_debug_module_counter = 0;
  //CPU_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign CPU_jtag_debug_module_byteenable = (CPU_data_master_granted_CPU_jtag_debug_module)? CPU_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign CPU_jtag_debug_module_debugaccess = (CPU_data_master_granted_CPU_jtag_debug_module)? CPU_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //CPU/jtag_debug_module enable non-zero assertions, which is an e_register
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
      if (CPU_data_master_granted_CPU_jtag_debug_module + CPU_instruction_master_granted_CPU_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_saved_grant_CPU_jtag_debug_module + CPU_instruction_master_saved_grant_CPU_jtag_debug_module > 1)
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

module jtag_uart_0_avalon_jtag_slave_irq_from_sa_clock_crossing_CPU_data_master_module (
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

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
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

module pio_0_s1_irq_from_sa_clock_crossing_CPU_data_master_module (
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

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
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

module CPU_data_master_arbitrator (
                                    // inputs:
                                     CPU_data_master_address,
                                     CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave,
                                     CPU_data_master_byteenable_Video_System_clock_0_in,
                                     CPU_data_master_granted_CPU_jtag_debug_module,
                                     CPU_data_master_granted_Onchip_Memory_s1,
                                     CPU_data_master_granted_Pixel_Buffer_DMA_avalon_control_slave,
                                     CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave,
                                     CPU_data_master_granted_Video_System_clock_0_in,
                                     CPU_data_master_granted_Video_System_clock_1_in,
                                     CPU_data_master_granted_Video_System_clock_2_in,
                                     CPU_data_master_qualified_request_CPU_jtag_debug_module,
                                     CPU_data_master_qualified_request_Onchip_Memory_s1,
                                     CPU_data_master_qualified_request_Pixel_Buffer_DMA_avalon_control_slave,
                                     CPU_data_master_qualified_request_Pixel_Buffer_avalon_sram_slave,
                                     CPU_data_master_qualified_request_Video_System_clock_0_in,
                                     CPU_data_master_qualified_request_Video_System_clock_1_in,
                                     CPU_data_master_qualified_request_Video_System_clock_2_in,
                                     CPU_data_master_read,
                                     CPU_data_master_read_data_valid_CPU_jtag_debug_module,
                                     CPU_data_master_read_data_valid_Onchip_Memory_s1,
                                     CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave,
                                     CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave,
                                     CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register,
                                     CPU_data_master_read_data_valid_Video_System_clock_0_in,
                                     CPU_data_master_read_data_valid_Video_System_clock_1_in,
                                     CPU_data_master_read_data_valid_Video_System_clock_2_in,
                                     CPU_data_master_requests_CPU_jtag_debug_module,
                                     CPU_data_master_requests_Onchip_Memory_s1,
                                     CPU_data_master_requests_Pixel_Buffer_DMA_avalon_control_slave,
                                     CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave,
                                     CPU_data_master_requests_Video_System_clock_0_in,
                                     CPU_data_master_requests_Video_System_clock_1_in,
                                     CPU_data_master_requests_Video_System_clock_2_in,
                                     CPU_data_master_write,
                                     CPU_data_master_writedata,
                                     CPU_jtag_debug_module_readdata_from_sa,
                                     Onchip_Memory_s1_readdata_from_sa,
                                     Pixel_Buffer_DMA_avalon_control_slave_readdata_from_sa,
                                     Pixel_Buffer_avalon_sram_slave_readdata_from_sa,
                                     Video_System_clock_0_in_readdata_from_sa,
                                     Video_System_clock_0_in_waitrequest_from_sa,
                                     Video_System_clock_1_in_readdata_from_sa,
                                     Video_System_clock_1_in_waitrequest_from_sa,
                                     Video_System_clock_2_in_readdata_from_sa,
                                     Video_System_clock_2_in_waitrequest_from_sa,
                                     clk,
                                     d1_CPU_jtag_debug_module_end_xfer,
                                     d1_Onchip_Memory_s1_end_xfer,
                                     d1_Pixel_Buffer_DMA_avalon_control_slave_end_xfer,
                                     d1_Pixel_Buffer_avalon_sram_slave_end_xfer,
                                     d1_Video_System_clock_0_in_end_xfer,
                                     d1_Video_System_clock_1_in_end_xfer,
                                     d1_Video_System_clock_2_in_end_xfer,
                                     jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                     pio_0_s1_irq_from_sa,
                                     registered_CPU_data_master_read_data_valid_Onchip_Memory_s1,
                                     registered_CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave,
                                     reset_n,
                                     sys_clk,
                                     sys_clk_reset_n,

                                    // outputs:
                                     CPU_data_master_address_to_slave,
                                     CPU_data_master_dbs_address,
                                     CPU_data_master_dbs_write_16,
                                     CPU_data_master_dbs_write_8,
                                     CPU_data_master_irq,
                                     CPU_data_master_no_byte_enables_and_last_term,
                                     CPU_data_master_readdata,
                                     CPU_data_master_waitrequest
                                  )
;

  output  [ 21: 0] CPU_data_master_address_to_slave;
  output  [  1: 0] CPU_data_master_dbs_address;
  output  [ 15: 0] CPU_data_master_dbs_write_16;
  output  [  7: 0] CPU_data_master_dbs_write_8;
  output  [ 31: 0] CPU_data_master_irq;
  output           CPU_data_master_no_byte_enables_and_last_term;
  output  [ 31: 0] CPU_data_master_readdata;
  output           CPU_data_master_waitrequest;
  input   [ 21: 0] CPU_data_master_address;
  input   [  1: 0] CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave;
  input            CPU_data_master_byteenable_Video_System_clock_0_in;
  input            CPU_data_master_granted_CPU_jtag_debug_module;
  input            CPU_data_master_granted_Onchip_Memory_s1;
  input            CPU_data_master_granted_Pixel_Buffer_DMA_avalon_control_slave;
  input            CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave;
  input            CPU_data_master_granted_Video_System_clock_0_in;
  input            CPU_data_master_granted_Video_System_clock_1_in;
  input            CPU_data_master_granted_Video_System_clock_2_in;
  input            CPU_data_master_qualified_request_CPU_jtag_debug_module;
  input            CPU_data_master_qualified_request_Onchip_Memory_s1;
  input            CPU_data_master_qualified_request_Pixel_Buffer_DMA_avalon_control_slave;
  input            CPU_data_master_qualified_request_Pixel_Buffer_avalon_sram_slave;
  input            CPU_data_master_qualified_request_Video_System_clock_0_in;
  input            CPU_data_master_qualified_request_Video_System_clock_1_in;
  input            CPU_data_master_qualified_request_Video_System_clock_2_in;
  input            CPU_data_master_read;
  input            CPU_data_master_read_data_valid_CPU_jtag_debug_module;
  input            CPU_data_master_read_data_valid_Onchip_Memory_s1;
  input            CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave;
  input            CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave;
  input            CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register;
  input            CPU_data_master_read_data_valid_Video_System_clock_0_in;
  input            CPU_data_master_read_data_valid_Video_System_clock_1_in;
  input            CPU_data_master_read_data_valid_Video_System_clock_2_in;
  input            CPU_data_master_requests_CPU_jtag_debug_module;
  input            CPU_data_master_requests_Onchip_Memory_s1;
  input            CPU_data_master_requests_Pixel_Buffer_DMA_avalon_control_slave;
  input            CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave;
  input            CPU_data_master_requests_Video_System_clock_0_in;
  input            CPU_data_master_requests_Video_System_clock_1_in;
  input            CPU_data_master_requests_Video_System_clock_2_in;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  input   [ 31: 0] Onchip_Memory_s1_readdata_from_sa;
  input   [ 31: 0] Pixel_Buffer_DMA_avalon_control_slave_readdata_from_sa;
  input   [ 15: 0] Pixel_Buffer_avalon_sram_slave_readdata_from_sa;
  input   [  7: 0] Video_System_clock_0_in_readdata_from_sa;
  input            Video_System_clock_0_in_waitrequest_from_sa;
  input   [ 31: 0] Video_System_clock_1_in_readdata_from_sa;
  input            Video_System_clock_1_in_waitrequest_from_sa;
  input   [ 31: 0] Video_System_clock_2_in_readdata_from_sa;
  input            Video_System_clock_2_in_waitrequest_from_sa;
  input            clk;
  input            d1_CPU_jtag_debug_module_end_xfer;
  input            d1_Onchip_Memory_s1_end_xfer;
  input            d1_Pixel_Buffer_DMA_avalon_control_slave_end_xfer;
  input            d1_Pixel_Buffer_avalon_sram_slave_end_xfer;
  input            d1_Video_System_clock_0_in_end_xfer;
  input            d1_Video_System_clock_1_in_end_xfer;
  input            d1_Video_System_clock_2_in_end_xfer;
  input            jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  input            pio_0_s1_irq_from_sa;
  input            registered_CPU_data_master_read_data_valid_Onchip_Memory_s1;
  input            registered_CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave;
  input            reset_n;
  input            sys_clk;
  input            sys_clk_reset_n;

  wire    [ 21: 0] CPU_data_master_address_to_slave;
  reg     [  1: 0] CPU_data_master_dbs_address;
  wire    [  1: 0] CPU_data_master_dbs_increment;
  wire    [ 15: 0] CPU_data_master_dbs_write_16;
  wire    [  7: 0] CPU_data_master_dbs_write_8;
  wire    [ 31: 0] CPU_data_master_irq;
  reg              CPU_data_master_no_byte_enables_and_last_term;
  wire    [ 31: 0] CPU_data_master_readdata;
  wire             CPU_data_master_run;
  reg              CPU_data_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  reg     [  7: 0] dbs_8_reg_segment_0;
  reg     [  7: 0] dbs_8_reg_segment_1;
  reg     [  7: 0] dbs_8_reg_segment_2;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire             last_dbs_term_and_run;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_8_reg_segment_2;
  wire    [ 31: 0] p1_registered_CPU_data_master_readdata;
  wire             pre_dbs_count_enable;
  wire             r_0;
  wire             r_1;
  reg     [ 31: 0] registered_CPU_data_master_readdata;
  wire             sys_clk_jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             sys_clk_pio_0_s1_irq_from_sa;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (CPU_data_master_qualified_request_CPU_jtag_debug_module | ~CPU_data_master_requests_CPU_jtag_debug_module) & (CPU_data_master_granted_CPU_jtag_debug_module | ~CPU_data_master_qualified_request_CPU_jtag_debug_module) & ((~CPU_data_master_qualified_request_CPU_jtag_debug_module | ~CPU_data_master_read | (1 & 1 & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_CPU_jtag_debug_module | ~CPU_data_master_write | (1 & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_Onchip_Memory_s1 | registered_CPU_data_master_read_data_valid_Onchip_Memory_s1 | ~CPU_data_master_requests_Onchip_Memory_s1) & (CPU_data_master_granted_Onchip_Memory_s1 | ~CPU_data_master_qualified_request_Onchip_Memory_s1) & ((~CPU_data_master_qualified_request_Onchip_Memory_s1 | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Onchip_Memory_s1 & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Onchip_Memory_s1 | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_Pixel_Buffer_avalon_sram_slave | (CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave & CPU_data_master_dbs_address[1]) | (CPU_data_master_write & !CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave & CPU_data_master_dbs_address[1]) | ~CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave) & (CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave | ~CPU_data_master_qualified_request_Pixel_Buffer_avalon_sram_slave) & ((~CPU_data_master_qualified_request_Pixel_Buffer_avalon_sram_slave | ~CPU_data_master_read | (CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave & (CPU_data_master_dbs_address[1]) & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Pixel_Buffer_avalon_sram_slave | ~CPU_data_master_write | (1 & (CPU_data_master_dbs_address[1]) & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_Pixel_Buffer_DMA_avalon_control_slave | registered_CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave | ~CPU_data_master_requests_Pixel_Buffer_DMA_avalon_control_slave) & ((~CPU_data_master_qualified_request_Pixel_Buffer_DMA_avalon_control_slave | ~CPU_data_master_read | (registered_CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Pixel_Buffer_DMA_avalon_control_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1;

  //cascaded wait assignment, which is an e_assign
  assign CPU_data_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((CPU_data_master_qualified_request_Video_System_clock_0_in | ((CPU_data_master_write & !CPU_data_master_byteenable_Video_System_clock_0_in & CPU_data_master_dbs_address[1] & CPU_data_master_dbs_address[0])) | ~CPU_data_master_requests_Video_System_clock_0_in)) & ((~CPU_data_master_qualified_request_Video_System_clock_0_in | ~CPU_data_master_read | (1 & ~Video_System_clock_0_in_waitrequest_from_sa & (CPU_data_master_dbs_address[1] & CPU_data_master_dbs_address[0]) & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Video_System_clock_0_in | ~CPU_data_master_write | (1 & ~Video_System_clock_0_in_waitrequest_from_sa & (CPU_data_master_dbs_address[1] & CPU_data_master_dbs_address[0]) & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_Video_System_clock_1_in | ~CPU_data_master_requests_Video_System_clock_1_in) & ((~CPU_data_master_qualified_request_Video_System_clock_1_in | ~(CPU_data_master_read | CPU_data_master_write) | (1 & ~Video_System_clock_1_in_waitrequest_from_sa & (CPU_data_master_read | CPU_data_master_write)))) & ((~CPU_data_master_qualified_request_Video_System_clock_1_in | ~(CPU_data_master_read | CPU_data_master_write) | (1 & ~Video_System_clock_1_in_waitrequest_from_sa & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_Video_System_clock_2_in | ~CPU_data_master_requests_Video_System_clock_2_in) & ((~CPU_data_master_qualified_request_Video_System_clock_2_in | ~(CPU_data_master_read | CPU_data_master_write) | (1 & ~Video_System_clock_2_in_waitrequest_from_sa & (CPU_data_master_read | CPU_data_master_write)))) & ((~CPU_data_master_qualified_request_Video_System_clock_2_in | ~(CPU_data_master_read | CPU_data_master_write) | (1 & ~Video_System_clock_2_in_waitrequest_from_sa & (CPU_data_master_read | CPU_data_master_write))));

  //optimize select-logic by passing only those address bits which matter.
  assign CPU_data_master_address_to_slave = CPU_data_master_address[21 : 0];

  //CPU/data_master readdata mux, which is an e_mux
  assign CPU_data_master_readdata = ({32 {~CPU_data_master_requests_CPU_jtag_debug_module}} | CPU_jtag_debug_module_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Onchip_Memory_s1}} | Onchip_Memory_s1_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave}} | registered_CPU_data_master_readdata) &
    ({32 {~CPU_data_master_requests_Pixel_Buffer_DMA_avalon_control_slave}} | Pixel_Buffer_DMA_avalon_control_slave_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Video_System_clock_0_in}} | registered_CPU_data_master_readdata) &
    ({32 {~CPU_data_master_requests_Video_System_clock_1_in}} | registered_CPU_data_master_readdata) &
    ({32 {~CPU_data_master_requests_Video_System_clock_2_in}} | registered_CPU_data_master_readdata);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_waitrequest <= ~0;
      else 
        CPU_data_master_waitrequest <= ~((~(CPU_data_master_read | CPU_data_master_write))? 0: (CPU_data_master_run & CPU_data_master_waitrequest));
    end


  //no_byte_enables_and_last_term, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_no_byte_enables_and_last_term <= 0;
      else 
        CPU_data_master_no_byte_enables_and_last_term <= last_dbs_term_and_run;
    end


  //compute the last dbs term, which is an e_mux
  assign last_dbs_term_and_run = (CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave)? (((CPU_data_master_dbs_address == 2'b10) & CPU_data_master_write & !CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave)) :
    (((CPU_data_master_dbs_address == 2'b11) & CPU_data_master_write & !CPU_data_master_byteenable_Video_System_clock_0_in));

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~CPU_data_master_no_byte_enables_and_last_term) & CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave & CPU_data_master_write & !CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave)) |
    CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave |
    (CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave & CPU_data_master_write & 1 & 1) |
    (((~CPU_data_master_no_byte_enables_and_last_term) & CPU_data_master_requests_Video_System_clock_0_in & CPU_data_master_write & !CPU_data_master_byteenable_Video_System_clock_0_in)) |
    (CPU_data_master_granted_Video_System_clock_0_in & CPU_data_master_read & 1 & 1 & ~Video_System_clock_0_in_waitrequest_from_sa) |
    (CPU_data_master_granted_Video_System_clock_0_in & CPU_data_master_write & 1 & 1 & ~Video_System_clock_0_in_waitrequest_from_sa);

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = Pixel_Buffer_avalon_sram_slave_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((CPU_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //unpredictable registered wait state incoming data, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          registered_CPU_data_master_readdata <= 0;
      else 
        registered_CPU_data_master_readdata <= p1_registered_CPU_data_master_readdata;
    end


  //registered readdata mux, which is an e_mux
  assign p1_registered_CPU_data_master_readdata = ({32 {~CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave}} | {Pixel_Buffer_avalon_sram_slave_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~CPU_data_master_requests_Video_System_clock_0_in}} | {Video_System_clock_0_in_readdata_from_sa[7 : 0],
    dbs_8_reg_segment_2,
    dbs_8_reg_segment_1,
    dbs_8_reg_segment_0}) &
    ({32 {~CPU_data_master_requests_Video_System_clock_1_in}} | Video_System_clock_1_in_readdata_from_sa) &
    ({32 {~CPU_data_master_requests_Video_System_clock_2_in}} | Video_System_clock_2_in_readdata_from_sa);

  //mux write dbs 1, which is an e_mux
  assign CPU_data_master_dbs_write_16 = (CPU_data_master_dbs_address[1])? CPU_data_master_writedata[31 : 16] :
    CPU_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign CPU_data_master_dbs_increment = (CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave)? 2 :
    (CPU_data_master_requests_Video_System_clock_0_in)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = CPU_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = CPU_data_master_dbs_address + CPU_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable &
    (~(CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave & ~CPU_data_master_waitrequest)) &
    (~(CPU_data_master_requests_Video_System_clock_0_in & ~CPU_data_master_waitrequest));

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          CPU_data_master_dbs_address <= next_dbs_address;
    end


  //input to dbs-8 stored 0, which is an e_mux
  assign p1_dbs_8_reg_segment_0 = Video_System_clock_0_in_readdata_from_sa;

  //dbs register for dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((CPU_data_master_dbs_address[1 : 0]) == 0))
          dbs_8_reg_segment_0 <= p1_dbs_8_reg_segment_0;
    end


  //input to dbs-8 stored 1, which is an e_mux
  assign p1_dbs_8_reg_segment_1 = Video_System_clock_0_in_readdata_from_sa;

  //dbs register for dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_1 <= 0;
      else if (dbs_count_enable & ((CPU_data_master_dbs_address[1 : 0]) == 1))
          dbs_8_reg_segment_1 <= p1_dbs_8_reg_segment_1;
    end


  //input to dbs-8 stored 2, which is an e_mux
  assign p1_dbs_8_reg_segment_2 = Video_System_clock_0_in_readdata_from_sa;

  //dbs register for dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_2 <= 0;
      else if (dbs_count_enable & ((CPU_data_master_dbs_address[1 : 0]) == 2))
          dbs_8_reg_segment_2 <= p1_dbs_8_reg_segment_2;
    end


  //mux write dbs 2, which is an e_mux
  assign CPU_data_master_dbs_write_8 = ((CPU_data_master_dbs_address[1 : 0] == 0))? CPU_data_master_writedata[7 : 0] :
    ((CPU_data_master_dbs_address[1 : 0] == 1))? CPU_data_master_writedata[15 : 8] :
    ((CPU_data_master_dbs_address[1 : 0] == 2))? CPU_data_master_writedata[23 : 16] :
    CPU_data_master_writedata[31 : 24];

  //jtag_uart_0_avalon_jtag_slave_irq_from_sa from clk to sys_clk
  jtag_uart_0_avalon_jtag_slave_irq_from_sa_clock_crossing_CPU_data_master_module jtag_uart_0_avalon_jtag_slave_irq_from_sa_clock_crossing_CPU_data_master
    (
      .clk      (sys_clk),
      .data_in  (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .data_out (sys_clk_jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .reset_n  (sys_clk_reset_n)
    );

  //irq assign, which is an e_assign
  assign CPU_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    sys_clk_pio_0_s1_irq_from_sa,
    sys_clk_jtag_uart_0_avalon_jtag_slave_irq_from_sa};

  //pio_0_s1_irq_from_sa from clk to sys_clk
  pio_0_s1_irq_from_sa_clock_crossing_CPU_data_master_module pio_0_s1_irq_from_sa_clock_crossing_CPU_data_master
    (
      .clk      (sys_clk),
      .data_in  (pio_0_s1_irq_from_sa),
      .data_out (sys_clk_pio_0_s1_irq_from_sa),
      .reset_n  (sys_clk_reset_n)
    );


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module CPU_instruction_master_arbitrator (
                                           // inputs:
                                            CPU_instruction_master_address,
                                            CPU_instruction_master_granted_CPU_jtag_debug_module,
                                            CPU_instruction_master_granted_Onchip_Memory_s1,
                                            CPU_instruction_master_qualified_request_CPU_jtag_debug_module,
                                            CPU_instruction_master_qualified_request_Onchip_Memory_s1,
                                            CPU_instruction_master_read,
                                            CPU_instruction_master_read_data_valid_CPU_jtag_debug_module,
                                            CPU_instruction_master_read_data_valid_Onchip_Memory_s1,
                                            CPU_instruction_master_requests_CPU_jtag_debug_module,
                                            CPU_instruction_master_requests_Onchip_Memory_s1,
                                            CPU_jtag_debug_module_readdata_from_sa,
                                            Onchip_Memory_s1_readdata_from_sa,
                                            clk,
                                            d1_CPU_jtag_debug_module_end_xfer,
                                            d1_Onchip_Memory_s1_end_xfer,
                                            reset_n,

                                           // outputs:
                                            CPU_instruction_master_address_to_slave,
                                            CPU_instruction_master_readdata,
                                            CPU_instruction_master_waitrequest
                                         )
;

  output  [ 21: 0] CPU_instruction_master_address_to_slave;
  output  [ 31: 0] CPU_instruction_master_readdata;
  output           CPU_instruction_master_waitrequest;
  input   [ 21: 0] CPU_instruction_master_address;
  input            CPU_instruction_master_granted_CPU_jtag_debug_module;
  input            CPU_instruction_master_granted_Onchip_Memory_s1;
  input            CPU_instruction_master_qualified_request_CPU_jtag_debug_module;
  input            CPU_instruction_master_qualified_request_Onchip_Memory_s1;
  input            CPU_instruction_master_read;
  input            CPU_instruction_master_read_data_valid_CPU_jtag_debug_module;
  input            CPU_instruction_master_read_data_valid_Onchip_Memory_s1;
  input            CPU_instruction_master_requests_CPU_jtag_debug_module;
  input            CPU_instruction_master_requests_Onchip_Memory_s1;
  input   [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  input   [ 31: 0] Onchip_Memory_s1_readdata_from_sa;
  input            clk;
  input            d1_CPU_jtag_debug_module_end_xfer;
  input            d1_Onchip_Memory_s1_end_xfer;
  input            reset_n;

  reg     [ 21: 0] CPU_instruction_master_address_last_time;
  wire    [ 21: 0] CPU_instruction_master_address_to_slave;
  reg              CPU_instruction_master_read_last_time;
  wire    [ 31: 0] CPU_instruction_master_readdata;
  wire             CPU_instruction_master_run;
  wire             CPU_instruction_master_waitrequest;
  reg              active_and_waiting_last_time;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (CPU_instruction_master_qualified_request_CPU_jtag_debug_module | ~CPU_instruction_master_requests_CPU_jtag_debug_module) & (CPU_instruction_master_granted_CPU_jtag_debug_module | ~CPU_instruction_master_qualified_request_CPU_jtag_debug_module) & ((~CPU_instruction_master_qualified_request_CPU_jtag_debug_module | ~CPU_instruction_master_read | (1 & ~d1_CPU_jtag_debug_module_end_xfer & CPU_instruction_master_read))) & 1 & (CPU_instruction_master_qualified_request_Onchip_Memory_s1 | CPU_instruction_master_read_data_valid_Onchip_Memory_s1 | ~CPU_instruction_master_requests_Onchip_Memory_s1) & (CPU_instruction_master_granted_Onchip_Memory_s1 | ~CPU_instruction_master_qualified_request_Onchip_Memory_s1) & ((~CPU_instruction_master_qualified_request_Onchip_Memory_s1 | ~CPU_instruction_master_read | (CPU_instruction_master_read_data_valid_Onchip_Memory_s1 & CPU_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign CPU_instruction_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign CPU_instruction_master_address_to_slave = {1'b1,
    CPU_instruction_master_address[20 : 0]};

  //CPU/instruction_master readdata mux, which is an e_mux
  assign CPU_instruction_master_readdata = ({32 {~CPU_instruction_master_requests_CPU_jtag_debug_module}} | CPU_jtag_debug_module_readdata_from_sa) &
    ({32 {~CPU_instruction_master_requests_Onchip_Memory_s1}} | Onchip_Memory_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign CPU_instruction_master_waitrequest = ~CPU_instruction_master_run;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //CPU_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_address_last_time <= 0;
      else 
        CPU_instruction_master_address_last_time <= CPU_instruction_master_address;
    end


  //CPU/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= CPU_instruction_master_waitrequest & (CPU_instruction_master_read);
    end


  //CPU_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (CPU_instruction_master_address != CPU_instruction_master_address_last_time))
        begin
          $write("%0d ns: CPU_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //CPU_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_read_last_time <= 0;
      else 
        CPU_instruction_master_read_last_time <= CPU_instruction_master_read;
    end


  //CPU_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (CPU_instruction_master_read != CPU_instruction_master_read_last_time))
        begin
          $write("%0d ns: CPU_instruction_master_read did not heed wait!!!", $time);
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

module Clock_Signals_avalon_clocks_slave_arbitrator (
                                                      // inputs:
                                                       Clock_Signals_avalon_clocks_slave_readdata,
                                                       Video_System_clock_0_out_address_to_slave,
                                                       Video_System_clock_0_out_read,
                                                       Video_System_clock_0_out_write,
                                                       clk,
                                                       reset_n,

                                                      // outputs:
                                                       Clock_Signals_avalon_clocks_slave_address,
                                                       Clock_Signals_avalon_clocks_slave_readdata_from_sa,
                                                       Video_System_clock_0_out_granted_Clock_Signals_avalon_clocks_slave,
                                                       Video_System_clock_0_out_qualified_request_Clock_Signals_avalon_clocks_slave,
                                                       Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave,
                                                       Video_System_clock_0_out_requests_Clock_Signals_avalon_clocks_slave,
                                                       d1_Clock_Signals_avalon_clocks_slave_end_xfer
                                                    )
;

  output           Clock_Signals_avalon_clocks_slave_address;
  output  [  7: 0] Clock_Signals_avalon_clocks_slave_readdata_from_sa;
  output           Video_System_clock_0_out_granted_Clock_Signals_avalon_clocks_slave;
  output           Video_System_clock_0_out_qualified_request_Clock_Signals_avalon_clocks_slave;
  output           Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave;
  output           Video_System_clock_0_out_requests_Clock_Signals_avalon_clocks_slave;
  output           d1_Clock_Signals_avalon_clocks_slave_end_xfer;
  input   [  7: 0] Clock_Signals_avalon_clocks_slave_readdata;
  input            Video_System_clock_0_out_address_to_slave;
  input            Video_System_clock_0_out_read;
  input            Video_System_clock_0_out_write;
  input            clk;
  input            reset_n;

  wire             Clock_Signals_avalon_clocks_slave_address;
  wire             Clock_Signals_avalon_clocks_slave_allgrants;
  wire             Clock_Signals_avalon_clocks_slave_allow_new_arb_cycle;
  wire             Clock_Signals_avalon_clocks_slave_any_bursting_master_saved_grant;
  wire             Clock_Signals_avalon_clocks_slave_any_continuerequest;
  wire             Clock_Signals_avalon_clocks_slave_arb_counter_enable;
  reg              Clock_Signals_avalon_clocks_slave_arb_share_counter;
  wire             Clock_Signals_avalon_clocks_slave_arb_share_counter_next_value;
  wire             Clock_Signals_avalon_clocks_slave_arb_share_set_values;
  wire             Clock_Signals_avalon_clocks_slave_beginbursttransfer_internal;
  wire             Clock_Signals_avalon_clocks_slave_begins_xfer;
  wire             Clock_Signals_avalon_clocks_slave_end_xfer;
  wire             Clock_Signals_avalon_clocks_slave_firsttransfer;
  wire             Clock_Signals_avalon_clocks_slave_grant_vector;
  wire             Clock_Signals_avalon_clocks_slave_in_a_read_cycle;
  wire             Clock_Signals_avalon_clocks_slave_in_a_write_cycle;
  wire             Clock_Signals_avalon_clocks_slave_master_qreq_vector;
  wire             Clock_Signals_avalon_clocks_slave_non_bursting_master_requests;
  wire    [  7: 0] Clock_Signals_avalon_clocks_slave_readdata_from_sa;
  reg              Clock_Signals_avalon_clocks_slave_reg_firsttransfer;
  reg              Clock_Signals_avalon_clocks_slave_slavearbiterlockenable;
  wire             Clock_Signals_avalon_clocks_slave_slavearbiterlockenable2;
  wire             Clock_Signals_avalon_clocks_slave_unreg_firsttransfer;
  wire             Clock_Signals_avalon_clocks_slave_waits_for_read;
  wire             Clock_Signals_avalon_clocks_slave_waits_for_write;
  wire             Video_System_clock_0_out_arbiterlock;
  wire             Video_System_clock_0_out_arbiterlock2;
  wire             Video_System_clock_0_out_continuerequest;
  wire             Video_System_clock_0_out_granted_Clock_Signals_avalon_clocks_slave;
  wire             Video_System_clock_0_out_qualified_request_Clock_Signals_avalon_clocks_slave;
  wire             Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave;
  reg              Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave_shift_register;
  wire             Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave_shift_register_in;
  wire             Video_System_clock_0_out_requests_Clock_Signals_avalon_clocks_slave;
  wire             Video_System_clock_0_out_saved_grant_Clock_Signals_avalon_clocks_slave;
  reg              d1_Clock_Signals_avalon_clocks_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Clock_Signals_avalon_clocks_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave_shift_register;
  wire             wait_for_Clock_Signals_avalon_clocks_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Clock_Signals_avalon_clocks_slave_end_xfer;
    end


  assign Clock_Signals_avalon_clocks_slave_begins_xfer = ~d1_reasons_to_wait & ((Video_System_clock_0_out_qualified_request_Clock_Signals_avalon_clocks_slave));
  //assign Clock_Signals_avalon_clocks_slave_readdata_from_sa = Clock_Signals_avalon_clocks_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Clock_Signals_avalon_clocks_slave_readdata_from_sa = Clock_Signals_avalon_clocks_slave_readdata;

  assign Video_System_clock_0_out_requests_Clock_Signals_avalon_clocks_slave = ((1) & (Video_System_clock_0_out_read | Video_System_clock_0_out_write)) & Video_System_clock_0_out_read;
  //Clock_Signals_avalon_clocks_slave_arb_share_counter set values, which is an e_mux
  assign Clock_Signals_avalon_clocks_slave_arb_share_set_values = 1;

  //Clock_Signals_avalon_clocks_slave_non_bursting_master_requests mux, which is an e_mux
  assign Clock_Signals_avalon_clocks_slave_non_bursting_master_requests = Video_System_clock_0_out_requests_Clock_Signals_avalon_clocks_slave;

  //Clock_Signals_avalon_clocks_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Clock_Signals_avalon_clocks_slave_any_bursting_master_saved_grant = 0;

  //Clock_Signals_avalon_clocks_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Clock_Signals_avalon_clocks_slave_arb_share_counter_next_value = Clock_Signals_avalon_clocks_slave_firsttransfer ? (Clock_Signals_avalon_clocks_slave_arb_share_set_values - 1) : |Clock_Signals_avalon_clocks_slave_arb_share_counter ? (Clock_Signals_avalon_clocks_slave_arb_share_counter - 1) : 0;

  //Clock_Signals_avalon_clocks_slave_allgrants all slave grants, which is an e_mux
  assign Clock_Signals_avalon_clocks_slave_allgrants = |Clock_Signals_avalon_clocks_slave_grant_vector;

  //Clock_Signals_avalon_clocks_slave_end_xfer assignment, which is an e_assign
  assign Clock_Signals_avalon_clocks_slave_end_xfer = ~(Clock_Signals_avalon_clocks_slave_waits_for_read | Clock_Signals_avalon_clocks_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Clock_Signals_avalon_clocks_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Clock_Signals_avalon_clocks_slave = Clock_Signals_avalon_clocks_slave_end_xfer & (~Clock_Signals_avalon_clocks_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Clock_Signals_avalon_clocks_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Clock_Signals_avalon_clocks_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Clock_Signals_avalon_clocks_slave & Clock_Signals_avalon_clocks_slave_allgrants) | (end_xfer_arb_share_counter_term_Clock_Signals_avalon_clocks_slave & ~Clock_Signals_avalon_clocks_slave_non_bursting_master_requests);

  //Clock_Signals_avalon_clocks_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Clock_Signals_avalon_clocks_slave_arb_share_counter <= 0;
      else if (Clock_Signals_avalon_clocks_slave_arb_counter_enable)
          Clock_Signals_avalon_clocks_slave_arb_share_counter <= Clock_Signals_avalon_clocks_slave_arb_share_counter_next_value;
    end


  //Clock_Signals_avalon_clocks_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Clock_Signals_avalon_clocks_slave_slavearbiterlockenable <= 0;
      else if ((|Clock_Signals_avalon_clocks_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Clock_Signals_avalon_clocks_slave) | (end_xfer_arb_share_counter_term_Clock_Signals_avalon_clocks_slave & ~Clock_Signals_avalon_clocks_slave_non_bursting_master_requests))
          Clock_Signals_avalon_clocks_slave_slavearbiterlockenable <= |Clock_Signals_avalon_clocks_slave_arb_share_counter_next_value;
    end


  //Video_System_clock_0/out Clock_Signals/avalon_clocks_slave arbiterlock, which is an e_assign
  assign Video_System_clock_0_out_arbiterlock = Clock_Signals_avalon_clocks_slave_slavearbiterlockenable & Video_System_clock_0_out_continuerequest;

  //Clock_Signals_avalon_clocks_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Clock_Signals_avalon_clocks_slave_slavearbiterlockenable2 = |Clock_Signals_avalon_clocks_slave_arb_share_counter_next_value;

  //Video_System_clock_0/out Clock_Signals/avalon_clocks_slave arbiterlock2, which is an e_assign
  assign Video_System_clock_0_out_arbiterlock2 = Clock_Signals_avalon_clocks_slave_slavearbiterlockenable2 & Video_System_clock_0_out_continuerequest;

  //Clock_Signals_avalon_clocks_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Clock_Signals_avalon_clocks_slave_any_continuerequest = 1;

  //Video_System_clock_0_out_continuerequest continued request, which is an e_assign
  assign Video_System_clock_0_out_continuerequest = 1;

  assign Video_System_clock_0_out_qualified_request_Clock_Signals_avalon_clocks_slave = Video_System_clock_0_out_requests_Clock_Signals_avalon_clocks_slave & ~((Video_System_clock_0_out_read & ((|Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave_shift_register))));
  //Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave_shift_register_in = Video_System_clock_0_out_granted_Clock_Signals_avalon_clocks_slave & Video_System_clock_0_out_read & ~Clock_Signals_avalon_clocks_slave_waits_for_read & ~(|Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave_shift_register);

  //shift register p1 Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave_shift_register = {Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave_shift_register, Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave_shift_register_in};

  //Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave_shift_register <= 0;
      else 
        Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave_shift_register <= p1_Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave_shift_register;
    end


  //local readdatavalid Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave, which is an e_mux
  assign Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave = Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave_shift_register;

  //master is always granted when requested
  assign Video_System_clock_0_out_granted_Clock_Signals_avalon_clocks_slave = Video_System_clock_0_out_qualified_request_Clock_Signals_avalon_clocks_slave;

  //Video_System_clock_0/out saved-grant Clock_Signals/avalon_clocks_slave, which is an e_assign
  assign Video_System_clock_0_out_saved_grant_Clock_Signals_avalon_clocks_slave = Video_System_clock_0_out_requests_Clock_Signals_avalon_clocks_slave;

  //allow new arb cycle for Clock_Signals/avalon_clocks_slave, which is an e_assign
  assign Clock_Signals_avalon_clocks_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Clock_Signals_avalon_clocks_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Clock_Signals_avalon_clocks_slave_master_qreq_vector = 1;

  //Clock_Signals_avalon_clocks_slave_firsttransfer first transaction, which is an e_assign
  assign Clock_Signals_avalon_clocks_slave_firsttransfer = Clock_Signals_avalon_clocks_slave_begins_xfer ? Clock_Signals_avalon_clocks_slave_unreg_firsttransfer : Clock_Signals_avalon_clocks_slave_reg_firsttransfer;

  //Clock_Signals_avalon_clocks_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Clock_Signals_avalon_clocks_slave_unreg_firsttransfer = ~(Clock_Signals_avalon_clocks_slave_slavearbiterlockenable & Clock_Signals_avalon_clocks_slave_any_continuerequest);

  //Clock_Signals_avalon_clocks_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Clock_Signals_avalon_clocks_slave_reg_firsttransfer <= 1'b1;
      else if (Clock_Signals_avalon_clocks_slave_begins_xfer)
          Clock_Signals_avalon_clocks_slave_reg_firsttransfer <= Clock_Signals_avalon_clocks_slave_unreg_firsttransfer;
    end


  //Clock_Signals_avalon_clocks_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Clock_Signals_avalon_clocks_slave_beginbursttransfer_internal = Clock_Signals_avalon_clocks_slave_begins_xfer;

  //Clock_Signals_avalon_clocks_slave_address mux, which is an e_mux
  assign Clock_Signals_avalon_clocks_slave_address = Video_System_clock_0_out_address_to_slave;

  //d1_Clock_Signals_avalon_clocks_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Clock_Signals_avalon_clocks_slave_end_xfer <= 1;
      else 
        d1_Clock_Signals_avalon_clocks_slave_end_xfer <= Clock_Signals_avalon_clocks_slave_end_xfer;
    end


  //Clock_Signals_avalon_clocks_slave_waits_for_read in a cycle, which is an e_mux
  assign Clock_Signals_avalon_clocks_slave_waits_for_read = Clock_Signals_avalon_clocks_slave_in_a_read_cycle & 0;

  //Clock_Signals_avalon_clocks_slave_in_a_read_cycle assignment, which is an e_assign
  assign Clock_Signals_avalon_clocks_slave_in_a_read_cycle = Video_System_clock_0_out_granted_Clock_Signals_avalon_clocks_slave & Video_System_clock_0_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Clock_Signals_avalon_clocks_slave_in_a_read_cycle;

  //Clock_Signals_avalon_clocks_slave_waits_for_write in a cycle, which is an e_mux
  assign Clock_Signals_avalon_clocks_slave_waits_for_write = Clock_Signals_avalon_clocks_slave_in_a_write_cycle & 0;

  //Clock_Signals_avalon_clocks_slave_in_a_write_cycle assignment, which is an e_assign
  assign Clock_Signals_avalon_clocks_slave_in_a_write_cycle = Video_System_clock_0_out_granted_Clock_Signals_avalon_clocks_slave & Video_System_clock_0_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Clock_Signals_avalon_clocks_slave_in_a_write_cycle;

  assign wait_for_Clock_Signals_avalon_clocks_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Clock_Signals/avalon_clocks_slave enable non-zero assertions, which is an e_register
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

module Dual_Clock_FIFO_avalon_dc_buffer_sink_arbitrator (
                                                          // inputs:
                                                           Dual_Clock_FIFO_avalon_dc_buffer_sink_ready,
                                                           Pixel_RGB_Resampler_avalon_rgb_source_data,
                                                           Pixel_RGB_Resampler_avalon_rgb_source_endofpacket,
                                                           Pixel_RGB_Resampler_avalon_rgb_source_startofpacket,
                                                           Pixel_RGB_Resampler_avalon_rgb_source_valid,
                                                           clk,
                                                           reset_n,

                                                          // outputs:
                                                           Dual_Clock_FIFO_avalon_dc_buffer_sink_data,
                                                           Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket,
                                                           Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa,
                                                           Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket,
                                                           Dual_Clock_FIFO_avalon_dc_buffer_sink_valid
                                                        )
;

  output  [ 29: 0] Dual_Clock_FIFO_avalon_dc_buffer_sink_data;
  output           Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket;
  output           Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa;
  output           Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket;
  output           Dual_Clock_FIFO_avalon_dc_buffer_sink_valid;
  input            Dual_Clock_FIFO_avalon_dc_buffer_sink_ready;
  input   [ 29: 0] Pixel_RGB_Resampler_avalon_rgb_source_data;
  input            Pixel_RGB_Resampler_avalon_rgb_source_endofpacket;
  input            Pixel_RGB_Resampler_avalon_rgb_source_startofpacket;
  input            Pixel_RGB_Resampler_avalon_rgb_source_valid;
  input            clk;
  input            reset_n;

  wire    [ 29: 0] Dual_Clock_FIFO_avalon_dc_buffer_sink_data;
  wire             Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket;
  wire             Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa;
  wire             Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket;
  wire             Dual_Clock_FIFO_avalon_dc_buffer_sink_valid;
  //mux Dual_Clock_FIFO_avalon_dc_buffer_sink_data, which is an e_mux
  assign Dual_Clock_FIFO_avalon_dc_buffer_sink_data = Pixel_RGB_Resampler_avalon_rgb_source_data;

  //mux Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket, which is an e_mux
  assign Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket = Pixel_RGB_Resampler_avalon_rgb_source_endofpacket;

  //assign Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa = Dual_Clock_FIFO_avalon_dc_buffer_sink_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa = Dual_Clock_FIFO_avalon_dc_buffer_sink_ready;

  //mux Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket, which is an e_mux
  assign Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket = Pixel_RGB_Resampler_avalon_rgb_source_startofpacket;

  //mux Dual_Clock_FIFO_avalon_dc_buffer_sink_valid, which is an e_mux
  assign Dual_Clock_FIFO_avalon_dc_buffer_sink_valid = Pixel_RGB_Resampler_avalon_rgb_source_valid;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Dual_Clock_FIFO_avalon_dc_buffer_source_arbitrator (
                                                            // inputs:
                                                             Dual_Clock_FIFO_avalon_dc_buffer_source_data,
                                                             Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket,
                                                             Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket,
                                                             Dual_Clock_FIFO_avalon_dc_buffer_source_valid,
                                                             VGA_Controller_avalon_vga_sink_ready_from_sa,
                                                             clk,
                                                             reset_n,

                                                            // outputs:
                                                             Dual_Clock_FIFO_avalon_dc_buffer_source_ready
                                                          )
;

  output           Dual_Clock_FIFO_avalon_dc_buffer_source_ready;
  input   [ 29: 0] Dual_Clock_FIFO_avalon_dc_buffer_source_data;
  input            Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket;
  input            Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket;
  input            Dual_Clock_FIFO_avalon_dc_buffer_source_valid;
  input            VGA_Controller_avalon_vga_sink_ready_from_sa;
  input            clk;
  input            reset_n;

  wire             Dual_Clock_FIFO_avalon_dc_buffer_source_ready;
  //mux Dual_Clock_FIFO_avalon_dc_buffer_source_ready, which is an e_mux
  assign Dual_Clock_FIFO_avalon_dc_buffer_source_ready = VGA_Controller_avalon_vga_sink_ready_from_sa;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Onchip_Memory_s1_arbitrator (
                                     // inputs:
                                      CPU_data_master_address_to_slave,
                                      CPU_data_master_byteenable,
                                      CPU_data_master_read,
                                      CPU_data_master_waitrequest,
                                      CPU_data_master_write,
                                      CPU_data_master_writedata,
                                      CPU_instruction_master_address_to_slave,
                                      CPU_instruction_master_read,
                                      Onchip_Memory_s1_readdata,
                                      clk,
                                      reset_n,

                                     // outputs:
                                      CPU_data_master_granted_Onchip_Memory_s1,
                                      CPU_data_master_qualified_request_Onchip_Memory_s1,
                                      CPU_data_master_read_data_valid_Onchip_Memory_s1,
                                      CPU_data_master_requests_Onchip_Memory_s1,
                                      CPU_instruction_master_granted_Onchip_Memory_s1,
                                      CPU_instruction_master_qualified_request_Onchip_Memory_s1,
                                      CPU_instruction_master_read_data_valid_Onchip_Memory_s1,
                                      CPU_instruction_master_requests_Onchip_Memory_s1,
                                      Onchip_Memory_s1_address,
                                      Onchip_Memory_s1_byteenable,
                                      Onchip_Memory_s1_chipselect,
                                      Onchip_Memory_s1_clken,
                                      Onchip_Memory_s1_readdata_from_sa,
                                      Onchip_Memory_s1_reset,
                                      Onchip_Memory_s1_write,
                                      Onchip_Memory_s1_writedata,
                                      d1_Onchip_Memory_s1_end_xfer,
                                      registered_CPU_data_master_read_data_valid_Onchip_Memory_s1
                                   )
;

  output           CPU_data_master_granted_Onchip_Memory_s1;
  output           CPU_data_master_qualified_request_Onchip_Memory_s1;
  output           CPU_data_master_read_data_valid_Onchip_Memory_s1;
  output           CPU_data_master_requests_Onchip_Memory_s1;
  output           CPU_instruction_master_granted_Onchip_Memory_s1;
  output           CPU_instruction_master_qualified_request_Onchip_Memory_s1;
  output           CPU_instruction_master_read_data_valid_Onchip_Memory_s1;
  output           CPU_instruction_master_requests_Onchip_Memory_s1;
  output  [ 16: 0] Onchip_Memory_s1_address;
  output  [  3: 0] Onchip_Memory_s1_byteenable;
  output           Onchip_Memory_s1_chipselect;
  output           Onchip_Memory_s1_clken;
  output  [ 31: 0] Onchip_Memory_s1_readdata_from_sa;
  output           Onchip_Memory_s1_reset;
  output           Onchip_Memory_s1_write;
  output  [ 31: 0] Onchip_Memory_s1_writedata;
  output           d1_Onchip_Memory_s1_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Onchip_Memory_s1;
  input   [ 21: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 21: 0] CPU_instruction_master_address_to_slave;
  input            CPU_instruction_master_read;
  input   [ 31: 0] Onchip_Memory_s1_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Onchip_Memory_s1;
  wire             CPU_data_master_qualified_request_Onchip_Memory_s1;
  wire             CPU_data_master_read_data_valid_Onchip_Memory_s1;
  reg              CPU_data_master_read_data_valid_Onchip_Memory_s1_shift_register;
  wire             CPU_data_master_read_data_valid_Onchip_Memory_s1_shift_register_in;
  wire             CPU_data_master_requests_Onchip_Memory_s1;
  wire             CPU_data_master_saved_grant_Onchip_Memory_s1;
  wire             CPU_instruction_master_arbiterlock;
  wire             CPU_instruction_master_arbiterlock2;
  wire             CPU_instruction_master_continuerequest;
  wire             CPU_instruction_master_granted_Onchip_Memory_s1;
  wire             CPU_instruction_master_qualified_request_Onchip_Memory_s1;
  wire             CPU_instruction_master_read_data_valid_Onchip_Memory_s1;
  reg              CPU_instruction_master_read_data_valid_Onchip_Memory_s1_shift_register;
  wire             CPU_instruction_master_read_data_valid_Onchip_Memory_s1_shift_register_in;
  wire             CPU_instruction_master_requests_Onchip_Memory_s1;
  wire             CPU_instruction_master_saved_grant_Onchip_Memory_s1;
  wire    [ 16: 0] Onchip_Memory_s1_address;
  wire             Onchip_Memory_s1_allgrants;
  wire             Onchip_Memory_s1_allow_new_arb_cycle;
  wire             Onchip_Memory_s1_any_bursting_master_saved_grant;
  wire             Onchip_Memory_s1_any_continuerequest;
  reg     [  1: 0] Onchip_Memory_s1_arb_addend;
  wire             Onchip_Memory_s1_arb_counter_enable;
  reg     [  2: 0] Onchip_Memory_s1_arb_share_counter;
  wire    [  2: 0] Onchip_Memory_s1_arb_share_counter_next_value;
  wire    [  2: 0] Onchip_Memory_s1_arb_share_set_values;
  wire    [  1: 0] Onchip_Memory_s1_arb_winner;
  wire             Onchip_Memory_s1_arbitration_holdoff_internal;
  wire             Onchip_Memory_s1_beginbursttransfer_internal;
  wire             Onchip_Memory_s1_begins_xfer;
  wire    [  3: 0] Onchip_Memory_s1_byteenable;
  wire             Onchip_Memory_s1_chipselect;
  wire    [  3: 0] Onchip_Memory_s1_chosen_master_double_vector;
  wire    [  1: 0] Onchip_Memory_s1_chosen_master_rot_left;
  wire             Onchip_Memory_s1_clken;
  wire             Onchip_Memory_s1_end_xfer;
  wire             Onchip_Memory_s1_firsttransfer;
  wire    [  1: 0] Onchip_Memory_s1_grant_vector;
  wire             Onchip_Memory_s1_in_a_read_cycle;
  wire             Onchip_Memory_s1_in_a_write_cycle;
  wire    [  1: 0] Onchip_Memory_s1_master_qreq_vector;
  wire             Onchip_Memory_s1_non_bursting_master_requests;
  wire    [ 31: 0] Onchip_Memory_s1_readdata_from_sa;
  reg              Onchip_Memory_s1_reg_firsttransfer;
  wire             Onchip_Memory_s1_reset;
  reg     [  1: 0] Onchip_Memory_s1_saved_chosen_master_vector;
  reg              Onchip_Memory_s1_slavearbiterlockenable;
  wire             Onchip_Memory_s1_slavearbiterlockenable2;
  wire             Onchip_Memory_s1_unreg_firsttransfer;
  wire             Onchip_Memory_s1_waits_for_read;
  wire             Onchip_Memory_s1_waits_for_write;
  wire             Onchip_Memory_s1_write;
  wire    [ 31: 0] Onchip_Memory_s1_writedata;
  reg              d1_Onchip_Memory_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Onchip_Memory_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_CPU_data_master_granted_slave_Onchip_Memory_s1;
  reg              last_cycle_CPU_instruction_master_granted_slave_Onchip_Memory_s1;
  wire             p1_CPU_data_master_read_data_valid_Onchip_Memory_s1_shift_register;
  wire             p1_CPU_instruction_master_read_data_valid_Onchip_Memory_s1_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Onchip_Memory_s1;
  wire    [ 21: 0] shifted_address_to_Onchip_Memory_s1_from_CPU_data_master;
  wire    [ 21: 0] shifted_address_to_Onchip_Memory_s1_from_CPU_instruction_master;
  wire             wait_for_Onchip_Memory_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Onchip_Memory_s1_end_xfer;
    end


  assign Onchip_Memory_s1_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Onchip_Memory_s1 | CPU_instruction_master_qualified_request_Onchip_Memory_s1));
  //assign Onchip_Memory_s1_readdata_from_sa = Onchip_Memory_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Onchip_Memory_s1_readdata_from_sa = Onchip_Memory_s1_readdata;

  assign CPU_data_master_requests_Onchip_Memory_s1 = ({CPU_data_master_address_to_slave[21 : 19] , 19'b0} == 22'h280000) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Onchip_Memory_s1 assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Onchip_Memory_s1 = CPU_data_master_read_data_valid_Onchip_Memory_s1_shift_register_in;

  //Onchip_Memory_s1_arb_share_counter set values, which is an e_mux
  assign Onchip_Memory_s1_arb_share_set_values = 1;

  //Onchip_Memory_s1_non_bursting_master_requests mux, which is an e_mux
  assign Onchip_Memory_s1_non_bursting_master_requests = CPU_data_master_requests_Onchip_Memory_s1 |
    CPU_instruction_master_requests_Onchip_Memory_s1 |
    CPU_data_master_requests_Onchip_Memory_s1 |
    CPU_instruction_master_requests_Onchip_Memory_s1;

  //Onchip_Memory_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign Onchip_Memory_s1_any_bursting_master_saved_grant = 0;

  //Onchip_Memory_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign Onchip_Memory_s1_arb_share_counter_next_value = Onchip_Memory_s1_firsttransfer ? (Onchip_Memory_s1_arb_share_set_values - 1) : |Onchip_Memory_s1_arb_share_counter ? (Onchip_Memory_s1_arb_share_counter - 1) : 0;

  //Onchip_Memory_s1_allgrants all slave grants, which is an e_mux
  assign Onchip_Memory_s1_allgrants = (|Onchip_Memory_s1_grant_vector) |
    (|Onchip_Memory_s1_grant_vector) |
    (|Onchip_Memory_s1_grant_vector) |
    (|Onchip_Memory_s1_grant_vector);

  //Onchip_Memory_s1_end_xfer assignment, which is an e_assign
  assign Onchip_Memory_s1_end_xfer = ~(Onchip_Memory_s1_waits_for_read | Onchip_Memory_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_Onchip_Memory_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Onchip_Memory_s1 = Onchip_Memory_s1_end_xfer & (~Onchip_Memory_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Onchip_Memory_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign Onchip_Memory_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_Onchip_Memory_s1 & Onchip_Memory_s1_allgrants) | (end_xfer_arb_share_counter_term_Onchip_Memory_s1 & ~Onchip_Memory_s1_non_bursting_master_requests);

  //Onchip_Memory_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_Memory_s1_arb_share_counter <= 0;
      else if (Onchip_Memory_s1_arb_counter_enable)
          Onchip_Memory_s1_arb_share_counter <= Onchip_Memory_s1_arb_share_counter_next_value;
    end


  //Onchip_Memory_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_Memory_s1_slavearbiterlockenable <= 0;
      else if ((|Onchip_Memory_s1_master_qreq_vector & end_xfer_arb_share_counter_term_Onchip_Memory_s1) | (end_xfer_arb_share_counter_term_Onchip_Memory_s1 & ~Onchip_Memory_s1_non_bursting_master_requests))
          Onchip_Memory_s1_slavearbiterlockenable <= |Onchip_Memory_s1_arb_share_counter_next_value;
    end


  //CPU/data_master Onchip_Memory/s1 arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Onchip_Memory_s1_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Onchip_Memory_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Onchip_Memory_s1_slavearbiterlockenable2 = |Onchip_Memory_s1_arb_share_counter_next_value;

  //CPU/data_master Onchip_Memory/s1 arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Onchip_Memory_s1_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //CPU/instruction_master Onchip_Memory/s1 arbiterlock, which is an e_assign
  assign CPU_instruction_master_arbiterlock = Onchip_Memory_s1_slavearbiterlockenable & CPU_instruction_master_continuerequest;

  //CPU/instruction_master Onchip_Memory/s1 arbiterlock2, which is an e_assign
  assign CPU_instruction_master_arbiterlock2 = Onchip_Memory_s1_slavearbiterlockenable2 & CPU_instruction_master_continuerequest;

  //CPU/instruction_master granted Onchip_Memory/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_instruction_master_granted_slave_Onchip_Memory_s1 <= 0;
      else 
        last_cycle_CPU_instruction_master_granted_slave_Onchip_Memory_s1 <= CPU_instruction_master_saved_grant_Onchip_Memory_s1 ? 1 : (Onchip_Memory_s1_arbitration_holdoff_internal | ~CPU_instruction_master_requests_Onchip_Memory_s1) ? 0 : last_cycle_CPU_instruction_master_granted_slave_Onchip_Memory_s1;
    end


  //CPU_instruction_master_continuerequest continued request, which is an e_mux
  assign CPU_instruction_master_continuerequest = last_cycle_CPU_instruction_master_granted_slave_Onchip_Memory_s1 & CPU_instruction_master_requests_Onchip_Memory_s1;

  //Onchip_Memory_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign Onchip_Memory_s1_any_continuerequest = CPU_instruction_master_continuerequest |
    CPU_data_master_continuerequest;

  assign CPU_data_master_qualified_request_Onchip_Memory_s1 = CPU_data_master_requests_Onchip_Memory_s1 & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Onchip_Memory_s1_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write) | CPU_instruction_master_arbiterlock);
  //CPU_data_master_read_data_valid_Onchip_Memory_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Onchip_Memory_s1_shift_register_in = CPU_data_master_granted_Onchip_Memory_s1 & CPU_data_master_read & ~Onchip_Memory_s1_waits_for_read & ~(|CPU_data_master_read_data_valid_Onchip_Memory_s1_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Onchip_Memory_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Onchip_Memory_s1_shift_register = {CPU_data_master_read_data_valid_Onchip_Memory_s1_shift_register, CPU_data_master_read_data_valid_Onchip_Memory_s1_shift_register_in};

  //CPU_data_master_read_data_valid_Onchip_Memory_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Onchip_Memory_s1_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Onchip_Memory_s1_shift_register <= p1_CPU_data_master_read_data_valid_Onchip_Memory_s1_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Onchip_Memory_s1, which is an e_mux
  assign CPU_data_master_read_data_valid_Onchip_Memory_s1 = CPU_data_master_read_data_valid_Onchip_Memory_s1_shift_register;

  //Onchip_Memory_s1_writedata mux, which is an e_mux
  assign Onchip_Memory_s1_writedata = CPU_data_master_writedata;

  //mux Onchip_Memory_s1_clken, which is an e_mux
  assign Onchip_Memory_s1_clken = 1'b1;

  assign CPU_instruction_master_requests_Onchip_Memory_s1 = (({CPU_instruction_master_address_to_slave[21 : 19] , 19'b0} == 22'h280000) & (CPU_instruction_master_read)) & CPU_instruction_master_read;
  //CPU/data_master granted Onchip_Memory/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_data_master_granted_slave_Onchip_Memory_s1 <= 0;
      else 
        last_cycle_CPU_data_master_granted_slave_Onchip_Memory_s1 <= CPU_data_master_saved_grant_Onchip_Memory_s1 ? 1 : (Onchip_Memory_s1_arbitration_holdoff_internal | ~CPU_data_master_requests_Onchip_Memory_s1) ? 0 : last_cycle_CPU_data_master_granted_slave_Onchip_Memory_s1;
    end


  //CPU_data_master_continuerequest continued request, which is an e_mux
  assign CPU_data_master_continuerequest = last_cycle_CPU_data_master_granted_slave_Onchip_Memory_s1 & CPU_data_master_requests_Onchip_Memory_s1;

  assign CPU_instruction_master_qualified_request_Onchip_Memory_s1 = CPU_instruction_master_requests_Onchip_Memory_s1 & ~((CPU_instruction_master_read & ((|CPU_instruction_master_read_data_valid_Onchip_Memory_s1_shift_register))) | CPU_data_master_arbiterlock);
  //CPU_instruction_master_read_data_valid_Onchip_Memory_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_instruction_master_read_data_valid_Onchip_Memory_s1_shift_register_in = CPU_instruction_master_granted_Onchip_Memory_s1 & CPU_instruction_master_read & ~Onchip_Memory_s1_waits_for_read & ~(|CPU_instruction_master_read_data_valid_Onchip_Memory_s1_shift_register);

  //shift register p1 CPU_instruction_master_read_data_valid_Onchip_Memory_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_instruction_master_read_data_valid_Onchip_Memory_s1_shift_register = {CPU_instruction_master_read_data_valid_Onchip_Memory_s1_shift_register, CPU_instruction_master_read_data_valid_Onchip_Memory_s1_shift_register_in};

  //CPU_instruction_master_read_data_valid_Onchip_Memory_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_read_data_valid_Onchip_Memory_s1_shift_register <= 0;
      else 
        CPU_instruction_master_read_data_valid_Onchip_Memory_s1_shift_register <= p1_CPU_instruction_master_read_data_valid_Onchip_Memory_s1_shift_register;
    end


  //local readdatavalid CPU_instruction_master_read_data_valid_Onchip_Memory_s1, which is an e_mux
  assign CPU_instruction_master_read_data_valid_Onchip_Memory_s1 = CPU_instruction_master_read_data_valid_Onchip_Memory_s1_shift_register;

  //allow new arb cycle for Onchip_Memory/s1, which is an e_assign
  assign Onchip_Memory_s1_allow_new_arb_cycle = ~CPU_data_master_arbiterlock & ~CPU_instruction_master_arbiterlock;

  //CPU/instruction_master assignment into master qualified-requests vector for Onchip_Memory/s1, which is an e_assign
  assign Onchip_Memory_s1_master_qreq_vector[0] = CPU_instruction_master_qualified_request_Onchip_Memory_s1;

  //CPU/instruction_master grant Onchip_Memory/s1, which is an e_assign
  assign CPU_instruction_master_granted_Onchip_Memory_s1 = Onchip_Memory_s1_grant_vector[0];

  //CPU/instruction_master saved-grant Onchip_Memory/s1, which is an e_assign
  assign CPU_instruction_master_saved_grant_Onchip_Memory_s1 = Onchip_Memory_s1_arb_winner[0] && CPU_instruction_master_requests_Onchip_Memory_s1;

  //CPU/data_master assignment into master qualified-requests vector for Onchip_Memory/s1, which is an e_assign
  assign Onchip_Memory_s1_master_qreq_vector[1] = CPU_data_master_qualified_request_Onchip_Memory_s1;

  //CPU/data_master grant Onchip_Memory/s1, which is an e_assign
  assign CPU_data_master_granted_Onchip_Memory_s1 = Onchip_Memory_s1_grant_vector[1];

  //CPU/data_master saved-grant Onchip_Memory/s1, which is an e_assign
  assign CPU_data_master_saved_grant_Onchip_Memory_s1 = Onchip_Memory_s1_arb_winner[1] && CPU_data_master_requests_Onchip_Memory_s1;

  //Onchip_Memory/s1 chosen-master double-vector, which is an e_assign
  assign Onchip_Memory_s1_chosen_master_double_vector = {Onchip_Memory_s1_master_qreq_vector, Onchip_Memory_s1_master_qreq_vector} & ({~Onchip_Memory_s1_master_qreq_vector, ~Onchip_Memory_s1_master_qreq_vector} + Onchip_Memory_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign Onchip_Memory_s1_arb_winner = (Onchip_Memory_s1_allow_new_arb_cycle & | Onchip_Memory_s1_grant_vector) ? Onchip_Memory_s1_grant_vector : Onchip_Memory_s1_saved_chosen_master_vector;

  //saved Onchip_Memory_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_Memory_s1_saved_chosen_master_vector <= 0;
      else if (Onchip_Memory_s1_allow_new_arb_cycle)
          Onchip_Memory_s1_saved_chosen_master_vector <= |Onchip_Memory_s1_grant_vector ? Onchip_Memory_s1_grant_vector : Onchip_Memory_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign Onchip_Memory_s1_grant_vector = {(Onchip_Memory_s1_chosen_master_double_vector[1] | Onchip_Memory_s1_chosen_master_double_vector[3]),
    (Onchip_Memory_s1_chosen_master_double_vector[0] | Onchip_Memory_s1_chosen_master_double_vector[2])};

  //Onchip_Memory/s1 chosen master rotated left, which is an e_assign
  assign Onchip_Memory_s1_chosen_master_rot_left = (Onchip_Memory_s1_arb_winner << 1) ? (Onchip_Memory_s1_arb_winner << 1) : 1;

  //Onchip_Memory/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_Memory_s1_arb_addend <= 1;
      else if (|Onchip_Memory_s1_grant_vector)
          Onchip_Memory_s1_arb_addend <= Onchip_Memory_s1_end_xfer? Onchip_Memory_s1_chosen_master_rot_left : Onchip_Memory_s1_grant_vector;
    end


  //~Onchip_Memory_s1_reset assignment, which is an e_assign
  assign Onchip_Memory_s1_reset = ~reset_n;

  assign Onchip_Memory_s1_chipselect = CPU_data_master_granted_Onchip_Memory_s1 | CPU_instruction_master_granted_Onchip_Memory_s1;
  //Onchip_Memory_s1_firsttransfer first transaction, which is an e_assign
  assign Onchip_Memory_s1_firsttransfer = Onchip_Memory_s1_begins_xfer ? Onchip_Memory_s1_unreg_firsttransfer : Onchip_Memory_s1_reg_firsttransfer;

  //Onchip_Memory_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign Onchip_Memory_s1_unreg_firsttransfer = ~(Onchip_Memory_s1_slavearbiterlockenable & Onchip_Memory_s1_any_continuerequest);

  //Onchip_Memory_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Onchip_Memory_s1_reg_firsttransfer <= 1'b1;
      else if (Onchip_Memory_s1_begins_xfer)
          Onchip_Memory_s1_reg_firsttransfer <= Onchip_Memory_s1_unreg_firsttransfer;
    end


  //Onchip_Memory_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Onchip_Memory_s1_beginbursttransfer_internal = Onchip_Memory_s1_begins_xfer;

  //Onchip_Memory_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign Onchip_Memory_s1_arbitration_holdoff_internal = Onchip_Memory_s1_begins_xfer & Onchip_Memory_s1_firsttransfer;

  //Onchip_Memory_s1_write assignment, which is an e_mux
  assign Onchip_Memory_s1_write = CPU_data_master_granted_Onchip_Memory_s1 & CPU_data_master_write;

  assign shifted_address_to_Onchip_Memory_s1_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Onchip_Memory_s1_address mux, which is an e_mux
  assign Onchip_Memory_s1_address = (CPU_data_master_granted_Onchip_Memory_s1)? (shifted_address_to_Onchip_Memory_s1_from_CPU_data_master >> 2) :
    (shifted_address_to_Onchip_Memory_s1_from_CPU_instruction_master >> 2);

  assign shifted_address_to_Onchip_Memory_s1_from_CPU_instruction_master = CPU_instruction_master_address_to_slave;
  //d1_Onchip_Memory_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Onchip_Memory_s1_end_xfer <= 1;
      else 
        d1_Onchip_Memory_s1_end_xfer <= Onchip_Memory_s1_end_xfer;
    end


  //Onchip_Memory_s1_waits_for_read in a cycle, which is an e_mux
  assign Onchip_Memory_s1_waits_for_read = Onchip_Memory_s1_in_a_read_cycle & 0;

  //Onchip_Memory_s1_in_a_read_cycle assignment, which is an e_assign
  assign Onchip_Memory_s1_in_a_read_cycle = (CPU_data_master_granted_Onchip_Memory_s1 & CPU_data_master_read) | (CPU_instruction_master_granted_Onchip_Memory_s1 & CPU_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Onchip_Memory_s1_in_a_read_cycle;

  //Onchip_Memory_s1_waits_for_write in a cycle, which is an e_mux
  assign Onchip_Memory_s1_waits_for_write = Onchip_Memory_s1_in_a_write_cycle & 0;

  //Onchip_Memory_s1_in_a_write_cycle assignment, which is an e_assign
  assign Onchip_Memory_s1_in_a_write_cycle = CPU_data_master_granted_Onchip_Memory_s1 & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Onchip_Memory_s1_in_a_write_cycle;

  assign wait_for_Onchip_Memory_s1_counter = 0;
  //Onchip_Memory_s1_byteenable byte enable port mux, which is an e_mux
  assign Onchip_Memory_s1_byteenable = (CPU_data_master_granted_Onchip_Memory_s1)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Onchip_Memory/s1 enable non-zero assertions, which is an e_register
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
      if (CPU_data_master_granted_Onchip_Memory_s1 + CPU_instruction_master_granted_Onchip_Memory_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_saved_grant_Onchip_Memory_s1 + CPU_instruction_master_saved_grant_Onchip_Memory_s1 > 1)
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

module rdv_fifo_for_CPU_data_master_to_Pixel_Buffer_avalon_sram_slave_module (
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

module rdv_fifo_for_Pixel_Buffer_DMA_avalon_pixel_dma_master_to_Pixel_Buffer_avalon_sram_slave_module (
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

module Pixel_Buffer_avalon_sram_slave_arbitrator (
                                                   // inputs:
                                                    CPU_data_master_address_to_slave,
                                                    CPU_data_master_byteenable,
                                                    CPU_data_master_dbs_address,
                                                    CPU_data_master_dbs_write_16,
                                                    CPU_data_master_no_byte_enables_and_last_term,
                                                    CPU_data_master_read,
                                                    CPU_data_master_waitrequest,
                                                    CPU_data_master_write,
                                                    Pixel_Buffer_DMA_avalon_pixel_dma_master_address_to_slave,
                                                    Pixel_Buffer_DMA_avalon_pixel_dma_master_arbiterlock,
                                                    Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter,
                                                    Pixel_Buffer_DMA_avalon_pixel_dma_master_read,
                                                    Pixel_Buffer_avalon_sram_slave_readdata,
                                                    Pixel_Buffer_avalon_sram_slave_readdatavalid,
                                                    clk,
                                                    reset_n,

                                                   // outputs:
                                                    CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave,
                                                    CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave,
                                                    CPU_data_master_qualified_request_Pixel_Buffer_avalon_sram_slave,
                                                    CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave,
                                                    CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register,
                                                    CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave,
                                                    Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_Pixel_Buffer_avalon_sram_slave,
                                                    Pixel_Buffer_DMA_avalon_pixel_dma_master_qualified_request_Pixel_Buffer_avalon_sram_slave,
                                                    Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave,
                                                    Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register,
                                                    Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave,
                                                    Pixel_Buffer_avalon_sram_slave_address,
                                                    Pixel_Buffer_avalon_sram_slave_byteenable,
                                                    Pixel_Buffer_avalon_sram_slave_read,
                                                    Pixel_Buffer_avalon_sram_slave_readdata_from_sa,
                                                    Pixel_Buffer_avalon_sram_slave_reset,
                                                    Pixel_Buffer_avalon_sram_slave_write,
                                                    Pixel_Buffer_avalon_sram_slave_writedata,
                                                    d1_Pixel_Buffer_avalon_sram_slave_end_xfer
                                                 )
;

  output  [  1: 0] CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave;
  output           CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave;
  output           CPU_data_master_qualified_request_Pixel_Buffer_avalon_sram_slave;
  output           CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave;
  output           CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register;
  output           CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave;
  output           Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_Pixel_Buffer_avalon_sram_slave;
  output           Pixel_Buffer_DMA_avalon_pixel_dma_master_qualified_request_Pixel_Buffer_avalon_sram_slave;
  output           Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave;
  output           Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register;
  output           Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave;
  output  [ 19: 0] Pixel_Buffer_avalon_sram_slave_address;
  output  [  1: 0] Pixel_Buffer_avalon_sram_slave_byteenable;
  output           Pixel_Buffer_avalon_sram_slave_read;
  output  [ 15: 0] Pixel_Buffer_avalon_sram_slave_readdata_from_sa;
  output           Pixel_Buffer_avalon_sram_slave_reset;
  output           Pixel_Buffer_avalon_sram_slave_write;
  output  [ 15: 0] Pixel_Buffer_avalon_sram_slave_writedata;
  output           d1_Pixel_Buffer_avalon_sram_slave_end_xfer;
  input   [ 21: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input   [  1: 0] CPU_data_master_dbs_address;
  input   [ 15: 0] CPU_data_master_dbs_write_16;
  input            CPU_data_master_no_byte_enables_and_last_term;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] Pixel_Buffer_DMA_avalon_pixel_dma_master_address_to_slave;
  input            Pixel_Buffer_DMA_avalon_pixel_dma_master_arbiterlock;
  input            Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter;
  input            Pixel_Buffer_DMA_avalon_pixel_dma_master_read;
  input   [ 15: 0] Pixel_Buffer_avalon_sram_slave_readdata;
  input            Pixel_Buffer_avalon_sram_slave_readdatavalid;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire    [  1: 0] CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave;
  wire    [  1: 0] CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave_segment_0;
  wire    [  1: 0] CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave_segment_1;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave;
  wire             CPU_data_master_qualified_request_Pixel_Buffer_avalon_sram_slave;
  wire             CPU_data_master_rdv_fifo_empty_Pixel_Buffer_avalon_sram_slave;
  wire             CPU_data_master_rdv_fifo_output_from_Pixel_Buffer_avalon_sram_slave;
  wire             CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave;
  wire             CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register;
  wire             CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave;
  wire             CPU_data_master_saved_grant_Pixel_Buffer_avalon_sram_slave;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_arbiterlock2;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_continuerequest;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_Pixel_Buffer_avalon_sram_slave;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_qualified_request_Pixel_Buffer_avalon_sram_slave;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_rdv_fifo_empty_Pixel_Buffer_avalon_sram_slave;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_rdv_fifo_output_from_Pixel_Buffer_avalon_sram_slave;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_saved_grant_Pixel_Buffer_avalon_sram_slave;
  wire    [ 19: 0] Pixel_Buffer_avalon_sram_slave_address;
  wire             Pixel_Buffer_avalon_sram_slave_allgrants;
  wire             Pixel_Buffer_avalon_sram_slave_allow_new_arb_cycle;
  wire             Pixel_Buffer_avalon_sram_slave_any_bursting_master_saved_grant;
  wire             Pixel_Buffer_avalon_sram_slave_any_continuerequest;
  reg     [  1: 0] Pixel_Buffer_avalon_sram_slave_arb_addend;
  wire             Pixel_Buffer_avalon_sram_slave_arb_counter_enable;
  reg     [  2: 0] Pixel_Buffer_avalon_sram_slave_arb_share_counter;
  wire    [  2: 0] Pixel_Buffer_avalon_sram_slave_arb_share_counter_next_value;
  wire    [  2: 0] Pixel_Buffer_avalon_sram_slave_arb_share_set_values;
  wire    [  1: 0] Pixel_Buffer_avalon_sram_slave_arb_winner;
  wire             Pixel_Buffer_avalon_sram_slave_arbitration_holdoff_internal;
  wire             Pixel_Buffer_avalon_sram_slave_beginbursttransfer_internal;
  wire             Pixel_Buffer_avalon_sram_slave_begins_xfer;
  wire    [  1: 0] Pixel_Buffer_avalon_sram_slave_byteenable;
  wire    [  3: 0] Pixel_Buffer_avalon_sram_slave_chosen_master_double_vector;
  wire    [  1: 0] Pixel_Buffer_avalon_sram_slave_chosen_master_rot_left;
  wire             Pixel_Buffer_avalon_sram_slave_end_xfer;
  wire             Pixel_Buffer_avalon_sram_slave_firsttransfer;
  wire    [  1: 0] Pixel_Buffer_avalon_sram_slave_grant_vector;
  wire             Pixel_Buffer_avalon_sram_slave_in_a_read_cycle;
  wire             Pixel_Buffer_avalon_sram_slave_in_a_write_cycle;
  wire    [  1: 0] Pixel_Buffer_avalon_sram_slave_master_qreq_vector;
  wire             Pixel_Buffer_avalon_sram_slave_move_on_to_next_transaction;
  wire             Pixel_Buffer_avalon_sram_slave_non_bursting_master_requests;
  wire             Pixel_Buffer_avalon_sram_slave_read;
  wire    [ 15: 0] Pixel_Buffer_avalon_sram_slave_readdata_from_sa;
  wire             Pixel_Buffer_avalon_sram_slave_readdatavalid_from_sa;
  reg              Pixel_Buffer_avalon_sram_slave_reg_firsttransfer;
  wire             Pixel_Buffer_avalon_sram_slave_reset;
  reg     [  1: 0] Pixel_Buffer_avalon_sram_slave_saved_chosen_master_vector;
  reg              Pixel_Buffer_avalon_sram_slave_slavearbiterlockenable;
  wire             Pixel_Buffer_avalon_sram_slave_slavearbiterlockenable2;
  wire             Pixel_Buffer_avalon_sram_slave_unreg_firsttransfer;
  wire             Pixel_Buffer_avalon_sram_slave_waits_for_read;
  wire             Pixel_Buffer_avalon_sram_slave_waits_for_write;
  wire             Pixel_Buffer_avalon_sram_slave_write;
  wire    [ 15: 0] Pixel_Buffer_avalon_sram_slave_writedata;
  reg              d1_Pixel_Buffer_avalon_sram_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Pixel_Buffer_avalon_sram_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_CPU_data_master_granted_slave_Pixel_Buffer_avalon_sram_slave;
  reg              last_cycle_Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_slave_Pixel_Buffer_avalon_sram_slave;
  wire             saved_chosen_master_btw_Pixel_Buffer_DMA_avalon_pixel_dma_master_and_Pixel_Buffer_avalon_sram_slave;
  wire    [ 21: 0] shifted_address_to_Pixel_Buffer_avalon_sram_slave_from_CPU_data_master;
  wire    [ 31: 0] shifted_address_to_Pixel_Buffer_avalon_sram_slave_from_Pixel_Buffer_DMA_avalon_pixel_dma_master;
  wire             wait_for_Pixel_Buffer_avalon_sram_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Pixel_Buffer_avalon_sram_slave_end_xfer;
    end


  assign Pixel_Buffer_avalon_sram_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Pixel_Buffer_avalon_sram_slave | Pixel_Buffer_DMA_avalon_pixel_dma_master_qualified_request_Pixel_Buffer_avalon_sram_slave));
  //assign Pixel_Buffer_avalon_sram_slave_readdata_from_sa = Pixel_Buffer_avalon_sram_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_readdata_from_sa = Pixel_Buffer_avalon_sram_slave_readdata;

  assign CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave = ({CPU_data_master_address_to_slave[21] , 21'b0} == 22'h0) & (CPU_data_master_read | CPU_data_master_write);
  //assign Pixel_Buffer_avalon_sram_slave_readdatavalid_from_sa = Pixel_Buffer_avalon_sram_slave_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_readdatavalid_from_sa = Pixel_Buffer_avalon_sram_slave_readdatavalid;

  //Pixel_Buffer_avalon_sram_slave_arb_share_counter set values, which is an e_mux
  assign Pixel_Buffer_avalon_sram_slave_arb_share_set_values = (CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave)? 2 :
    (CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave)? 2 :
    1;

  //Pixel_Buffer_avalon_sram_slave_non_bursting_master_requests mux, which is an e_mux
  assign Pixel_Buffer_avalon_sram_slave_non_bursting_master_requests = CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave |
    Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave |
    CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave |
    Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave;

  //Pixel_Buffer_avalon_sram_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Pixel_Buffer_avalon_sram_slave_any_bursting_master_saved_grant = 0;

  //Pixel_Buffer_avalon_sram_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_arb_share_counter_next_value = Pixel_Buffer_avalon_sram_slave_firsttransfer ? (Pixel_Buffer_avalon_sram_slave_arb_share_set_values - 1) : |Pixel_Buffer_avalon_sram_slave_arb_share_counter ? (Pixel_Buffer_avalon_sram_slave_arb_share_counter - 1) : 0;

  //Pixel_Buffer_avalon_sram_slave_allgrants all slave grants, which is an e_mux
  assign Pixel_Buffer_avalon_sram_slave_allgrants = (|Pixel_Buffer_avalon_sram_slave_grant_vector) |
    (|Pixel_Buffer_avalon_sram_slave_grant_vector) |
    (|Pixel_Buffer_avalon_sram_slave_grant_vector) |
    (|Pixel_Buffer_avalon_sram_slave_grant_vector);

  //Pixel_Buffer_avalon_sram_slave_end_xfer assignment, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_end_xfer = ~(Pixel_Buffer_avalon_sram_slave_waits_for_read | Pixel_Buffer_avalon_sram_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Pixel_Buffer_avalon_sram_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Pixel_Buffer_avalon_sram_slave = Pixel_Buffer_avalon_sram_slave_end_xfer & (~Pixel_Buffer_avalon_sram_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Pixel_Buffer_avalon_sram_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Pixel_Buffer_avalon_sram_slave & Pixel_Buffer_avalon_sram_slave_allgrants) | (end_xfer_arb_share_counter_term_Pixel_Buffer_avalon_sram_slave & ~Pixel_Buffer_avalon_sram_slave_non_bursting_master_requests);

  //Pixel_Buffer_avalon_sram_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pixel_Buffer_avalon_sram_slave_arb_share_counter <= 0;
      else if (Pixel_Buffer_avalon_sram_slave_arb_counter_enable)
          Pixel_Buffer_avalon_sram_slave_arb_share_counter <= Pixel_Buffer_avalon_sram_slave_arb_share_counter_next_value;
    end


  //Pixel_Buffer_avalon_sram_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pixel_Buffer_avalon_sram_slave_slavearbiterlockenable <= 0;
      else if ((|Pixel_Buffer_avalon_sram_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Pixel_Buffer_avalon_sram_slave) | (end_xfer_arb_share_counter_term_Pixel_Buffer_avalon_sram_slave & ~Pixel_Buffer_avalon_sram_slave_non_bursting_master_requests))
          Pixel_Buffer_avalon_sram_slave_slavearbiterlockenable <= |Pixel_Buffer_avalon_sram_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Pixel_Buffer/avalon_sram_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Pixel_Buffer_avalon_sram_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Pixel_Buffer_avalon_sram_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_slavearbiterlockenable2 = |Pixel_Buffer_avalon_sram_slave_arb_share_counter_next_value;

  //CPU/data_master Pixel_Buffer/avalon_sram_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Pixel_Buffer_avalon_sram_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Pixel_Buffer_DMA/avalon_pixel_dma_master Pixel_Buffer/avalon_sram_slave arbiterlock2, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_pixel_dma_master_arbiterlock2 = Pixel_Buffer_avalon_sram_slave_slavearbiterlockenable2 & Pixel_Buffer_DMA_avalon_pixel_dma_master_continuerequest;

  //Pixel_Buffer_DMA/avalon_pixel_dma_master granted Pixel_Buffer/avalon_sram_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_slave_Pixel_Buffer_avalon_sram_slave <= 0;
      else 
        last_cycle_Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_slave_Pixel_Buffer_avalon_sram_slave <= Pixel_Buffer_DMA_avalon_pixel_dma_master_saved_grant_Pixel_Buffer_avalon_sram_slave ? 1 : (Pixel_Buffer_avalon_sram_slave_arbitration_holdoff_internal | ~Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave) ? 0 : last_cycle_Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_slave_Pixel_Buffer_avalon_sram_slave;
    end


  //Pixel_Buffer_DMA_avalon_pixel_dma_master_continuerequest continued request, which is an e_mux
  assign Pixel_Buffer_DMA_avalon_pixel_dma_master_continuerequest = last_cycle_Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_slave_Pixel_Buffer_avalon_sram_slave & Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave;

  //Pixel_Buffer_avalon_sram_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign Pixel_Buffer_avalon_sram_slave_any_continuerequest = Pixel_Buffer_DMA_avalon_pixel_dma_master_continuerequest |
    CPU_data_master_continuerequest;

  assign CPU_data_master_qualified_request_Pixel_Buffer_avalon_sram_slave = CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave & ~((CPU_data_master_read & (~CPU_data_master_waitrequest | (|CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register))) | ((~CPU_data_master_waitrequest | CPU_data_master_no_byte_enables_and_last_term | !CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave) & CPU_data_master_write) | (Pixel_Buffer_DMA_avalon_pixel_dma_master_arbiterlock & (saved_chosen_master_btw_Pixel_Buffer_DMA_avalon_pixel_dma_master_and_Pixel_Buffer_avalon_sram_slave)));
  //unique name for Pixel_Buffer_avalon_sram_slave_move_on_to_next_transaction, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_move_on_to_next_transaction = Pixel_Buffer_avalon_sram_slave_readdatavalid_from_sa;

  //rdv_fifo_for_CPU_data_master_to_Pixel_Buffer_avalon_sram_slave, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_CPU_data_master_to_Pixel_Buffer_avalon_sram_slave_module rdv_fifo_for_CPU_data_master_to_Pixel_Buffer_avalon_sram_slave
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave),
      .data_out             (CPU_data_master_rdv_fifo_output_from_Pixel_Buffer_avalon_sram_slave),
      .empty                (),
      .fifo_contains_ones_n (CPU_data_master_rdv_fifo_empty_Pixel_Buffer_avalon_sram_slave),
      .full                 (),
      .read                 (Pixel_Buffer_avalon_sram_slave_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~Pixel_Buffer_avalon_sram_slave_waits_for_read)
    );

  assign CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register = ~CPU_data_master_rdv_fifo_empty_Pixel_Buffer_avalon_sram_slave;
  //local readdatavalid CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave = (Pixel_Buffer_avalon_sram_slave_readdatavalid_from_sa & CPU_data_master_rdv_fifo_output_from_Pixel_Buffer_avalon_sram_slave) & ~ CPU_data_master_rdv_fifo_empty_Pixel_Buffer_avalon_sram_slave;

  //Pixel_Buffer_avalon_sram_slave_writedata mux, which is an e_mux
  assign Pixel_Buffer_avalon_sram_slave_writedata = CPU_data_master_dbs_write_16;

  assign Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave = (({Pixel_Buffer_DMA_avalon_pixel_dma_master_address_to_slave[31 : 21] , 21'b0} == 32'h0) & (Pixel_Buffer_DMA_avalon_pixel_dma_master_read)) & Pixel_Buffer_DMA_avalon_pixel_dma_master_read;
  //CPU/data_master granted Pixel_Buffer/avalon_sram_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_data_master_granted_slave_Pixel_Buffer_avalon_sram_slave <= 0;
      else 
        last_cycle_CPU_data_master_granted_slave_Pixel_Buffer_avalon_sram_slave <= CPU_data_master_saved_grant_Pixel_Buffer_avalon_sram_slave ? 1 : (Pixel_Buffer_avalon_sram_slave_arbitration_holdoff_internal | ~CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave) ? 0 : last_cycle_CPU_data_master_granted_slave_Pixel_Buffer_avalon_sram_slave;
    end


  //CPU_data_master_continuerequest continued request, which is an e_mux
  assign CPU_data_master_continuerequest = last_cycle_CPU_data_master_granted_slave_Pixel_Buffer_avalon_sram_slave & CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave;

  assign Pixel_Buffer_DMA_avalon_pixel_dma_master_qualified_request_Pixel_Buffer_avalon_sram_slave = Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave & ~((Pixel_Buffer_DMA_avalon_pixel_dma_master_read & ((Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter != 0) | (1 < Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter))) | CPU_data_master_arbiterlock);
  //rdv_fifo_for_Pixel_Buffer_DMA_avalon_pixel_dma_master_to_Pixel_Buffer_avalon_sram_slave, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_Pixel_Buffer_DMA_avalon_pixel_dma_master_to_Pixel_Buffer_avalon_sram_slave_module rdv_fifo_for_Pixel_Buffer_DMA_avalon_pixel_dma_master_to_Pixel_Buffer_avalon_sram_slave
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_Pixel_Buffer_avalon_sram_slave),
      .data_out             (Pixel_Buffer_DMA_avalon_pixel_dma_master_rdv_fifo_output_from_Pixel_Buffer_avalon_sram_slave),
      .empty                (),
      .fifo_contains_ones_n (Pixel_Buffer_DMA_avalon_pixel_dma_master_rdv_fifo_empty_Pixel_Buffer_avalon_sram_slave),
      .full                 (),
      .read                 (Pixel_Buffer_avalon_sram_slave_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~Pixel_Buffer_avalon_sram_slave_waits_for_read)
    );

  assign Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register = ~Pixel_Buffer_DMA_avalon_pixel_dma_master_rdv_fifo_empty_Pixel_Buffer_avalon_sram_slave;
  //local readdatavalid Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave, which is an e_mux
  assign Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave = (Pixel_Buffer_avalon_sram_slave_readdatavalid_from_sa & Pixel_Buffer_DMA_avalon_pixel_dma_master_rdv_fifo_output_from_Pixel_Buffer_avalon_sram_slave) & ~ Pixel_Buffer_DMA_avalon_pixel_dma_master_rdv_fifo_empty_Pixel_Buffer_avalon_sram_slave;

  //allow new arb cycle for Pixel_Buffer/avalon_sram_slave, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_allow_new_arb_cycle = ~CPU_data_master_arbiterlock & ~(Pixel_Buffer_DMA_avalon_pixel_dma_master_arbiterlock & (saved_chosen_master_btw_Pixel_Buffer_DMA_avalon_pixel_dma_master_and_Pixel_Buffer_avalon_sram_slave));

  //Pixel_Buffer_DMA/avalon_pixel_dma_master assignment into master qualified-requests vector for Pixel_Buffer/avalon_sram_slave, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_master_qreq_vector[0] = Pixel_Buffer_DMA_avalon_pixel_dma_master_qualified_request_Pixel_Buffer_avalon_sram_slave;

  //Pixel_Buffer_DMA/avalon_pixel_dma_master grant Pixel_Buffer/avalon_sram_slave, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_Pixel_Buffer_avalon_sram_slave = Pixel_Buffer_avalon_sram_slave_grant_vector[0];

  //Pixel_Buffer_DMA/avalon_pixel_dma_master saved-grant Pixel_Buffer/avalon_sram_slave, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_pixel_dma_master_saved_grant_Pixel_Buffer_avalon_sram_slave = Pixel_Buffer_avalon_sram_slave_arb_winner[0] && Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave;

  //saved chosen master btw Pixel_Buffer_DMA/avalon_pixel_dma_master and Pixel_Buffer/avalon_sram_slave, which is an e_assign
  assign saved_chosen_master_btw_Pixel_Buffer_DMA_avalon_pixel_dma_master_and_Pixel_Buffer_avalon_sram_slave = Pixel_Buffer_avalon_sram_slave_saved_chosen_master_vector[0];

  //CPU/data_master assignment into master qualified-requests vector for Pixel_Buffer/avalon_sram_slave, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_master_qreq_vector[1] = CPU_data_master_qualified_request_Pixel_Buffer_avalon_sram_slave;

  //CPU/data_master grant Pixel_Buffer/avalon_sram_slave, which is an e_assign
  assign CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave = Pixel_Buffer_avalon_sram_slave_grant_vector[1];

  //CPU/data_master saved-grant Pixel_Buffer/avalon_sram_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Pixel_Buffer_avalon_sram_slave = Pixel_Buffer_avalon_sram_slave_arb_winner[1] && CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave;

  //Pixel_Buffer/avalon_sram_slave chosen-master double-vector, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_chosen_master_double_vector = {Pixel_Buffer_avalon_sram_slave_master_qreq_vector, Pixel_Buffer_avalon_sram_slave_master_qreq_vector} & ({~Pixel_Buffer_avalon_sram_slave_master_qreq_vector, ~Pixel_Buffer_avalon_sram_slave_master_qreq_vector} + Pixel_Buffer_avalon_sram_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign Pixel_Buffer_avalon_sram_slave_arb_winner = (Pixel_Buffer_avalon_sram_slave_allow_new_arb_cycle & | Pixel_Buffer_avalon_sram_slave_grant_vector) ? Pixel_Buffer_avalon_sram_slave_grant_vector : Pixel_Buffer_avalon_sram_slave_saved_chosen_master_vector;

  //saved Pixel_Buffer_avalon_sram_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pixel_Buffer_avalon_sram_slave_saved_chosen_master_vector <= 0;
      else if (Pixel_Buffer_avalon_sram_slave_allow_new_arb_cycle)
          Pixel_Buffer_avalon_sram_slave_saved_chosen_master_vector <= |Pixel_Buffer_avalon_sram_slave_grant_vector ? Pixel_Buffer_avalon_sram_slave_grant_vector : Pixel_Buffer_avalon_sram_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign Pixel_Buffer_avalon_sram_slave_grant_vector = {(Pixel_Buffer_avalon_sram_slave_chosen_master_double_vector[1] | Pixel_Buffer_avalon_sram_slave_chosen_master_double_vector[3]),
    (Pixel_Buffer_avalon_sram_slave_chosen_master_double_vector[0] | Pixel_Buffer_avalon_sram_slave_chosen_master_double_vector[2])};

  //Pixel_Buffer/avalon_sram_slave chosen master rotated left, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_chosen_master_rot_left = (Pixel_Buffer_avalon_sram_slave_arb_winner << 1) ? (Pixel_Buffer_avalon_sram_slave_arb_winner << 1) : 1;

  //Pixel_Buffer/avalon_sram_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pixel_Buffer_avalon_sram_slave_arb_addend <= 1;
      else if (|Pixel_Buffer_avalon_sram_slave_grant_vector)
          Pixel_Buffer_avalon_sram_slave_arb_addend <= Pixel_Buffer_avalon_sram_slave_end_xfer? Pixel_Buffer_avalon_sram_slave_chosen_master_rot_left : Pixel_Buffer_avalon_sram_slave_grant_vector;
    end


  //~Pixel_Buffer_avalon_sram_slave_reset assignment, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_reset = ~reset_n;

  //Pixel_Buffer_avalon_sram_slave_firsttransfer first transaction, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_firsttransfer = Pixel_Buffer_avalon_sram_slave_begins_xfer ? Pixel_Buffer_avalon_sram_slave_unreg_firsttransfer : Pixel_Buffer_avalon_sram_slave_reg_firsttransfer;

  //Pixel_Buffer_avalon_sram_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_unreg_firsttransfer = ~(Pixel_Buffer_avalon_sram_slave_slavearbiterlockenable & Pixel_Buffer_avalon_sram_slave_any_continuerequest);

  //Pixel_Buffer_avalon_sram_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pixel_Buffer_avalon_sram_slave_reg_firsttransfer <= 1'b1;
      else if (Pixel_Buffer_avalon_sram_slave_begins_xfer)
          Pixel_Buffer_avalon_sram_slave_reg_firsttransfer <= Pixel_Buffer_avalon_sram_slave_unreg_firsttransfer;
    end


  //Pixel_Buffer_avalon_sram_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_beginbursttransfer_internal = Pixel_Buffer_avalon_sram_slave_begins_xfer;

  //Pixel_Buffer_avalon_sram_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_arbitration_holdoff_internal = Pixel_Buffer_avalon_sram_slave_begins_xfer & Pixel_Buffer_avalon_sram_slave_firsttransfer;

  //Pixel_Buffer_avalon_sram_slave_read assignment, which is an e_mux
  assign Pixel_Buffer_avalon_sram_slave_read = (CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave & CPU_data_master_read) | (Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_Pixel_Buffer_avalon_sram_slave & Pixel_Buffer_DMA_avalon_pixel_dma_master_read);

  //Pixel_Buffer_avalon_sram_slave_write assignment, which is an e_mux
  assign Pixel_Buffer_avalon_sram_slave_write = CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave & CPU_data_master_write;

  assign shifted_address_to_Pixel_Buffer_avalon_sram_slave_from_CPU_data_master = {CPU_data_master_address_to_slave >> 2,
    CPU_data_master_dbs_address[1],
    {1 {1'b0}}};

  //Pixel_Buffer_avalon_sram_slave_address mux, which is an e_mux
  assign Pixel_Buffer_avalon_sram_slave_address = (CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave)? (shifted_address_to_Pixel_Buffer_avalon_sram_slave_from_CPU_data_master >> 1) :
    (shifted_address_to_Pixel_Buffer_avalon_sram_slave_from_Pixel_Buffer_DMA_avalon_pixel_dma_master >> 1);

  assign shifted_address_to_Pixel_Buffer_avalon_sram_slave_from_Pixel_Buffer_DMA_avalon_pixel_dma_master = Pixel_Buffer_DMA_avalon_pixel_dma_master_address_to_slave;
  //d1_Pixel_Buffer_avalon_sram_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Pixel_Buffer_avalon_sram_slave_end_xfer <= 1;
      else 
        d1_Pixel_Buffer_avalon_sram_slave_end_xfer <= Pixel_Buffer_avalon_sram_slave_end_xfer;
    end


  //Pixel_Buffer_avalon_sram_slave_waits_for_read in a cycle, which is an e_mux
  assign Pixel_Buffer_avalon_sram_slave_waits_for_read = Pixel_Buffer_avalon_sram_slave_in_a_read_cycle & 0;

  //Pixel_Buffer_avalon_sram_slave_in_a_read_cycle assignment, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_in_a_read_cycle = (CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave & CPU_data_master_read) | (Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_Pixel_Buffer_avalon_sram_slave & Pixel_Buffer_DMA_avalon_pixel_dma_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Pixel_Buffer_avalon_sram_slave_in_a_read_cycle;

  //Pixel_Buffer_avalon_sram_slave_waits_for_write in a cycle, which is an e_mux
  assign Pixel_Buffer_avalon_sram_slave_waits_for_write = Pixel_Buffer_avalon_sram_slave_in_a_write_cycle & 0;

  //Pixel_Buffer_avalon_sram_slave_in_a_write_cycle assignment, which is an e_assign
  assign Pixel_Buffer_avalon_sram_slave_in_a_write_cycle = CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Pixel_Buffer_avalon_sram_slave_in_a_write_cycle;

  assign wait_for_Pixel_Buffer_avalon_sram_slave_counter = 0;
  //Pixel_Buffer_avalon_sram_slave_byteenable byte enable port mux, which is an e_mux
  assign Pixel_Buffer_avalon_sram_slave_byteenable = (CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave)? CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave :
    -1;

  assign {CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave_segment_1,
CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave_segment_0} = CPU_data_master_byteenable;
  assign CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave = ((CPU_data_master_dbs_address[1] == 0))? CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave_segment_0 :
    CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Pixel_Buffer/avalon_sram_slave enable non-zero assertions, which is an e_register
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
      if (CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave + Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_Pixel_Buffer_avalon_sram_slave > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_saved_grant_Pixel_Buffer_avalon_sram_slave + Pixel_Buffer_DMA_avalon_pixel_dma_master_saved_grant_Pixel_Buffer_avalon_sram_slave > 1)
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

module Pixel_Buffer_DMA_avalon_control_slave_arbitrator (
                                                          // inputs:
                                                           CPU_data_master_address_to_slave,
                                                           CPU_data_master_byteenable,
                                                           CPU_data_master_read,
                                                           CPU_data_master_waitrequest,
                                                           CPU_data_master_write,
                                                           CPU_data_master_writedata,
                                                           Pixel_Buffer_DMA_avalon_control_slave_readdata,
                                                           clk,
                                                           reset_n,

                                                          // outputs:
                                                           CPU_data_master_granted_Pixel_Buffer_DMA_avalon_control_slave,
                                                           CPU_data_master_qualified_request_Pixel_Buffer_DMA_avalon_control_slave,
                                                           CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave,
                                                           CPU_data_master_requests_Pixel_Buffer_DMA_avalon_control_slave,
                                                           Pixel_Buffer_DMA_avalon_control_slave_address,
                                                           Pixel_Buffer_DMA_avalon_control_slave_byteenable,
                                                           Pixel_Buffer_DMA_avalon_control_slave_read,
                                                           Pixel_Buffer_DMA_avalon_control_slave_readdata_from_sa,
                                                           Pixel_Buffer_DMA_avalon_control_slave_write,
                                                           Pixel_Buffer_DMA_avalon_control_slave_writedata,
                                                           d1_Pixel_Buffer_DMA_avalon_control_slave_end_xfer,
                                                           registered_CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave
                                                        )
;

  output           CPU_data_master_granted_Pixel_Buffer_DMA_avalon_control_slave;
  output           CPU_data_master_qualified_request_Pixel_Buffer_DMA_avalon_control_slave;
  output           CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave;
  output           CPU_data_master_requests_Pixel_Buffer_DMA_avalon_control_slave;
  output  [  1: 0] Pixel_Buffer_DMA_avalon_control_slave_address;
  output  [  3: 0] Pixel_Buffer_DMA_avalon_control_slave_byteenable;
  output           Pixel_Buffer_DMA_avalon_control_slave_read;
  output  [ 31: 0] Pixel_Buffer_DMA_avalon_control_slave_readdata_from_sa;
  output           Pixel_Buffer_DMA_avalon_control_slave_write;
  output  [ 31: 0] Pixel_Buffer_DMA_avalon_control_slave_writedata;
  output           d1_Pixel_Buffer_DMA_avalon_control_slave_end_xfer;
  output           registered_CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave;
  input   [ 21: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] Pixel_Buffer_DMA_avalon_control_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Pixel_Buffer_DMA_avalon_control_slave;
  wire             CPU_data_master_qualified_request_Pixel_Buffer_DMA_avalon_control_slave;
  wire             CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave;
  reg              CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave_shift_register_in;
  wire             CPU_data_master_requests_Pixel_Buffer_DMA_avalon_control_slave;
  wire             CPU_data_master_saved_grant_Pixel_Buffer_DMA_avalon_control_slave;
  wire    [  1: 0] Pixel_Buffer_DMA_avalon_control_slave_address;
  wire             Pixel_Buffer_DMA_avalon_control_slave_allgrants;
  wire             Pixel_Buffer_DMA_avalon_control_slave_allow_new_arb_cycle;
  wire             Pixel_Buffer_DMA_avalon_control_slave_any_bursting_master_saved_grant;
  wire             Pixel_Buffer_DMA_avalon_control_slave_any_continuerequest;
  wire             Pixel_Buffer_DMA_avalon_control_slave_arb_counter_enable;
  reg     [  2: 0] Pixel_Buffer_DMA_avalon_control_slave_arb_share_counter;
  wire    [  2: 0] Pixel_Buffer_DMA_avalon_control_slave_arb_share_counter_next_value;
  wire    [  2: 0] Pixel_Buffer_DMA_avalon_control_slave_arb_share_set_values;
  wire             Pixel_Buffer_DMA_avalon_control_slave_beginbursttransfer_internal;
  wire             Pixel_Buffer_DMA_avalon_control_slave_begins_xfer;
  wire    [  3: 0] Pixel_Buffer_DMA_avalon_control_slave_byteenable;
  wire             Pixel_Buffer_DMA_avalon_control_slave_end_xfer;
  wire             Pixel_Buffer_DMA_avalon_control_slave_firsttransfer;
  wire             Pixel_Buffer_DMA_avalon_control_slave_grant_vector;
  wire             Pixel_Buffer_DMA_avalon_control_slave_in_a_read_cycle;
  wire             Pixel_Buffer_DMA_avalon_control_slave_in_a_write_cycle;
  wire             Pixel_Buffer_DMA_avalon_control_slave_master_qreq_vector;
  wire             Pixel_Buffer_DMA_avalon_control_slave_non_bursting_master_requests;
  wire             Pixel_Buffer_DMA_avalon_control_slave_read;
  wire    [ 31: 0] Pixel_Buffer_DMA_avalon_control_slave_readdata_from_sa;
  reg              Pixel_Buffer_DMA_avalon_control_slave_reg_firsttransfer;
  reg              Pixel_Buffer_DMA_avalon_control_slave_slavearbiterlockenable;
  wire             Pixel_Buffer_DMA_avalon_control_slave_slavearbiterlockenable2;
  wire             Pixel_Buffer_DMA_avalon_control_slave_unreg_firsttransfer;
  wire             Pixel_Buffer_DMA_avalon_control_slave_waits_for_read;
  wire             Pixel_Buffer_DMA_avalon_control_slave_waits_for_write;
  wire             Pixel_Buffer_DMA_avalon_control_slave_write;
  wire    [ 31: 0] Pixel_Buffer_DMA_avalon_control_slave_writedata;
  reg              d1_Pixel_Buffer_DMA_avalon_control_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Pixel_Buffer_DMA_avalon_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave_shift_register;
  wire             registered_CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave;
  wire    [ 21: 0] shifted_address_to_Pixel_Buffer_DMA_avalon_control_slave_from_CPU_data_master;
  wire             wait_for_Pixel_Buffer_DMA_avalon_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Pixel_Buffer_DMA_avalon_control_slave_end_xfer;
    end


  assign Pixel_Buffer_DMA_avalon_control_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Pixel_Buffer_DMA_avalon_control_slave));
  //assign Pixel_Buffer_DMA_avalon_control_slave_readdata_from_sa = Pixel_Buffer_DMA_avalon_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_control_slave_readdata_from_sa = Pixel_Buffer_DMA_avalon_control_slave_readdata;

  assign CPU_data_master_requests_Pixel_Buffer_DMA_avalon_control_slave = ({CPU_data_master_address_to_slave[21 : 4] , 4'b0} == 22'h301000) & (CPU_data_master_read | CPU_data_master_write);
  //registered rdv signal_name registered_CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave assignment, which is an e_assign
  assign registered_CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave = CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave_shift_register_in;

  //Pixel_Buffer_DMA_avalon_control_slave_arb_share_counter set values, which is an e_mux
  assign Pixel_Buffer_DMA_avalon_control_slave_arb_share_set_values = 1;

  //Pixel_Buffer_DMA_avalon_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign Pixel_Buffer_DMA_avalon_control_slave_non_bursting_master_requests = CPU_data_master_requests_Pixel_Buffer_DMA_avalon_control_slave;

  //Pixel_Buffer_DMA_avalon_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Pixel_Buffer_DMA_avalon_control_slave_any_bursting_master_saved_grant = 0;

  //Pixel_Buffer_DMA_avalon_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_control_slave_arb_share_counter_next_value = Pixel_Buffer_DMA_avalon_control_slave_firsttransfer ? (Pixel_Buffer_DMA_avalon_control_slave_arb_share_set_values - 1) : |Pixel_Buffer_DMA_avalon_control_slave_arb_share_counter ? (Pixel_Buffer_DMA_avalon_control_slave_arb_share_counter - 1) : 0;

  //Pixel_Buffer_DMA_avalon_control_slave_allgrants all slave grants, which is an e_mux
  assign Pixel_Buffer_DMA_avalon_control_slave_allgrants = |Pixel_Buffer_DMA_avalon_control_slave_grant_vector;

  //Pixel_Buffer_DMA_avalon_control_slave_end_xfer assignment, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_control_slave_end_xfer = ~(Pixel_Buffer_DMA_avalon_control_slave_waits_for_read | Pixel_Buffer_DMA_avalon_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_Pixel_Buffer_DMA_avalon_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Pixel_Buffer_DMA_avalon_control_slave = Pixel_Buffer_DMA_avalon_control_slave_end_xfer & (~Pixel_Buffer_DMA_avalon_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Pixel_Buffer_DMA_avalon_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Pixel_Buffer_DMA_avalon_control_slave & Pixel_Buffer_DMA_avalon_control_slave_allgrants) | (end_xfer_arb_share_counter_term_Pixel_Buffer_DMA_avalon_control_slave & ~Pixel_Buffer_DMA_avalon_control_slave_non_bursting_master_requests);

  //Pixel_Buffer_DMA_avalon_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pixel_Buffer_DMA_avalon_control_slave_arb_share_counter <= 0;
      else if (Pixel_Buffer_DMA_avalon_control_slave_arb_counter_enable)
          Pixel_Buffer_DMA_avalon_control_slave_arb_share_counter <= Pixel_Buffer_DMA_avalon_control_slave_arb_share_counter_next_value;
    end


  //Pixel_Buffer_DMA_avalon_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pixel_Buffer_DMA_avalon_control_slave_slavearbiterlockenable <= 0;
      else if ((|Pixel_Buffer_DMA_avalon_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Pixel_Buffer_DMA_avalon_control_slave) | (end_xfer_arb_share_counter_term_Pixel_Buffer_DMA_avalon_control_slave & ~Pixel_Buffer_DMA_avalon_control_slave_non_bursting_master_requests))
          Pixel_Buffer_DMA_avalon_control_slave_slavearbiterlockenable <= |Pixel_Buffer_DMA_avalon_control_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Pixel_Buffer_DMA/avalon_control_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Pixel_Buffer_DMA_avalon_control_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Pixel_Buffer_DMA_avalon_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_control_slave_slavearbiterlockenable2 = |Pixel_Buffer_DMA_avalon_control_slave_arb_share_counter_next_value;

  //CPU/data_master Pixel_Buffer_DMA/avalon_control_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Pixel_Buffer_DMA_avalon_control_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Pixel_Buffer_DMA_avalon_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_control_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Pixel_Buffer_DMA_avalon_control_slave = CPU_data_master_requests_Pixel_Buffer_DMA_avalon_control_slave & ~((CPU_data_master_read & ((|CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave_shift_register))) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave_shift_register_in = CPU_data_master_granted_Pixel_Buffer_DMA_avalon_control_slave & CPU_data_master_read & ~Pixel_Buffer_DMA_avalon_control_slave_waits_for_read & ~(|CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave_shift_register);

  //shift register p1 CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave_shift_register = {CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave_shift_register, CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave_shift_register_in};

  //CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave_shift_register <= p1_CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave = CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave_shift_register;

  //Pixel_Buffer_DMA_avalon_control_slave_writedata mux, which is an e_mux
  assign Pixel_Buffer_DMA_avalon_control_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_Pixel_Buffer_DMA_avalon_control_slave = CPU_data_master_qualified_request_Pixel_Buffer_DMA_avalon_control_slave;

  //CPU/data_master saved-grant Pixel_Buffer_DMA/avalon_control_slave, which is an e_assign
  assign CPU_data_master_saved_grant_Pixel_Buffer_DMA_avalon_control_slave = CPU_data_master_requests_Pixel_Buffer_DMA_avalon_control_slave;

  //allow new arb cycle for Pixel_Buffer_DMA/avalon_control_slave, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Pixel_Buffer_DMA_avalon_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Pixel_Buffer_DMA_avalon_control_slave_master_qreq_vector = 1;

  //Pixel_Buffer_DMA_avalon_control_slave_firsttransfer first transaction, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_control_slave_firsttransfer = Pixel_Buffer_DMA_avalon_control_slave_begins_xfer ? Pixel_Buffer_DMA_avalon_control_slave_unreg_firsttransfer : Pixel_Buffer_DMA_avalon_control_slave_reg_firsttransfer;

  //Pixel_Buffer_DMA_avalon_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_control_slave_unreg_firsttransfer = ~(Pixel_Buffer_DMA_avalon_control_slave_slavearbiterlockenable & Pixel_Buffer_DMA_avalon_control_slave_any_continuerequest);

  //Pixel_Buffer_DMA_avalon_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pixel_Buffer_DMA_avalon_control_slave_reg_firsttransfer <= 1'b1;
      else if (Pixel_Buffer_DMA_avalon_control_slave_begins_xfer)
          Pixel_Buffer_DMA_avalon_control_slave_reg_firsttransfer <= Pixel_Buffer_DMA_avalon_control_slave_unreg_firsttransfer;
    end


  //Pixel_Buffer_DMA_avalon_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_control_slave_beginbursttransfer_internal = Pixel_Buffer_DMA_avalon_control_slave_begins_xfer;

  //Pixel_Buffer_DMA_avalon_control_slave_read assignment, which is an e_mux
  assign Pixel_Buffer_DMA_avalon_control_slave_read = CPU_data_master_granted_Pixel_Buffer_DMA_avalon_control_slave & CPU_data_master_read;

  //Pixel_Buffer_DMA_avalon_control_slave_write assignment, which is an e_mux
  assign Pixel_Buffer_DMA_avalon_control_slave_write = CPU_data_master_granted_Pixel_Buffer_DMA_avalon_control_slave & CPU_data_master_write;

  assign shifted_address_to_Pixel_Buffer_DMA_avalon_control_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Pixel_Buffer_DMA_avalon_control_slave_address mux, which is an e_mux
  assign Pixel_Buffer_DMA_avalon_control_slave_address = shifted_address_to_Pixel_Buffer_DMA_avalon_control_slave_from_CPU_data_master >> 2;

  //d1_Pixel_Buffer_DMA_avalon_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Pixel_Buffer_DMA_avalon_control_slave_end_xfer <= 1;
      else 
        d1_Pixel_Buffer_DMA_avalon_control_slave_end_xfer <= Pixel_Buffer_DMA_avalon_control_slave_end_xfer;
    end


  //Pixel_Buffer_DMA_avalon_control_slave_waits_for_read in a cycle, which is an e_mux
  assign Pixel_Buffer_DMA_avalon_control_slave_waits_for_read = Pixel_Buffer_DMA_avalon_control_slave_in_a_read_cycle & 0;

  //Pixel_Buffer_DMA_avalon_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_control_slave_in_a_read_cycle = CPU_data_master_granted_Pixel_Buffer_DMA_avalon_control_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Pixel_Buffer_DMA_avalon_control_slave_in_a_read_cycle;

  //Pixel_Buffer_DMA_avalon_control_slave_waits_for_write in a cycle, which is an e_mux
  assign Pixel_Buffer_DMA_avalon_control_slave_waits_for_write = Pixel_Buffer_DMA_avalon_control_slave_in_a_write_cycle & 0;

  //Pixel_Buffer_DMA_avalon_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_control_slave_in_a_write_cycle = CPU_data_master_granted_Pixel_Buffer_DMA_avalon_control_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Pixel_Buffer_DMA_avalon_control_slave_in_a_write_cycle;

  assign wait_for_Pixel_Buffer_DMA_avalon_control_slave_counter = 0;
  //Pixel_Buffer_DMA_avalon_control_slave_byteenable byte enable port mux, which is an e_mux
  assign Pixel_Buffer_DMA_avalon_control_slave_byteenable = (CPU_data_master_granted_Pixel_Buffer_DMA_avalon_control_slave)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Pixel_Buffer_DMA/avalon_control_slave enable non-zero assertions, which is an e_register
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

module Pixel_Buffer_DMA_avalon_pixel_dma_master_arbitrator (
                                                             // inputs:
                                                              Pixel_Buffer_DMA_avalon_pixel_dma_master_address,
                                                              Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_Pixel_Buffer_avalon_sram_slave,
                                                              Pixel_Buffer_DMA_avalon_pixel_dma_master_qualified_request_Pixel_Buffer_avalon_sram_slave,
                                                              Pixel_Buffer_DMA_avalon_pixel_dma_master_read,
                                                              Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave,
                                                              Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register,
                                                              Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave,
                                                              Pixel_Buffer_avalon_sram_slave_readdata_from_sa,
                                                              clk,
                                                              d1_Pixel_Buffer_avalon_sram_slave_end_xfer,
                                                              reset_n,

                                                             // outputs:
                                                              Pixel_Buffer_DMA_avalon_pixel_dma_master_address_to_slave,
                                                              Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter,
                                                              Pixel_Buffer_DMA_avalon_pixel_dma_master_readdata,
                                                              Pixel_Buffer_DMA_avalon_pixel_dma_master_readdatavalid,
                                                              Pixel_Buffer_DMA_avalon_pixel_dma_master_reset,
                                                              Pixel_Buffer_DMA_avalon_pixel_dma_master_waitrequest
                                                           )
;

  output  [ 31: 0] Pixel_Buffer_DMA_avalon_pixel_dma_master_address_to_slave;
  output           Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter;
  output  [ 15: 0] Pixel_Buffer_DMA_avalon_pixel_dma_master_readdata;
  output           Pixel_Buffer_DMA_avalon_pixel_dma_master_readdatavalid;
  output           Pixel_Buffer_DMA_avalon_pixel_dma_master_reset;
  output           Pixel_Buffer_DMA_avalon_pixel_dma_master_waitrequest;
  input   [ 31: 0] Pixel_Buffer_DMA_avalon_pixel_dma_master_address;
  input            Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_Pixel_Buffer_avalon_sram_slave;
  input            Pixel_Buffer_DMA_avalon_pixel_dma_master_qualified_request_Pixel_Buffer_avalon_sram_slave;
  input            Pixel_Buffer_DMA_avalon_pixel_dma_master_read;
  input            Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave;
  input            Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register;
  input            Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave;
  input   [ 15: 0] Pixel_Buffer_avalon_sram_slave_readdata_from_sa;
  input            clk;
  input            d1_Pixel_Buffer_avalon_sram_slave_end_xfer;
  input            reset_n;

  reg     [ 31: 0] Pixel_Buffer_DMA_avalon_pixel_dma_master_address_last_time;
  wire    [ 31: 0] Pixel_Buffer_DMA_avalon_pixel_dma_master_address_to_slave;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_is_granted_some_slave;
  reg              Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter;
  reg              Pixel_Buffer_DMA_avalon_pixel_dma_master_read_but_no_slave_selected;
  reg              Pixel_Buffer_DMA_avalon_pixel_dma_master_read_last_time;
  wire    [ 15: 0] Pixel_Buffer_DMA_avalon_pixel_dma_master_readdata;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_readdatavalid;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_reset;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_run;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_waitrequest;
  reg              active_and_waiting_last_time;
  wire             latency_load_value;
  wire             p1_Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter;
  wire             pre_flush_Pixel_Buffer_DMA_avalon_pixel_dma_master_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (Pixel_Buffer_DMA_avalon_pixel_dma_master_qualified_request_Pixel_Buffer_avalon_sram_slave | ~Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave) & (Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_Pixel_Buffer_avalon_sram_slave | ~Pixel_Buffer_DMA_avalon_pixel_dma_master_qualified_request_Pixel_Buffer_avalon_sram_slave) & ((~Pixel_Buffer_DMA_avalon_pixel_dma_master_qualified_request_Pixel_Buffer_avalon_sram_slave | ~Pixel_Buffer_DMA_avalon_pixel_dma_master_read | (1 & Pixel_Buffer_DMA_avalon_pixel_dma_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_pixel_dma_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign Pixel_Buffer_DMA_avalon_pixel_dma_master_address_to_slave = {11'b0,
    Pixel_Buffer_DMA_avalon_pixel_dma_master_address[20 : 0]};

  //Pixel_Buffer_DMA_avalon_pixel_dma_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pixel_Buffer_DMA_avalon_pixel_dma_master_read_but_no_slave_selected <= 0;
      else 
        Pixel_Buffer_DMA_avalon_pixel_dma_master_read_but_no_slave_selected <= Pixel_Buffer_DMA_avalon_pixel_dma_master_read & Pixel_Buffer_DMA_avalon_pixel_dma_master_run & ~Pixel_Buffer_DMA_avalon_pixel_dma_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign Pixel_Buffer_DMA_avalon_pixel_dma_master_is_granted_some_slave = Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_Pixel_Buffer_avalon_sram_slave;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_Pixel_Buffer_DMA_avalon_pixel_dma_master_readdatavalid = Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign Pixel_Buffer_DMA_avalon_pixel_dma_master_readdatavalid = Pixel_Buffer_DMA_avalon_pixel_dma_master_read_but_no_slave_selected |
    pre_flush_Pixel_Buffer_DMA_avalon_pixel_dma_master_readdatavalid;

  //Pixel_Buffer_DMA/avalon_pixel_dma_master readdata mux, which is an e_mux
  assign Pixel_Buffer_DMA_avalon_pixel_dma_master_readdata = Pixel_Buffer_avalon_sram_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_pixel_dma_master_waitrequest = ~Pixel_Buffer_DMA_avalon_pixel_dma_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter <= 0;
      else 
        Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter <= p1_Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter = ((Pixel_Buffer_DMA_avalon_pixel_dma_master_run & Pixel_Buffer_DMA_avalon_pixel_dma_master_read))? latency_load_value :
    (Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter)? Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;

  //~Pixel_Buffer_DMA_avalon_pixel_dma_master_reset assignment, which is an e_assign
  assign Pixel_Buffer_DMA_avalon_pixel_dma_master_reset = ~reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Pixel_Buffer_DMA_avalon_pixel_dma_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pixel_Buffer_DMA_avalon_pixel_dma_master_address_last_time <= 0;
      else 
        Pixel_Buffer_DMA_avalon_pixel_dma_master_address_last_time <= Pixel_Buffer_DMA_avalon_pixel_dma_master_address;
    end


  //Pixel_Buffer_DMA/avalon_pixel_dma_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= Pixel_Buffer_DMA_avalon_pixel_dma_master_waitrequest & (Pixel_Buffer_DMA_avalon_pixel_dma_master_read);
    end


  //Pixel_Buffer_DMA_avalon_pixel_dma_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Pixel_Buffer_DMA_avalon_pixel_dma_master_address != Pixel_Buffer_DMA_avalon_pixel_dma_master_address_last_time))
        begin
          $write("%0d ns: Pixel_Buffer_DMA_avalon_pixel_dma_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //Pixel_Buffer_DMA_avalon_pixel_dma_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Pixel_Buffer_DMA_avalon_pixel_dma_master_read_last_time <= 0;
      else 
        Pixel_Buffer_DMA_avalon_pixel_dma_master_read_last_time <= Pixel_Buffer_DMA_avalon_pixel_dma_master_read;
    end


  //Pixel_Buffer_DMA_avalon_pixel_dma_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Pixel_Buffer_DMA_avalon_pixel_dma_master_read != Pixel_Buffer_DMA_avalon_pixel_dma_master_read_last_time))
        begin
          $write("%0d ns: Pixel_Buffer_DMA_avalon_pixel_dma_master_read did not heed wait!!!", $time);
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

module Pixel_Buffer_DMA_avalon_pixel_source_arbitrator (
                                                         // inputs:
                                                          Pixel_Buffer_DMA_avalon_pixel_source_data,
                                                          Pixel_Buffer_DMA_avalon_pixel_source_endofpacket,
                                                          Pixel_Buffer_DMA_avalon_pixel_source_startofpacket,
                                                          Pixel_Buffer_DMA_avalon_pixel_source_valid,
                                                          Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa,
                                                          clk,
                                                          reset_n,

                                                         // outputs:
                                                          Pixel_Buffer_DMA_avalon_pixel_source_ready
                                                       )
;

  output           Pixel_Buffer_DMA_avalon_pixel_source_ready;
  input   [ 15: 0] Pixel_Buffer_DMA_avalon_pixel_source_data;
  input            Pixel_Buffer_DMA_avalon_pixel_source_endofpacket;
  input            Pixel_Buffer_DMA_avalon_pixel_source_startofpacket;
  input            Pixel_Buffer_DMA_avalon_pixel_source_valid;
  input            Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa;
  input            clk;
  input            reset_n;

  wire             Pixel_Buffer_DMA_avalon_pixel_source_ready;
  //mux Pixel_Buffer_DMA_avalon_pixel_source_ready, which is an e_mux
  assign Pixel_Buffer_DMA_avalon_pixel_source_ready = Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Pixel_RGB_Resampler_avalon_rgb_sink_arbitrator (
                                                        // inputs:
                                                         Pixel_Buffer_DMA_avalon_pixel_source_data,
                                                         Pixel_Buffer_DMA_avalon_pixel_source_endofpacket,
                                                         Pixel_Buffer_DMA_avalon_pixel_source_startofpacket,
                                                         Pixel_Buffer_DMA_avalon_pixel_source_valid,
                                                         Pixel_RGB_Resampler_avalon_rgb_sink_ready,
                                                         clk,
                                                         reset_n,

                                                        // outputs:
                                                         Pixel_RGB_Resampler_avalon_rgb_sink_data,
                                                         Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket,
                                                         Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa,
                                                         Pixel_RGB_Resampler_avalon_rgb_sink_reset,
                                                         Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket,
                                                         Pixel_RGB_Resampler_avalon_rgb_sink_valid
                                                      )
;

  output  [ 15: 0] Pixel_RGB_Resampler_avalon_rgb_sink_data;
  output           Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket;
  output           Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa;
  output           Pixel_RGB_Resampler_avalon_rgb_sink_reset;
  output           Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket;
  output           Pixel_RGB_Resampler_avalon_rgb_sink_valid;
  input   [ 15: 0] Pixel_Buffer_DMA_avalon_pixel_source_data;
  input            Pixel_Buffer_DMA_avalon_pixel_source_endofpacket;
  input            Pixel_Buffer_DMA_avalon_pixel_source_startofpacket;
  input            Pixel_Buffer_DMA_avalon_pixel_source_valid;
  input            Pixel_RGB_Resampler_avalon_rgb_sink_ready;
  input            clk;
  input            reset_n;

  wire    [ 15: 0] Pixel_RGB_Resampler_avalon_rgb_sink_data;
  wire             Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket;
  wire             Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa;
  wire             Pixel_RGB_Resampler_avalon_rgb_sink_reset;
  wire             Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket;
  wire             Pixel_RGB_Resampler_avalon_rgb_sink_valid;
  //mux Pixel_RGB_Resampler_avalon_rgb_sink_data, which is an e_mux
  assign Pixel_RGB_Resampler_avalon_rgb_sink_data = Pixel_Buffer_DMA_avalon_pixel_source_data;

  //mux Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket, which is an e_mux
  assign Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket = Pixel_Buffer_DMA_avalon_pixel_source_endofpacket;

  //assign Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa = Pixel_RGB_Resampler_avalon_rgb_sink_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa = Pixel_RGB_Resampler_avalon_rgb_sink_ready;

  //mux Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket, which is an e_mux
  assign Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket = Pixel_Buffer_DMA_avalon_pixel_source_startofpacket;

  //mux Pixel_RGB_Resampler_avalon_rgb_sink_valid, which is an e_mux
  assign Pixel_RGB_Resampler_avalon_rgb_sink_valid = Pixel_Buffer_DMA_avalon_pixel_source_valid;

  //~Pixel_RGB_Resampler_avalon_rgb_sink_reset assignment, which is an e_assign
  assign Pixel_RGB_Resampler_avalon_rgb_sink_reset = ~reset_n;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Pixel_RGB_Resampler_avalon_rgb_source_arbitrator (
                                                          // inputs:
                                                           Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa,
                                                           Pixel_RGB_Resampler_avalon_rgb_source_data,
                                                           Pixel_RGB_Resampler_avalon_rgb_source_endofpacket,
                                                           Pixel_RGB_Resampler_avalon_rgb_source_startofpacket,
                                                           Pixel_RGB_Resampler_avalon_rgb_source_valid,
                                                           clk,
                                                           reset_n,

                                                          // outputs:
                                                           Pixel_RGB_Resampler_avalon_rgb_source_ready
                                                        )
;

  output           Pixel_RGB_Resampler_avalon_rgb_source_ready;
  input            Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa;
  input   [ 29: 0] Pixel_RGB_Resampler_avalon_rgb_source_data;
  input            Pixel_RGB_Resampler_avalon_rgb_source_endofpacket;
  input            Pixel_RGB_Resampler_avalon_rgb_source_startofpacket;
  input            Pixel_RGB_Resampler_avalon_rgb_source_valid;
  input            clk;
  input            reset_n;

  wire             Pixel_RGB_Resampler_avalon_rgb_source_ready;
  //mux Pixel_RGB_Resampler_avalon_rgb_source_ready, which is an e_mux
  assign Pixel_RGB_Resampler_avalon_rgb_source_ready = Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module VGA_Controller_avalon_vga_sink_arbitrator (
                                                   // inputs:
                                                    Dual_Clock_FIFO_avalon_dc_buffer_source_data,
                                                    Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket,
                                                    Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket,
                                                    Dual_Clock_FIFO_avalon_dc_buffer_source_valid,
                                                    VGA_Controller_avalon_vga_sink_ready,
                                                    clk,
                                                    reset_n,

                                                   // outputs:
                                                    VGA_Controller_avalon_vga_sink_data,
                                                    VGA_Controller_avalon_vga_sink_endofpacket,
                                                    VGA_Controller_avalon_vga_sink_ready_from_sa,
                                                    VGA_Controller_avalon_vga_sink_reset,
                                                    VGA_Controller_avalon_vga_sink_startofpacket,
                                                    VGA_Controller_avalon_vga_sink_valid
                                                 )
;

  output  [ 29: 0] VGA_Controller_avalon_vga_sink_data;
  output           VGA_Controller_avalon_vga_sink_endofpacket;
  output           VGA_Controller_avalon_vga_sink_ready_from_sa;
  output           VGA_Controller_avalon_vga_sink_reset;
  output           VGA_Controller_avalon_vga_sink_startofpacket;
  output           VGA_Controller_avalon_vga_sink_valid;
  input   [ 29: 0] Dual_Clock_FIFO_avalon_dc_buffer_source_data;
  input            Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket;
  input            Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket;
  input            Dual_Clock_FIFO_avalon_dc_buffer_source_valid;
  input            VGA_Controller_avalon_vga_sink_ready;
  input            clk;
  input            reset_n;

  wire    [ 29: 0] VGA_Controller_avalon_vga_sink_data;
  wire             VGA_Controller_avalon_vga_sink_endofpacket;
  wire             VGA_Controller_avalon_vga_sink_ready_from_sa;
  wire             VGA_Controller_avalon_vga_sink_reset;
  wire             VGA_Controller_avalon_vga_sink_startofpacket;
  wire             VGA_Controller_avalon_vga_sink_valid;
  //mux VGA_Controller_avalon_vga_sink_data, which is an e_mux
  assign VGA_Controller_avalon_vga_sink_data = Dual_Clock_FIFO_avalon_dc_buffer_source_data;

  //mux VGA_Controller_avalon_vga_sink_endofpacket, which is an e_mux
  assign VGA_Controller_avalon_vga_sink_endofpacket = Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket;

  //assign VGA_Controller_avalon_vga_sink_ready_from_sa = VGA_Controller_avalon_vga_sink_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign VGA_Controller_avalon_vga_sink_ready_from_sa = VGA_Controller_avalon_vga_sink_ready;

  //mux VGA_Controller_avalon_vga_sink_startofpacket, which is an e_mux
  assign VGA_Controller_avalon_vga_sink_startofpacket = Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket;

  //mux VGA_Controller_avalon_vga_sink_valid, which is an e_mux
  assign VGA_Controller_avalon_vga_sink_valid = Dual_Clock_FIFO_avalon_dc_buffer_source_valid;

  //~VGA_Controller_avalon_vga_sink_reset assignment, which is an e_assign
  assign VGA_Controller_avalon_vga_sink_reset = ~reset_n;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Video_System_clock_0_in_arbitrator (
                                            // inputs:
                                             CPU_data_master_address_to_slave,
                                             CPU_data_master_byteenable,
                                             CPU_data_master_dbs_address,
                                             CPU_data_master_dbs_write_8,
                                             CPU_data_master_no_byte_enables_and_last_term,
                                             CPU_data_master_read,
                                             CPU_data_master_waitrequest,
                                             CPU_data_master_write,
                                             Video_System_clock_0_in_endofpacket,
                                             Video_System_clock_0_in_readdata,
                                             Video_System_clock_0_in_waitrequest,
                                             clk,
                                             reset_n,

                                            // outputs:
                                             CPU_data_master_byteenable_Video_System_clock_0_in,
                                             CPU_data_master_granted_Video_System_clock_0_in,
                                             CPU_data_master_qualified_request_Video_System_clock_0_in,
                                             CPU_data_master_read_data_valid_Video_System_clock_0_in,
                                             CPU_data_master_requests_Video_System_clock_0_in,
                                             Video_System_clock_0_in_address,
                                             Video_System_clock_0_in_endofpacket_from_sa,
                                             Video_System_clock_0_in_nativeaddress,
                                             Video_System_clock_0_in_read,
                                             Video_System_clock_0_in_readdata_from_sa,
                                             Video_System_clock_0_in_reset_n,
                                             Video_System_clock_0_in_waitrequest_from_sa,
                                             Video_System_clock_0_in_write,
                                             Video_System_clock_0_in_writedata,
                                             d1_Video_System_clock_0_in_end_xfer
                                          )
;

  output           CPU_data_master_byteenable_Video_System_clock_0_in;
  output           CPU_data_master_granted_Video_System_clock_0_in;
  output           CPU_data_master_qualified_request_Video_System_clock_0_in;
  output           CPU_data_master_read_data_valid_Video_System_clock_0_in;
  output           CPU_data_master_requests_Video_System_clock_0_in;
  output           Video_System_clock_0_in_address;
  output           Video_System_clock_0_in_endofpacket_from_sa;
  output           Video_System_clock_0_in_nativeaddress;
  output           Video_System_clock_0_in_read;
  output  [  7: 0] Video_System_clock_0_in_readdata_from_sa;
  output           Video_System_clock_0_in_reset_n;
  output           Video_System_clock_0_in_waitrequest_from_sa;
  output           Video_System_clock_0_in_write;
  output  [  7: 0] Video_System_clock_0_in_writedata;
  output           d1_Video_System_clock_0_in_end_xfer;
  input   [ 21: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input   [  1: 0] CPU_data_master_dbs_address;
  input   [  7: 0] CPU_data_master_dbs_write_8;
  input            CPU_data_master_no_byte_enables_and_last_term;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input            Video_System_clock_0_in_endofpacket;
  input   [  7: 0] Video_System_clock_0_in_readdata;
  input            Video_System_clock_0_in_waitrequest;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_byteenable_Video_System_clock_0_in;
  wire             CPU_data_master_byteenable_Video_System_clock_0_in_segment_0;
  wire             CPU_data_master_byteenable_Video_System_clock_0_in_segment_1;
  wire             CPU_data_master_byteenable_Video_System_clock_0_in_segment_2;
  wire             CPU_data_master_byteenable_Video_System_clock_0_in_segment_3;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Video_System_clock_0_in;
  wire             CPU_data_master_qualified_request_Video_System_clock_0_in;
  wire             CPU_data_master_read_data_valid_Video_System_clock_0_in;
  wire             CPU_data_master_requests_Video_System_clock_0_in;
  wire             CPU_data_master_saved_grant_Video_System_clock_0_in;
  wire             Video_System_clock_0_in_address;
  wire             Video_System_clock_0_in_allgrants;
  wire             Video_System_clock_0_in_allow_new_arb_cycle;
  wire             Video_System_clock_0_in_any_bursting_master_saved_grant;
  wire             Video_System_clock_0_in_any_continuerequest;
  wire             Video_System_clock_0_in_arb_counter_enable;
  reg     [  2: 0] Video_System_clock_0_in_arb_share_counter;
  wire    [  2: 0] Video_System_clock_0_in_arb_share_counter_next_value;
  wire    [  2: 0] Video_System_clock_0_in_arb_share_set_values;
  wire             Video_System_clock_0_in_beginbursttransfer_internal;
  wire             Video_System_clock_0_in_begins_xfer;
  wire             Video_System_clock_0_in_end_xfer;
  wire             Video_System_clock_0_in_endofpacket_from_sa;
  wire             Video_System_clock_0_in_firsttransfer;
  wire             Video_System_clock_0_in_grant_vector;
  wire             Video_System_clock_0_in_in_a_read_cycle;
  wire             Video_System_clock_0_in_in_a_write_cycle;
  wire             Video_System_clock_0_in_master_qreq_vector;
  wire             Video_System_clock_0_in_nativeaddress;
  wire             Video_System_clock_0_in_non_bursting_master_requests;
  wire             Video_System_clock_0_in_pretend_byte_enable;
  wire             Video_System_clock_0_in_read;
  wire    [  7: 0] Video_System_clock_0_in_readdata_from_sa;
  reg              Video_System_clock_0_in_reg_firsttransfer;
  wire             Video_System_clock_0_in_reset_n;
  reg              Video_System_clock_0_in_slavearbiterlockenable;
  wire             Video_System_clock_0_in_slavearbiterlockenable2;
  wire             Video_System_clock_0_in_unreg_firsttransfer;
  wire             Video_System_clock_0_in_waitrequest_from_sa;
  wire             Video_System_clock_0_in_waits_for_read;
  wire             Video_System_clock_0_in_waits_for_write;
  wire             Video_System_clock_0_in_write;
  wire    [  7: 0] Video_System_clock_0_in_writedata;
  reg              d1_Video_System_clock_0_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Video_System_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_Video_System_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Video_System_clock_0_in_end_xfer;
    end


  assign Video_System_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Video_System_clock_0_in));
  //assign Video_System_clock_0_in_readdata_from_sa = Video_System_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Video_System_clock_0_in_readdata_from_sa = Video_System_clock_0_in_readdata;

  assign CPU_data_master_requests_Video_System_clock_0_in = ({CPU_data_master_address_to_slave[21 : 1] , 1'b0} == 22'h301028) & (CPU_data_master_read | CPU_data_master_write);
  //assign Video_System_clock_0_in_waitrequest_from_sa = Video_System_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Video_System_clock_0_in_waitrequest_from_sa = Video_System_clock_0_in_waitrequest;

  //Video_System_clock_0_in_arb_share_counter set values, which is an e_mux
  assign Video_System_clock_0_in_arb_share_set_values = (CPU_data_master_granted_Video_System_clock_0_in)? 4 :
    1;

  //Video_System_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign Video_System_clock_0_in_non_bursting_master_requests = CPU_data_master_requests_Video_System_clock_0_in;

  //Video_System_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign Video_System_clock_0_in_any_bursting_master_saved_grant = 0;

  //Video_System_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign Video_System_clock_0_in_arb_share_counter_next_value = Video_System_clock_0_in_firsttransfer ? (Video_System_clock_0_in_arb_share_set_values - 1) : |Video_System_clock_0_in_arb_share_counter ? (Video_System_clock_0_in_arb_share_counter - 1) : 0;

  //Video_System_clock_0_in_allgrants all slave grants, which is an e_mux
  assign Video_System_clock_0_in_allgrants = |Video_System_clock_0_in_grant_vector;

  //Video_System_clock_0_in_end_xfer assignment, which is an e_assign
  assign Video_System_clock_0_in_end_xfer = ~(Video_System_clock_0_in_waits_for_read | Video_System_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_Video_System_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Video_System_clock_0_in = Video_System_clock_0_in_end_xfer & (~Video_System_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Video_System_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign Video_System_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_Video_System_clock_0_in & Video_System_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_Video_System_clock_0_in & ~Video_System_clock_0_in_non_bursting_master_requests);

  //Video_System_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_0_in_arb_share_counter <= 0;
      else if (Video_System_clock_0_in_arb_counter_enable)
          Video_System_clock_0_in_arb_share_counter <= Video_System_clock_0_in_arb_share_counter_next_value;
    end


  //Video_System_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|Video_System_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_Video_System_clock_0_in) | (end_xfer_arb_share_counter_term_Video_System_clock_0_in & ~Video_System_clock_0_in_non_bursting_master_requests))
          Video_System_clock_0_in_slavearbiterlockenable <= |Video_System_clock_0_in_arb_share_counter_next_value;
    end


  //CPU/data_master Video_System_clock_0/in arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Video_System_clock_0_in_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Video_System_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Video_System_clock_0_in_slavearbiterlockenable2 = |Video_System_clock_0_in_arb_share_counter_next_value;

  //CPU/data_master Video_System_clock_0/in arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Video_System_clock_0_in_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Video_System_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Video_System_clock_0_in_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Video_System_clock_0_in = CPU_data_master_requests_Video_System_clock_0_in & ~((CPU_data_master_read & (~CPU_data_master_waitrequest)) | ((~CPU_data_master_waitrequest | CPU_data_master_no_byte_enables_and_last_term | !CPU_data_master_byteenable_Video_System_clock_0_in) & CPU_data_master_write));
  //Video_System_clock_0_in_writedata mux, which is an e_mux
  assign Video_System_clock_0_in_writedata = CPU_data_master_dbs_write_8;

  //assign Video_System_clock_0_in_endofpacket_from_sa = Video_System_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Video_System_clock_0_in_endofpacket_from_sa = Video_System_clock_0_in_endofpacket;

  //master is always granted when requested
  assign CPU_data_master_granted_Video_System_clock_0_in = CPU_data_master_qualified_request_Video_System_clock_0_in;

  //CPU/data_master saved-grant Video_System_clock_0/in, which is an e_assign
  assign CPU_data_master_saved_grant_Video_System_clock_0_in = CPU_data_master_requests_Video_System_clock_0_in;

  //allow new arb cycle for Video_System_clock_0/in, which is an e_assign
  assign Video_System_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Video_System_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Video_System_clock_0_in_master_qreq_vector = 1;

  //Video_System_clock_0_in_reset_n assignment, which is an e_assign
  assign Video_System_clock_0_in_reset_n = reset_n;

  //Video_System_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign Video_System_clock_0_in_firsttransfer = Video_System_clock_0_in_begins_xfer ? Video_System_clock_0_in_unreg_firsttransfer : Video_System_clock_0_in_reg_firsttransfer;

  //Video_System_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign Video_System_clock_0_in_unreg_firsttransfer = ~(Video_System_clock_0_in_slavearbiterlockenable & Video_System_clock_0_in_any_continuerequest);

  //Video_System_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (Video_System_clock_0_in_begins_xfer)
          Video_System_clock_0_in_reg_firsttransfer <= Video_System_clock_0_in_unreg_firsttransfer;
    end


  //Video_System_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Video_System_clock_0_in_beginbursttransfer_internal = Video_System_clock_0_in_begins_xfer;

  //Video_System_clock_0_in_read assignment, which is an e_mux
  assign Video_System_clock_0_in_read = CPU_data_master_granted_Video_System_clock_0_in & CPU_data_master_read;

  //Video_System_clock_0_in_write assignment, which is an e_mux
  assign Video_System_clock_0_in_write = ((CPU_data_master_granted_Video_System_clock_0_in & CPU_data_master_write)) & Video_System_clock_0_in_pretend_byte_enable;

  //Video_System_clock_0_in_address mux, which is an e_mux
  assign Video_System_clock_0_in_address = {CPU_data_master_address_to_slave >> 2,
    CPU_data_master_dbs_address[1 : 0]};

  //slaveid Video_System_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign Video_System_clock_0_in_nativeaddress = CPU_data_master_address_to_slave >> 2;

  //d1_Video_System_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Video_System_clock_0_in_end_xfer <= 1;
      else 
        d1_Video_System_clock_0_in_end_xfer <= Video_System_clock_0_in_end_xfer;
    end


  //Video_System_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign Video_System_clock_0_in_waits_for_read = Video_System_clock_0_in_in_a_read_cycle & Video_System_clock_0_in_waitrequest_from_sa;

  //Video_System_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign Video_System_clock_0_in_in_a_read_cycle = CPU_data_master_granted_Video_System_clock_0_in & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Video_System_clock_0_in_in_a_read_cycle;

  //Video_System_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign Video_System_clock_0_in_waits_for_write = Video_System_clock_0_in_in_a_write_cycle & Video_System_clock_0_in_waitrequest_from_sa;

  //Video_System_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign Video_System_clock_0_in_in_a_write_cycle = CPU_data_master_granted_Video_System_clock_0_in & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Video_System_clock_0_in_in_a_write_cycle;

  assign wait_for_Video_System_clock_0_in_counter = 0;
  //Video_System_clock_0_in_pretend_byte_enable byte enable port mux, which is an e_mux
  assign Video_System_clock_0_in_pretend_byte_enable = (CPU_data_master_granted_Video_System_clock_0_in)? CPU_data_master_byteenable_Video_System_clock_0_in :
    -1;

  assign {CPU_data_master_byteenable_Video_System_clock_0_in_segment_3,
CPU_data_master_byteenable_Video_System_clock_0_in_segment_2,
CPU_data_master_byteenable_Video_System_clock_0_in_segment_1,
CPU_data_master_byteenable_Video_System_clock_0_in_segment_0} = CPU_data_master_byteenable;
  assign CPU_data_master_byteenable_Video_System_clock_0_in = ((CPU_data_master_dbs_address[1 : 0] == 0))? CPU_data_master_byteenable_Video_System_clock_0_in_segment_0 :
    ((CPU_data_master_dbs_address[1 : 0] == 1))? CPU_data_master_byteenable_Video_System_clock_0_in_segment_1 :
    ((CPU_data_master_dbs_address[1 : 0] == 2))? CPU_data_master_byteenable_Video_System_clock_0_in_segment_2 :
    CPU_data_master_byteenable_Video_System_clock_0_in_segment_3;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Video_System_clock_0/in enable non-zero assertions, which is an e_register
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

module Video_System_clock_0_out_arbitrator (
                                             // inputs:
                                              Clock_Signals_avalon_clocks_slave_readdata_from_sa,
                                              Video_System_clock_0_out_address,
                                              Video_System_clock_0_out_granted_Clock_Signals_avalon_clocks_slave,
                                              Video_System_clock_0_out_qualified_request_Clock_Signals_avalon_clocks_slave,
                                              Video_System_clock_0_out_read,
                                              Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave,
                                              Video_System_clock_0_out_requests_Clock_Signals_avalon_clocks_slave,
                                              Video_System_clock_0_out_write,
                                              Video_System_clock_0_out_writedata,
                                              clk,
                                              d1_Clock_Signals_avalon_clocks_slave_end_xfer,
                                              reset_n,

                                             // outputs:
                                              Video_System_clock_0_out_address_to_slave,
                                              Video_System_clock_0_out_readdata,
                                              Video_System_clock_0_out_reset_n,
                                              Video_System_clock_0_out_waitrequest
                                           )
;

  output           Video_System_clock_0_out_address_to_slave;
  output  [  7: 0] Video_System_clock_0_out_readdata;
  output           Video_System_clock_0_out_reset_n;
  output           Video_System_clock_0_out_waitrequest;
  input   [  7: 0] Clock_Signals_avalon_clocks_slave_readdata_from_sa;
  input            Video_System_clock_0_out_address;
  input            Video_System_clock_0_out_granted_Clock_Signals_avalon_clocks_slave;
  input            Video_System_clock_0_out_qualified_request_Clock_Signals_avalon_clocks_slave;
  input            Video_System_clock_0_out_read;
  input            Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave;
  input            Video_System_clock_0_out_requests_Clock_Signals_avalon_clocks_slave;
  input            Video_System_clock_0_out_write;
  input   [  7: 0] Video_System_clock_0_out_writedata;
  input            clk;
  input            d1_Clock_Signals_avalon_clocks_slave_end_xfer;
  input            reset_n;

  reg              Video_System_clock_0_out_address_last_time;
  wire             Video_System_clock_0_out_address_to_slave;
  reg              Video_System_clock_0_out_read_last_time;
  wire    [  7: 0] Video_System_clock_0_out_readdata;
  wire             Video_System_clock_0_out_reset_n;
  wire             Video_System_clock_0_out_run;
  wire             Video_System_clock_0_out_waitrequest;
  reg              Video_System_clock_0_out_write_last_time;
  reg     [  7: 0] Video_System_clock_0_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (Video_System_clock_0_out_qualified_request_Clock_Signals_avalon_clocks_slave | Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave | ~Video_System_clock_0_out_requests_Clock_Signals_avalon_clocks_slave) & ((~Video_System_clock_0_out_qualified_request_Clock_Signals_avalon_clocks_slave | ~Video_System_clock_0_out_read | (Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave & Video_System_clock_0_out_read))) & ((~Video_System_clock_0_out_qualified_request_Clock_Signals_avalon_clocks_slave | ~(Video_System_clock_0_out_read | Video_System_clock_0_out_write) | (1 & (Video_System_clock_0_out_read | Video_System_clock_0_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign Video_System_clock_0_out_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign Video_System_clock_0_out_address_to_slave = Video_System_clock_0_out_address;

  //Video_System_clock_0/out readdata mux, which is an e_mux
  assign Video_System_clock_0_out_readdata = Clock_Signals_avalon_clocks_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign Video_System_clock_0_out_waitrequest = ~Video_System_clock_0_out_run;

  //Video_System_clock_0_out_reset_n assignment, which is an e_assign
  assign Video_System_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Video_System_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_0_out_address_last_time <= 0;
      else 
        Video_System_clock_0_out_address_last_time <= Video_System_clock_0_out_address;
    end


  //Video_System_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= Video_System_clock_0_out_waitrequest & (Video_System_clock_0_out_read | Video_System_clock_0_out_write);
    end


  //Video_System_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Video_System_clock_0_out_address != Video_System_clock_0_out_address_last_time))
        begin
          $write("%0d ns: Video_System_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //Video_System_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_0_out_read_last_time <= 0;
      else 
        Video_System_clock_0_out_read_last_time <= Video_System_clock_0_out_read;
    end


  //Video_System_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Video_System_clock_0_out_read != Video_System_clock_0_out_read_last_time))
        begin
          $write("%0d ns: Video_System_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //Video_System_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_0_out_write_last_time <= 0;
      else 
        Video_System_clock_0_out_write_last_time <= Video_System_clock_0_out_write;
    end


  //Video_System_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Video_System_clock_0_out_write != Video_System_clock_0_out_write_last_time))
        begin
          $write("%0d ns: Video_System_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //Video_System_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_0_out_writedata_last_time <= 0;
      else 
        Video_System_clock_0_out_writedata_last_time <= Video_System_clock_0_out_writedata;
    end


  //Video_System_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Video_System_clock_0_out_writedata != Video_System_clock_0_out_writedata_last_time) & Video_System_clock_0_out_write)
        begin
          $write("%0d ns: Video_System_clock_0_out_writedata did not heed wait!!!", $time);
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

module Video_System_clock_1_in_arbitrator (
                                            // inputs:
                                             CPU_data_master_address_to_slave,
                                             CPU_data_master_byteenable,
                                             CPU_data_master_read,
                                             CPU_data_master_waitrequest,
                                             CPU_data_master_write,
                                             CPU_data_master_writedata,
                                             Video_System_clock_1_in_endofpacket,
                                             Video_System_clock_1_in_readdata,
                                             Video_System_clock_1_in_waitrequest,
                                             clk,
                                             reset_n,

                                            // outputs:
                                             CPU_data_master_granted_Video_System_clock_1_in,
                                             CPU_data_master_qualified_request_Video_System_clock_1_in,
                                             CPU_data_master_read_data_valid_Video_System_clock_1_in,
                                             CPU_data_master_requests_Video_System_clock_1_in,
                                             Video_System_clock_1_in_address,
                                             Video_System_clock_1_in_byteenable,
                                             Video_System_clock_1_in_endofpacket_from_sa,
                                             Video_System_clock_1_in_nativeaddress,
                                             Video_System_clock_1_in_read,
                                             Video_System_clock_1_in_readdata_from_sa,
                                             Video_System_clock_1_in_reset_n,
                                             Video_System_clock_1_in_waitrequest_from_sa,
                                             Video_System_clock_1_in_write,
                                             Video_System_clock_1_in_writedata,
                                             d1_Video_System_clock_1_in_end_xfer
                                          )
;

  output           CPU_data_master_granted_Video_System_clock_1_in;
  output           CPU_data_master_qualified_request_Video_System_clock_1_in;
  output           CPU_data_master_read_data_valid_Video_System_clock_1_in;
  output           CPU_data_master_requests_Video_System_clock_1_in;
  output  [  2: 0] Video_System_clock_1_in_address;
  output  [  3: 0] Video_System_clock_1_in_byteenable;
  output           Video_System_clock_1_in_endofpacket_from_sa;
  output           Video_System_clock_1_in_nativeaddress;
  output           Video_System_clock_1_in_read;
  output  [ 31: 0] Video_System_clock_1_in_readdata_from_sa;
  output           Video_System_clock_1_in_reset_n;
  output           Video_System_clock_1_in_waitrequest_from_sa;
  output           Video_System_clock_1_in_write;
  output  [ 31: 0] Video_System_clock_1_in_writedata;
  output           d1_Video_System_clock_1_in_end_xfer;
  input   [ 21: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            Video_System_clock_1_in_endofpacket;
  input   [ 31: 0] Video_System_clock_1_in_readdata;
  input            Video_System_clock_1_in_waitrequest;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Video_System_clock_1_in;
  wire             CPU_data_master_qualified_request_Video_System_clock_1_in;
  wire             CPU_data_master_read_data_valid_Video_System_clock_1_in;
  wire             CPU_data_master_requests_Video_System_clock_1_in;
  wire             CPU_data_master_saved_grant_Video_System_clock_1_in;
  wire    [  2: 0] Video_System_clock_1_in_address;
  wire             Video_System_clock_1_in_allgrants;
  wire             Video_System_clock_1_in_allow_new_arb_cycle;
  wire             Video_System_clock_1_in_any_bursting_master_saved_grant;
  wire             Video_System_clock_1_in_any_continuerequest;
  wire             Video_System_clock_1_in_arb_counter_enable;
  reg     [  2: 0] Video_System_clock_1_in_arb_share_counter;
  wire    [  2: 0] Video_System_clock_1_in_arb_share_counter_next_value;
  wire    [  2: 0] Video_System_clock_1_in_arb_share_set_values;
  wire             Video_System_clock_1_in_beginbursttransfer_internal;
  wire             Video_System_clock_1_in_begins_xfer;
  wire    [  3: 0] Video_System_clock_1_in_byteenable;
  wire             Video_System_clock_1_in_end_xfer;
  wire             Video_System_clock_1_in_endofpacket_from_sa;
  wire             Video_System_clock_1_in_firsttransfer;
  wire             Video_System_clock_1_in_grant_vector;
  wire             Video_System_clock_1_in_in_a_read_cycle;
  wire             Video_System_clock_1_in_in_a_write_cycle;
  wire             Video_System_clock_1_in_master_qreq_vector;
  wire             Video_System_clock_1_in_nativeaddress;
  wire             Video_System_clock_1_in_non_bursting_master_requests;
  wire             Video_System_clock_1_in_read;
  wire    [ 31: 0] Video_System_clock_1_in_readdata_from_sa;
  reg              Video_System_clock_1_in_reg_firsttransfer;
  wire             Video_System_clock_1_in_reset_n;
  reg              Video_System_clock_1_in_slavearbiterlockenable;
  wire             Video_System_clock_1_in_slavearbiterlockenable2;
  wire             Video_System_clock_1_in_unreg_firsttransfer;
  wire             Video_System_clock_1_in_waitrequest_from_sa;
  wire             Video_System_clock_1_in_waits_for_read;
  wire             Video_System_clock_1_in_waits_for_write;
  wire             Video_System_clock_1_in_write;
  wire    [ 31: 0] Video_System_clock_1_in_writedata;
  reg              d1_Video_System_clock_1_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Video_System_clock_1_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 21: 0] shifted_address_to_Video_System_clock_1_in_from_CPU_data_master;
  wire             wait_for_Video_System_clock_1_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Video_System_clock_1_in_end_xfer;
    end


  assign Video_System_clock_1_in_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Video_System_clock_1_in));
  //assign Video_System_clock_1_in_readdata_from_sa = Video_System_clock_1_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Video_System_clock_1_in_readdata_from_sa = Video_System_clock_1_in_readdata;

  assign CPU_data_master_requests_Video_System_clock_1_in = ({CPU_data_master_address_to_slave[21 : 3] , 3'b0} == 22'h301020) & (CPU_data_master_read | CPU_data_master_write);
  //assign Video_System_clock_1_in_waitrequest_from_sa = Video_System_clock_1_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Video_System_clock_1_in_waitrequest_from_sa = Video_System_clock_1_in_waitrequest;

  //Video_System_clock_1_in_arb_share_counter set values, which is an e_mux
  assign Video_System_clock_1_in_arb_share_set_values = 1;

  //Video_System_clock_1_in_non_bursting_master_requests mux, which is an e_mux
  assign Video_System_clock_1_in_non_bursting_master_requests = CPU_data_master_requests_Video_System_clock_1_in;

  //Video_System_clock_1_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign Video_System_clock_1_in_any_bursting_master_saved_grant = 0;

  //Video_System_clock_1_in_arb_share_counter_next_value assignment, which is an e_assign
  assign Video_System_clock_1_in_arb_share_counter_next_value = Video_System_clock_1_in_firsttransfer ? (Video_System_clock_1_in_arb_share_set_values - 1) : |Video_System_clock_1_in_arb_share_counter ? (Video_System_clock_1_in_arb_share_counter - 1) : 0;

  //Video_System_clock_1_in_allgrants all slave grants, which is an e_mux
  assign Video_System_clock_1_in_allgrants = |Video_System_clock_1_in_grant_vector;

  //Video_System_clock_1_in_end_xfer assignment, which is an e_assign
  assign Video_System_clock_1_in_end_xfer = ~(Video_System_clock_1_in_waits_for_read | Video_System_clock_1_in_waits_for_write);

  //end_xfer_arb_share_counter_term_Video_System_clock_1_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Video_System_clock_1_in = Video_System_clock_1_in_end_xfer & (~Video_System_clock_1_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Video_System_clock_1_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign Video_System_clock_1_in_arb_counter_enable = (end_xfer_arb_share_counter_term_Video_System_clock_1_in & Video_System_clock_1_in_allgrants) | (end_xfer_arb_share_counter_term_Video_System_clock_1_in & ~Video_System_clock_1_in_non_bursting_master_requests);

  //Video_System_clock_1_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_1_in_arb_share_counter <= 0;
      else if (Video_System_clock_1_in_arb_counter_enable)
          Video_System_clock_1_in_arb_share_counter <= Video_System_clock_1_in_arb_share_counter_next_value;
    end


  //Video_System_clock_1_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_1_in_slavearbiterlockenable <= 0;
      else if ((|Video_System_clock_1_in_master_qreq_vector & end_xfer_arb_share_counter_term_Video_System_clock_1_in) | (end_xfer_arb_share_counter_term_Video_System_clock_1_in & ~Video_System_clock_1_in_non_bursting_master_requests))
          Video_System_clock_1_in_slavearbiterlockenable <= |Video_System_clock_1_in_arb_share_counter_next_value;
    end


  //CPU/data_master Video_System_clock_1/in arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Video_System_clock_1_in_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Video_System_clock_1_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Video_System_clock_1_in_slavearbiterlockenable2 = |Video_System_clock_1_in_arb_share_counter_next_value;

  //CPU/data_master Video_System_clock_1/in arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Video_System_clock_1_in_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Video_System_clock_1_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Video_System_clock_1_in_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Video_System_clock_1_in = CPU_data_master_requests_Video_System_clock_1_in & ~((CPU_data_master_read & (~CPU_data_master_waitrequest)) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //Video_System_clock_1_in_writedata mux, which is an e_mux
  assign Video_System_clock_1_in_writedata = CPU_data_master_writedata;

  //assign Video_System_clock_1_in_endofpacket_from_sa = Video_System_clock_1_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Video_System_clock_1_in_endofpacket_from_sa = Video_System_clock_1_in_endofpacket;

  //master is always granted when requested
  assign CPU_data_master_granted_Video_System_clock_1_in = CPU_data_master_qualified_request_Video_System_clock_1_in;

  //CPU/data_master saved-grant Video_System_clock_1/in, which is an e_assign
  assign CPU_data_master_saved_grant_Video_System_clock_1_in = CPU_data_master_requests_Video_System_clock_1_in;

  //allow new arb cycle for Video_System_clock_1/in, which is an e_assign
  assign Video_System_clock_1_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Video_System_clock_1_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Video_System_clock_1_in_master_qreq_vector = 1;

  //Video_System_clock_1_in_reset_n assignment, which is an e_assign
  assign Video_System_clock_1_in_reset_n = reset_n;

  //Video_System_clock_1_in_firsttransfer first transaction, which is an e_assign
  assign Video_System_clock_1_in_firsttransfer = Video_System_clock_1_in_begins_xfer ? Video_System_clock_1_in_unreg_firsttransfer : Video_System_clock_1_in_reg_firsttransfer;

  //Video_System_clock_1_in_unreg_firsttransfer first transaction, which is an e_assign
  assign Video_System_clock_1_in_unreg_firsttransfer = ~(Video_System_clock_1_in_slavearbiterlockenable & Video_System_clock_1_in_any_continuerequest);

  //Video_System_clock_1_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_1_in_reg_firsttransfer <= 1'b1;
      else if (Video_System_clock_1_in_begins_xfer)
          Video_System_clock_1_in_reg_firsttransfer <= Video_System_clock_1_in_unreg_firsttransfer;
    end


  //Video_System_clock_1_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Video_System_clock_1_in_beginbursttransfer_internal = Video_System_clock_1_in_begins_xfer;

  //Video_System_clock_1_in_read assignment, which is an e_mux
  assign Video_System_clock_1_in_read = CPU_data_master_granted_Video_System_clock_1_in & CPU_data_master_read;

  //Video_System_clock_1_in_write assignment, which is an e_mux
  assign Video_System_clock_1_in_write = CPU_data_master_granted_Video_System_clock_1_in & CPU_data_master_write;

  assign shifted_address_to_Video_System_clock_1_in_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Video_System_clock_1_in_address mux, which is an e_mux
  assign Video_System_clock_1_in_address = shifted_address_to_Video_System_clock_1_in_from_CPU_data_master >> 2;

  //slaveid Video_System_clock_1_in_nativeaddress nativeaddress mux, which is an e_mux
  assign Video_System_clock_1_in_nativeaddress = CPU_data_master_address_to_slave >> 2;

  //d1_Video_System_clock_1_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Video_System_clock_1_in_end_xfer <= 1;
      else 
        d1_Video_System_clock_1_in_end_xfer <= Video_System_clock_1_in_end_xfer;
    end


  //Video_System_clock_1_in_waits_for_read in a cycle, which is an e_mux
  assign Video_System_clock_1_in_waits_for_read = Video_System_clock_1_in_in_a_read_cycle & Video_System_clock_1_in_waitrequest_from_sa;

  //Video_System_clock_1_in_in_a_read_cycle assignment, which is an e_assign
  assign Video_System_clock_1_in_in_a_read_cycle = CPU_data_master_granted_Video_System_clock_1_in & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Video_System_clock_1_in_in_a_read_cycle;

  //Video_System_clock_1_in_waits_for_write in a cycle, which is an e_mux
  assign Video_System_clock_1_in_waits_for_write = Video_System_clock_1_in_in_a_write_cycle & Video_System_clock_1_in_waitrequest_from_sa;

  //Video_System_clock_1_in_in_a_write_cycle assignment, which is an e_assign
  assign Video_System_clock_1_in_in_a_write_cycle = CPU_data_master_granted_Video_System_clock_1_in & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Video_System_clock_1_in_in_a_write_cycle;

  assign wait_for_Video_System_clock_1_in_counter = 0;
  //Video_System_clock_1_in_byteenable byte enable port mux, which is an e_mux
  assign Video_System_clock_1_in_byteenable = (CPU_data_master_granted_Video_System_clock_1_in)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Video_System_clock_1/in enable non-zero assertions, which is an e_register
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

module Video_System_clock_1_out_arbitrator (
                                             // inputs:
                                              Video_System_clock_1_out_address,
                                              Video_System_clock_1_out_byteenable,
                                              Video_System_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave,
                                              Video_System_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                              Video_System_clock_1_out_read,
                                              Video_System_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                              Video_System_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave,
                                              Video_System_clock_1_out_write,
                                              Video_System_clock_1_out_writedata,
                                              clk,
                                              d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                              jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                              jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                              reset_n,

                                             // outputs:
                                              Video_System_clock_1_out_address_to_slave,
                                              Video_System_clock_1_out_readdata,
                                              Video_System_clock_1_out_reset_n,
                                              Video_System_clock_1_out_waitrequest
                                           )
;

  output  [  2: 0] Video_System_clock_1_out_address_to_slave;
  output  [ 31: 0] Video_System_clock_1_out_readdata;
  output           Video_System_clock_1_out_reset_n;
  output           Video_System_clock_1_out_waitrequest;
  input   [  2: 0] Video_System_clock_1_out_address;
  input   [  3: 0] Video_System_clock_1_out_byteenable;
  input            Video_System_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave;
  input            Video_System_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave;
  input            Video_System_clock_1_out_read;
  input            Video_System_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  input            Video_System_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave;
  input            Video_System_clock_1_out_write;
  input   [ 31: 0] Video_System_clock_1_out_writedata;
  input            clk;
  input            d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  input            reset_n;

  reg     [  2: 0] Video_System_clock_1_out_address_last_time;
  wire    [  2: 0] Video_System_clock_1_out_address_to_slave;
  reg     [  3: 0] Video_System_clock_1_out_byteenable_last_time;
  reg              Video_System_clock_1_out_read_last_time;
  wire    [ 31: 0] Video_System_clock_1_out_readdata;
  wire             Video_System_clock_1_out_reset_n;
  wire             Video_System_clock_1_out_run;
  wire             Video_System_clock_1_out_waitrequest;
  reg              Video_System_clock_1_out_write_last_time;
  reg     [ 31: 0] Video_System_clock_1_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & ((~Video_System_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(Video_System_clock_1_out_read | Video_System_clock_1_out_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (Video_System_clock_1_out_read | Video_System_clock_1_out_write)))) & ((~Video_System_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(Video_System_clock_1_out_read | Video_System_clock_1_out_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (Video_System_clock_1_out_read | Video_System_clock_1_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign Video_System_clock_1_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign Video_System_clock_1_out_address_to_slave = Video_System_clock_1_out_address;

  //Video_System_clock_1/out readdata mux, which is an e_mux
  assign Video_System_clock_1_out_readdata = jtag_uart_0_avalon_jtag_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign Video_System_clock_1_out_waitrequest = ~Video_System_clock_1_out_run;

  //Video_System_clock_1_out_reset_n assignment, which is an e_assign
  assign Video_System_clock_1_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Video_System_clock_1_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_1_out_address_last_time <= 0;
      else 
        Video_System_clock_1_out_address_last_time <= Video_System_clock_1_out_address;
    end


  //Video_System_clock_1/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= Video_System_clock_1_out_waitrequest & (Video_System_clock_1_out_read | Video_System_clock_1_out_write);
    end


  //Video_System_clock_1_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Video_System_clock_1_out_address != Video_System_clock_1_out_address_last_time))
        begin
          $write("%0d ns: Video_System_clock_1_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //Video_System_clock_1_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_1_out_byteenable_last_time <= 0;
      else 
        Video_System_clock_1_out_byteenable_last_time <= Video_System_clock_1_out_byteenable;
    end


  //Video_System_clock_1_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Video_System_clock_1_out_byteenable != Video_System_clock_1_out_byteenable_last_time))
        begin
          $write("%0d ns: Video_System_clock_1_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //Video_System_clock_1_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_1_out_read_last_time <= 0;
      else 
        Video_System_clock_1_out_read_last_time <= Video_System_clock_1_out_read;
    end


  //Video_System_clock_1_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Video_System_clock_1_out_read != Video_System_clock_1_out_read_last_time))
        begin
          $write("%0d ns: Video_System_clock_1_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //Video_System_clock_1_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_1_out_write_last_time <= 0;
      else 
        Video_System_clock_1_out_write_last_time <= Video_System_clock_1_out_write;
    end


  //Video_System_clock_1_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Video_System_clock_1_out_write != Video_System_clock_1_out_write_last_time))
        begin
          $write("%0d ns: Video_System_clock_1_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //Video_System_clock_1_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_1_out_writedata_last_time <= 0;
      else 
        Video_System_clock_1_out_writedata_last_time <= Video_System_clock_1_out_writedata;
    end


  //Video_System_clock_1_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Video_System_clock_1_out_writedata != Video_System_clock_1_out_writedata_last_time) & Video_System_clock_1_out_write)
        begin
          $write("%0d ns: Video_System_clock_1_out_writedata did not heed wait!!!", $time);
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

module Video_System_clock_2_in_arbitrator (
                                            // inputs:
                                             CPU_data_master_address_to_slave,
                                             CPU_data_master_byteenable,
                                             CPU_data_master_read,
                                             CPU_data_master_waitrequest,
                                             CPU_data_master_write,
                                             CPU_data_master_writedata,
                                             Video_System_clock_2_in_endofpacket,
                                             Video_System_clock_2_in_readdata,
                                             Video_System_clock_2_in_waitrequest,
                                             clk,
                                             reset_n,

                                            // outputs:
                                             CPU_data_master_granted_Video_System_clock_2_in,
                                             CPU_data_master_qualified_request_Video_System_clock_2_in,
                                             CPU_data_master_read_data_valid_Video_System_clock_2_in,
                                             CPU_data_master_requests_Video_System_clock_2_in,
                                             Video_System_clock_2_in_address,
                                             Video_System_clock_2_in_byteenable,
                                             Video_System_clock_2_in_endofpacket_from_sa,
                                             Video_System_clock_2_in_nativeaddress,
                                             Video_System_clock_2_in_read,
                                             Video_System_clock_2_in_readdata_from_sa,
                                             Video_System_clock_2_in_reset_n,
                                             Video_System_clock_2_in_waitrequest_from_sa,
                                             Video_System_clock_2_in_write,
                                             Video_System_clock_2_in_writedata,
                                             d1_Video_System_clock_2_in_end_xfer
                                          )
;

  output           CPU_data_master_granted_Video_System_clock_2_in;
  output           CPU_data_master_qualified_request_Video_System_clock_2_in;
  output           CPU_data_master_read_data_valid_Video_System_clock_2_in;
  output           CPU_data_master_requests_Video_System_clock_2_in;
  output  [  3: 0] Video_System_clock_2_in_address;
  output  [  3: 0] Video_System_clock_2_in_byteenable;
  output           Video_System_clock_2_in_endofpacket_from_sa;
  output  [  1: 0] Video_System_clock_2_in_nativeaddress;
  output           Video_System_clock_2_in_read;
  output  [ 31: 0] Video_System_clock_2_in_readdata_from_sa;
  output           Video_System_clock_2_in_reset_n;
  output           Video_System_clock_2_in_waitrequest_from_sa;
  output           Video_System_clock_2_in_write;
  output  [ 31: 0] Video_System_clock_2_in_writedata;
  output           d1_Video_System_clock_2_in_end_xfer;
  input   [ 21: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_read;
  input            CPU_data_master_waitrequest;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            Video_System_clock_2_in_endofpacket;
  input   [ 31: 0] Video_System_clock_2_in_readdata;
  input            Video_System_clock_2_in_waitrequest;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Video_System_clock_2_in;
  wire             CPU_data_master_qualified_request_Video_System_clock_2_in;
  wire             CPU_data_master_read_data_valid_Video_System_clock_2_in;
  wire             CPU_data_master_requests_Video_System_clock_2_in;
  wire             CPU_data_master_saved_grant_Video_System_clock_2_in;
  wire    [  3: 0] Video_System_clock_2_in_address;
  wire             Video_System_clock_2_in_allgrants;
  wire             Video_System_clock_2_in_allow_new_arb_cycle;
  wire             Video_System_clock_2_in_any_bursting_master_saved_grant;
  wire             Video_System_clock_2_in_any_continuerequest;
  wire             Video_System_clock_2_in_arb_counter_enable;
  reg     [  2: 0] Video_System_clock_2_in_arb_share_counter;
  wire    [  2: 0] Video_System_clock_2_in_arb_share_counter_next_value;
  wire    [  2: 0] Video_System_clock_2_in_arb_share_set_values;
  wire             Video_System_clock_2_in_beginbursttransfer_internal;
  wire             Video_System_clock_2_in_begins_xfer;
  wire    [  3: 0] Video_System_clock_2_in_byteenable;
  wire             Video_System_clock_2_in_end_xfer;
  wire             Video_System_clock_2_in_endofpacket_from_sa;
  wire             Video_System_clock_2_in_firsttransfer;
  wire             Video_System_clock_2_in_grant_vector;
  wire             Video_System_clock_2_in_in_a_read_cycle;
  wire             Video_System_clock_2_in_in_a_write_cycle;
  wire             Video_System_clock_2_in_master_qreq_vector;
  wire    [  1: 0] Video_System_clock_2_in_nativeaddress;
  wire             Video_System_clock_2_in_non_bursting_master_requests;
  wire             Video_System_clock_2_in_read;
  wire    [ 31: 0] Video_System_clock_2_in_readdata_from_sa;
  reg              Video_System_clock_2_in_reg_firsttransfer;
  wire             Video_System_clock_2_in_reset_n;
  reg              Video_System_clock_2_in_slavearbiterlockenable;
  wire             Video_System_clock_2_in_slavearbiterlockenable2;
  wire             Video_System_clock_2_in_unreg_firsttransfer;
  wire             Video_System_clock_2_in_waitrequest_from_sa;
  wire             Video_System_clock_2_in_waits_for_read;
  wire             Video_System_clock_2_in_waits_for_write;
  wire             Video_System_clock_2_in_write;
  wire    [ 31: 0] Video_System_clock_2_in_writedata;
  reg              d1_Video_System_clock_2_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Video_System_clock_2_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 21: 0] shifted_address_to_Video_System_clock_2_in_from_CPU_data_master;
  wire             wait_for_Video_System_clock_2_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Video_System_clock_2_in_end_xfer;
    end


  assign Video_System_clock_2_in_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Video_System_clock_2_in));
  //assign Video_System_clock_2_in_readdata_from_sa = Video_System_clock_2_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Video_System_clock_2_in_readdata_from_sa = Video_System_clock_2_in_readdata;

  assign CPU_data_master_requests_Video_System_clock_2_in = ({CPU_data_master_address_to_slave[21 : 4] , 4'b0} == 22'h301010) & (CPU_data_master_read | CPU_data_master_write);
  //assign Video_System_clock_2_in_waitrequest_from_sa = Video_System_clock_2_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Video_System_clock_2_in_waitrequest_from_sa = Video_System_clock_2_in_waitrequest;

  //Video_System_clock_2_in_arb_share_counter set values, which is an e_mux
  assign Video_System_clock_2_in_arb_share_set_values = 1;

  //Video_System_clock_2_in_non_bursting_master_requests mux, which is an e_mux
  assign Video_System_clock_2_in_non_bursting_master_requests = CPU_data_master_requests_Video_System_clock_2_in;

  //Video_System_clock_2_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign Video_System_clock_2_in_any_bursting_master_saved_grant = 0;

  //Video_System_clock_2_in_arb_share_counter_next_value assignment, which is an e_assign
  assign Video_System_clock_2_in_arb_share_counter_next_value = Video_System_clock_2_in_firsttransfer ? (Video_System_clock_2_in_arb_share_set_values - 1) : |Video_System_clock_2_in_arb_share_counter ? (Video_System_clock_2_in_arb_share_counter - 1) : 0;

  //Video_System_clock_2_in_allgrants all slave grants, which is an e_mux
  assign Video_System_clock_2_in_allgrants = |Video_System_clock_2_in_grant_vector;

  //Video_System_clock_2_in_end_xfer assignment, which is an e_assign
  assign Video_System_clock_2_in_end_xfer = ~(Video_System_clock_2_in_waits_for_read | Video_System_clock_2_in_waits_for_write);

  //end_xfer_arb_share_counter_term_Video_System_clock_2_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Video_System_clock_2_in = Video_System_clock_2_in_end_xfer & (~Video_System_clock_2_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Video_System_clock_2_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign Video_System_clock_2_in_arb_counter_enable = (end_xfer_arb_share_counter_term_Video_System_clock_2_in & Video_System_clock_2_in_allgrants) | (end_xfer_arb_share_counter_term_Video_System_clock_2_in & ~Video_System_clock_2_in_non_bursting_master_requests);

  //Video_System_clock_2_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_2_in_arb_share_counter <= 0;
      else if (Video_System_clock_2_in_arb_counter_enable)
          Video_System_clock_2_in_arb_share_counter <= Video_System_clock_2_in_arb_share_counter_next_value;
    end


  //Video_System_clock_2_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_2_in_slavearbiterlockenable <= 0;
      else if ((|Video_System_clock_2_in_master_qreq_vector & end_xfer_arb_share_counter_term_Video_System_clock_2_in) | (end_xfer_arb_share_counter_term_Video_System_clock_2_in & ~Video_System_clock_2_in_non_bursting_master_requests))
          Video_System_clock_2_in_slavearbiterlockenable <= |Video_System_clock_2_in_arb_share_counter_next_value;
    end


  //CPU/data_master Video_System_clock_2/in arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Video_System_clock_2_in_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Video_System_clock_2_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Video_System_clock_2_in_slavearbiterlockenable2 = |Video_System_clock_2_in_arb_share_counter_next_value;

  //CPU/data_master Video_System_clock_2/in arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Video_System_clock_2_in_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Video_System_clock_2_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Video_System_clock_2_in_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Video_System_clock_2_in = CPU_data_master_requests_Video_System_clock_2_in & ~((CPU_data_master_read & (~CPU_data_master_waitrequest)) | ((~CPU_data_master_waitrequest) & CPU_data_master_write));
  //Video_System_clock_2_in_writedata mux, which is an e_mux
  assign Video_System_clock_2_in_writedata = CPU_data_master_writedata;

  //assign Video_System_clock_2_in_endofpacket_from_sa = Video_System_clock_2_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Video_System_clock_2_in_endofpacket_from_sa = Video_System_clock_2_in_endofpacket;

  //master is always granted when requested
  assign CPU_data_master_granted_Video_System_clock_2_in = CPU_data_master_qualified_request_Video_System_clock_2_in;

  //CPU/data_master saved-grant Video_System_clock_2/in, which is an e_assign
  assign CPU_data_master_saved_grant_Video_System_clock_2_in = CPU_data_master_requests_Video_System_clock_2_in;

  //allow new arb cycle for Video_System_clock_2/in, which is an e_assign
  assign Video_System_clock_2_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Video_System_clock_2_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Video_System_clock_2_in_master_qreq_vector = 1;

  //Video_System_clock_2_in_reset_n assignment, which is an e_assign
  assign Video_System_clock_2_in_reset_n = reset_n;

  //Video_System_clock_2_in_firsttransfer first transaction, which is an e_assign
  assign Video_System_clock_2_in_firsttransfer = Video_System_clock_2_in_begins_xfer ? Video_System_clock_2_in_unreg_firsttransfer : Video_System_clock_2_in_reg_firsttransfer;

  //Video_System_clock_2_in_unreg_firsttransfer first transaction, which is an e_assign
  assign Video_System_clock_2_in_unreg_firsttransfer = ~(Video_System_clock_2_in_slavearbiterlockenable & Video_System_clock_2_in_any_continuerequest);

  //Video_System_clock_2_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_2_in_reg_firsttransfer <= 1'b1;
      else if (Video_System_clock_2_in_begins_xfer)
          Video_System_clock_2_in_reg_firsttransfer <= Video_System_clock_2_in_unreg_firsttransfer;
    end


  //Video_System_clock_2_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Video_System_clock_2_in_beginbursttransfer_internal = Video_System_clock_2_in_begins_xfer;

  //Video_System_clock_2_in_read assignment, which is an e_mux
  assign Video_System_clock_2_in_read = CPU_data_master_granted_Video_System_clock_2_in & CPU_data_master_read;

  //Video_System_clock_2_in_write assignment, which is an e_mux
  assign Video_System_clock_2_in_write = CPU_data_master_granted_Video_System_clock_2_in & CPU_data_master_write;

  assign shifted_address_to_Video_System_clock_2_in_from_CPU_data_master = CPU_data_master_address_to_slave;
  //Video_System_clock_2_in_address mux, which is an e_mux
  assign Video_System_clock_2_in_address = shifted_address_to_Video_System_clock_2_in_from_CPU_data_master >> 2;

  //slaveid Video_System_clock_2_in_nativeaddress nativeaddress mux, which is an e_mux
  assign Video_System_clock_2_in_nativeaddress = CPU_data_master_address_to_slave >> 2;

  //d1_Video_System_clock_2_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Video_System_clock_2_in_end_xfer <= 1;
      else 
        d1_Video_System_clock_2_in_end_xfer <= Video_System_clock_2_in_end_xfer;
    end


  //Video_System_clock_2_in_waits_for_read in a cycle, which is an e_mux
  assign Video_System_clock_2_in_waits_for_read = Video_System_clock_2_in_in_a_read_cycle & Video_System_clock_2_in_waitrequest_from_sa;

  //Video_System_clock_2_in_in_a_read_cycle assignment, which is an e_assign
  assign Video_System_clock_2_in_in_a_read_cycle = CPU_data_master_granted_Video_System_clock_2_in & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Video_System_clock_2_in_in_a_read_cycle;

  //Video_System_clock_2_in_waits_for_write in a cycle, which is an e_mux
  assign Video_System_clock_2_in_waits_for_write = Video_System_clock_2_in_in_a_write_cycle & Video_System_clock_2_in_waitrequest_from_sa;

  //Video_System_clock_2_in_in_a_write_cycle assignment, which is an e_assign
  assign Video_System_clock_2_in_in_a_write_cycle = CPU_data_master_granted_Video_System_clock_2_in & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Video_System_clock_2_in_in_a_write_cycle;

  assign wait_for_Video_System_clock_2_in_counter = 0;
  //Video_System_clock_2_in_byteenable byte enable port mux, which is an e_mux
  assign Video_System_clock_2_in_byteenable = (CPU_data_master_granted_Video_System_clock_2_in)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Video_System_clock_2/in enable non-zero assertions, which is an e_register
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

module Video_System_clock_2_out_arbitrator (
                                             // inputs:
                                              Video_System_clock_2_out_address,
                                              Video_System_clock_2_out_byteenable,
                                              Video_System_clock_2_out_granted_pio_0_s1,
                                              Video_System_clock_2_out_qualified_request_pio_0_s1,
                                              Video_System_clock_2_out_read,
                                              Video_System_clock_2_out_read_data_valid_pio_0_s1,
                                              Video_System_clock_2_out_requests_pio_0_s1,
                                              Video_System_clock_2_out_write,
                                              Video_System_clock_2_out_writedata,
                                              clk,
                                              d1_pio_0_s1_end_xfer,
                                              pio_0_s1_readdata_from_sa,
                                              reset_n,

                                             // outputs:
                                              Video_System_clock_2_out_address_to_slave,
                                              Video_System_clock_2_out_readdata,
                                              Video_System_clock_2_out_reset_n,
                                              Video_System_clock_2_out_waitrequest
                                           )
;

  output  [  3: 0] Video_System_clock_2_out_address_to_slave;
  output  [ 31: 0] Video_System_clock_2_out_readdata;
  output           Video_System_clock_2_out_reset_n;
  output           Video_System_clock_2_out_waitrequest;
  input   [  3: 0] Video_System_clock_2_out_address;
  input   [  3: 0] Video_System_clock_2_out_byteenable;
  input            Video_System_clock_2_out_granted_pio_0_s1;
  input            Video_System_clock_2_out_qualified_request_pio_0_s1;
  input            Video_System_clock_2_out_read;
  input            Video_System_clock_2_out_read_data_valid_pio_0_s1;
  input            Video_System_clock_2_out_requests_pio_0_s1;
  input            Video_System_clock_2_out_write;
  input   [ 31: 0] Video_System_clock_2_out_writedata;
  input            clk;
  input            d1_pio_0_s1_end_xfer;
  input   [ 31: 0] pio_0_s1_readdata_from_sa;
  input            reset_n;

  reg     [  3: 0] Video_System_clock_2_out_address_last_time;
  wire    [  3: 0] Video_System_clock_2_out_address_to_slave;
  reg     [  3: 0] Video_System_clock_2_out_byteenable_last_time;
  reg              Video_System_clock_2_out_read_last_time;
  wire    [ 31: 0] Video_System_clock_2_out_readdata;
  wire             Video_System_clock_2_out_reset_n;
  wire             Video_System_clock_2_out_run;
  wire             Video_System_clock_2_out_waitrequest;
  reg              Video_System_clock_2_out_write_last_time;
  reg     [ 31: 0] Video_System_clock_2_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & ((~Video_System_clock_2_out_qualified_request_pio_0_s1 | ~Video_System_clock_2_out_read | (1 & ~d1_pio_0_s1_end_xfer & Video_System_clock_2_out_read))) & ((~Video_System_clock_2_out_qualified_request_pio_0_s1 | ~Video_System_clock_2_out_write | (1 & Video_System_clock_2_out_write)));

  //cascaded wait assignment, which is an e_assign
  assign Video_System_clock_2_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign Video_System_clock_2_out_address_to_slave = Video_System_clock_2_out_address;

  //Video_System_clock_2/out readdata mux, which is an e_mux
  assign Video_System_clock_2_out_readdata = pio_0_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign Video_System_clock_2_out_waitrequest = ~Video_System_clock_2_out_run;

  //Video_System_clock_2_out_reset_n assignment, which is an e_assign
  assign Video_System_clock_2_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Video_System_clock_2_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_2_out_address_last_time <= 0;
      else 
        Video_System_clock_2_out_address_last_time <= Video_System_clock_2_out_address;
    end


  //Video_System_clock_2/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= Video_System_clock_2_out_waitrequest & (Video_System_clock_2_out_read | Video_System_clock_2_out_write);
    end


  //Video_System_clock_2_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Video_System_clock_2_out_address != Video_System_clock_2_out_address_last_time))
        begin
          $write("%0d ns: Video_System_clock_2_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //Video_System_clock_2_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_2_out_byteenable_last_time <= 0;
      else 
        Video_System_clock_2_out_byteenable_last_time <= Video_System_clock_2_out_byteenable;
    end


  //Video_System_clock_2_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Video_System_clock_2_out_byteenable != Video_System_clock_2_out_byteenable_last_time))
        begin
          $write("%0d ns: Video_System_clock_2_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //Video_System_clock_2_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_2_out_read_last_time <= 0;
      else 
        Video_System_clock_2_out_read_last_time <= Video_System_clock_2_out_read;
    end


  //Video_System_clock_2_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Video_System_clock_2_out_read != Video_System_clock_2_out_read_last_time))
        begin
          $write("%0d ns: Video_System_clock_2_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //Video_System_clock_2_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_2_out_write_last_time <= 0;
      else 
        Video_System_clock_2_out_write_last_time <= Video_System_clock_2_out_write;
    end


  //Video_System_clock_2_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Video_System_clock_2_out_write != Video_System_clock_2_out_write_last_time))
        begin
          $write("%0d ns: Video_System_clock_2_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //Video_System_clock_2_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Video_System_clock_2_out_writedata_last_time <= 0;
      else 
        Video_System_clock_2_out_writedata_last_time <= Video_System_clock_2_out_writedata;
    end


  //Video_System_clock_2_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Video_System_clock_2_out_writedata != Video_System_clock_2_out_writedata_last_time) & Video_System_clock_2_out_write)
        begin
          $write("%0d ns: Video_System_clock_2_out_writedata did not heed wait!!!", $time);
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

module jtag_uart_0_avalon_jtag_slave_arbitrator (
                                                  // inputs:
                                                   Video_System_clock_1_out_address_to_slave,
                                                   Video_System_clock_1_out_nativeaddress,
                                                   Video_System_clock_1_out_read,
                                                   Video_System_clock_1_out_write,
                                                   Video_System_clock_1_out_writedata,
                                                   clk,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable,
                                                   jtag_uart_0_avalon_jtag_slave_irq,
                                                   jtag_uart_0_avalon_jtag_slave_readdata,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest,
                                                   reset_n,

                                                  // outputs:
                                                   Video_System_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave,
                                                   Video_System_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                                   Video_System_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                                   Video_System_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave,
                                                   d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                                   jtag_uart_0_avalon_jtag_slave_address,
                                                   jtag_uart_0_avalon_jtag_slave_chipselect,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_read_n,
                                                   jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_reset_n,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_write_n,
                                                   jtag_uart_0_avalon_jtag_slave_writedata
                                                )
;

  output           Video_System_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave;
  output           Video_System_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave;
  output           Video_System_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  output           Video_System_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave;
  output           d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  output           jtag_uart_0_avalon_jtag_slave_address;
  output           jtag_uart_0_avalon_jtag_slave_chipselect;
  output           jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_reset_n;
  output           jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  input   [  2: 0] Video_System_clock_1_out_address_to_slave;
  input            Video_System_clock_1_out_nativeaddress;
  input            Video_System_clock_1_out_read;
  input            Video_System_clock_1_out_write;
  input   [ 31: 0] Video_System_clock_1_out_writedata;
  input            clk;
  input            jtag_uart_0_avalon_jtag_slave_dataavailable;
  input            jtag_uart_0_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  input            jtag_uart_0_avalon_jtag_slave_readyfordata;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             Video_System_clock_1_out_arbiterlock;
  wire             Video_System_clock_1_out_arbiterlock2;
  wire             Video_System_clock_1_out_continuerequest;
  wire             Video_System_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave;
  wire             Video_System_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             Video_System_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             Video_System_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave;
  wire             Video_System_clock_1_out_saved_grant_jtag_uart_0_avalon_jtag_slave;
  reg              d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_allgrants;
  wire             jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_0_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_0_avalon_jtag_slave_arb_counter_enable;
  reg              jtag_uart_0_avalon_jtag_slave_arb_share_counter;
  wire             jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
  wire             jtag_uart_0_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_0_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  reg              jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire             wait_for_jtag_uart_0_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_0_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((Video_System_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave));
  //assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata;

  assign Video_System_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave = (1) & (Video_System_clock_1_out_read | Video_System_clock_1_out_write);
  //assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests = Video_System_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave;

  //jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_0_avalon_jtag_slave_firsttransfer ? (jtag_uart_0_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_0_avalon_jtag_slave_arb_share_counter ? (jtag_uart_0_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_0_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_allgrants = |jtag_uart_0_avalon_jtag_slave_grant_vector;

  //jtag_uart_0_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_end_xfer = ~(jtag_uart_0_avalon_jtag_slave_waits_for_read | jtag_uart_0_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave = jtag_uart_0_avalon_jtag_slave_end_xfer & (~jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & jtag_uart_0_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_0_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_0_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //Video_System_clock_1/out jtag_uart_0/avalon_jtag_slave arbiterlock, which is an e_assign
  assign Video_System_clock_1_out_arbiterlock = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & Video_System_clock_1_out_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;

  //Video_System_clock_1/out jtag_uart_0/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign Video_System_clock_1_out_arbiterlock2 = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 & Video_System_clock_1_out_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_any_continuerequest = 1;

  //Video_System_clock_1_out_continuerequest continued request, which is an e_assign
  assign Video_System_clock_1_out_continuerequest = 1;

  assign Video_System_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave = Video_System_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave;
  //jtag_uart_0_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_writedata = Video_System_clock_1_out_writedata;

  //master is always granted when requested
  assign Video_System_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave = Video_System_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave;

  //Video_System_clock_1/out saved-grant jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign Video_System_clock_1_out_saved_grant_jtag_uart_0_avalon_jtag_slave = Video_System_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_0_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_0_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_0_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_0_avalon_jtag_slave_chipselect = Video_System_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave;
  //jtag_uart_0_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_firsttransfer = jtag_uart_0_avalon_jtag_slave_begins_xfer ? jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_0_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_0_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_0_avalon_jtag_slave_begins_xfer)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_0_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_0_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_read_n = ~(Video_System_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave & Video_System_clock_1_out_read);

  //~jtag_uart_0_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_write_n = ~(Video_System_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave & Video_System_clock_1_out_write);

  //jtag_uart_0_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_address = Video_System_clock_1_out_nativeaddress;

  //d1_jtag_uart_0_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_0_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_read = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_read_cycle = Video_System_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave & Video_System_clock_1_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_0_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_write = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_write_cycle = Video_System_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave & Video_System_clock_1_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_0_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart_0/avalon_jtag_slave enable non-zero assertions, which is an e_register
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

module pio_0_s1_arbitrator (
                             // inputs:
                              Video_System_clock_2_out_address_to_slave,
                              Video_System_clock_2_out_nativeaddress,
                              Video_System_clock_2_out_read,
                              Video_System_clock_2_out_write,
                              Video_System_clock_2_out_writedata,
                              clk,
                              pio_0_s1_irq,
                              pio_0_s1_readdata,
                              reset_n,

                             // outputs:
                              Video_System_clock_2_out_granted_pio_0_s1,
                              Video_System_clock_2_out_qualified_request_pio_0_s1,
                              Video_System_clock_2_out_read_data_valid_pio_0_s1,
                              Video_System_clock_2_out_requests_pio_0_s1,
                              d1_pio_0_s1_end_xfer,
                              pio_0_s1_address,
                              pio_0_s1_chipselect,
                              pio_0_s1_irq_from_sa,
                              pio_0_s1_readdata_from_sa,
                              pio_0_s1_reset_n,
                              pio_0_s1_write_n,
                              pio_0_s1_writedata
                           )
;

  output           Video_System_clock_2_out_granted_pio_0_s1;
  output           Video_System_clock_2_out_qualified_request_pio_0_s1;
  output           Video_System_clock_2_out_read_data_valid_pio_0_s1;
  output           Video_System_clock_2_out_requests_pio_0_s1;
  output           d1_pio_0_s1_end_xfer;
  output  [  1: 0] pio_0_s1_address;
  output           pio_0_s1_chipselect;
  output           pio_0_s1_irq_from_sa;
  output  [ 31: 0] pio_0_s1_readdata_from_sa;
  output           pio_0_s1_reset_n;
  output           pio_0_s1_write_n;
  output  [ 31: 0] pio_0_s1_writedata;
  input   [  3: 0] Video_System_clock_2_out_address_to_slave;
  input   [  1: 0] Video_System_clock_2_out_nativeaddress;
  input            Video_System_clock_2_out_read;
  input            Video_System_clock_2_out_write;
  input   [ 31: 0] Video_System_clock_2_out_writedata;
  input            clk;
  input            pio_0_s1_irq;
  input   [ 31: 0] pio_0_s1_readdata;
  input            reset_n;

  wire             Video_System_clock_2_out_arbiterlock;
  wire             Video_System_clock_2_out_arbiterlock2;
  wire             Video_System_clock_2_out_continuerequest;
  wire             Video_System_clock_2_out_granted_pio_0_s1;
  wire             Video_System_clock_2_out_qualified_request_pio_0_s1;
  wire             Video_System_clock_2_out_read_data_valid_pio_0_s1;
  wire             Video_System_clock_2_out_requests_pio_0_s1;
  wire             Video_System_clock_2_out_saved_grant_pio_0_s1;
  reg              d1_pio_0_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] pio_0_s1_address;
  wire             pio_0_s1_allgrants;
  wire             pio_0_s1_allow_new_arb_cycle;
  wire             pio_0_s1_any_bursting_master_saved_grant;
  wire             pio_0_s1_any_continuerequest;
  wire             pio_0_s1_arb_counter_enable;
  reg              pio_0_s1_arb_share_counter;
  wire             pio_0_s1_arb_share_counter_next_value;
  wire             pio_0_s1_arb_share_set_values;
  wire             pio_0_s1_beginbursttransfer_internal;
  wire             pio_0_s1_begins_xfer;
  wire             pio_0_s1_chipselect;
  wire             pio_0_s1_end_xfer;
  wire             pio_0_s1_firsttransfer;
  wire             pio_0_s1_grant_vector;
  wire             pio_0_s1_in_a_read_cycle;
  wire             pio_0_s1_in_a_write_cycle;
  wire             pio_0_s1_irq_from_sa;
  wire             pio_0_s1_master_qreq_vector;
  wire             pio_0_s1_non_bursting_master_requests;
  wire    [ 31: 0] pio_0_s1_readdata_from_sa;
  reg              pio_0_s1_reg_firsttransfer;
  wire             pio_0_s1_reset_n;
  reg              pio_0_s1_slavearbiterlockenable;
  wire             pio_0_s1_slavearbiterlockenable2;
  wire             pio_0_s1_unreg_firsttransfer;
  wire             pio_0_s1_waits_for_read;
  wire             pio_0_s1_waits_for_write;
  wire             pio_0_s1_write_n;
  wire    [ 31: 0] pio_0_s1_writedata;
  wire             wait_for_pio_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_0_s1_end_xfer;
    end


  assign pio_0_s1_begins_xfer = ~d1_reasons_to_wait & ((Video_System_clock_2_out_qualified_request_pio_0_s1));
  //assign pio_0_s1_readdata_from_sa = pio_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_0_s1_readdata_from_sa = pio_0_s1_readdata;

  assign Video_System_clock_2_out_requests_pio_0_s1 = (1) & (Video_System_clock_2_out_read | Video_System_clock_2_out_write);
  //pio_0_s1_arb_share_counter set values, which is an e_mux
  assign pio_0_s1_arb_share_set_values = 1;

  //pio_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_0_s1_non_bursting_master_requests = Video_System_clock_2_out_requests_pio_0_s1;

  //pio_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_0_s1_any_bursting_master_saved_grant = 0;

  //pio_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_0_s1_arb_share_counter_next_value = pio_0_s1_firsttransfer ? (pio_0_s1_arb_share_set_values - 1) : |pio_0_s1_arb_share_counter ? (pio_0_s1_arb_share_counter - 1) : 0;

  //pio_0_s1_allgrants all slave grants, which is an e_mux
  assign pio_0_s1_allgrants = |pio_0_s1_grant_vector;

  //pio_0_s1_end_xfer assignment, which is an e_assign
  assign pio_0_s1_end_xfer = ~(pio_0_s1_waits_for_read | pio_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_0_s1 = pio_0_s1_end_xfer & (~pio_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_0_s1 & pio_0_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_0_s1 & ~pio_0_s1_non_bursting_master_requests);

  //pio_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_0_s1_arb_share_counter <= 0;
      else if (pio_0_s1_arb_counter_enable)
          pio_0_s1_arb_share_counter <= pio_0_s1_arb_share_counter_next_value;
    end


  //pio_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_0_s1_slavearbiterlockenable <= 0;
      else if ((|pio_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_0_s1) | (end_xfer_arb_share_counter_term_pio_0_s1 & ~pio_0_s1_non_bursting_master_requests))
          pio_0_s1_slavearbiterlockenable <= |pio_0_s1_arb_share_counter_next_value;
    end


  //Video_System_clock_2/out pio_0/s1 arbiterlock, which is an e_assign
  assign Video_System_clock_2_out_arbiterlock = pio_0_s1_slavearbiterlockenable & Video_System_clock_2_out_continuerequest;

  //pio_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_0_s1_slavearbiterlockenable2 = |pio_0_s1_arb_share_counter_next_value;

  //Video_System_clock_2/out pio_0/s1 arbiterlock2, which is an e_assign
  assign Video_System_clock_2_out_arbiterlock2 = pio_0_s1_slavearbiterlockenable2 & Video_System_clock_2_out_continuerequest;

  //pio_0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_0_s1_any_continuerequest = 1;

  //Video_System_clock_2_out_continuerequest continued request, which is an e_assign
  assign Video_System_clock_2_out_continuerequest = 1;

  assign Video_System_clock_2_out_qualified_request_pio_0_s1 = Video_System_clock_2_out_requests_pio_0_s1;
  //pio_0_s1_writedata mux, which is an e_mux
  assign pio_0_s1_writedata = Video_System_clock_2_out_writedata;

  //master is always granted when requested
  assign Video_System_clock_2_out_granted_pio_0_s1 = Video_System_clock_2_out_qualified_request_pio_0_s1;

  //Video_System_clock_2/out saved-grant pio_0/s1, which is an e_assign
  assign Video_System_clock_2_out_saved_grant_pio_0_s1 = Video_System_clock_2_out_requests_pio_0_s1;

  //allow new arb cycle for pio_0/s1, which is an e_assign
  assign pio_0_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_0_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_0_s1_master_qreq_vector = 1;

  //pio_0_s1_reset_n assignment, which is an e_assign
  assign pio_0_s1_reset_n = reset_n;

  assign pio_0_s1_chipselect = Video_System_clock_2_out_granted_pio_0_s1;
  //pio_0_s1_firsttransfer first transaction, which is an e_assign
  assign pio_0_s1_firsttransfer = pio_0_s1_begins_xfer ? pio_0_s1_unreg_firsttransfer : pio_0_s1_reg_firsttransfer;

  //pio_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_0_s1_unreg_firsttransfer = ~(pio_0_s1_slavearbiterlockenable & pio_0_s1_any_continuerequest);

  //pio_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_0_s1_reg_firsttransfer <= 1'b1;
      else if (pio_0_s1_begins_xfer)
          pio_0_s1_reg_firsttransfer <= pio_0_s1_unreg_firsttransfer;
    end


  //pio_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_0_s1_beginbursttransfer_internal = pio_0_s1_begins_xfer;

  //~pio_0_s1_write_n assignment, which is an e_mux
  assign pio_0_s1_write_n = ~(Video_System_clock_2_out_granted_pio_0_s1 & Video_System_clock_2_out_write);

  //pio_0_s1_address mux, which is an e_mux
  assign pio_0_s1_address = Video_System_clock_2_out_nativeaddress;

  //d1_pio_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_0_s1_end_xfer <= 1;
      else 
        d1_pio_0_s1_end_xfer <= pio_0_s1_end_xfer;
    end


  //pio_0_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_0_s1_waits_for_read = pio_0_s1_in_a_read_cycle & pio_0_s1_begins_xfer;

  //pio_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_0_s1_in_a_read_cycle = Video_System_clock_2_out_granted_pio_0_s1 & Video_System_clock_2_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_0_s1_in_a_read_cycle;

  //pio_0_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_0_s1_waits_for_write = pio_0_s1_in_a_write_cycle & 0;

  //pio_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_0_s1_in_a_write_cycle = Video_System_clock_2_out_granted_pio_0_s1 & Video_System_clock_2_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_0_s1_in_a_write_cycle;

  assign wait_for_pio_0_s1_counter = 0;
  //assign pio_0_s1_irq_from_sa = pio_0_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_0_s1_irq_from_sa = pio_0_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_0/s1 enable non-zero assertions, which is an e_register
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

module Video_System_reset_sys_clk_domain_synch_module (
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

module Video_System_reset_clk_domain_synch_module (
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

module Video_System_reset_vga_clk_domain_synch_module (
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

module Video_System (
                      // 1) global signals:
                       clk,
                       reset_n,
                       sys_clk,
                       vga_clk,

                      // the_Pixel_Buffer
                       SRAM_ADDR_from_the_Pixel_Buffer,
                       SRAM_CE_N_from_the_Pixel_Buffer,
                       SRAM_DQ_to_and_from_the_Pixel_Buffer,
                       SRAM_LB_N_from_the_Pixel_Buffer,
                       SRAM_OE_N_from_the_Pixel_Buffer,
                       SRAM_UB_N_from_the_Pixel_Buffer,
                       SRAM_WE_N_from_the_Pixel_Buffer,

                      // the_VGA_Controller
                       VGA_BLANK_from_the_VGA_Controller,
                       VGA_B_from_the_VGA_Controller,
                       VGA_CLK_from_the_VGA_Controller,
                       VGA_G_from_the_VGA_Controller,
                       VGA_HS_from_the_VGA_Controller,
                       VGA_R_from_the_VGA_Controller,
                       VGA_SYNC_from_the_VGA_Controller,
                       VGA_VS_from_the_VGA_Controller,

                      // the_pio_0
                       in_port_to_the_pio_0
                    )
;

  output  [ 19: 0] SRAM_ADDR_from_the_Pixel_Buffer;
  output           SRAM_CE_N_from_the_Pixel_Buffer;
  inout   [ 15: 0] SRAM_DQ_to_and_from_the_Pixel_Buffer;
  output           SRAM_LB_N_from_the_Pixel_Buffer;
  output           SRAM_OE_N_from_the_Pixel_Buffer;
  output           SRAM_UB_N_from_the_Pixel_Buffer;
  output           SRAM_WE_N_from_the_Pixel_Buffer;
  output           VGA_BLANK_from_the_VGA_Controller;
  output  [  7: 0] VGA_B_from_the_VGA_Controller;
  output           VGA_CLK_from_the_VGA_Controller;
  output  [  7: 0] VGA_G_from_the_VGA_Controller;
  output           VGA_HS_from_the_VGA_Controller;
  output  [  7: 0] VGA_R_from_the_VGA_Controller;
  output           VGA_SYNC_from_the_VGA_Controller;
  output           VGA_VS_from_the_VGA_Controller;
  output           sys_clk;
  output           vga_clk;
  input            clk;
  input   [  3: 0] in_port_to_the_pio_0;
  input            reset_n;

  wire    [ 21: 0] CPU_data_master_address;
  wire    [ 21: 0] CPU_data_master_address_to_slave;
  wire    [  3: 0] CPU_data_master_byteenable;
  wire    [  1: 0] CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave;
  wire             CPU_data_master_byteenable_Video_System_clock_0_in;
  wire    [  1: 0] CPU_data_master_dbs_address;
  wire    [ 15: 0] CPU_data_master_dbs_write_16;
  wire    [  7: 0] CPU_data_master_dbs_write_8;
  wire             CPU_data_master_debugaccess;
  wire             CPU_data_master_granted_CPU_jtag_debug_module;
  wire             CPU_data_master_granted_Onchip_Memory_s1;
  wire             CPU_data_master_granted_Pixel_Buffer_DMA_avalon_control_slave;
  wire             CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave;
  wire             CPU_data_master_granted_Video_System_clock_0_in;
  wire             CPU_data_master_granted_Video_System_clock_1_in;
  wire             CPU_data_master_granted_Video_System_clock_2_in;
  wire    [ 31: 0] CPU_data_master_irq;
  wire             CPU_data_master_no_byte_enables_and_last_term;
  wire             CPU_data_master_qualified_request_CPU_jtag_debug_module;
  wire             CPU_data_master_qualified_request_Onchip_Memory_s1;
  wire             CPU_data_master_qualified_request_Pixel_Buffer_DMA_avalon_control_slave;
  wire             CPU_data_master_qualified_request_Pixel_Buffer_avalon_sram_slave;
  wire             CPU_data_master_qualified_request_Video_System_clock_0_in;
  wire             CPU_data_master_qualified_request_Video_System_clock_1_in;
  wire             CPU_data_master_qualified_request_Video_System_clock_2_in;
  wire             CPU_data_master_read;
  wire             CPU_data_master_read_data_valid_CPU_jtag_debug_module;
  wire             CPU_data_master_read_data_valid_Onchip_Memory_s1;
  wire             CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave;
  wire             CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave;
  wire             CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register;
  wire             CPU_data_master_read_data_valid_Video_System_clock_0_in;
  wire             CPU_data_master_read_data_valid_Video_System_clock_1_in;
  wire             CPU_data_master_read_data_valid_Video_System_clock_2_in;
  wire    [ 31: 0] CPU_data_master_readdata;
  wire             CPU_data_master_requests_CPU_jtag_debug_module;
  wire             CPU_data_master_requests_Onchip_Memory_s1;
  wire             CPU_data_master_requests_Pixel_Buffer_DMA_avalon_control_slave;
  wire             CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave;
  wire             CPU_data_master_requests_Video_System_clock_0_in;
  wire             CPU_data_master_requests_Video_System_clock_1_in;
  wire             CPU_data_master_requests_Video_System_clock_2_in;
  wire             CPU_data_master_waitrequest;
  wire             CPU_data_master_write;
  wire    [ 31: 0] CPU_data_master_writedata;
  wire    [ 21: 0] CPU_instruction_master_address;
  wire    [ 21: 0] CPU_instruction_master_address_to_slave;
  wire             CPU_instruction_master_granted_CPU_jtag_debug_module;
  wire             CPU_instruction_master_granted_Onchip_Memory_s1;
  wire             CPU_instruction_master_qualified_request_CPU_jtag_debug_module;
  wire             CPU_instruction_master_qualified_request_Onchip_Memory_s1;
  wire             CPU_instruction_master_read;
  wire             CPU_instruction_master_read_data_valid_CPU_jtag_debug_module;
  wire             CPU_instruction_master_read_data_valid_Onchip_Memory_s1;
  wire    [ 31: 0] CPU_instruction_master_readdata;
  wire             CPU_instruction_master_requests_CPU_jtag_debug_module;
  wire             CPU_instruction_master_requests_Onchip_Memory_s1;
  wire             CPU_instruction_master_waitrequest;
  wire    [  8: 0] CPU_jtag_debug_module_address;
  wire             CPU_jtag_debug_module_begintransfer;
  wire    [  3: 0] CPU_jtag_debug_module_byteenable;
  wire             CPU_jtag_debug_module_chipselect;
  wire             CPU_jtag_debug_module_debugaccess;
  wire    [ 31: 0] CPU_jtag_debug_module_readdata;
  wire    [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  wire             CPU_jtag_debug_module_reset_n;
  wire             CPU_jtag_debug_module_resetrequest;
  wire             CPU_jtag_debug_module_resetrequest_from_sa;
  wire             CPU_jtag_debug_module_write;
  wire    [ 31: 0] CPU_jtag_debug_module_writedata;
  wire             Clock_Signals_avalon_clocks_slave_address;
  wire    [  7: 0] Clock_Signals_avalon_clocks_slave_readdata;
  wire    [  7: 0] Clock_Signals_avalon_clocks_slave_readdata_from_sa;
  wire    [ 29: 0] Dual_Clock_FIFO_avalon_dc_buffer_sink_data;
  wire             Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket;
  wire             Dual_Clock_FIFO_avalon_dc_buffer_sink_ready;
  wire             Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa;
  wire             Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket;
  wire             Dual_Clock_FIFO_avalon_dc_buffer_sink_valid;
  wire    [ 29: 0] Dual_Clock_FIFO_avalon_dc_buffer_source_data;
  wire             Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket;
  wire             Dual_Clock_FIFO_avalon_dc_buffer_source_ready;
  wire             Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket;
  wire             Dual_Clock_FIFO_avalon_dc_buffer_source_valid;
  wire    [ 16: 0] Onchip_Memory_s1_address;
  wire    [  3: 0] Onchip_Memory_s1_byteenable;
  wire             Onchip_Memory_s1_chipselect;
  wire             Onchip_Memory_s1_clken;
  wire    [ 31: 0] Onchip_Memory_s1_readdata;
  wire    [ 31: 0] Onchip_Memory_s1_readdata_from_sa;
  wire             Onchip_Memory_s1_reset;
  wire             Onchip_Memory_s1_write;
  wire    [ 31: 0] Onchip_Memory_s1_writedata;
  wire    [  1: 0] Pixel_Buffer_DMA_avalon_control_slave_address;
  wire    [  3: 0] Pixel_Buffer_DMA_avalon_control_slave_byteenable;
  wire             Pixel_Buffer_DMA_avalon_control_slave_read;
  wire    [ 31: 0] Pixel_Buffer_DMA_avalon_control_slave_readdata;
  wire    [ 31: 0] Pixel_Buffer_DMA_avalon_control_slave_readdata_from_sa;
  wire             Pixel_Buffer_DMA_avalon_control_slave_write;
  wire    [ 31: 0] Pixel_Buffer_DMA_avalon_control_slave_writedata;
  wire    [ 31: 0] Pixel_Buffer_DMA_avalon_pixel_dma_master_address;
  wire    [ 31: 0] Pixel_Buffer_DMA_avalon_pixel_dma_master_address_to_slave;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_arbiterlock;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_Pixel_Buffer_avalon_sram_slave;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_qualified_request_Pixel_Buffer_avalon_sram_slave;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_read;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register;
  wire    [ 15: 0] Pixel_Buffer_DMA_avalon_pixel_dma_master_readdata;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_readdatavalid;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_reset;
  wire             Pixel_Buffer_DMA_avalon_pixel_dma_master_waitrequest;
  wire    [ 15: 0] Pixel_Buffer_DMA_avalon_pixel_source_data;
  wire             Pixel_Buffer_DMA_avalon_pixel_source_endofpacket;
  wire             Pixel_Buffer_DMA_avalon_pixel_source_ready;
  wire             Pixel_Buffer_DMA_avalon_pixel_source_startofpacket;
  wire             Pixel_Buffer_DMA_avalon_pixel_source_valid;
  wire    [ 19: 0] Pixel_Buffer_avalon_sram_slave_address;
  wire    [  1: 0] Pixel_Buffer_avalon_sram_slave_byteenable;
  wire             Pixel_Buffer_avalon_sram_slave_read;
  wire    [ 15: 0] Pixel_Buffer_avalon_sram_slave_readdata;
  wire    [ 15: 0] Pixel_Buffer_avalon_sram_slave_readdata_from_sa;
  wire             Pixel_Buffer_avalon_sram_slave_readdatavalid;
  wire             Pixel_Buffer_avalon_sram_slave_reset;
  wire             Pixel_Buffer_avalon_sram_slave_write;
  wire    [ 15: 0] Pixel_Buffer_avalon_sram_slave_writedata;
  wire    [ 15: 0] Pixel_RGB_Resampler_avalon_rgb_sink_data;
  wire             Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket;
  wire             Pixel_RGB_Resampler_avalon_rgb_sink_ready;
  wire             Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa;
  wire             Pixel_RGB_Resampler_avalon_rgb_sink_reset;
  wire             Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket;
  wire             Pixel_RGB_Resampler_avalon_rgb_sink_valid;
  wire    [ 29: 0] Pixel_RGB_Resampler_avalon_rgb_source_data;
  wire             Pixel_RGB_Resampler_avalon_rgb_source_endofpacket;
  wire             Pixel_RGB_Resampler_avalon_rgb_source_ready;
  wire             Pixel_RGB_Resampler_avalon_rgb_source_startofpacket;
  wire             Pixel_RGB_Resampler_avalon_rgb_source_valid;
  wire    [ 19: 0] SRAM_ADDR_from_the_Pixel_Buffer;
  wire             SRAM_CE_N_from_the_Pixel_Buffer;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_Pixel_Buffer;
  wire             SRAM_LB_N_from_the_Pixel_Buffer;
  wire             SRAM_OE_N_from_the_Pixel_Buffer;
  wire             SRAM_UB_N_from_the_Pixel_Buffer;
  wire             SRAM_WE_N_from_the_Pixel_Buffer;
  wire             VGA_BLANK_from_the_VGA_Controller;
  wire    [  7: 0] VGA_B_from_the_VGA_Controller;
  wire             VGA_CLK_from_the_VGA_Controller;
  wire    [ 29: 0] VGA_Controller_avalon_vga_sink_data;
  wire             VGA_Controller_avalon_vga_sink_endofpacket;
  wire             VGA_Controller_avalon_vga_sink_ready;
  wire             VGA_Controller_avalon_vga_sink_ready_from_sa;
  wire             VGA_Controller_avalon_vga_sink_reset;
  wire             VGA_Controller_avalon_vga_sink_startofpacket;
  wire             VGA_Controller_avalon_vga_sink_valid;
  wire    [  7: 0] VGA_G_from_the_VGA_Controller;
  wire             VGA_HS_from_the_VGA_Controller;
  wire    [  7: 0] VGA_R_from_the_VGA_Controller;
  wire             VGA_SYNC_from_the_VGA_Controller;
  wire             VGA_VS_from_the_VGA_Controller;
  wire             Video_System_clock_0_in_address;
  wire             Video_System_clock_0_in_endofpacket;
  wire             Video_System_clock_0_in_endofpacket_from_sa;
  wire             Video_System_clock_0_in_nativeaddress;
  wire             Video_System_clock_0_in_read;
  wire    [  7: 0] Video_System_clock_0_in_readdata;
  wire    [  7: 0] Video_System_clock_0_in_readdata_from_sa;
  wire             Video_System_clock_0_in_reset_n;
  wire             Video_System_clock_0_in_waitrequest;
  wire             Video_System_clock_0_in_waitrequest_from_sa;
  wire             Video_System_clock_0_in_write;
  wire    [  7: 0] Video_System_clock_0_in_writedata;
  wire             Video_System_clock_0_out_address;
  wire             Video_System_clock_0_out_address_to_slave;
  wire             Video_System_clock_0_out_endofpacket;
  wire             Video_System_clock_0_out_granted_Clock_Signals_avalon_clocks_slave;
  wire             Video_System_clock_0_out_nativeaddress;
  wire             Video_System_clock_0_out_qualified_request_Clock_Signals_avalon_clocks_slave;
  wire             Video_System_clock_0_out_read;
  wire             Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave;
  wire    [  7: 0] Video_System_clock_0_out_readdata;
  wire             Video_System_clock_0_out_requests_Clock_Signals_avalon_clocks_slave;
  wire             Video_System_clock_0_out_reset_n;
  wire             Video_System_clock_0_out_waitrequest;
  wire             Video_System_clock_0_out_write;
  wire    [  7: 0] Video_System_clock_0_out_writedata;
  wire    [  2: 0] Video_System_clock_1_in_address;
  wire    [  3: 0] Video_System_clock_1_in_byteenable;
  wire             Video_System_clock_1_in_endofpacket;
  wire             Video_System_clock_1_in_endofpacket_from_sa;
  wire             Video_System_clock_1_in_nativeaddress;
  wire             Video_System_clock_1_in_read;
  wire    [ 31: 0] Video_System_clock_1_in_readdata;
  wire    [ 31: 0] Video_System_clock_1_in_readdata_from_sa;
  wire             Video_System_clock_1_in_reset_n;
  wire             Video_System_clock_1_in_waitrequest;
  wire             Video_System_clock_1_in_waitrequest_from_sa;
  wire             Video_System_clock_1_in_write;
  wire    [ 31: 0] Video_System_clock_1_in_writedata;
  wire    [  2: 0] Video_System_clock_1_out_address;
  wire    [  2: 0] Video_System_clock_1_out_address_to_slave;
  wire    [  3: 0] Video_System_clock_1_out_byteenable;
  wire             Video_System_clock_1_out_endofpacket;
  wire             Video_System_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave;
  wire             Video_System_clock_1_out_nativeaddress;
  wire             Video_System_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             Video_System_clock_1_out_read;
  wire             Video_System_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire    [ 31: 0] Video_System_clock_1_out_readdata;
  wire             Video_System_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave;
  wire             Video_System_clock_1_out_reset_n;
  wire             Video_System_clock_1_out_waitrequest;
  wire             Video_System_clock_1_out_write;
  wire    [ 31: 0] Video_System_clock_1_out_writedata;
  wire    [  3: 0] Video_System_clock_2_in_address;
  wire    [  3: 0] Video_System_clock_2_in_byteenable;
  wire             Video_System_clock_2_in_endofpacket;
  wire             Video_System_clock_2_in_endofpacket_from_sa;
  wire    [  1: 0] Video_System_clock_2_in_nativeaddress;
  wire             Video_System_clock_2_in_read;
  wire    [ 31: 0] Video_System_clock_2_in_readdata;
  wire    [ 31: 0] Video_System_clock_2_in_readdata_from_sa;
  wire             Video_System_clock_2_in_reset_n;
  wire             Video_System_clock_2_in_waitrequest;
  wire             Video_System_clock_2_in_waitrequest_from_sa;
  wire             Video_System_clock_2_in_write;
  wire    [ 31: 0] Video_System_clock_2_in_writedata;
  wire    [  3: 0] Video_System_clock_2_out_address;
  wire    [  3: 0] Video_System_clock_2_out_address_to_slave;
  wire    [  3: 0] Video_System_clock_2_out_byteenable;
  wire             Video_System_clock_2_out_endofpacket;
  wire             Video_System_clock_2_out_granted_pio_0_s1;
  wire    [  1: 0] Video_System_clock_2_out_nativeaddress;
  wire             Video_System_clock_2_out_qualified_request_pio_0_s1;
  wire             Video_System_clock_2_out_read;
  wire             Video_System_clock_2_out_read_data_valid_pio_0_s1;
  wire    [ 31: 0] Video_System_clock_2_out_readdata;
  wire             Video_System_clock_2_out_requests_pio_0_s1;
  wire             Video_System_clock_2_out_reset_n;
  wire             Video_System_clock_2_out_waitrequest;
  wire             Video_System_clock_2_out_write;
  wire    [ 31: 0] Video_System_clock_2_out_writedata;
  wire             clk_reset_n;
  wire             d1_CPU_jtag_debug_module_end_xfer;
  wire             d1_Clock_Signals_avalon_clocks_slave_end_xfer;
  wire             d1_Onchip_Memory_s1_end_xfer;
  wire             d1_Pixel_Buffer_DMA_avalon_control_slave_end_xfer;
  wire             d1_Pixel_Buffer_avalon_sram_slave_end_xfer;
  wire             d1_Video_System_clock_0_in_end_xfer;
  wire             d1_Video_System_clock_1_in_end_xfer;
  wire             d1_Video_System_clock_2_in_end_xfer;
  wire             d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             d1_pio_0_s1_end_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_irq;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire             out_clk_Clock_Signals_VGA_CLK;
  wire             out_clk_Clock_Signals_sys_clk;
  wire    [  1: 0] pio_0_s1_address;
  wire             pio_0_s1_chipselect;
  wire             pio_0_s1_irq;
  wire             pio_0_s1_irq_from_sa;
  wire    [ 31: 0] pio_0_s1_readdata;
  wire    [ 31: 0] pio_0_s1_readdata_from_sa;
  wire             pio_0_s1_reset_n;
  wire             pio_0_s1_write_n;
  wire    [ 31: 0] pio_0_s1_writedata;
  wire             registered_CPU_data_master_read_data_valid_Onchip_Memory_s1;
  wire             registered_CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave;
  wire             reset_n_sources;
  wire             sys_clk;
  wire             sys_clk_reset_n;
  wire             vga_clk;
  wire             vga_clk_reset_n;
  CPU_jtag_debug_module_arbitrator the_CPU_jtag_debug_module
    (
      .CPU_data_master_address_to_slave                               (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                     (CPU_data_master_byteenable),
      .CPU_data_master_debugaccess                                    (CPU_data_master_debugaccess),
      .CPU_data_master_granted_CPU_jtag_debug_module                  (CPU_data_master_granted_CPU_jtag_debug_module),
      .CPU_data_master_qualified_request_CPU_jtag_debug_module        (CPU_data_master_qualified_request_CPU_jtag_debug_module),
      .CPU_data_master_read                                           (CPU_data_master_read),
      .CPU_data_master_read_data_valid_CPU_jtag_debug_module          (CPU_data_master_read_data_valid_CPU_jtag_debug_module),
      .CPU_data_master_requests_CPU_jtag_debug_module                 (CPU_data_master_requests_CPU_jtag_debug_module),
      .CPU_data_master_waitrequest                                    (CPU_data_master_waitrequest),
      .CPU_data_master_write                                          (CPU_data_master_write),
      .CPU_data_master_writedata                                      (CPU_data_master_writedata),
      .CPU_instruction_master_address_to_slave                        (CPU_instruction_master_address_to_slave),
      .CPU_instruction_master_granted_CPU_jtag_debug_module           (CPU_instruction_master_granted_CPU_jtag_debug_module),
      .CPU_instruction_master_qualified_request_CPU_jtag_debug_module (CPU_instruction_master_qualified_request_CPU_jtag_debug_module),
      .CPU_instruction_master_read                                    (CPU_instruction_master_read),
      .CPU_instruction_master_read_data_valid_CPU_jtag_debug_module   (CPU_instruction_master_read_data_valid_CPU_jtag_debug_module),
      .CPU_instruction_master_requests_CPU_jtag_debug_module          (CPU_instruction_master_requests_CPU_jtag_debug_module),
      .CPU_jtag_debug_module_address                                  (CPU_jtag_debug_module_address),
      .CPU_jtag_debug_module_begintransfer                            (CPU_jtag_debug_module_begintransfer),
      .CPU_jtag_debug_module_byteenable                               (CPU_jtag_debug_module_byteenable),
      .CPU_jtag_debug_module_chipselect                               (CPU_jtag_debug_module_chipselect),
      .CPU_jtag_debug_module_debugaccess                              (CPU_jtag_debug_module_debugaccess),
      .CPU_jtag_debug_module_readdata                                 (CPU_jtag_debug_module_readdata),
      .CPU_jtag_debug_module_readdata_from_sa                         (CPU_jtag_debug_module_readdata_from_sa),
      .CPU_jtag_debug_module_reset_n                                  (CPU_jtag_debug_module_reset_n),
      .CPU_jtag_debug_module_resetrequest                             (CPU_jtag_debug_module_resetrequest),
      .CPU_jtag_debug_module_resetrequest_from_sa                     (CPU_jtag_debug_module_resetrequest_from_sa),
      .CPU_jtag_debug_module_write                                    (CPU_jtag_debug_module_write),
      .CPU_jtag_debug_module_writedata                                (CPU_jtag_debug_module_writedata),
      .clk                                                            (sys_clk),
      .d1_CPU_jtag_debug_module_end_xfer                              (d1_CPU_jtag_debug_module_end_xfer),
      .reset_n                                                        (sys_clk_reset_n)
    );

  CPU_data_master_arbitrator the_CPU_data_master
    (
      .CPU_data_master_address                                                          (CPU_data_master_address),
      .CPU_data_master_address_to_slave                                                 (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave                        (CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave),
      .CPU_data_master_byteenable_Video_System_clock_0_in                               (CPU_data_master_byteenable_Video_System_clock_0_in),
      .CPU_data_master_dbs_address                                                      (CPU_data_master_dbs_address),
      .CPU_data_master_dbs_write_16                                                     (CPU_data_master_dbs_write_16),
      .CPU_data_master_dbs_write_8                                                      (CPU_data_master_dbs_write_8),
      .CPU_data_master_granted_CPU_jtag_debug_module                                    (CPU_data_master_granted_CPU_jtag_debug_module),
      .CPU_data_master_granted_Onchip_Memory_s1                                         (CPU_data_master_granted_Onchip_Memory_s1),
      .CPU_data_master_granted_Pixel_Buffer_DMA_avalon_control_slave                    (CPU_data_master_granted_Pixel_Buffer_DMA_avalon_control_slave),
      .CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave                           (CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave),
      .CPU_data_master_granted_Video_System_clock_0_in                                  (CPU_data_master_granted_Video_System_clock_0_in),
      .CPU_data_master_granted_Video_System_clock_1_in                                  (CPU_data_master_granted_Video_System_clock_1_in),
      .CPU_data_master_granted_Video_System_clock_2_in                                  (CPU_data_master_granted_Video_System_clock_2_in),
      .CPU_data_master_irq                                                              (CPU_data_master_irq),
      .CPU_data_master_no_byte_enables_and_last_term                                    (CPU_data_master_no_byte_enables_and_last_term),
      .CPU_data_master_qualified_request_CPU_jtag_debug_module                          (CPU_data_master_qualified_request_CPU_jtag_debug_module),
      .CPU_data_master_qualified_request_Onchip_Memory_s1                               (CPU_data_master_qualified_request_Onchip_Memory_s1),
      .CPU_data_master_qualified_request_Pixel_Buffer_DMA_avalon_control_slave          (CPU_data_master_qualified_request_Pixel_Buffer_DMA_avalon_control_slave),
      .CPU_data_master_qualified_request_Pixel_Buffer_avalon_sram_slave                 (CPU_data_master_qualified_request_Pixel_Buffer_avalon_sram_slave),
      .CPU_data_master_qualified_request_Video_System_clock_0_in                        (CPU_data_master_qualified_request_Video_System_clock_0_in),
      .CPU_data_master_qualified_request_Video_System_clock_1_in                        (CPU_data_master_qualified_request_Video_System_clock_1_in),
      .CPU_data_master_qualified_request_Video_System_clock_2_in                        (CPU_data_master_qualified_request_Video_System_clock_2_in),
      .CPU_data_master_read                                                             (CPU_data_master_read),
      .CPU_data_master_read_data_valid_CPU_jtag_debug_module                            (CPU_data_master_read_data_valid_CPU_jtag_debug_module),
      .CPU_data_master_read_data_valid_Onchip_Memory_s1                                 (CPU_data_master_read_data_valid_Onchip_Memory_s1),
      .CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave            (CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave),
      .CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave                   (CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave),
      .CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register    (CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register),
      .CPU_data_master_read_data_valid_Video_System_clock_0_in                          (CPU_data_master_read_data_valid_Video_System_clock_0_in),
      .CPU_data_master_read_data_valid_Video_System_clock_1_in                          (CPU_data_master_read_data_valid_Video_System_clock_1_in),
      .CPU_data_master_read_data_valid_Video_System_clock_2_in                          (CPU_data_master_read_data_valid_Video_System_clock_2_in),
      .CPU_data_master_readdata                                                         (CPU_data_master_readdata),
      .CPU_data_master_requests_CPU_jtag_debug_module                                   (CPU_data_master_requests_CPU_jtag_debug_module),
      .CPU_data_master_requests_Onchip_Memory_s1                                        (CPU_data_master_requests_Onchip_Memory_s1),
      .CPU_data_master_requests_Pixel_Buffer_DMA_avalon_control_slave                   (CPU_data_master_requests_Pixel_Buffer_DMA_avalon_control_slave),
      .CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave                          (CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave),
      .CPU_data_master_requests_Video_System_clock_0_in                                 (CPU_data_master_requests_Video_System_clock_0_in),
      .CPU_data_master_requests_Video_System_clock_1_in                                 (CPU_data_master_requests_Video_System_clock_1_in),
      .CPU_data_master_requests_Video_System_clock_2_in                                 (CPU_data_master_requests_Video_System_clock_2_in),
      .CPU_data_master_waitrequest                                                      (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                            (CPU_data_master_write),
      .CPU_data_master_writedata                                                        (CPU_data_master_writedata),
      .CPU_jtag_debug_module_readdata_from_sa                                           (CPU_jtag_debug_module_readdata_from_sa),
      .Onchip_Memory_s1_readdata_from_sa                                                (Onchip_Memory_s1_readdata_from_sa),
      .Pixel_Buffer_DMA_avalon_control_slave_readdata_from_sa                           (Pixel_Buffer_DMA_avalon_control_slave_readdata_from_sa),
      .Pixel_Buffer_avalon_sram_slave_readdata_from_sa                                  (Pixel_Buffer_avalon_sram_slave_readdata_from_sa),
      .Video_System_clock_0_in_readdata_from_sa                                         (Video_System_clock_0_in_readdata_from_sa),
      .Video_System_clock_0_in_waitrequest_from_sa                                      (Video_System_clock_0_in_waitrequest_from_sa),
      .Video_System_clock_1_in_readdata_from_sa                                         (Video_System_clock_1_in_readdata_from_sa),
      .Video_System_clock_1_in_waitrequest_from_sa                                      (Video_System_clock_1_in_waitrequest_from_sa),
      .Video_System_clock_2_in_readdata_from_sa                                         (Video_System_clock_2_in_readdata_from_sa),
      .Video_System_clock_2_in_waitrequest_from_sa                                      (Video_System_clock_2_in_waitrequest_from_sa),
      .clk                                                                              (sys_clk),
      .d1_CPU_jtag_debug_module_end_xfer                                                (d1_CPU_jtag_debug_module_end_xfer),
      .d1_Onchip_Memory_s1_end_xfer                                                     (d1_Onchip_Memory_s1_end_xfer),
      .d1_Pixel_Buffer_DMA_avalon_control_slave_end_xfer                                (d1_Pixel_Buffer_DMA_avalon_control_slave_end_xfer),
      .d1_Pixel_Buffer_avalon_sram_slave_end_xfer                                       (d1_Pixel_Buffer_avalon_sram_slave_end_xfer),
      .d1_Video_System_clock_0_in_end_xfer                                              (d1_Video_System_clock_0_in_end_xfer),
      .d1_Video_System_clock_1_in_end_xfer                                              (d1_Video_System_clock_1_in_end_xfer),
      .d1_Video_System_clock_2_in_end_xfer                                              (d1_Video_System_clock_2_in_end_xfer),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                                        (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .pio_0_s1_irq_from_sa                                                             (pio_0_s1_irq_from_sa),
      .registered_CPU_data_master_read_data_valid_Onchip_Memory_s1                      (registered_CPU_data_master_read_data_valid_Onchip_Memory_s1),
      .registered_CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave (registered_CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave),
      .reset_n                                                                          (sys_clk_reset_n),
      .sys_clk                                                                          (sys_clk),
      .sys_clk_reset_n                                                                  (sys_clk_reset_n)
    );

  CPU_instruction_master_arbitrator the_CPU_instruction_master
    (
      .CPU_instruction_master_address                                 (CPU_instruction_master_address),
      .CPU_instruction_master_address_to_slave                        (CPU_instruction_master_address_to_slave),
      .CPU_instruction_master_granted_CPU_jtag_debug_module           (CPU_instruction_master_granted_CPU_jtag_debug_module),
      .CPU_instruction_master_granted_Onchip_Memory_s1                (CPU_instruction_master_granted_Onchip_Memory_s1),
      .CPU_instruction_master_qualified_request_CPU_jtag_debug_module (CPU_instruction_master_qualified_request_CPU_jtag_debug_module),
      .CPU_instruction_master_qualified_request_Onchip_Memory_s1      (CPU_instruction_master_qualified_request_Onchip_Memory_s1),
      .CPU_instruction_master_read                                    (CPU_instruction_master_read),
      .CPU_instruction_master_read_data_valid_CPU_jtag_debug_module   (CPU_instruction_master_read_data_valid_CPU_jtag_debug_module),
      .CPU_instruction_master_read_data_valid_Onchip_Memory_s1        (CPU_instruction_master_read_data_valid_Onchip_Memory_s1),
      .CPU_instruction_master_readdata                                (CPU_instruction_master_readdata),
      .CPU_instruction_master_requests_CPU_jtag_debug_module          (CPU_instruction_master_requests_CPU_jtag_debug_module),
      .CPU_instruction_master_requests_Onchip_Memory_s1               (CPU_instruction_master_requests_Onchip_Memory_s1),
      .CPU_instruction_master_waitrequest                             (CPU_instruction_master_waitrequest),
      .CPU_jtag_debug_module_readdata_from_sa                         (CPU_jtag_debug_module_readdata_from_sa),
      .Onchip_Memory_s1_readdata_from_sa                              (Onchip_Memory_s1_readdata_from_sa),
      .clk                                                            (sys_clk),
      .d1_CPU_jtag_debug_module_end_xfer                              (d1_CPU_jtag_debug_module_end_xfer),
      .d1_Onchip_Memory_s1_end_xfer                                   (d1_Onchip_Memory_s1_end_xfer),
      .reset_n                                                        (sys_clk_reset_n)
    );

  CPU the_CPU
    (
      .clk                                   (sys_clk),
      .d_address                             (CPU_data_master_address),
      .d_byteenable                          (CPU_data_master_byteenable),
      .d_irq                                 (CPU_data_master_irq),
      .d_read                                (CPU_data_master_read),
      .d_readdata                            (CPU_data_master_readdata),
      .d_waitrequest                         (CPU_data_master_waitrequest),
      .d_write                               (CPU_data_master_write),
      .d_writedata                           (CPU_data_master_writedata),
      .i_address                             (CPU_instruction_master_address),
      .i_read                                (CPU_instruction_master_read),
      .i_readdata                            (CPU_instruction_master_readdata),
      .i_waitrequest                         (CPU_instruction_master_waitrequest),
      .jtag_debug_module_address             (CPU_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (CPU_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (CPU_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (CPU_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (CPU_data_master_debugaccess),
      .jtag_debug_module_readdata            (CPU_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (CPU_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (CPU_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (CPU_jtag_debug_module_write),
      .jtag_debug_module_writedata           (CPU_jtag_debug_module_writedata),
      .reset_n                               (CPU_jtag_debug_module_reset_n)
    );

  Clock_Signals_avalon_clocks_slave_arbitrator the_Clock_Signals_avalon_clocks_slave
    (
      .Clock_Signals_avalon_clocks_slave_address                                    (Clock_Signals_avalon_clocks_slave_address),
      .Clock_Signals_avalon_clocks_slave_readdata                                   (Clock_Signals_avalon_clocks_slave_readdata),
      .Clock_Signals_avalon_clocks_slave_readdata_from_sa                           (Clock_Signals_avalon_clocks_slave_readdata_from_sa),
      .Video_System_clock_0_out_address_to_slave                                    (Video_System_clock_0_out_address_to_slave),
      .Video_System_clock_0_out_granted_Clock_Signals_avalon_clocks_slave           (Video_System_clock_0_out_granted_Clock_Signals_avalon_clocks_slave),
      .Video_System_clock_0_out_qualified_request_Clock_Signals_avalon_clocks_slave (Video_System_clock_0_out_qualified_request_Clock_Signals_avalon_clocks_slave),
      .Video_System_clock_0_out_read                                                (Video_System_clock_0_out_read),
      .Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave   (Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave),
      .Video_System_clock_0_out_requests_Clock_Signals_avalon_clocks_slave          (Video_System_clock_0_out_requests_Clock_Signals_avalon_clocks_slave),
      .Video_System_clock_0_out_write                                               (Video_System_clock_0_out_write),
      .clk                                                                          (clk),
      .d1_Clock_Signals_avalon_clocks_slave_end_xfer                                (d1_Clock_Signals_avalon_clocks_slave_end_xfer),
      .reset_n                                                                      (clk_reset_n)
    );

  //vga_clk out_clk assignment, which is an e_assign
  assign vga_clk = out_clk_Clock_Signals_VGA_CLK;

  //sys_clk out_clk assignment, which is an e_assign
  assign sys_clk = out_clk_Clock_Signals_sys_clk;

  Clock_Signals the_Clock_Signals
    (
      .CLOCK_50 (clk),
      .VGA_CLK  (out_clk_Clock_Signals_VGA_CLK),
      .address  (Clock_Signals_avalon_clocks_slave_address),
      .readdata (Clock_Signals_avalon_clocks_slave_readdata),
      .sys_clk  (out_clk_Clock_Signals_sys_clk)
    );

  Dual_Clock_FIFO_avalon_dc_buffer_sink_arbitrator the_Dual_Clock_FIFO_avalon_dc_buffer_sink
    (
      .Dual_Clock_FIFO_avalon_dc_buffer_sink_data          (Dual_Clock_FIFO_avalon_dc_buffer_sink_data),
      .Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket   (Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket),
      .Dual_Clock_FIFO_avalon_dc_buffer_sink_ready         (Dual_Clock_FIFO_avalon_dc_buffer_sink_ready),
      .Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa (Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa),
      .Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket (Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket),
      .Dual_Clock_FIFO_avalon_dc_buffer_sink_valid         (Dual_Clock_FIFO_avalon_dc_buffer_sink_valid),
      .Pixel_RGB_Resampler_avalon_rgb_source_data          (Pixel_RGB_Resampler_avalon_rgb_source_data),
      .Pixel_RGB_Resampler_avalon_rgb_source_endofpacket   (Pixel_RGB_Resampler_avalon_rgb_source_endofpacket),
      .Pixel_RGB_Resampler_avalon_rgb_source_startofpacket (Pixel_RGB_Resampler_avalon_rgb_source_startofpacket),
      .Pixel_RGB_Resampler_avalon_rgb_source_valid         (Pixel_RGB_Resampler_avalon_rgb_source_valid),
      .clk                                                 (sys_clk),
      .reset_n                                             (sys_clk_reset_n)
    );

  Dual_Clock_FIFO_avalon_dc_buffer_source_arbitrator the_Dual_Clock_FIFO_avalon_dc_buffer_source
    (
      .Dual_Clock_FIFO_avalon_dc_buffer_source_data          (Dual_Clock_FIFO_avalon_dc_buffer_source_data),
      .Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket   (Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket),
      .Dual_Clock_FIFO_avalon_dc_buffer_source_ready         (Dual_Clock_FIFO_avalon_dc_buffer_source_ready),
      .Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket (Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket),
      .Dual_Clock_FIFO_avalon_dc_buffer_source_valid         (Dual_Clock_FIFO_avalon_dc_buffer_source_valid),
      .VGA_Controller_avalon_vga_sink_ready_from_sa          (VGA_Controller_avalon_vga_sink_ready_from_sa),
      .clk                                                   (vga_clk),
      .reset_n                                               (vga_clk_reset_n)
    );

  Dual_Clock_FIFO the_Dual_Clock_FIFO
    (
      .clk_stream_in            (sys_clk),
      .clk_stream_out           (vga_clk),
      .stream_in_data           (Dual_Clock_FIFO_avalon_dc_buffer_sink_data),
      .stream_in_endofpacket    (Dual_Clock_FIFO_avalon_dc_buffer_sink_endofpacket),
      .stream_in_ready          (Dual_Clock_FIFO_avalon_dc_buffer_sink_ready),
      .stream_in_startofpacket  (Dual_Clock_FIFO_avalon_dc_buffer_sink_startofpacket),
      .stream_in_valid          (Dual_Clock_FIFO_avalon_dc_buffer_sink_valid),
      .stream_out_data          (Dual_Clock_FIFO_avalon_dc_buffer_source_data),
      .stream_out_endofpacket   (Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket),
      .stream_out_ready         (Dual_Clock_FIFO_avalon_dc_buffer_source_ready),
      .stream_out_startofpacket (Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket),
      .stream_out_valid         (Dual_Clock_FIFO_avalon_dc_buffer_source_valid)
    );

  Onchip_Memory_s1_arbitrator the_Onchip_Memory_s1
    (
      .CPU_data_master_address_to_slave                            (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                  (CPU_data_master_byteenable),
      .CPU_data_master_granted_Onchip_Memory_s1                    (CPU_data_master_granted_Onchip_Memory_s1),
      .CPU_data_master_qualified_request_Onchip_Memory_s1          (CPU_data_master_qualified_request_Onchip_Memory_s1),
      .CPU_data_master_read                                        (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Onchip_Memory_s1            (CPU_data_master_read_data_valid_Onchip_Memory_s1),
      .CPU_data_master_requests_Onchip_Memory_s1                   (CPU_data_master_requests_Onchip_Memory_s1),
      .CPU_data_master_waitrequest                                 (CPU_data_master_waitrequest),
      .CPU_data_master_write                                       (CPU_data_master_write),
      .CPU_data_master_writedata                                   (CPU_data_master_writedata),
      .CPU_instruction_master_address_to_slave                     (CPU_instruction_master_address_to_slave),
      .CPU_instruction_master_granted_Onchip_Memory_s1             (CPU_instruction_master_granted_Onchip_Memory_s1),
      .CPU_instruction_master_qualified_request_Onchip_Memory_s1   (CPU_instruction_master_qualified_request_Onchip_Memory_s1),
      .CPU_instruction_master_read                                 (CPU_instruction_master_read),
      .CPU_instruction_master_read_data_valid_Onchip_Memory_s1     (CPU_instruction_master_read_data_valid_Onchip_Memory_s1),
      .CPU_instruction_master_requests_Onchip_Memory_s1            (CPU_instruction_master_requests_Onchip_Memory_s1),
      .Onchip_Memory_s1_address                                    (Onchip_Memory_s1_address),
      .Onchip_Memory_s1_byteenable                                 (Onchip_Memory_s1_byteenable),
      .Onchip_Memory_s1_chipselect                                 (Onchip_Memory_s1_chipselect),
      .Onchip_Memory_s1_clken                                      (Onchip_Memory_s1_clken),
      .Onchip_Memory_s1_readdata                                   (Onchip_Memory_s1_readdata),
      .Onchip_Memory_s1_readdata_from_sa                           (Onchip_Memory_s1_readdata_from_sa),
      .Onchip_Memory_s1_reset                                      (Onchip_Memory_s1_reset),
      .Onchip_Memory_s1_write                                      (Onchip_Memory_s1_write),
      .Onchip_Memory_s1_writedata                                  (Onchip_Memory_s1_writedata),
      .clk                                                         (sys_clk),
      .d1_Onchip_Memory_s1_end_xfer                                (d1_Onchip_Memory_s1_end_xfer),
      .registered_CPU_data_master_read_data_valid_Onchip_Memory_s1 (registered_CPU_data_master_read_data_valid_Onchip_Memory_s1),
      .reset_n                                                     (sys_clk_reset_n)
    );

  Onchip_Memory the_Onchip_Memory
    (
      .address    (Onchip_Memory_s1_address),
      .byteenable (Onchip_Memory_s1_byteenable),
      .chipselect (Onchip_Memory_s1_chipselect),
      .clk        (sys_clk),
      .clken      (Onchip_Memory_s1_clken),
      .readdata   (Onchip_Memory_s1_readdata),
      .reset      (Onchip_Memory_s1_reset),
      .write      (Onchip_Memory_s1_write),
      .writedata  (Onchip_Memory_s1_writedata)
    );

  Pixel_Buffer_avalon_sram_slave_arbitrator the_Pixel_Buffer_avalon_sram_slave
    (
      .CPU_data_master_address_to_slave                                                                       (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                                             (CPU_data_master_byteenable),
      .CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave                                              (CPU_data_master_byteenable_Pixel_Buffer_avalon_sram_slave),
      .CPU_data_master_dbs_address                                                                            (CPU_data_master_dbs_address),
      .CPU_data_master_dbs_write_16                                                                           (CPU_data_master_dbs_write_16),
      .CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave                                                 (CPU_data_master_granted_Pixel_Buffer_avalon_sram_slave),
      .CPU_data_master_no_byte_enables_and_last_term                                                          (CPU_data_master_no_byte_enables_and_last_term),
      .CPU_data_master_qualified_request_Pixel_Buffer_avalon_sram_slave                                       (CPU_data_master_qualified_request_Pixel_Buffer_avalon_sram_slave),
      .CPU_data_master_read                                                                                   (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave                                         (CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave),
      .CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register                          (CPU_data_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register),
      .CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave                                                (CPU_data_master_requests_Pixel_Buffer_avalon_sram_slave),
      .CPU_data_master_waitrequest                                                                            (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                                                  (CPU_data_master_write),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_address_to_slave                                              (Pixel_Buffer_DMA_avalon_pixel_dma_master_address_to_slave),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_arbiterlock                                                   (Pixel_Buffer_DMA_avalon_pixel_dma_master_arbiterlock),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_Pixel_Buffer_avalon_sram_slave                        (Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_Pixel_Buffer_avalon_sram_slave),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter                                               (Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_qualified_request_Pixel_Buffer_avalon_sram_slave              (Pixel_Buffer_DMA_avalon_pixel_dma_master_qualified_request_Pixel_Buffer_avalon_sram_slave),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_read                                                          (Pixel_Buffer_DMA_avalon_pixel_dma_master_read),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave                (Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register (Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave                       (Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave),
      .Pixel_Buffer_avalon_sram_slave_address                                                                 (Pixel_Buffer_avalon_sram_slave_address),
      .Pixel_Buffer_avalon_sram_slave_byteenable                                                              (Pixel_Buffer_avalon_sram_slave_byteenable),
      .Pixel_Buffer_avalon_sram_slave_read                                                                    (Pixel_Buffer_avalon_sram_slave_read),
      .Pixel_Buffer_avalon_sram_slave_readdata                                                                (Pixel_Buffer_avalon_sram_slave_readdata),
      .Pixel_Buffer_avalon_sram_slave_readdata_from_sa                                                        (Pixel_Buffer_avalon_sram_slave_readdata_from_sa),
      .Pixel_Buffer_avalon_sram_slave_readdatavalid                                                           (Pixel_Buffer_avalon_sram_slave_readdatavalid),
      .Pixel_Buffer_avalon_sram_slave_reset                                                                   (Pixel_Buffer_avalon_sram_slave_reset),
      .Pixel_Buffer_avalon_sram_slave_write                                                                   (Pixel_Buffer_avalon_sram_slave_write),
      .Pixel_Buffer_avalon_sram_slave_writedata                                                               (Pixel_Buffer_avalon_sram_slave_writedata),
      .clk                                                                                                    (sys_clk),
      .d1_Pixel_Buffer_avalon_sram_slave_end_xfer                                                             (d1_Pixel_Buffer_avalon_sram_slave_end_xfer),
      .reset_n                                                                                                (sys_clk_reset_n)
    );

  Pixel_Buffer the_Pixel_Buffer
    (
      .SRAM_ADDR     (SRAM_ADDR_from_the_Pixel_Buffer),
      .SRAM_CE_N     (SRAM_CE_N_from_the_Pixel_Buffer),
      .SRAM_DQ       (SRAM_DQ_to_and_from_the_Pixel_Buffer),
      .SRAM_LB_N     (SRAM_LB_N_from_the_Pixel_Buffer),
      .SRAM_OE_N     (SRAM_OE_N_from_the_Pixel_Buffer),
      .SRAM_UB_N     (SRAM_UB_N_from_the_Pixel_Buffer),
      .SRAM_WE_N     (SRAM_WE_N_from_the_Pixel_Buffer),
      .address       (Pixel_Buffer_avalon_sram_slave_address),
      .byteenable    (Pixel_Buffer_avalon_sram_slave_byteenable),
      .clk           (sys_clk),
      .read          (Pixel_Buffer_avalon_sram_slave_read),
      .readdata      (Pixel_Buffer_avalon_sram_slave_readdata),
      .readdatavalid (Pixel_Buffer_avalon_sram_slave_readdatavalid),
      .reset         (Pixel_Buffer_avalon_sram_slave_reset),
      .write         (Pixel_Buffer_avalon_sram_slave_write),
      .writedata     (Pixel_Buffer_avalon_sram_slave_writedata)
    );

  Pixel_Buffer_DMA_avalon_control_slave_arbitrator the_Pixel_Buffer_DMA_avalon_control_slave
    (
      .CPU_data_master_address_to_slave                                                 (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                                       (CPU_data_master_byteenable),
      .CPU_data_master_granted_Pixel_Buffer_DMA_avalon_control_slave                    (CPU_data_master_granted_Pixel_Buffer_DMA_avalon_control_slave),
      .CPU_data_master_qualified_request_Pixel_Buffer_DMA_avalon_control_slave          (CPU_data_master_qualified_request_Pixel_Buffer_DMA_avalon_control_slave),
      .CPU_data_master_read                                                             (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave            (CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave),
      .CPU_data_master_requests_Pixel_Buffer_DMA_avalon_control_slave                   (CPU_data_master_requests_Pixel_Buffer_DMA_avalon_control_slave),
      .CPU_data_master_waitrequest                                                      (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                            (CPU_data_master_write),
      .CPU_data_master_writedata                                                        (CPU_data_master_writedata),
      .Pixel_Buffer_DMA_avalon_control_slave_address                                    (Pixel_Buffer_DMA_avalon_control_slave_address),
      .Pixel_Buffer_DMA_avalon_control_slave_byteenable                                 (Pixel_Buffer_DMA_avalon_control_slave_byteenable),
      .Pixel_Buffer_DMA_avalon_control_slave_read                                       (Pixel_Buffer_DMA_avalon_control_slave_read),
      .Pixel_Buffer_DMA_avalon_control_slave_readdata                                   (Pixel_Buffer_DMA_avalon_control_slave_readdata),
      .Pixel_Buffer_DMA_avalon_control_slave_readdata_from_sa                           (Pixel_Buffer_DMA_avalon_control_slave_readdata_from_sa),
      .Pixel_Buffer_DMA_avalon_control_slave_write                                      (Pixel_Buffer_DMA_avalon_control_slave_write),
      .Pixel_Buffer_DMA_avalon_control_slave_writedata                                  (Pixel_Buffer_DMA_avalon_control_slave_writedata),
      .clk                                                                              (sys_clk),
      .d1_Pixel_Buffer_DMA_avalon_control_slave_end_xfer                                (d1_Pixel_Buffer_DMA_avalon_control_slave_end_xfer),
      .registered_CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave (registered_CPU_data_master_read_data_valid_Pixel_Buffer_DMA_avalon_control_slave),
      .reset_n                                                                          (sys_clk_reset_n)
    );

  Pixel_Buffer_DMA_avalon_pixel_dma_master_arbitrator the_Pixel_Buffer_DMA_avalon_pixel_dma_master
    (
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_address                                                       (Pixel_Buffer_DMA_avalon_pixel_dma_master_address),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_address_to_slave                                              (Pixel_Buffer_DMA_avalon_pixel_dma_master_address_to_slave),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_Pixel_Buffer_avalon_sram_slave                        (Pixel_Buffer_DMA_avalon_pixel_dma_master_granted_Pixel_Buffer_avalon_sram_slave),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter                                               (Pixel_Buffer_DMA_avalon_pixel_dma_master_latency_counter),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_qualified_request_Pixel_Buffer_avalon_sram_slave              (Pixel_Buffer_DMA_avalon_pixel_dma_master_qualified_request_Pixel_Buffer_avalon_sram_slave),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_read                                                          (Pixel_Buffer_DMA_avalon_pixel_dma_master_read),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave                (Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register (Pixel_Buffer_DMA_avalon_pixel_dma_master_read_data_valid_Pixel_Buffer_avalon_sram_slave_shift_register),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_readdata                                                      (Pixel_Buffer_DMA_avalon_pixel_dma_master_readdata),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_readdatavalid                                                 (Pixel_Buffer_DMA_avalon_pixel_dma_master_readdatavalid),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave                       (Pixel_Buffer_DMA_avalon_pixel_dma_master_requests_Pixel_Buffer_avalon_sram_slave),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_reset                                                         (Pixel_Buffer_DMA_avalon_pixel_dma_master_reset),
      .Pixel_Buffer_DMA_avalon_pixel_dma_master_waitrequest                                                   (Pixel_Buffer_DMA_avalon_pixel_dma_master_waitrequest),
      .Pixel_Buffer_avalon_sram_slave_readdata_from_sa                                                        (Pixel_Buffer_avalon_sram_slave_readdata_from_sa),
      .clk                                                                                                    (sys_clk),
      .d1_Pixel_Buffer_avalon_sram_slave_end_xfer                                                             (d1_Pixel_Buffer_avalon_sram_slave_end_xfer),
      .reset_n                                                                                                (sys_clk_reset_n)
    );

  Pixel_Buffer_DMA_avalon_pixel_source_arbitrator the_Pixel_Buffer_DMA_avalon_pixel_source
    (
      .Pixel_Buffer_DMA_avalon_pixel_source_data          (Pixel_Buffer_DMA_avalon_pixel_source_data),
      .Pixel_Buffer_DMA_avalon_pixel_source_endofpacket   (Pixel_Buffer_DMA_avalon_pixel_source_endofpacket),
      .Pixel_Buffer_DMA_avalon_pixel_source_ready         (Pixel_Buffer_DMA_avalon_pixel_source_ready),
      .Pixel_Buffer_DMA_avalon_pixel_source_startofpacket (Pixel_Buffer_DMA_avalon_pixel_source_startofpacket),
      .Pixel_Buffer_DMA_avalon_pixel_source_valid         (Pixel_Buffer_DMA_avalon_pixel_source_valid),
      .Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa  (Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa),
      .clk                                                (sys_clk),
      .reset_n                                            (sys_clk_reset_n)
    );

  Pixel_Buffer_DMA the_Pixel_Buffer_DMA
    (
      .clk                  (sys_clk),
      .master_address       (Pixel_Buffer_DMA_avalon_pixel_dma_master_address),
      .master_arbiterlock   (Pixel_Buffer_DMA_avalon_pixel_dma_master_arbiterlock),
      .master_read          (Pixel_Buffer_DMA_avalon_pixel_dma_master_read),
      .master_readdata      (Pixel_Buffer_DMA_avalon_pixel_dma_master_readdata),
      .master_readdatavalid (Pixel_Buffer_DMA_avalon_pixel_dma_master_readdatavalid),
      .master_waitrequest   (Pixel_Buffer_DMA_avalon_pixel_dma_master_waitrequest),
      .reset                (Pixel_Buffer_DMA_avalon_pixel_dma_master_reset),
      .slave_address        (Pixel_Buffer_DMA_avalon_control_slave_address),
      .slave_byteenable     (Pixel_Buffer_DMA_avalon_control_slave_byteenable),
      .slave_read           (Pixel_Buffer_DMA_avalon_control_slave_read),
      .slave_readdata       (Pixel_Buffer_DMA_avalon_control_slave_readdata),
      .slave_write          (Pixel_Buffer_DMA_avalon_control_slave_write),
      .slave_writedata      (Pixel_Buffer_DMA_avalon_control_slave_writedata),
      .stream_data          (Pixel_Buffer_DMA_avalon_pixel_source_data),
      .stream_endofpacket   (Pixel_Buffer_DMA_avalon_pixel_source_endofpacket),
      .stream_ready         (Pixel_Buffer_DMA_avalon_pixel_source_ready),
      .stream_startofpacket (Pixel_Buffer_DMA_avalon_pixel_source_startofpacket),
      .stream_valid         (Pixel_Buffer_DMA_avalon_pixel_source_valid)
    );

  Pixel_RGB_Resampler_avalon_rgb_sink_arbitrator the_Pixel_RGB_Resampler_avalon_rgb_sink
    (
      .Pixel_Buffer_DMA_avalon_pixel_source_data          (Pixel_Buffer_DMA_avalon_pixel_source_data),
      .Pixel_Buffer_DMA_avalon_pixel_source_endofpacket   (Pixel_Buffer_DMA_avalon_pixel_source_endofpacket),
      .Pixel_Buffer_DMA_avalon_pixel_source_startofpacket (Pixel_Buffer_DMA_avalon_pixel_source_startofpacket),
      .Pixel_Buffer_DMA_avalon_pixel_source_valid         (Pixel_Buffer_DMA_avalon_pixel_source_valid),
      .Pixel_RGB_Resampler_avalon_rgb_sink_data           (Pixel_RGB_Resampler_avalon_rgb_sink_data),
      .Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket    (Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket),
      .Pixel_RGB_Resampler_avalon_rgb_sink_ready          (Pixel_RGB_Resampler_avalon_rgb_sink_ready),
      .Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa  (Pixel_RGB_Resampler_avalon_rgb_sink_ready_from_sa),
      .Pixel_RGB_Resampler_avalon_rgb_sink_reset          (Pixel_RGB_Resampler_avalon_rgb_sink_reset),
      .Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket  (Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket),
      .Pixel_RGB_Resampler_avalon_rgb_sink_valid          (Pixel_RGB_Resampler_avalon_rgb_sink_valid),
      .clk                                                (sys_clk),
      .reset_n                                            (sys_clk_reset_n)
    );

  Pixel_RGB_Resampler_avalon_rgb_source_arbitrator the_Pixel_RGB_Resampler_avalon_rgb_source
    (
      .Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa (Dual_Clock_FIFO_avalon_dc_buffer_sink_ready_from_sa),
      .Pixel_RGB_Resampler_avalon_rgb_source_data          (Pixel_RGB_Resampler_avalon_rgb_source_data),
      .Pixel_RGB_Resampler_avalon_rgb_source_endofpacket   (Pixel_RGB_Resampler_avalon_rgb_source_endofpacket),
      .Pixel_RGB_Resampler_avalon_rgb_source_ready         (Pixel_RGB_Resampler_avalon_rgb_source_ready),
      .Pixel_RGB_Resampler_avalon_rgb_source_startofpacket (Pixel_RGB_Resampler_avalon_rgb_source_startofpacket),
      .Pixel_RGB_Resampler_avalon_rgb_source_valid         (Pixel_RGB_Resampler_avalon_rgb_source_valid),
      .clk                                                 (sys_clk),
      .reset_n                                             (sys_clk_reset_n)
    );

  Pixel_RGB_Resampler the_Pixel_RGB_Resampler
    (
      .clk                      (sys_clk),
      .reset                    (Pixel_RGB_Resampler_avalon_rgb_sink_reset),
      .stream_in_data           (Pixel_RGB_Resampler_avalon_rgb_sink_data),
      .stream_in_endofpacket    (Pixel_RGB_Resampler_avalon_rgb_sink_endofpacket),
      .stream_in_ready          (Pixel_RGB_Resampler_avalon_rgb_sink_ready),
      .stream_in_startofpacket  (Pixel_RGB_Resampler_avalon_rgb_sink_startofpacket),
      .stream_in_valid          (Pixel_RGB_Resampler_avalon_rgb_sink_valid),
      .stream_out_data          (Pixel_RGB_Resampler_avalon_rgb_source_data),
      .stream_out_endofpacket   (Pixel_RGB_Resampler_avalon_rgb_source_endofpacket),
      .stream_out_ready         (Pixel_RGB_Resampler_avalon_rgb_source_ready),
      .stream_out_startofpacket (Pixel_RGB_Resampler_avalon_rgb_source_startofpacket),
      .stream_out_valid         (Pixel_RGB_Resampler_avalon_rgb_source_valid)
    );

  VGA_Controller_avalon_vga_sink_arbitrator the_VGA_Controller_avalon_vga_sink
    (
      .Dual_Clock_FIFO_avalon_dc_buffer_source_data          (Dual_Clock_FIFO_avalon_dc_buffer_source_data),
      .Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket   (Dual_Clock_FIFO_avalon_dc_buffer_source_endofpacket),
      .Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket (Dual_Clock_FIFO_avalon_dc_buffer_source_startofpacket),
      .Dual_Clock_FIFO_avalon_dc_buffer_source_valid         (Dual_Clock_FIFO_avalon_dc_buffer_source_valid),
      .VGA_Controller_avalon_vga_sink_data                   (VGA_Controller_avalon_vga_sink_data),
      .VGA_Controller_avalon_vga_sink_endofpacket            (VGA_Controller_avalon_vga_sink_endofpacket),
      .VGA_Controller_avalon_vga_sink_ready                  (VGA_Controller_avalon_vga_sink_ready),
      .VGA_Controller_avalon_vga_sink_ready_from_sa          (VGA_Controller_avalon_vga_sink_ready_from_sa),
      .VGA_Controller_avalon_vga_sink_reset                  (VGA_Controller_avalon_vga_sink_reset),
      .VGA_Controller_avalon_vga_sink_startofpacket          (VGA_Controller_avalon_vga_sink_startofpacket),
      .VGA_Controller_avalon_vga_sink_valid                  (VGA_Controller_avalon_vga_sink_valid),
      .clk                                                   (vga_clk),
      .reset_n                                               (vga_clk_reset_n)
    );

  VGA_Controller the_VGA_Controller
    (
      .VGA_B         (VGA_B_from_the_VGA_Controller),
      .VGA_BLANK     (VGA_BLANK_from_the_VGA_Controller),
      .VGA_CLK       (VGA_CLK_from_the_VGA_Controller),
      .VGA_G         (VGA_G_from_the_VGA_Controller),
      .VGA_HS        (VGA_HS_from_the_VGA_Controller),
      .VGA_R         (VGA_R_from_the_VGA_Controller),
      .VGA_SYNC      (VGA_SYNC_from_the_VGA_Controller),
      .VGA_VS        (VGA_VS_from_the_VGA_Controller),
      .clk           (vga_clk),
      .data          (VGA_Controller_avalon_vga_sink_data),
      .endofpacket   (VGA_Controller_avalon_vga_sink_endofpacket),
      .ready         (VGA_Controller_avalon_vga_sink_ready),
      .reset         (VGA_Controller_avalon_vga_sink_reset),
      .startofpacket (VGA_Controller_avalon_vga_sink_startofpacket),
      .valid         (VGA_Controller_avalon_vga_sink_valid)
    );

  Video_System_clock_0_in_arbitrator the_Video_System_clock_0_in
    (
      .CPU_data_master_address_to_slave                          (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                (CPU_data_master_byteenable),
      .CPU_data_master_byteenable_Video_System_clock_0_in        (CPU_data_master_byteenable_Video_System_clock_0_in),
      .CPU_data_master_dbs_address                               (CPU_data_master_dbs_address),
      .CPU_data_master_dbs_write_8                               (CPU_data_master_dbs_write_8),
      .CPU_data_master_granted_Video_System_clock_0_in           (CPU_data_master_granted_Video_System_clock_0_in),
      .CPU_data_master_no_byte_enables_and_last_term             (CPU_data_master_no_byte_enables_and_last_term),
      .CPU_data_master_qualified_request_Video_System_clock_0_in (CPU_data_master_qualified_request_Video_System_clock_0_in),
      .CPU_data_master_read                                      (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Video_System_clock_0_in   (CPU_data_master_read_data_valid_Video_System_clock_0_in),
      .CPU_data_master_requests_Video_System_clock_0_in          (CPU_data_master_requests_Video_System_clock_0_in),
      .CPU_data_master_waitrequest                               (CPU_data_master_waitrequest),
      .CPU_data_master_write                                     (CPU_data_master_write),
      .Video_System_clock_0_in_address                           (Video_System_clock_0_in_address),
      .Video_System_clock_0_in_endofpacket                       (Video_System_clock_0_in_endofpacket),
      .Video_System_clock_0_in_endofpacket_from_sa               (Video_System_clock_0_in_endofpacket_from_sa),
      .Video_System_clock_0_in_nativeaddress                     (Video_System_clock_0_in_nativeaddress),
      .Video_System_clock_0_in_read                              (Video_System_clock_0_in_read),
      .Video_System_clock_0_in_readdata                          (Video_System_clock_0_in_readdata),
      .Video_System_clock_0_in_readdata_from_sa                  (Video_System_clock_0_in_readdata_from_sa),
      .Video_System_clock_0_in_reset_n                           (Video_System_clock_0_in_reset_n),
      .Video_System_clock_0_in_waitrequest                       (Video_System_clock_0_in_waitrequest),
      .Video_System_clock_0_in_waitrequest_from_sa               (Video_System_clock_0_in_waitrequest_from_sa),
      .Video_System_clock_0_in_write                             (Video_System_clock_0_in_write),
      .Video_System_clock_0_in_writedata                         (Video_System_clock_0_in_writedata),
      .clk                                                       (sys_clk),
      .d1_Video_System_clock_0_in_end_xfer                       (d1_Video_System_clock_0_in_end_xfer),
      .reset_n                                                   (sys_clk_reset_n)
    );

  Video_System_clock_0_out_arbitrator the_Video_System_clock_0_out
    (
      .Clock_Signals_avalon_clocks_slave_readdata_from_sa                           (Clock_Signals_avalon_clocks_slave_readdata_from_sa),
      .Video_System_clock_0_out_address                                             (Video_System_clock_0_out_address),
      .Video_System_clock_0_out_address_to_slave                                    (Video_System_clock_0_out_address_to_slave),
      .Video_System_clock_0_out_granted_Clock_Signals_avalon_clocks_slave           (Video_System_clock_0_out_granted_Clock_Signals_avalon_clocks_slave),
      .Video_System_clock_0_out_qualified_request_Clock_Signals_avalon_clocks_slave (Video_System_clock_0_out_qualified_request_Clock_Signals_avalon_clocks_slave),
      .Video_System_clock_0_out_read                                                (Video_System_clock_0_out_read),
      .Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave   (Video_System_clock_0_out_read_data_valid_Clock_Signals_avalon_clocks_slave),
      .Video_System_clock_0_out_readdata                                            (Video_System_clock_0_out_readdata),
      .Video_System_clock_0_out_requests_Clock_Signals_avalon_clocks_slave          (Video_System_clock_0_out_requests_Clock_Signals_avalon_clocks_slave),
      .Video_System_clock_0_out_reset_n                                             (Video_System_clock_0_out_reset_n),
      .Video_System_clock_0_out_waitrequest                                         (Video_System_clock_0_out_waitrequest),
      .Video_System_clock_0_out_write                                               (Video_System_clock_0_out_write),
      .Video_System_clock_0_out_writedata                                           (Video_System_clock_0_out_writedata),
      .clk                                                                          (clk),
      .d1_Clock_Signals_avalon_clocks_slave_end_xfer                                (d1_Clock_Signals_avalon_clocks_slave_end_xfer),
      .reset_n                                                                      (clk_reset_n)
    );

  Video_System_clock_0 the_Video_System_clock_0
    (
      .master_address       (Video_System_clock_0_out_address),
      .master_clk           (clk),
      .master_endofpacket   (Video_System_clock_0_out_endofpacket),
      .master_nativeaddress (Video_System_clock_0_out_nativeaddress),
      .master_read          (Video_System_clock_0_out_read),
      .master_readdata      (Video_System_clock_0_out_readdata),
      .master_reset_n       (Video_System_clock_0_out_reset_n),
      .master_waitrequest   (Video_System_clock_0_out_waitrequest),
      .master_write         (Video_System_clock_0_out_write),
      .master_writedata     (Video_System_clock_0_out_writedata),
      .slave_address        (Video_System_clock_0_in_address),
      .slave_clk            (sys_clk),
      .slave_endofpacket    (Video_System_clock_0_in_endofpacket),
      .slave_nativeaddress  (Video_System_clock_0_in_nativeaddress),
      .slave_read           (Video_System_clock_0_in_read),
      .slave_readdata       (Video_System_clock_0_in_readdata),
      .slave_reset_n        (Video_System_clock_0_in_reset_n),
      .slave_waitrequest    (Video_System_clock_0_in_waitrequest),
      .slave_write          (Video_System_clock_0_in_write),
      .slave_writedata      (Video_System_clock_0_in_writedata)
    );

  Video_System_clock_1_in_arbitrator the_Video_System_clock_1_in
    (
      .CPU_data_master_address_to_slave                          (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                (CPU_data_master_byteenable),
      .CPU_data_master_granted_Video_System_clock_1_in           (CPU_data_master_granted_Video_System_clock_1_in),
      .CPU_data_master_qualified_request_Video_System_clock_1_in (CPU_data_master_qualified_request_Video_System_clock_1_in),
      .CPU_data_master_read                                      (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Video_System_clock_1_in   (CPU_data_master_read_data_valid_Video_System_clock_1_in),
      .CPU_data_master_requests_Video_System_clock_1_in          (CPU_data_master_requests_Video_System_clock_1_in),
      .CPU_data_master_waitrequest                               (CPU_data_master_waitrequest),
      .CPU_data_master_write                                     (CPU_data_master_write),
      .CPU_data_master_writedata                                 (CPU_data_master_writedata),
      .Video_System_clock_1_in_address                           (Video_System_clock_1_in_address),
      .Video_System_clock_1_in_byteenable                        (Video_System_clock_1_in_byteenable),
      .Video_System_clock_1_in_endofpacket                       (Video_System_clock_1_in_endofpacket),
      .Video_System_clock_1_in_endofpacket_from_sa               (Video_System_clock_1_in_endofpacket_from_sa),
      .Video_System_clock_1_in_nativeaddress                     (Video_System_clock_1_in_nativeaddress),
      .Video_System_clock_1_in_read                              (Video_System_clock_1_in_read),
      .Video_System_clock_1_in_readdata                          (Video_System_clock_1_in_readdata),
      .Video_System_clock_1_in_readdata_from_sa                  (Video_System_clock_1_in_readdata_from_sa),
      .Video_System_clock_1_in_reset_n                           (Video_System_clock_1_in_reset_n),
      .Video_System_clock_1_in_waitrequest                       (Video_System_clock_1_in_waitrequest),
      .Video_System_clock_1_in_waitrequest_from_sa               (Video_System_clock_1_in_waitrequest_from_sa),
      .Video_System_clock_1_in_write                             (Video_System_clock_1_in_write),
      .Video_System_clock_1_in_writedata                         (Video_System_clock_1_in_writedata),
      .clk                                                       (sys_clk),
      .d1_Video_System_clock_1_in_end_xfer                       (d1_Video_System_clock_1_in_end_xfer),
      .reset_n                                                   (sys_clk_reset_n)
    );

  Video_System_clock_1_out_arbitrator the_Video_System_clock_1_out
    (
      .Video_System_clock_1_out_address                                         (Video_System_clock_1_out_address),
      .Video_System_clock_1_out_address_to_slave                                (Video_System_clock_1_out_address_to_slave),
      .Video_System_clock_1_out_byteenable                                      (Video_System_clock_1_out_byteenable),
      .Video_System_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave           (Video_System_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave),
      .Video_System_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave (Video_System_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .Video_System_clock_1_out_read                                            (Video_System_clock_1_out_read),
      .Video_System_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave   (Video_System_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .Video_System_clock_1_out_readdata                                        (Video_System_clock_1_out_readdata),
      .Video_System_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave          (Video_System_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave),
      .Video_System_clock_1_out_reset_n                                         (Video_System_clock_1_out_reset_n),
      .Video_System_clock_1_out_waitrequest                                     (Video_System_clock_1_out_waitrequest),
      .Video_System_clock_1_out_write                                           (Video_System_clock_1_out_write),
      .Video_System_clock_1_out_writedata                                       (Video_System_clock_1_out_writedata),
      .clk                                                                      (clk),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                                (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                           (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                        (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .reset_n                                                                  (clk_reset_n)
    );

  Video_System_clock_1 the_Video_System_clock_1
    (
      .master_address       (Video_System_clock_1_out_address),
      .master_byteenable    (Video_System_clock_1_out_byteenable),
      .master_clk           (clk),
      .master_endofpacket   (Video_System_clock_1_out_endofpacket),
      .master_nativeaddress (Video_System_clock_1_out_nativeaddress),
      .master_read          (Video_System_clock_1_out_read),
      .master_readdata      (Video_System_clock_1_out_readdata),
      .master_reset_n       (Video_System_clock_1_out_reset_n),
      .master_waitrequest   (Video_System_clock_1_out_waitrequest),
      .master_write         (Video_System_clock_1_out_write),
      .master_writedata     (Video_System_clock_1_out_writedata),
      .slave_address        (Video_System_clock_1_in_address),
      .slave_byteenable     (Video_System_clock_1_in_byteenable),
      .slave_clk            (sys_clk),
      .slave_endofpacket    (Video_System_clock_1_in_endofpacket),
      .slave_nativeaddress  (Video_System_clock_1_in_nativeaddress),
      .slave_read           (Video_System_clock_1_in_read),
      .slave_readdata       (Video_System_clock_1_in_readdata),
      .slave_reset_n        (Video_System_clock_1_in_reset_n),
      .slave_waitrequest    (Video_System_clock_1_in_waitrequest),
      .slave_write          (Video_System_clock_1_in_write),
      .slave_writedata      (Video_System_clock_1_in_writedata)
    );

  Video_System_clock_2_in_arbitrator the_Video_System_clock_2_in
    (
      .CPU_data_master_address_to_slave                          (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                (CPU_data_master_byteenable),
      .CPU_data_master_granted_Video_System_clock_2_in           (CPU_data_master_granted_Video_System_clock_2_in),
      .CPU_data_master_qualified_request_Video_System_clock_2_in (CPU_data_master_qualified_request_Video_System_clock_2_in),
      .CPU_data_master_read                                      (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Video_System_clock_2_in   (CPU_data_master_read_data_valid_Video_System_clock_2_in),
      .CPU_data_master_requests_Video_System_clock_2_in          (CPU_data_master_requests_Video_System_clock_2_in),
      .CPU_data_master_waitrequest                               (CPU_data_master_waitrequest),
      .CPU_data_master_write                                     (CPU_data_master_write),
      .CPU_data_master_writedata                                 (CPU_data_master_writedata),
      .Video_System_clock_2_in_address                           (Video_System_clock_2_in_address),
      .Video_System_clock_2_in_byteenable                        (Video_System_clock_2_in_byteenable),
      .Video_System_clock_2_in_endofpacket                       (Video_System_clock_2_in_endofpacket),
      .Video_System_clock_2_in_endofpacket_from_sa               (Video_System_clock_2_in_endofpacket_from_sa),
      .Video_System_clock_2_in_nativeaddress                     (Video_System_clock_2_in_nativeaddress),
      .Video_System_clock_2_in_read                              (Video_System_clock_2_in_read),
      .Video_System_clock_2_in_readdata                          (Video_System_clock_2_in_readdata),
      .Video_System_clock_2_in_readdata_from_sa                  (Video_System_clock_2_in_readdata_from_sa),
      .Video_System_clock_2_in_reset_n                           (Video_System_clock_2_in_reset_n),
      .Video_System_clock_2_in_waitrequest                       (Video_System_clock_2_in_waitrequest),
      .Video_System_clock_2_in_waitrequest_from_sa               (Video_System_clock_2_in_waitrequest_from_sa),
      .Video_System_clock_2_in_write                             (Video_System_clock_2_in_write),
      .Video_System_clock_2_in_writedata                         (Video_System_clock_2_in_writedata),
      .clk                                                       (sys_clk),
      .d1_Video_System_clock_2_in_end_xfer                       (d1_Video_System_clock_2_in_end_xfer),
      .reset_n                                                   (sys_clk_reset_n)
    );

  Video_System_clock_2_out_arbitrator the_Video_System_clock_2_out
    (
      .Video_System_clock_2_out_address                    (Video_System_clock_2_out_address),
      .Video_System_clock_2_out_address_to_slave           (Video_System_clock_2_out_address_to_slave),
      .Video_System_clock_2_out_byteenable                 (Video_System_clock_2_out_byteenable),
      .Video_System_clock_2_out_granted_pio_0_s1           (Video_System_clock_2_out_granted_pio_0_s1),
      .Video_System_clock_2_out_qualified_request_pio_0_s1 (Video_System_clock_2_out_qualified_request_pio_0_s1),
      .Video_System_clock_2_out_read                       (Video_System_clock_2_out_read),
      .Video_System_clock_2_out_read_data_valid_pio_0_s1   (Video_System_clock_2_out_read_data_valid_pio_0_s1),
      .Video_System_clock_2_out_readdata                   (Video_System_clock_2_out_readdata),
      .Video_System_clock_2_out_requests_pio_0_s1          (Video_System_clock_2_out_requests_pio_0_s1),
      .Video_System_clock_2_out_reset_n                    (Video_System_clock_2_out_reset_n),
      .Video_System_clock_2_out_waitrequest                (Video_System_clock_2_out_waitrequest),
      .Video_System_clock_2_out_write                      (Video_System_clock_2_out_write),
      .Video_System_clock_2_out_writedata                  (Video_System_clock_2_out_writedata),
      .clk                                                 (clk),
      .d1_pio_0_s1_end_xfer                                (d1_pio_0_s1_end_xfer),
      .pio_0_s1_readdata_from_sa                           (pio_0_s1_readdata_from_sa),
      .reset_n                                             (clk_reset_n)
    );

  Video_System_clock_2 the_Video_System_clock_2
    (
      .master_address       (Video_System_clock_2_out_address),
      .master_byteenable    (Video_System_clock_2_out_byteenable),
      .master_clk           (clk),
      .master_endofpacket   (Video_System_clock_2_out_endofpacket),
      .master_nativeaddress (Video_System_clock_2_out_nativeaddress),
      .master_read          (Video_System_clock_2_out_read),
      .master_readdata      (Video_System_clock_2_out_readdata),
      .master_reset_n       (Video_System_clock_2_out_reset_n),
      .master_waitrequest   (Video_System_clock_2_out_waitrequest),
      .master_write         (Video_System_clock_2_out_write),
      .master_writedata     (Video_System_clock_2_out_writedata),
      .slave_address        (Video_System_clock_2_in_address),
      .slave_byteenable     (Video_System_clock_2_in_byteenable),
      .slave_clk            (sys_clk),
      .slave_endofpacket    (Video_System_clock_2_in_endofpacket),
      .slave_nativeaddress  (Video_System_clock_2_in_nativeaddress),
      .slave_read           (Video_System_clock_2_in_read),
      .slave_readdata       (Video_System_clock_2_in_readdata),
      .slave_reset_n        (Video_System_clock_2_in_reset_n),
      .slave_waitrequest    (Video_System_clock_2_in_waitrequest),
      .slave_write          (Video_System_clock_2_in_write),
      .slave_writedata      (Video_System_clock_2_in_writedata)
    );

  jtag_uart_0_avalon_jtag_slave_arbitrator the_jtag_uart_0_avalon_jtag_slave
    (
      .Video_System_clock_1_out_address_to_slave                                (Video_System_clock_1_out_address_to_slave),
      .Video_System_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave           (Video_System_clock_1_out_granted_jtag_uart_0_avalon_jtag_slave),
      .Video_System_clock_1_out_nativeaddress                                   (Video_System_clock_1_out_nativeaddress),
      .Video_System_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave (Video_System_clock_1_out_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .Video_System_clock_1_out_read                                            (Video_System_clock_1_out_read),
      .Video_System_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave   (Video_System_clock_1_out_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .Video_System_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave          (Video_System_clock_1_out_requests_jtag_uart_0_avalon_jtag_slave),
      .Video_System_clock_1_out_write                                           (Video_System_clock_1_out_write),
      .Video_System_clock_1_out_writedata                                       (Video_System_clock_1_out_writedata),
      .clk                                                                      (clk),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                                (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .jtag_uart_0_avalon_jtag_slave_address                                    (jtag_uart_0_avalon_jtag_slave_address),
      .jtag_uart_0_avalon_jtag_slave_chipselect                                 (jtag_uart_0_avalon_jtag_slave_chipselect),
      .jtag_uart_0_avalon_jtag_slave_dataavailable                              (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa                      (jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_0_avalon_jtag_slave_irq                                        (jtag_uart_0_avalon_jtag_slave_irq),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                                (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_read_n                                     (jtag_uart_0_avalon_jtag_slave_read_n),
      .jtag_uart_0_avalon_jtag_slave_readdata                                   (jtag_uart_0_avalon_jtag_slave_readdata),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                           (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readyfordata                               (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa                       (jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_reset_n                                    (jtag_uart_0_avalon_jtag_slave_reset_n),
      .jtag_uart_0_avalon_jtag_slave_waitrequest                                (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                        (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_0_avalon_jtag_slave_write_n                                    (jtag_uart_0_avalon_jtag_slave_write_n),
      .jtag_uart_0_avalon_jtag_slave_writedata                                  (jtag_uart_0_avalon_jtag_slave_writedata),
      .reset_n                                                                  (clk_reset_n)
    );

  jtag_uart_0 the_jtag_uart_0
    (
      .av_address     (jtag_uart_0_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_0_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_0_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_0_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_0_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_0_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_0_avalon_jtag_slave_writedata),
      .clk            (clk),
      .dataavailable  (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_0_avalon_jtag_slave_reset_n)
    );

  pio_0_s1_arbitrator the_pio_0_s1
    (
      .Video_System_clock_2_out_address_to_slave           (Video_System_clock_2_out_address_to_slave),
      .Video_System_clock_2_out_granted_pio_0_s1           (Video_System_clock_2_out_granted_pio_0_s1),
      .Video_System_clock_2_out_nativeaddress              (Video_System_clock_2_out_nativeaddress),
      .Video_System_clock_2_out_qualified_request_pio_0_s1 (Video_System_clock_2_out_qualified_request_pio_0_s1),
      .Video_System_clock_2_out_read                       (Video_System_clock_2_out_read),
      .Video_System_clock_2_out_read_data_valid_pio_0_s1   (Video_System_clock_2_out_read_data_valid_pio_0_s1),
      .Video_System_clock_2_out_requests_pio_0_s1          (Video_System_clock_2_out_requests_pio_0_s1),
      .Video_System_clock_2_out_write                      (Video_System_clock_2_out_write),
      .Video_System_clock_2_out_writedata                  (Video_System_clock_2_out_writedata),
      .clk                                                 (clk),
      .d1_pio_0_s1_end_xfer                                (d1_pio_0_s1_end_xfer),
      .pio_0_s1_address                                    (pio_0_s1_address),
      .pio_0_s1_chipselect                                 (pio_0_s1_chipselect),
      .pio_0_s1_irq                                        (pio_0_s1_irq),
      .pio_0_s1_irq_from_sa                                (pio_0_s1_irq_from_sa),
      .pio_0_s1_readdata                                   (pio_0_s1_readdata),
      .pio_0_s1_readdata_from_sa                           (pio_0_s1_readdata_from_sa),
      .pio_0_s1_reset_n                                    (pio_0_s1_reset_n),
      .pio_0_s1_write_n                                    (pio_0_s1_write_n),
      .pio_0_s1_writedata                                  (pio_0_s1_writedata),
      .reset_n                                             (clk_reset_n)
    );

  pio_0 the_pio_0
    (
      .address    (pio_0_s1_address),
      .chipselect (pio_0_s1_chipselect),
      .clk        (clk),
      .in_port    (in_port_to_the_pio_0),
      .irq        (pio_0_s1_irq),
      .readdata   (pio_0_s1_readdata),
      .reset_n    (pio_0_s1_reset_n),
      .write_n    (pio_0_s1_write_n),
      .writedata  (pio_0_s1_writedata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  Video_System_reset_sys_clk_domain_synch_module Video_System_reset_sys_clk_domain_synch
    (
      .clk      (sys_clk),
      .data_in  (1'b1),
      .data_out (sys_clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    CPU_jtag_debug_module_resetrequest_from_sa |
    CPU_jtag_debug_module_resetrequest_from_sa |
    0 |
    0);

  //reset is asserted asynchronously and deasserted synchronously
  Video_System_reset_clk_domain_synch_module Video_System_reset_clk_domain_synch
    (
      .clk      (clk),
      .data_in  (1'b1),
      .data_out (clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset is asserted asynchronously and deasserted synchronously
  Video_System_reset_vga_clk_domain_synch_module Video_System_reset_vga_clk_domain_synch
    (
      .clk      (vga_clk),
      .data_in  (1'b1),
      .data_out (vga_clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //Video_System_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign Video_System_clock_0_out_endofpacket = 0;

  //Video_System_clock_1_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign Video_System_clock_1_out_endofpacket = 0;

  //Video_System_clock_2_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign Video_System_clock_2_out_endofpacket = 0;


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
`include "Pixel_RGB_Resampler.v"
`include "Pixel_Buffer.v"
`include "Pixel_Buffer_DMA.v"
`include "Dual_Clock_FIFO.v"
`include "VGA_Controller.v"
`include "Clock_Signals.v"
`include "Video_System_clock_0.v"
`include "CPU_test_bench.v"
`include "CPU_oci_test_bench.v"
`include "CPU_jtag_debug_module_tck.v"
`include "CPU_jtag_debug_module_sysclk.v"
`include "CPU_jtag_debug_module_wrapper.v"
`include "CPU.v"
`include "pio_0.v"
`include "Video_System_clock_2.v"
`include "Onchip_Memory.v"
`include "jtag_uart_0.v"
`include "Video_System_clock_1.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire    [ 19: 0] SRAM_ADDR_from_the_Pixel_Buffer;
  wire             SRAM_CE_N_from_the_Pixel_Buffer;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_Pixel_Buffer;
  wire             SRAM_LB_N_from_the_Pixel_Buffer;
  wire             SRAM_OE_N_from_the_Pixel_Buffer;
  wire             SRAM_UB_N_from_the_Pixel_Buffer;
  wire             SRAM_WE_N_from_the_Pixel_Buffer;
  wire             VGA_BLANK_from_the_VGA_Controller;
  wire    [  7: 0] VGA_B_from_the_VGA_Controller;
  wire             VGA_CLK_from_the_VGA_Controller;
  wire    [  7: 0] VGA_G_from_the_VGA_Controller;
  wire             VGA_HS_from_the_VGA_Controller;
  wire    [  7: 0] VGA_R_from_the_VGA_Controller;
  wire             VGA_SYNC_from_the_VGA_Controller;
  wire             VGA_VS_from_the_VGA_Controller;
  wire             Video_System_clock_0_in_endofpacket_from_sa;
  wire             Video_System_clock_0_out_endofpacket;
  wire             Video_System_clock_0_out_nativeaddress;
  wire             Video_System_clock_1_in_endofpacket_from_sa;
  wire             Video_System_clock_1_out_endofpacket;
  wire             Video_System_clock_2_in_endofpacket_from_sa;
  wire             Video_System_clock_2_out_endofpacket;
  reg              clk;
  wire    [  3: 0] in_port_to_the_pio_0;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  reg              reset_n;
  wire             sys_clk;
  wire             vga_clk;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  Video_System DUT
    (
      .SRAM_ADDR_from_the_Pixel_Buffer      (SRAM_ADDR_from_the_Pixel_Buffer),
      .SRAM_CE_N_from_the_Pixel_Buffer      (SRAM_CE_N_from_the_Pixel_Buffer),
      .SRAM_DQ_to_and_from_the_Pixel_Buffer (SRAM_DQ_to_and_from_the_Pixel_Buffer),
      .SRAM_LB_N_from_the_Pixel_Buffer      (SRAM_LB_N_from_the_Pixel_Buffer),
      .SRAM_OE_N_from_the_Pixel_Buffer      (SRAM_OE_N_from_the_Pixel_Buffer),
      .SRAM_UB_N_from_the_Pixel_Buffer      (SRAM_UB_N_from_the_Pixel_Buffer),
      .SRAM_WE_N_from_the_Pixel_Buffer      (SRAM_WE_N_from_the_Pixel_Buffer),
      .VGA_BLANK_from_the_VGA_Controller    (VGA_BLANK_from_the_VGA_Controller),
      .VGA_B_from_the_VGA_Controller        (VGA_B_from_the_VGA_Controller),
      .VGA_CLK_from_the_VGA_Controller      (VGA_CLK_from_the_VGA_Controller),
      .VGA_G_from_the_VGA_Controller        (VGA_G_from_the_VGA_Controller),
      .VGA_HS_from_the_VGA_Controller       (VGA_HS_from_the_VGA_Controller),
      .VGA_R_from_the_VGA_Controller        (VGA_R_from_the_VGA_Controller),
      .VGA_SYNC_from_the_VGA_Controller     (VGA_SYNC_from_the_VGA_Controller),
      .VGA_VS_from_the_VGA_Controller       (VGA_VS_from_the_VGA_Controller),
      .clk                                  (clk),
      .in_port_to_the_pio_0                 (in_port_to_the_pio_0),
      .reset_n                              (reset_n),
      .sys_clk                              (sys_clk),
      .vga_clk                              (vga_clk)
    );

  initial
    clk = 1'b0;
  always
    #10 clk <= ~clk;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on