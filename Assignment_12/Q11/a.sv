class eth_pkt;
 rand int len;
endclass

module tb;
 eth_pkt pkt;
 initial begin
  pkt=new();
  for(int i=0;i<20;i++) begin
   randcase
    80 :pkt_len =  $urandom_range(1000,1400);
	20 :pkt_len =  $urandom_range(42,100);
   endcase
   $display("pkt[%0d] len=%0d",i,pkt.len);
  end
 end
endmodule


//pkt[0] len=1343 (LARGE)
//pkt[1] len=84 (SMALL)
//pkt[2] len=1228 (LARGE)
//pkt[3] len=1222 (LARGE)
//pkt[4] len=1167 (LARGE)
//pkt[5] len=1227 (LARGE)
//pkt[6] len=1044 (LARGE)
//pkt[7] len=89 (SMALL)
//pkt[8] len=1358 (LARGE)
//pkt[9] len=1203 (LARGE)
//pkt[10] len=1238 (LARGE)
//pkt[11] len=1045 (LARGE)
//pkt[12] len=1077 (LARGE)
//pkt[13] len=1329 (LARGE)
//pkt[14] len=1269 (LARGE)
//pkt[15] len=1262 (LARGE)
//pkt[16] len=1198 (LARGE)
//pkt[17] len=1157 (LARGE)
//pkt[18] len=1394 (LARGE)
//pkt[19] len=47 (SMALL)
