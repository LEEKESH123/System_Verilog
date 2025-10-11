module tb;
	string str;
	int a;
	initial begin
		repeat(10) begin
			a=$urandom_range(65,92);
			//str=string'(a);
			//$sformat(str,"%0s",a);
			str=$sformatf("%0s",a);
			$display("str=%0s",str);
		end
	end
endmodule
