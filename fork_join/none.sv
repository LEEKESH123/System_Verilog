module tb;
	int i,j,value;

	initial begin
		forever begin
			fork
				begin
					$display("%0t: process-%0d is started",$time,i++);
					#10;
					$display("%0t: process-%0d is completed",$time,j++);

				end
			join_none
			value=$urandom_range(5,15);
			$display("%0t : random delay=%0d",$time,value);
			#(value);
		end
	end
	initial begin
		#100;
		$finish;
	end
endmodule

//# 0 : random delay=9        
//# 0: process-0 is started      // 10ns
//# 9 : random delay=5           --> total 14ns 
//# 9: process-1 is started      // 19ns
//# 10: process-0 is completed
//# 14 : random delay=5        // total 19ns 
//# 14: process-2 is started   // 24ns 
//# 19: process-1 is completed
//# 19 : random delay=15        // 34ns 
//# 19: process-3 is started    // 29ns 
//# 24: process-2 is completed
//# 29: process-3 is completed
//# 34 : random delay=10
//# 34: process-4 is started
//# 44 : random delay=13
//# 44: process-5 is started
//# 44: process-4 is completed
//# 54: process-5 is completed
//# 57 : random delay=8
//# 57: process-6 is started
//# 65 : random delay=15
//# 65: process-7 is started
//# 67: process-6 is completed
//# 75: process-7 is completed
//# 80 : random delay=14
//# 80: process-8 is started
//# 90: process-8 is completed
//# 94 : random delay=13
//# 94: process-9 is started

