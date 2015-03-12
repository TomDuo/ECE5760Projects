//////////////////////////////////////////////////
////////////	Direct Digital Synth	//////////////
//////////////////////////////////////////////////
// Input is an increment, phase and a clock
// output is a sine wave
// Output frequency = increment * clock_rate / accumulator_bit_length
// Here accumulator_bit_length is 32 bits
// Phase is measured in samples out of 256/cycle. e.g. 64 input is 90 degrees

module DDS (clock, reset, increment, phase, sine_out);
input clock, reset;
input [31:0] increment ;
input [7:0]  phase;
output wire signed [15:0] sine_out;
reg [31:0]	accumulator;

always@(posedge clock) begin
	if (reset) accumulator <= 0;
	// increment phase accumulator
	else accumulator <= accumulator + increment  ;
end

// link the accumulator to the sine lookup table
sync_rom sineTable(clock, accumulator[31:24]+phase, sine_out);

endmodule
	
module signed_mult (out, a, b);
	output 		[17:0]	out;
	input 	signed	[17:0] 	a;
	input 	signed	[17:0] 	b;
	wire	signed	[17:0]	out;
	wire 	signed	[35:0]	mult_out;
	assign mult_out = a * b;
	assign out = {mult_out[35], mult_out[32:16]};
endmodule

/*
module node (clock, reset, n, rho, eta, alpha, boundaryGain, out);
input clock, reset;
input [0:2] n;
input [0:2] rho;
input  eta;
input  alpha;
input boundaryGain; // either 0 or 1
output wire signed [15:0] out;
reg [31:0]	accumulator;

always@(posedge clock) begin
	if (reset) accumulator <= 0;
	// increment phase accumulator
	else accumulator <= accumulator + increment  ;
end

// link the accumulator to the sine lookup table
sync_rom sineTable(clock, accumulator[31:24]+phase, sine_out);

endmodule
*/

module test_node(clock, reset, in, out, v2, count);
parameter i=0,j=0;
//state variables
input clock, reset;
input signed [17:0] in;
output reg signed [17:0] out;
output reg signed [17:0] v2 ;
wire signed [17:0] v1new, v2new ;
//signed mult output
wire signed [17:0] v1xK_M, v2xD_M ;
// the clock divider
output reg [4:0] count;


//Update state variables of simulation of spring- mass
	always @ (posedge clock) 
	begin
		count <= count + 1; 
		if (reset==0) //reset
		begin	
			out <= 18'h10000;
			v2  <= 18'h00000 ;
			count <= 0;
		end
		else if (count==0)
		begin 
			$display("v1 %d %d %d", i, j, in);
			out <= v1new ;
			v2 <= v2new ;
		end
	end
	
	
	// Compute new F(t,v) with dt = 2>>9
	// v1(n+1) = v1(n) + dt*v2(n)
	assign v1new = in + (v2>>>9);
	// v2(n+1) = v2(n) + dt*(-k/m*v1(n) - d/m*v2(n))
	signed_mult K_M(v1xK_M, in, 18'h10000);
	signed_mult D_M(v2xD_M, v2, 18'h00800);
	assign v2new = v2 - ((v1xK_M + v2xD_M)>>>9);
endmodule
