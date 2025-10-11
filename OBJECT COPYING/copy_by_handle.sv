class sample;
	int a,b;
	function void print(input string str);
		$display("--------printing the data from %0s-----------",str);
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
		s2=s1;    // copy by handle 
		s2.print("S2");
		
		s2.a=10;
		s2.b=20;
		s2.print("->S2");
		s1.print("S1->S2");
		s1.a=150;
		s1.b=250;
		s1.print("->S1");
		s2.print("S2->S1");
	end
endmodule




