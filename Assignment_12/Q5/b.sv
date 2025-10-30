class eth_pkt;
	static randc [3:0]count;

endclass

module tb;
	eth_pkt pkt1,pkt2,pkt3;

	initial begin
	pkt1 =new();
	pkt2 =new();
	pkt3 =new();
	pkt1.randomize(); $display("pkt1.count=%0d",pkt1.count);
	pkt2.randomize(); $display("pkt2.count=%0d",pkt2.count);
	pkt3.randomize(); $display("pkt3.count=%0d",pkt3.count);

	pkt1.randomize(); $display("pkt1.count=%0d",pkt1.count);
	pkt2.randomize(); $display("pkt2.count=%0d",pkt2.count);
	end
endmodule

//# pkt1.count=11
//# pkt2.count=5
//# pkt3.count=10
//# pkt2.count=13
//# pkt1.count=6
