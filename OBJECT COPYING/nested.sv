class sample;
	class sample1;
		class sample2;
			class sample3;
				static int a;
				int b;
				static function void print();
					$display("a=%0d",a);
				endfunction
				
				function void print1();
					$display("b=%0d",b);
				endfunction
			endclass
		endclass
	endclass
endclass


module tb;
	sample::sample1::sample2::sample3 s;
	initial begin
		sample::sample1::sample2::sample3::a=100;
		sample::sample1::sample2::sample3::print();
		s=new();
		s.b=200;
		s.print1();
	end
endmodule


