// --------------------------------------------------------------------
// Copyright (c) 2010 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------
//
// Major Functions:	DE2_115 Top Entity Reference Design
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author                    :| Mod. Date :| Changes Made:
//   V1.0 :| Richard                   :| 07/09/10  :| Initial Revision
// --------------------------------------------------------------------
module DE2_115_GOLDEN_TOP(

	//////// CLOCK //////////
	CLOCK_50,
   CLOCK2_50,
   CLOCK3_50,
	ENETCLK_25,

	//////// Sma //////////
	SMA_CLKIN,
	SMA_CLKOUT,

	//////// LED //////////
	LEDG,
	LEDR,

	//////// KEY //////////
	KEY,

	//////// SW //////////
	SW,

	//////// SEG7 //////////
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	HEX6,
	HEX7,

	//////// LCD //////////
	LCD_BLON,
	LCD_DATA,
	LCD_EN,
	LCD_ON,
	LCD_RS,
	LCD_RW,

	//////// RS232 //////////
	UART_CTS,
	UART_RTS,
	UART_RXD,
	UART_TXD,

	//////// PS2 //////////
	PS2_CLK,
	PS2_DAT,
	PS2_CLK2,
	PS2_DAT2,

	//////// SDCARD //////////
	SD_CLK,
	SD_CMD,
	SD_DAT,
	SD_WP_N,

	//////// VGA //////////
	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS,

	//////// Audio //////////
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK,

	//////// I2C for EEPROM //////////
	EEP_I2C_SCLK,
	EEP_I2C_SDAT,

	//////// I2C for Audio and Tv-Decode //////////
	I2C_SCLK,
	I2C_SDAT,

	//////// Ethernet 0 //////////
	ENET0_GTX_CLK,
	ENET0_INT_N,
	ENET0_MDC,
	ENET0_MDIO,
	ENET0_RST_N,
	ENET0_RX_CLK,
	ENET0_RX_COL,
	ENET0_RX_CRS,
	ENET0_RX_DATA,
	ENET0_RX_DV,
	ENET0_RX_ER,
	ENET0_TX_CLK,
	ENET0_TX_DATA,
	ENET0_TX_EN,
	ENET0_TX_ER,
	ENET0_LINK100,

	//////// Ethernet 1 //////////
	ENET1_GTX_CLK,
	ENET1_INT_N,
	ENET1_MDC,
	ENET1_MDIO,
	ENET1_RST_N,
	ENET1_RX_CLK,
	ENET1_RX_COL,
	ENET1_RX_CRS,
	ENET1_RX_DATA,
	ENET1_RX_DV,
	ENET1_RX_ER,
	ENET1_TX_CLK,
	ENET1_TX_DATA,
	ENET1_TX_EN,
	ENET1_TX_ER,
	ENET1_LINK100,

	//////// TV Decoder //////////
	TD_CLK27,
	TD_DATA,
	TD_HS,
	TD_RESET_N,
	TD_VS,

    /////// USB OTG controller
    OTG_DATA,
    OTG_ADDR,
    OTG_CS_N,
    OTG_WR_N,
    OTG_RD_N,
    OTG_INT,
    OTG_RST_N,
    OTG_DREQ,
    OTG_DACK_N,
    OTG_FSPEED,
    OTG_LSPEED,
	//////// IR Receiver //////////
	IRDA_RXD,

	//////// SDRAM //////////
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_DQM,
	DRAM_RAS_N,
	DRAM_WE_N,

	//////// SRAM //////////
	SRAM_ADDR,
	SRAM_CE_N,
	SRAM_DQ,
	SRAM_LB_N,
	SRAM_OE_N,
	SRAM_UB_N,
	SRAM_WE_N,

	//////// Flash //////////
	FL_ADDR,
	FL_CE_N,
	FL_DQ,
	FL_OE_N,
	FL_RST_N,
	FL_RY,
	FL_WE_N,
	FL_WP_N,

	//////// GPIO //////////
	GPIO,

	//////// HSMC (LVDS) //////////
//	HSMC_CLKIN_N1,
//	HSMC_CLKIN_N2,
	HSMC_CLKIN_P1,
	HSMC_CLKIN_P2,
	HSMC_CLKIN0,
//	HSMC_CLKOUT_N1,
//	HSMC_CLKOUT_N2,
	HSMC_CLKOUT_P1,
	HSMC_CLKOUT_P2,
	HSMC_CLKOUT0,
	HSMC_D,
//	HSMC_RX_D_N,
	HSMC_RX_D_P,
//	HSMC_TX_D_N,
	HSMC_TX_D_P,
    //////// EXTEND IO //////////
    EX_IO	
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input		          		CLOCK_50;
input		          		CLOCK2_50;
input		          		CLOCK3_50;
input		          		ENETCLK_25;

//////////// Sma //////////
input		          		SMA_CLKIN;
output		          		SMA_CLKOUT;

//////////// LED //////////
output		     [8:0]		LEDG;
output		    [17:0]		LEDR;

//////////// KEY //////////
input		     [3:0]		KEY;

//////////// SW //////////
input		    [17:0]		SW;

//////////// SEG7 //////////
output		     [6:0]		HEX0;
output		     [6:0]		HEX1;
output		     [6:0]		HEX2;
output		     [6:0]		HEX3;
output		     [6:0]		HEX4;
output		     [6:0]		HEX5;
output		     [6:0]		HEX6;
output		     [6:0]		HEX7;

//////////// LCD //////////
output		          		LCD_BLON;
inout		     [7:0]		LCD_DATA;
output		          		LCD_EN;
output		          		LCD_ON;
output		          		LCD_RS;
output		          		LCD_RW;

//////////// RS232 //////////
output		          		UART_CTS;
input		          		UART_RTS;
input		          		UART_RXD;
output		          		UART_TXD;

//////////// PS2 //////////
inout		          		PS2_CLK;
inout		          		PS2_DAT;
inout		          		PS2_CLK2;
inout		          		PS2_DAT2;

//////////// SDCARD //////////
output		          		SD_CLK;
inout		          		SD_CMD;
inout		     [3:0]		SD_DAT;
input		          		SD_WP_N;

//////////// VGA //////////
output		     [7:0]		VGA_B;
output		          		VGA_BLANK_N;
output		          		VGA_CLK;
output		     [7:0]		VGA_G;
output		          		VGA_HS;
output		     [7:0]		VGA_R;
output		          		VGA_SYNC_N;
output		          		VGA_VS;

//////////// Audio //////////
input		          		AUD_ADCDAT;
inout		          		AUD_ADCLRCK;
inout		          		AUD_BCLK;
output		          		AUD_DACDAT;
inout		          		AUD_DACLRCK;
output		          		AUD_XCK;

//////////// I2C for EEPROM //////////
output		          		EEP_I2C_SCLK;
inout		          		EEP_I2C_SDAT;

//////////// I2C for Audio and Tv-Decode //////////
output		          		I2C_SCLK;
inout		          		I2C_SDAT;

//////////// Ethernet 0 //////////
output		          		ENET0_GTX_CLK;
input		          		ENET0_INT_N;
output		          		ENET0_MDC;
inout		          		ENET0_MDIO;
output		          		ENET0_RST_N;
input		          		ENET0_RX_CLK;
input		          		ENET0_RX_COL;
input		          		ENET0_RX_CRS;
input		     [3:0]		ENET0_RX_DATA;
input		          		ENET0_RX_DV;
input		          		ENET0_RX_ER;
input		          		ENET0_TX_CLK;
output		     [3:0]		ENET0_TX_DATA;
output		          		ENET0_TX_EN;
output		          		ENET0_TX_ER;
input		          		ENET0_LINK100;

//////////// Ethernet 1 //////////
output		          		ENET1_GTX_CLK;
input		          		ENET1_INT_N;
output		          		ENET1_MDC;
inout		          		ENET1_MDIO;
output		          		ENET1_RST_N;
input		          		ENET1_RX_CLK;
input		          		ENET1_RX_COL;
input		          		ENET1_RX_CRS;
input		     [3:0]		ENET1_RX_DATA;
input		          		ENET1_RX_DV;
input		          		ENET1_RX_ER;
input		          		ENET1_TX_CLK;
output		     [3:0]		ENET1_TX_DATA;
output		          		ENET1_TX_EN;
output		          		ENET1_TX_ER;
input		          		ENET1_LINK100;

//////////// TV Decoder 1 //////////
input		          		TD_CLK27;
input		     [7:0]		TD_DATA;
input		          		TD_HS;
output		          		TD_RESET_N;
input		          		TD_VS;


//////////// USB OTG controller //////////
inout            [15:0]     OTG_DATA;
output           [1:0]      OTG_ADDR;
output                      OTG_CS_N;
output                      OTG_WR_N;
output                      OTG_RD_N;
input            [1:0]      OTG_INT;
output                      OTG_RST_N;
input            [1:0]      OTG_DREQ;
output           [1:0]      OTG_DACK_N;
inout                       OTG_FSPEED;
inout                       OTG_LSPEED;

//////////// IR Receiver //////////
input		          		IRDA_RXD;

//////////// SDRAM //////////
output		    [12:0]		DRAM_ADDR;
output		     [1:0]		DRAM_BA;
output		          		DRAM_CAS_N;
output		          		DRAM_CKE;
output		          		DRAM_CLK;
output		          		DRAM_CS_N;
inout		    [31:0]		DRAM_DQ;
output		     [3:0]		DRAM_DQM;
output		          		DRAM_RAS_N;
output		          		DRAM_WE_N;

//////////// SRAM //////////
output		    [19:0]		SRAM_ADDR;
output		          		SRAM_CE_N;
inout		    [15:0]		SRAM_DQ;
output		          		SRAM_LB_N;
output		          		SRAM_OE_N;
output		          		SRAM_UB_N;
output		          		SRAM_WE_N;

//////////// Flash //////////
output		    [22:0]		FL_ADDR;
output		          		FL_CE_N;
inout		     [7:0]		FL_DQ;
output		          		FL_OE_N;
output		          		FL_RST_N;
input		          		FL_RY;
output		          		FL_WE_N;
output		          		FL_WP_N;

//////////// GPIO //////////
inout		    [35:0]		GPIO;

//////////// HSMC (LVDS) //////////

//input		          		HSMC_CLKIN_N1;
//input		          		HSMC_CLKIN_N2;
input		          		HSMC_CLKIN_P1;
input		          		HSMC_CLKIN_P2;
input		          		HSMC_CLKIN0;
//output		          		HSMC_CLKOUT_N1;
//output		          		HSMC_CLKOUT_N2;
output		          		HSMC_CLKOUT_P1;
output		          		HSMC_CLKOUT_P2;
output		          		HSMC_CLKOUT0;
inout		     [3:0]		HSMC_D;
//input		    [16:0]		HSMC_RX_D_N;
input		    [16:0]		HSMC_RX_D_P;
//output		    [16:0]		HSMC_TX_D_N;
output		    [16:0]		HSMC_TX_D_P;

//////// EXTEND IO //////////
inout		    [6:0]		EX_IO;

//	All inout port turn to tri-state
assign	SD_DAT		=	4'bz;
assign	GPIO   =	36'hzzzzzzzz;

//	Disable USB speed select
assign	OTG_FSPEED	=	1'bz;
assign	OTG_LSPEED	=	1'bz;


//	Enable TV Decoder
assign	TD_RESET_N	=	KEY[0];

//	All inout port turn to tri-state
assign	DRAM_DQ		=	32'hzzzzzzzz;
assign	SRAM_DQ		=	16'hzzzz;
assign	SD_DAT		=	4'bz;

//	All inout port turn to tri-state
assign	SD_DAT		=	4'bz;
assign	GPIO   =	36'hzzzzzzzz;

//	Disable USB speed select
assign	OTG_FSPEED	=	1'bz;
assign	OTG_LSPEED	=	1'bz;

//assign LEDR = SW;
wire	VGA_CTRL_CLK;
wire	AUD_CTRL_CLK;
wire	DLY_RST;

/*
module VGA_Audio_PLL (
	areset,
	inclk0,
	c0,
	c1,
	c2,
	locked);

module vga_buffer (
	address_a,
	address_b,
	clock_a,
	clock_b,
	data_a,
	data_b,
	wren_a,
	wren_b,
	q_a,
	q_b);
*/

Reset_Delay			r0	(	.iCLK(CLOCK_50),.oRESET(DLY_RST)	);

VGA_Audio_PLL 		p1	(	.areset(~DLY_RST),.inclk0(CLOCK2_50),.c0(VGA_CTRL_CLK),.c1(AUD_CTRL_CLK),.c2(VGA_CLK)	);

VGA_Controller		u1	(	//	Host Side
							.iCursor_RGB_EN(4'b0111),
							.oAddress(mVGA_ADDR),
							.oCoord_X(Coord_X),
							.oCoord_Y(Coord_Y),
							.iRed(mVGA_R),
							.iGreen(mVGA_G),
							.iBlue(mVGA_B),
							//	VGA Side
							.oVGA_R(VGA_R),
							.oVGA_G(VGA_G),
							.oVGA_B(VGA_B),
							.oVGA_H_SYNC(VGA_HS),
							.oVGA_V_SYNC(VGA_VS),
							.oVGA_SYNC(VGA_SYNC_N),
							.oVGA_BLANK(VGA_BLANK_N),
							//	Control Signal
							.iCLK(VGA_CTRL_CLK),
							.iRST_N(DLY_RST)	);

wire [9:0]	mVGA_R;				//memory output to VGA
wire [9:0]	mVGA_G;
wire [9:0]	mVGA_B;
wire [18:0]	mVGA_ADDR;			//video memory address
wire [9:0]  Coord_X, Coord_Y;	//display coods

////////////////////////////////////
//DLA state machine variables
wire reset;
wire scroll;
reg [3:0] state;	//state machine
reg [9:0] x_cursor;
reg [8:0] y_cursor;
reg [2:0] pattern;
reg [30:0] rand;

////////////////////////////////////
/*From megaWizard:
	module vga_buffer (
	address_a, // use a for state machine
	address_b, // use b for VGA refresh
	clock_a,
	clock_b,
	data_a,
	data_b,
	wren_a,
	wren_b,
	q_a,
	q_b);*/
// Show m4k on the VGA
// -- use m4k a for state machine
// -- use m4k b for VGA refresh
wire mem_bit ; //current data from m4k to VGA
reg disp_bit ; // registered data from m4k to VGA
wire state_bit ; // current data from m4k to state machine
reg we ; // write enable for a
reg [18:0] addr_reg ; // for a
reg data_reg ; // for a
reg rand_top;
reg rand_side;
reg next;
reg [7:0] switches;

vga_buffer display(
	.address_a (addr_reg) , 
	.address_b ({Coord_X[9:0],Coord_Y[8:0]}), // vga current address
	.clock_a (VGA_CTRL_CLK),
	.clock_b (VGA_CTRL_CLK),
	.data_a (data_reg),
	.data_b (1'b0), // never write on port b
	.wren_a (we),
	.wren_b (1'b0), // never write on port b
	.q_a (state_bit),
	.q_b (mem_bit) ); // data used to update VGA

// make the color white
assign  mVGA_R = {10{disp_bit}} ;
assign  mVGA_G = {10{disp_bit}} ;
assign  mVGA_B = {10{disp_bit}} ;

// DLA state machine
assign reset = ~KEY[0];
assign scroll = ~KEY[1];
assign LEDR[8:0] = y_cursor;
assign low_bit = rand[27] ^ rand[30];

//state names
parameter init = 4'd0, 
			 init1 = 4'd1,
			 init2 = 4'd2,
			 test = 4'd3,
			 test1 = 4'd4,
			 test2 = 4'd5,
			 test3 = 4'd6,
			 test4 = 4'd7,
			 draw = 4'd8,
			 draw1 = 4'd9,
			 draw2 = 4'd10,
			 update = 4'd11,
			 new_screen = 4'd12,
			 done = 4'd13;
			 
always @ (negedge VGA_CTRL_CLK)
begin
	// register the m4k output for better timing on VGA
	// negedge seems to work better than posedge
	disp_bit <= mem_bit;
end

always @ (posedge VGA_CTRL_CLK) //VGA_CTRL_CLK
begin
	// register the m4k output for better timing on VGA
	//disp_bit <= mem_bit;
	
	if (reset)		//synch reset assumes KEY0 is held down 1/60 second
	begin
		//clear the screen
		addr_reg <= {Coord_X[9:0],Coord_Y[8:0]} ;	// [17:0]
		we <= 1'b1;								//write some memory
		data_reg <= 1'b0;						//write all zeros (black)
		x_cursor <= 10'd1;
		y_cursor <= 9'd1;
		if (SW[15:8]==8'b0)
		begin
			rand <= 31'h55555555;
		end
		else
		begin
			rand <= {SW[15:8],SW[15:8],SW[15:8],SW[15:9]}; //random bit is rand[30]
		end
		state <= init;	//first state in regular state machine 
		
		rand_top <= SW[17];
		rand_side <= SW[16];
		switches <= SW[7:0];
	end
	
	else if (scroll)
	begin
	   we <= 1'b0;
		state <= new_screen;
		addr_reg <= {10'd0, 9'd479};
	end
	
	//begin state machine to modify display 
	else if (KEY[3])
	begin
		case(state)
			// next three states write the inital dot
			init: //write a single dot in the middle of the screen
			begin
				if (rand_top)
				begin
				   we <= 1'b1;
					addr_reg <= {x_cursor, 9'b0};
					x_cursor <= x_cursor + 10'd1;
					data_reg <= rand[30];
					rand <= {rand[29:0], low_bit} ;
					
					if (x_cursor < 10'd638)
						state <= init;
					else
						state <= init1;
				end
				else
				begin
					we <= 1'b0 ;
					addr_reg <= {10'd320,9'd0} ;	//(x,y)							
					//write a white dot in the middle of the screen
					data_reg <= 1'b1 ;
					state <= init1 ;
				end
			end			
			
			init1: //delay enable 'we' to account for registering addr,data
			begin
				we <= 1'b1;								
				//write a white dot to the top center of the screen
				data_reg <= 1'b1 ;
				x_cursor <= 10'd1;
				state <= init2 ;
			end	 
			
			init2: 
			// finish write a single dot in the middle of the screen
			// and set up first read
			begin
				we <= 1'b0;	
				//read left neighbor
				// use result TWO cycles later (state==test2)
				// -- one to load the addr reg, one to read memory
				addr_reg <= {x_cursor-10'd1, y_cursor-9'd1};							
				state <=test1;
			end	
					
			test1: 
			begin	
				pattern <= 3'b000; 		//clear the pattern
				we <= 1'b0; 	//no memory write 
				//read right neighbor 
				addr_reg <= {x_cursor + 10'd1, y_cursor-9'd1};
				state <= test2;			
			end
			
			test2: 
			begin				
				we <= 1'b0; //no memory write 
				if (x_cursor == 10'd1)
				begin
					pattern[2] <= rand[30];
					rand <= {rand[29:0], low_bit};
				end
				else
				begin
					pattern[2] <= state_bit;	//record left neighbor
				end
				//read middle neighbor 
				addr_reg <= {x_cursor, y_cursor-9'd1};
				state <= test3;	
			end
			
			test3:  
			begin
				we <= 1'b0; //no memory write 
				if (x_cursor == 10'd638)
				begin
					pattern[0] <= rand[30];
					rand <= {rand[29:0], low_bit};
				end
				else
				begin
					pattern[0] <= state_bit; //record right neighbor
				end
				state <= test4;
			end
			
			test4: 
			begin
				we <= 1'b0; //no memory write 
				pattern[1] <= state_bit; // record middle neighbor
				state <= draw ;					
			end
			
			draw:
			begin
				we <= 1'b0; //no memory write 
				case (pattern)
					3'b111: data_reg <= switches[7];
					3'b110: data_reg <= switches[6];
					3'b101: data_reg <= switches[5];
					3'b100: data_reg <= switches[4];
					3'b011: data_reg <= switches[3];
					3'b010: data_reg <= switches[2];
					3'b001: data_reg <= switches[1];
					3'b000: data_reg <= switches[0];
				endcase
				
				addr_reg <= {x_cursor, y_cursor};
				state <= draw1;
			end
			
			draw1:
			begin
				we <= 1'b1; // memory write enable 
				state <= draw2 ;
			end
			
			draw2:
			begin
				we <= 1'b0; // finish memory write
				state <= update ;
			end		
			
			update: //update the cursor
			begin
				we <= 1'b0; //no mem write
				//increment x until end of line
				if (x_cursor < 10'd638)
					x_cursor <= x_cursor + 10'd1;
				else 
				begin
					x_cursor <= 10'd1;
					y_cursor <= y_cursor + 9'd1;
				end
				
				if (y_cursor < 9'd480)
					state <= init2;
				else
					state <= done;
			end
			
			new_screen: //generate a new one
			begin
				we <= 1'b0;
				state <= new_screen;
				addr_reg <= {10'd0, 9'd479};
			end
			
			done:
			begin
				we <= 1'b0;
			end
		endcase
	end
	else
	begin
	end
	
	
end // always @ (posedge VGA_CTRL_CLK)

endmodule //top module






















