//11. generate eth_pkts (len only field), which are generated with large pkts
//with 80% chance, small packets with 20% chance
//a.large pkt: 1000 to 1400
//b.small pkt: 42 to 100
//c.don't declare payload
//d.totally generate 20 pkts
//e.Hint: can use randcase
//i. Try other option also, like weighted random constraints

class eth_pkt;
 rand int len;
 rand bit is_large;

 constraint weight_c {
  is_large dist {1 := 80, 0 := 20}; 
 }

 constraint len_c {
  if(is_large)
   len inside {[1000:1400]};
  else
   len inside {[42:100]};
 }

endclass

module tb;
 eth_pkt pkt;
 initial begin
  pkt=new();
  for(int i=0;i<20;i++) begin
  assert(pkt.randomize());
  $display("pkt[%0d] len=%0d (%s)",i,pkt.len,pkt.is_large ? "LARGE" : "SMALL")
end
end
endmodule


//pkt[0] len=86 (SMALL)
//pkt[1] len=1017 (LARGE)
//pkt[2] len=1335 (LARGE)
//pkt[3] len=76 (SMALL)
//pkt[4] len=1033 (LARGE)
//pkt[5] len=1242 (LARGE)
//pkt[6] len=53 (SMALL)
//pkt[7] len=1300 (LARGE)
//pkt[8] len=86 (SMALL)
//pkt[9] len=1239 (LARGE)
//pkt[10] len=1167 (LARGE)
//pkt[11] len=1148 (LARGE)
//pkt[12] len=57 (SMALL)
//pkt[13] len=60 (SMALL)
//pkt[14] len=1253 (LARGE)
//pkt[15] len=68 (SMALL)
//pkt[16] len=1197 (LARGE)
//pkt[17] len=1015 (LARGE)
//pkt[18] len=87 (SMALL)
//pkt[19] len=1151 (LARGE)
