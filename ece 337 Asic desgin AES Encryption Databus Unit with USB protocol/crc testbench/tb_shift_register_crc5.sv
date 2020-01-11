// $Id: $
// File name:   tb_usb_receiver.sv
// Created:     2/27/2018
// Author:      Da Cheng
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: testbench
`timescale 1ns / 10ps 
module tb_shift_register_crc5();
	
        localparam  	CLK_PERIOD	= 2.5;
	localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay
	localparam      NUM_CNT_BITS = 4;
		
	// Clock generation block


 reg tb_clk;
  //input wire w_clk,
   reg tb_n_rst;
  reg tb_data_in;

reg tb_result;
 
  reg [4:0] tb_crc_o;
  reg[10:0] tb_cur_input;
  reg[4:0] tb_cur_exp;
  reg tb_expected_result;
   

  
shift_register_crc5
DUT(
   .clk(tb_clk),
  //input wire w_clk,
   .n_rst(tb_n_rst),
   .data_in(tb_data_in),
   
   .crc_o(tb_crc_o),
   .result(tb_result)
  
);
      


always

	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
   
task all_one;
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;


@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;


end

endtask


task zero;

begin

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =0;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;
end
endtask


task one;

begin
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =0;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;
end
endtask

task two;

begin
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;
end
endtask

task three;

begin
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;
end
endtask

task four;

begin
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =0;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;
end
endtask

task five;

begin
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =0;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;
end
endtask

task six;

begin
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;
end
endtask
task seven;

begin
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;
end
endtask

task zero_CRC;

begin
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =0;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =0;

end
endtask

task one_CRC;

begin
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =0;

end
endtask

task two_CRC;

begin
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =1;

end
endtask

task three_CRC;

begin
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =0;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =1;

end
endtask

task four_CRC;

begin
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =1;

end
endtask


task five_CRC;

begin
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =0;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =1;

end
endtask

task six_CRC;

begin
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =0;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =0;

end
endtask


task seven_CRC;

begin
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =0;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =0;

end
endtask

task stop;
begin
@(negedge tb_clk);


tb_n_rst=0;
@(negedge tb_clk);
@(negedge tb_clk);



end
endtask
task error;
begin
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;
@(negedge tb_clk);

tb_n_rst =1;

tb_data_in =1;

@(negedge tb_clk);
tb_n_rst =1;

tb_data_in =1;

end
endtask

 initial
    begin

tb_n_rst=0;
tb_expected_result=1;
zero;
tb_cur_input = 11'b00011111111;
tb_cur_exp = 5'b10100;
all_one;
zero_CRC;
tb_expected_result=0;

tb_cur_input = 0;
tb_cur_exp = 0;
stop;
@(negedge tb_clk);
@(negedge tb_clk);
tb_expected_result=1;

tb_cur_input = 11'b00111111111;
tb_cur_exp = 5'b01000;
one;
all_one;
one_CRC;
tb_expected_result=0;

tb_cur_input = 0;
tb_cur_exp = 0;
stop;
@(negedge tb_clk);
@(negedge tb_clk);
tb_expected_result=1;
tb_cur_input = 11'b01011111111;
tb_cur_exp = 5'b01001;
two;
all_one;
two_CRC;
tb_expected_result=0;

tb_cur_input = 0;
tb_cur_exp = 0;
stop;
@(negedge tb_clk);
@(negedge tb_clk);
tb_expected_result=1;
tb_cur_input = 11'b01111111111;
tb_cur_exp = 5'b10101;

three;
all_one;
three_CRC;
tb_expected_result=0;

tb_cur_input = 0;
tb_cur_exp = 0;
stop;
@(negedge tb_clk);
@(negedge tb_clk);
tb_expected_result=1;
tb_cur_input = 11'b10011111111;
tb_cur_exp = 5'b01011;
four;
all_one;
four_CRC;
tb_expected_result=0;

tb_cur_input = 0;
tb_cur_exp = 0;
stop;
@(negedge tb_clk);
@(negedge tb_clk);
tb_expected_result=1;
tb_cur_input = 11'b10111111111;
tb_cur_exp = 5'b10111;
five;
all_one;
five_CRC;
tb_expected_result=0;

tb_cur_input = 0;
tb_cur_exp = 0;
stop;
@(negedge tb_clk);
@(negedge tb_clk);
tb_expected_result=1;
tb_cur_input = 11'b11011111111;
tb_cur_exp = 5'b10110;
six;
all_one;
six_CRC;
tb_expected_result=0;

tb_cur_input = 0;
tb_cur_exp = 0;
stop;
@(negedge tb_clk);
@(negedge tb_clk);
tb_expected_result=1;
tb_cur_input = 11'b11111111111;
tb_cur_exp = 5'b01010;
seven;
all_one;
seven_CRC;
tb_expected_result=0;

tb_cur_input = 0;
tb_cur_exp = 0;
stop;
@(negedge tb_clk);
@(negedge tb_clk);
tb_expected_result=1;


//stop;

// error

zero;
tb_cur_input = 11'b00011111111;
tb_cur_exp = 5'b11111;
all_one;
error;
tb_cur_input = 0;
tb_cur_exp = 0;
//stop;

tb_cur_input = 11'b00111111111;
tb_cur_exp = 5'b11111;
one;
all_one;
error;
tb_cur_input = 0;
tb_cur_exp = 0;
//stop;
tb_cur_input = 11'b01011111111;
tb_cur_exp = 5'b11111;
two;
all_one;
error;
tb_cur_input = 0;
tb_cur_exp = 0;
//stop;
tb_cur_input = 11'b01111111111;
tb_cur_exp = 5'b11111;

three;
all_one;
error;
tb_cur_input = 0;
tb_cur_exp = 0;
//stop;
tb_cur_input = 11'b10011111111;
tb_cur_exp = 5'b11111;
four;
all_one;
error;
tb_cur_input = 0;
tb_cur_exp = 0;
//stop;
tb_cur_input = 11'b10111111111;
tb_cur_exp = 5'b11111;
five;
all_one;
error;
tb_cur_input = 0;
tb_cur_exp = 0;
//stop;

tb_cur_input = 11'b11011111111;
tb_cur_exp = 5'b11111;
six;
all_one;
error;
tb_cur_input = 0;
tb_cur_exp = 0;
//stop;
tb_cur_input = 11'b11111111111;
tb_cur_exp = 5'b11111;
seven;
all_one;
error;
tb_cur_input = 0;
tb_cur_exp = 0;















end

endmodule
