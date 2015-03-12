`timescale 1ns/1ps

module testbench();
	
	reg clk_50, reset;
	
	reg [31:0] index;
	
	//Initialize clocks and index
	initial begin
		clk_50 = 1'b0;
		index  = 32'd0;
	end
	
	//Toggle the clocks
	always begin
		#10
		clk_50  = !clk_50;
	end
	
	//Intialize and drive signals
	initial begin
		reset  = 1'b0;
		#20 
		reset  = 1'b1;
		#20000
		$stop;
	end
	
	//Increment index
	always @ (posedge clk_50) begin
		index  <= index + 32'd1;
	end

	//Instantiation of Device Under Test
	wire [17:0]  testbench_out;
	
	drum DUT(

	//////////// CLOCK //////////
	.CLOCK_50(clk_50),
	.CLOCK2_50(1'b0),
	.CLOCK3_50(1'b0),

	//////////// KEY //////////
	.KEY({3'b0,reset}),

	//////////// SW //////////
	.SW(18'b0),
	
	//////////// Audio //////////
	.AUD_ADCDAT(),
	.AUD_ADCLRCK(),
	.AUD_BCLK(),
	.AUD_DACDAT(),
	.AUD_DACLRCK(),
	.AUD_XCK(),

	//////////// I2C for Audio  //////////
	.I2C_SCLK(),
	.I2C_SDAT()
);
	
endmodule
