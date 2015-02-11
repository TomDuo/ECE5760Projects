// (C) 2001-2011 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/rel/11.0/ip/merlin/altera_merlin_router/altera_merlin_router.sv.terp#2 $
// $Revision: #2 $
// $Date: 2011/03/23 $
// $Author: aferrucc $

// -------------------------------------------------------
// Merlin Router
//
// Asserts the appropriate one-hot encoded channel based on 
// either (a) the address or (b) the dest id. The DECODER_TYPE
// parameter controls this behaviour. 0 means address decoder,
// 1 means dest id decoder.
//
// In the case of (a), it also sets the destination id.
// -------------------------------------------------------

`timescale 1 ns / 1 ns

module basic_shit_addr_router_002_default_decode
  #(
     parameter DEFAULT_CHANNEL = 4,
               DEFAULT_DESTID = 5 
   )
  (output [85 - 83 : 0] default_destid,
   output [7-1 : 0] default_src_channel
  );

  assign default_destid = DEFAULT_DESTID;
  generate begin : default_decode
    if (DEFAULT_CHANNEL == -1)
      assign default_src_channel = 0;
    else
      assign default_src_channel = 1 << DEFAULT_CHANNEL;
  end endgenerate

endmodule


module basic_shit_addr_router_002
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,

    // -------------------
    // Command Sink (Input)
    // -------------------
    input                       sink_valid,
    input  [87-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [87-1    : 0] src_data,
    output reg [7-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 67;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 85;
    localparam PKT_DEST_ID_L = 83;
    localparam ST_DATA_W = 87;
    localparam ST_CHANNEL_W = 7;
    localparam DECODER_TYPE = 0;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;

    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------
    localparam PAD0 = log2ceil(32'h301000 - 32'h300800);
    localparam PAD1 = log2ceil(32'h300000 - 32'h280000);
    localparam PAD2 = log2ceil(32'h301010 - 32'h301000);
    localparam PAD3 = log2ceil(32'h301038 - 32'h301030);
    localparam PAD4 = log2ceil(32'h200000 - 32'h0);
    localparam PAD5 = log2ceil(32'h301020 - 32'h301010);
    localparam PAD6 = log2ceil(32'h301030 - 32'h301020);

    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 32'h301038;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;
    localparam RG = RANGE_ADDR_WIDTH-1;

    reg [PKT_ADDR_W-1 : 0] address;

    // -------------------------------------------------------
    // Pass almost everything through, untouched
    // -------------------------------------------------------
    assign sink_ready        = src_ready;
    assign src_valid         = sink_valid;
    assign src_startofpacket = sink_startofpacket;
    assign src_endofpacket   = sink_endofpacket;

    wire [PKT_DEST_ID_W-1:0] default_destid;
    wire [7-1 : 0] default_src_channel;

    basic_shit_addr_router_002_default_decode the_default_decode(
      .default_destid (default_destid),
      .default_src_channel (default_src_channel)
    );

    always @* begin
        src_data    = sink_data;
        src_channel = default_src_channel;

        src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = default_destid;
        // --------------------------------------------------
        // Address Decoder
        // Sets the channel and destination ID based on the address
        // --------------------------------------------------
        address     = sink_data[OPTIMIZED_ADDR_H : PKT_ADDR_L];

        // ( 0x300800 .. 0x301000 )
        if ( {address[RG:PAD0],{PAD0{1'b0}}} == 'h300800 ) begin
            src_channel = 'b0000001;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
        end

        // ( 0x280000 .. 0x300000 )
        if ( {address[RG:PAD1],{PAD1{1'b0}}} == 'h280000 ) begin
            src_channel = 'b0000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
        end

        // ( 0x301000 .. 0x301010 )
        if ( {address[RG:PAD2],{PAD2{1'b0}}} == 'h301000 ) begin
            src_channel = 'b0000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
        end

        // ( 0x301030 .. 0x301038 )
        if ( {address[RG:PAD3],{PAD3{1'b0}}} == 'h301030 ) begin
            src_channel = 'b0001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
        end

        // ( 0x0 .. 0x200000 )
        if ( {address[RG:PAD4],{PAD4{1'b0}}} == 'h0 ) begin
            src_channel = 'b0010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
        end

        // ( 0x301010 .. 0x301020 )
        if ( {address[RG:PAD5],{PAD5{1'b0}}} == 'h301010 ) begin
            src_channel = 'b0100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
        end

        // ( 0x301020 .. 0x301030 )
        if ( {address[RG:PAD6],{PAD6{1'b0}}} == 'h301020 ) begin
            src_channel = 'b1000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
        end

    end

    // --------------------------------------------------
    // Ceil(log2()) function
    // --------------------------------------------------
    function integer log2ceil;
        input reg[63:0] val;
        reg [63:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

endmodule

