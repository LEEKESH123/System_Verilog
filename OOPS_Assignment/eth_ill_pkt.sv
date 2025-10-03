class eth_ill_pkt extends eth_pkt;
	static int ill_count;
	
	function new();
		ill_count ++;
	endfunction

	function void print(input string str="ill_pkt");
		super.print(str);
		$display("ill_count = %0d",ill_count);
	endfunction

	constraint p_c{
		p_t == ILL;
	}
endclass
