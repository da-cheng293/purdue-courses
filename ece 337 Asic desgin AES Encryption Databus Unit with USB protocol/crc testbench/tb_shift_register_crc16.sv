// $Id: $
// File name:   tb_usb_receiver.sv
// Created:     2/27/2018
// Author:      Da Cheng
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: testbench
`timescale 1ns / 10ps 
module tb_shift_register_crc16();
	
        localparam  	CLK_PERIOD	= 2.5;
	localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay
	localparam      NUM_CNT_BITS = 4;
		
	// Clock generation block


 reg tb_clk;
  //input wire w_clk,
   reg tb_n_rst;
  reg tb_data_in;

reg tb_result;
 
  reg [15:0] tb_crc_o;
  
   reg[135:0] tb_cur_input;
  reg[15:0] tb_cur_exp;
  reg tb_expected_result;

  
shift_register_crc16
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
   
task AA;
begin
reg [135:0]test;
test = 136'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;

for (int n=135;n>=0; n=n-1)
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in = test[n];

end


end

endtask

task BB;
begin
reg [135:0]test;
test = 136'hBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB;

for (int n=135;n>=0; n=n-1)
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in = test[n];

end


end

endtask

task CC;
begin
reg [135:0]test;
test = 136'hCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC;

for (int n=135;n>=0; n=n-1)
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in = test[n];

end


end

endtask

task DD;
begin
reg [135:0]test;
test = 136'hDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD;

for (int n=135;n>=0; n=n-1)
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in = test[n];

end


end

endtask

task EE;
begin
reg [135:0]test;
test = 136'hEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE;

for (int n=135;n>=0; n=n-1)
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in = test[n];

end


end

endtask


task FF;
begin
reg [135:0]test;
test = 136'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;

for (int n=135;n>=0; n=n-1)
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in = test[n];

end
end

endtask
task eight;
begin
reg [135:0]test;
test = 136'h8888888888888888888888888888888888;

for (int n=135;n>=0; n=n-1)
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in = test[n];

end

end

endtask

task nine;
begin
reg [135:0]test;
test = 136'h9999999999999999999999999999999999;

for (int n=135;n>=0; n=n-1)
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in = test[n];

end
end

endtask
task A_CRC;
begin

reg [15:0]test;
test = 16'b0111011111110101;

for (int n=15;n>=0; n=n-1)
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in = test[n];

end

end
endtask

task B_CRC;
begin

reg [15:0]test;
test = 16'b0011101001101100;

for (int n=15;n>=0; n=n-1)
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in = test[n];

end

end
endtask

task C_CRC;
begin

reg [15:0]test;
test = 16'b0101101010100110;

for (int n=15;n>=0; n=n-1)
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in = test[n];

end

end
endtask


task D_CRC;
begin

reg [15:0]test;
test = 16'b0001011100111111;

for (int n=15;n>=0; n=n-1)
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in = test[n];

end

end
endtask

task E_CRC;
begin

reg [15:0]test;
test = 16'b1100000110010100;

for (int n=15;n>=0; n=n-1)
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in = test[n];

end

end
endtask

task F_CRC;
begin

reg [15:0]test;
test = 16'b1000110000001101;

for (int n=15;n>=0; n=n-1)
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in = test[n];

end

end
endtask

task eight_CRC;
begin

reg [15:0]test;
test = 16'b1110110011000111;

for (int n=15;n>=0; n=n-1)
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in = test[n];

end

end
endtask



task nine_CRC;
begin

reg [15:0]test;
test = 16'b1010000101011110;

for (int n=15;n>=0; n=n-1)
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in = test[n];

end

end
endtask

task error_CRC;
begin

reg [15:0]test;
test = 16'b1111111111111111;

for (int n=15;n>=0; n=n-1)
begin

@(negedge tb_clk);

tb_n_rst =1;

tb_data_in = test[n];

end

end
endtask

task stop;
begin
@(negedge tb_clk);
tb_n_rst=0;
end
endtask

 initial
    begin
tb_n_rst=0;
tb_expected_result=0;
@(negedge tb_clk);
tb_cur_input=136'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
tb_cur_exp=16'b0111011111110101;
tb_expected_result=1;
AA;
A_CRC;
tb_expected_result=0;
stop;
@(negedge tb_clk);
@(negedge tb_clk);
tb_expected_result=1;


tb_cur_input=136'hBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB;
tb_cur_exp=16'b0011101001101100;
BB;
B_CRC;
tb_expected_result=0;
stop;
@(negedge tb_clk);
@(negedge tb_clk);
tb_expected_result=1;


tb_cur_input=136'hCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC;
tb_cur_exp=16'b0101101010100110;

CC;
C_CRC;
tb_expected_result=0;
stop;
@(negedge tb_clk);
@(negedge tb_clk);
tb_expected_result=1;

tb_cur_input=136'hDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD;
tb_cur_exp=16'b0001011100111111;


DD;
D_CRC;
tb_expected_result=0;
stop;
@(negedge tb_clk);
@(negedge tb_clk);
tb_expected_result=1;

tb_cur_input=136'hEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE;
tb_cur_exp=16'b1100000110010100;

EE;
E_CRC;
tb_expected_result=0;
stop;
@(negedge tb_clk);
@(negedge tb_clk);
tb_expected_result=1;


tb_cur_input=136'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
tb_cur_exp=16'b1000110000001101;


FF;
F_CRC;
tb_expected_result=0;
stop;
@(negedge tb_clk);
@(negedge tb_clk);
tb_expected_result=1;

tb_cur_input=136'h8888888888888888888888888888888888;
tb_cur_exp=16'b1110110011000111;
eight;
eight_CRC;
tb_expected_result=0;
stop;
@(negedge tb_clk);
@(negedge tb_clk);
tb_expected_result=1;

tb_cur_input=136'h9999999999999999999999999999999999;
tb_cur_exp=16'b1010000101011110;
nine;
nine_CRC;
tb_expected_result=0;
stop;
@(negedge tb_clk);
@(negedge tb_clk);
//error
tb_expected_result=1;

tb_cur_input=136'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
tb_cur_exp=16'b0111011111110101;
AA;
error_CRC;
tb_cur_input=136'hBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB;
tb_cur_exp=16'b0011101001101100;
BB;
error_CRC;
tb_cur_input=136'hCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC;
tb_cur_exp=16'b0101101010100110;
CC;
error_CRC;
tb_cur_input=136'hDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD;
tb_cur_exp=16'b0001011100111111;
DD;
error_CRC;

tb_cur_input=136'hEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE;
tb_cur_exp=16'b1100000110010100;

EE;
error_CRC;
tb_cur_input=136'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
tb_cur_exp=16'b1000110000001101;

FF;
error_CRC;
tb_cur_input=136'h8888888888888888888888888888888888;
tb_cur_exp=16'b1110110011000111;
eight;
error_CRC;
tb_cur_input=136'h9999999999999999999999999999999999;
tb_cur_exp=16'b1010000101011110;
nine;
error_CRC;












end

endmodule
