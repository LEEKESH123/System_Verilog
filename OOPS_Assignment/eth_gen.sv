class eth_gen;
	eth_good_pkt g_pkt;
	eth_bad_pkt b_pkt;
	eth_ill_pkt i_pkt;

	int s;
	task run();
		repeat(10) begin
			s=$urandom_range(0,2);
		case(s);
		0 : begin
				g_pkt=new();
				g_pkt.randomize();
				g_pkt.print("gen_good_pkt");
				gen2bfm.put(g_pkt)
			end
		
		1 : begin
				b_pkt=new();
				b_pkt.randomize();
				b_pkt.print("gen_bad_pkt");
				gen2bfm.put(b_pkt);
			end
		
		2 : begin
				i_pkt=new();
				i_pkt.randomize();
				i_pkt.print("gen_ill_pkt");
				gen2bfm.put(i_pkt);
			end
		endcase
		end
		$display("----------GENERATOR DONE------------");
	endtask
endclass


