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
