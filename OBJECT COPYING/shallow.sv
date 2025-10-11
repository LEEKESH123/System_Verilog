class parent;
	int count;
endclass


class sample;
	parent p;
	int a,b;
	
	function new();
		p=new();
	endfunction
	
	function void set(input int y);
		p.count=y;
	endfunction

	function void print(input string str);
		$display("--------printing the data from %0s-----------",str);
		$display("a=%0d,b=%0d",a,b);
		$display("parent count=%0d",p.count);
	endfunction
endclass

module tb;
	sample s1,s2;
	initial begin
		s1=new();
		s1.a=100;
		s1.b=200;
		s1.set(300);
		s1.print("S1");
		s2=new s1;    // shallow copy 
		s2.print("S2");
		
		s2.a=10;
		s2.b=20;
		s2.set(30);
		s2.print("->S2");
		s1.print("S1->S2");
		s1.a=150;
		s1.b=250;
		s1.set(350);
		s1.print("->S1");
		s2.print("S2->S1");
	end
endmodule

//# --------printing the data from S1-----------
//# a=100,b=200
//# parent count=300
//# --------printing the data from S2-----------
//# a=100,b=200
//# parent count=300
//# --------printing the data from ->S2-----------
//# a=10,b=20
//# parent count=30
//# --------printing the data from S1->S2-----------
//# a=100,b=200
//# parent count=30
//# --------printing the data from ->S1-----------
//# a=150,b=250
//# parent count=350
//# --------printing the data from S2->S1-----------
//# a=10,b=20
//# parent count=350



