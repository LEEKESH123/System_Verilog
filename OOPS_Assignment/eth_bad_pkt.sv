class eth_bad_pkt extends eth_pkt;
	static int count_bad;

	function new();
		count_bad ++;
	endfunction

	function void print(input string str="bad_pkt");
		super.print(str);
		$display("count_bad = %0d",count_bad);
	endfunction

	constraint p_c {
		p_t == BAD;
	}
endclass
