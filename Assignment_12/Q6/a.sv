class eth_pkt;
	rand bit [3:0]pior;
	rand int len;

	extern constraint pkt_c;

endclass

constraint eth_pkt::pkt_c {
	len inside {[64:1500]};
	pior inside {[0:7]};
	if(pior >= 4)
	 len > 512;
}

module tb;
	eth_pkt pkt;
	initial begin
		pkt = new();
		repeat (5) begin
		assert(pkt.randomize());
		$display("length=%0d priority=%0d",pkt.len,pkt.pior);
	end
	end
endmodule

//# length=894 priority=2
//# length=405 priority=3
//# length=1378 priority=4
//# length=1475 priority=6
//# length=1481 priority=1
