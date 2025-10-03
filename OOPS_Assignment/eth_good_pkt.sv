class eth_good_pkt extends eth_pkt;
	static int count_good;

	function new();
		count_good ++;
	endfunction

	function void print(input string str="good_pkt");
		super.print(str);
		$display("count_good = %0d",count_good);
	endfunction

	constraint p_c {
		p_t == GOOD;
	}
endclass
