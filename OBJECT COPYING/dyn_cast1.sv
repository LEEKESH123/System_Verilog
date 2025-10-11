class parent;
endclass

class child1 extends parent;
endclass

class child2 extends parent;
endclass

module tb;
	parent p1,p2;
	child1 ch1;
	child2 ch2;
	initial begin
		p1=new();
		p2=new();
		ch1=new();
		ch2=new();
		if($cast(p1,p2)) $display("casting is possible ");
		else $display("casting is not possible ");

		$display("------------------------------------------");
		
		if($cast(ch1,p1)) $display("casting is possible ");
		else $display("casting is not possible ");
		
		$display("------------------------------------------");

		if($cast(p1,ch1)) $display("casting is possible ");
		else $display("casting is not possible ");
		
		$display("------------------------------------------");
		
		if($cast(ch1,ch2)) $display("casting is possible ");
		else $display("casting is not possible ");
		
		$display("------------------------------------------");

	end
endmodule

//# casting is possible 
//# ------------------------------------------
//# casting is not possible 
//# ------------------------------------------
//# casting is possible 
//# ------------------------------------------
//# casting is not possible 
//# ------------------------------------------





