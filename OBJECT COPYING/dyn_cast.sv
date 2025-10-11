class sample;
	int a,b;
	function void print(input string str);
		$display("-------printing the data from %0s---------",str);
		$display("a=%0d,b=%0d",a,b);
	endfunction
endclass

module tb;
	sample s1,s2;
	initial begin
		s1=new();
		s1.a=100;
		s1.b=200;
		s1.print("S1");
		$cast(s2,s1);
		s2.print("S2");
	end
endmodule 
