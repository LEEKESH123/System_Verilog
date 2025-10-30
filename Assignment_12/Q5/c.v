class eth_pkt;
	rand sa;
	rand da;
	rand len;

	constraint size_c{
		sa inside {[10:20]};
		da inside {[10:20]};
	}

	constraint len_c {
		len inside {[64:1500]};

	}

	function void pre_randomize();
		$display("starting preradomization");

	endfunction

	function void post_randomize();
		$display("after randomization sa=%0d len=%0d addr=%0d",sa,len,addr);
	endfunction
endclass

module tb;
	eth_pkt pkt1,pkt2;

	initial begin
		
	end

endmodule 
