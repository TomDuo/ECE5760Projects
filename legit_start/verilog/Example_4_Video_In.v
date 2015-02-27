
module Example_4_Video_In (

	//////////// CLOCK //////////
	input 		          		CLOCK_50,
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// VGA //////////
	output		     [7:0]		VGA_B,
	output		          		VGA_BLANK_N,
	output		          		VGA_CLK,
	output		     [7:0]		VGA_G,
	output		          		VGA_HS,
	output		     [7:0]		VGA_R,
	output		          		VGA_SYNC_N,
	output		          		VGA_VS,

	//////////// Audio //////////
	input 		          		AUD_ADCDAT,
	inout 		          		AUD_ADCLRCK,
	inout 		          		AUD_BCLK,
	output		          		AUD_DACDAT,
	inout 		          		AUD_DACLRCK,
	output		          		AUD_XCK,

	//////////// I2C for Audio  //////////
	output		          		I2C_SCLK,
	inout 		          		I2C_SDAT,

	//////////// SRAM //////////
	output		    [19:0]		SRAM_ADDR,
	output		          		SRAM_CE_N,
	inout 		    [15:0]		SRAM_DQ,
	output		          		SRAM_LB_N,
	output		          		SRAM_OE_N,
	output		          		SRAM_UB_N,
	output		          		SRAM_WE_N
	

);

wire [7:0] sound_out;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

//Example instantiation for system 'Video_System'
Video_System Video_System_inst
 (
	.SRAM_ADDR_from_the_Pixel_Buffer      (SRAM_ADDR),
	.SRAM_CE_N_from_the_Pixel_Buffer      (SRAM_CE_N),
	.SRAM_DQ_to_and_from_the_Pixel_Buffer (SRAM_DQ),
	.SRAM_LB_N_from_the_Pixel_Buffer      (SRAM_LB_N),
	.SRAM_OE_N_from_the_Pixel_Buffer      (SRAM_OE_N),
	.SRAM_UB_N_from_the_Pixel_Buffer      (SRAM_UB_N),
	.SRAM_WE_N_from_the_Pixel_Buffer      (SRAM_WE_N),
	.VGA_BLANK_from_the_VGA_Controller    (VGA_BLANK_N),
	.VGA_B_from_the_VGA_Controller        (VGA_B),
	.VGA_CLK_from_the_VGA_Controller      (VGA_CLK),
	.VGA_G_from_the_VGA_Controller        (VGA_G),
	.VGA_HS_from_the_VGA_Controller       (VGA_HS),
	.VGA_R_from_the_VGA_Controller        (VGA_R),
	.VGA_SYNC_from_the_VGA_Controller     (VGA_SYNC_N),
	.VGA_VS_from_the_VGA_Controller       (VGA_VS),
	.clk                                  (CLOCK_50),
	.in_port_to_the_pio_0                 (KEY),
	.out_port_from_the_sound              (sound_out),
	.reset_n                              (1'b1),
	.sys_clk                              (),
	.vga_clk                              ()
 );
 
 /* Audio hardware setup */

wire	AUD_CTRL_CLK;
wire	DLY_RST;

assign	AUD_ADCLRCK	=	AUD_DACLRCK;
assign	AUD_XCK		=	AUD_CTRL_CLK;

Reset_Delay			r0	(.iCLK(CLOCK_50),.oRESET(DLY_RST));

Audio_PLL 			p1	(.areset(~DLY_RST),.inclk0(CLOCK_50),.c0(AUD_CTRL_CLK));

I2C_AV_Config 		u3	(	//	Host Side
							.iCLK(CLOCK_50),
							.iRST_N(KEY[0]),
							//	I2C Side
							.I2C_SCLK(I2C_SCLK),
							.I2C_SDAT(I2C_SDAT)	);

AUDIO_DAC_ADC 			u4	(	//	Audio Side
							.oAUD_BCK(AUD_BCLK),
							.oAUD_DATA(AUD_DACDAT),
							.oAUD_LRCK(AUD_DACLRCK),
							.oAUD_inL(audio_inL), // audio data from ADC 
							.oAUD_inR(audio_inR), // audio data from ADC 
							.iAUD_ADCDAT(AUD_ADCDAT),
							.iAUD_extL(audio_outL), // audio data to DAC
							.iAUD_extR(audio_outR), // audio data to DAC
							//	Control Signals
				         .iCLK_18_4(AUD_CTRL_CLK),
							.iRST_N(DLY_RST)
							);



// The data for the DACs
wire signed [15:0] audio_outL, audio_outR ;

// output from DDS units and noise
wire signed [15:0] lfsr_out;
wire signed [15:0] sine_out;

// output two sine waves in quadrature
assign audio_outR = (lfsr_out<<1) + sine_out;
assign audio_outL = (lfsr_out<<1) + sine_out; 


/* Crashing sound generator.  Hooked up to pin 0 of sound parallel IO port*/
LFSR_attack_decay crash(.clock(AUD_DACLRCK), 
			.reset(~sound_out[0]),
			.cutoff(3'd7), // cutoff from full freq to clock/(2^7)
			.gain(3'd7), // gain = 3 bit shift factor = 1 to 2^7
			.attack(4'd0), // fast rise
			.decay(4'd6),  // fairly slow fall
			.amp(16'h7FFF), // nearly full amp
			.noise_out(lfsr_out));

/* Success sound generator (440hz).  Hooked up to pin 0 of sound parallel IO port*/
DDS sine   (.clock(AUD_DACLRCK), 
				.reset(~sound_out[1]),
				.increment({18'd2507, 14'b0}), 
				.phase(8'd0),
				.sine_out(sine_out));

endmodule

