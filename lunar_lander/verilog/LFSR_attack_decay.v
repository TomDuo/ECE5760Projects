//////////////////////////////////////////////////
////////////	Linear feedback noise	///////////
//////////////////////////////////////////////////
// Input is an lowpass cutoff and a clock
// output is bandlimited white noise
// frequency cutoff is given as a power of two from 0 to 7
// where 0 means no filtering and 7 means a cutoff ~= clock/(2^7) 

module LFSR_attack_decay (clock, reset, cutoff, gain, attack, decay, amp, noise_out);
input clock, reset;
input [2:0]  cutoff, gain;
input [3:0] attack, decay ;
input [15:0] amp ;
output wire signed [15:0] noise_out;

//random number generator and lowpass filter
wire x_low_bit ; // random number gen low-order bit
reg  signed [30:0] x_rand ;//  rand number
wire signed [17:0] new_lopass, rand_bits ;
reg signed [17:0]  lopass ;
reg [15:0] amp_rise, amp_fall;
wire  [15:0] amp_rise_main, envelope ;
wire [31:0] temp_mult, temp_envelope;
wire signed [15:0] temp_noise_out;
reg [7:0] LR_clk_divider;

//generate a random number 
//right-most bit for rand number shift regs
assign x_low_bit = x_rand[27] ^ x_rand[30];
assign rand_bits = x_rand[17:0];
// LOWPASS:
// newsample = (1-alpha)*oldsample + random*alpha
// rearranging:
// newsample = oldsample + (random-oldsample)*alpha
// alpha is set from 1 to 1/128 using shifts from 0 to 7
// alpha==1 means no lopass at all. 1/128 loses almost all the input bits
//assign new_lopass = lopass + {{4{x_rand[17]}},x_rand[17:4]} - {{4{lopass[17]}},lopass[17:4]};

assign new_lopass = lopass + (rand_bits - lopass)>>>cutoff;
assign temp_noise_out = lopass[17:2]<<gain ;

always@(posedge clock) begin
	if (reset)
	begin
		x_rand <= 31'h55555555;
		lopass <= 18'h0 ;
		amp_fall <= amp ; 
		amp_rise <= amp ;
	end
	else begin
		x_rand <= {x_rand[29:0], x_low_bit} ;
		lopass <= new_lopass ;
	end
	
	LR_clk_divider = LR_clk_divider + 1;
	if (LR_clk_divider == 0) begin
		amp_fall <= amp_fall - (amp_fall>>decay) ;
		amp_rise <= amp_rise - (amp_rise>>attack);
	end	
end

// form (1-exp(-t/tau)) for the attack phase
assign amp_rise_main =  amp - amp_rise;
// product of rise and fall exponentials is the amplitude envelope
assign temp_envelope = amp_rise_main * amp_fall ;
assign envelope = temp_envelope[31:16]  ;		
assign temp_mult = (temp_noise_out<<1) * $signed(envelope);
//assign shaped_out = (envelope<16'h10)? 16'd0 : temp_mult[31:16] ;
assign noise_out = temp_mult[31:16] ;
endmodule
