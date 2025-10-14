module tb;
	initial begin
		$display("%0t entry-1",$time);   //0ns
		#2;
		$display("%0t entry-2",$time);   // 2
		fork
			$display("%0t entry-3",$time);  //2ns
			#2 $display("%0t entry-4",$time); //4ns
			begin
				#5;
				$display("%0t entry-5",$time);   //7ns
				#1 $display("%0t entry-6",$time);// 8ns
				$display("%0t entry-7",$time);   //8ns
			end
			#2; $display("%0t entry-8",$time); //2ns
			#5 $display("%0t entry-9",$time); //7ns
			begin
				#3;
				$display("%0t entry-10",$time); //5ns
				#15; //20ns
			end
			$display("%0t entry-11",$time); //2ns
		join
		$display("%0t entry-12",$time);   //20ns
		#5 $display("%0t entry-13",$time); //25ns
		#15;
		$display("%0t entry-14",$time);  //40ns
	end
endmodule

//# 0 entry-1
//# 2 entry-2
//# 2 entry-3
//# 2 entry-8
//# 2 entry-11
//# 4 entry-4
//# 5 entry-10
//# 7 entry-5
//# 7 entry-9
//# 8 entry-6
//# 8 entry-7
//# 20 entry-12
//# 25 entry-13
//# 40 entry-14
//


