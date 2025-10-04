// 8. Declaring a property as static, automatic
// a. In Eth_pkt class declare a new variable count(static int count;)
// b. Create 3 instances of eth_pkt in module top
// i. New, randomize, assign count = 10 in one of the pkt
// instances only(not other 2, ie. Pktl only, not pkt2 & pkt3)
// c. Now print pktl, pkt2, pkt3
// i. You will notice that count is printed as same for all pkt's
// ii. Other variables len, payload, sof, crc will be unique for
// each instance
// iii. All static fields share a common memory
// d. Declare a property as automatic(by default every property in
// class is automatic)
// e. Use above count property do keep track of number of pkts
// created.
// i. When all 3 pkts are created, count should be printed as
// 3
// ii. Try above example by declaring count as automatic,
// every time count will be 'I' only, since for every new pkt
// created, it starts with 'O' value.

class eth_pkt;
    static int count = 0;
    bit[47:0] data; 
    rand int unsigned len;
    rand bit[31:0] da;
    rand bit[31:0] sa;
    rand byte payload [];
    bit [31:0]crc;
    
   function void print(input string name="ETH_PKT");
        $display("--- %0s ---", name);
        $display("  count: %0d", count);
        $display("  DA: 'h%0h, SA: 'h%0h", da, sa);
        $display("  len (Local/Protected): %0d", this.len); 
        $display("  data (Local): 'h%0h", this.data);
        $display("  CRC: 'h%0h", crc);
    	$display("payload : %p",payload);
    endfunction
    
    function void calc_crc();
        this.crc = da[31:0] ^ sa[31:0] ^ len;
    endfunction
    
    function new();
        count++;
    endfunction
    
    constraint p_c {
        len inside {[10:20]}; 
        payload.size() == len; 
    }
endclass : eth_pkt

module top;
  eth_pkt pkt1,pkt2,pkt3;
  
  initial begin
    pkt1=new();
    pkt2=new();
    pkt3=new();
    
    assert (pkt1.randomize() & pkt2.randomize() & pkt3.randomize());
    
    pkt1.calc_crc();
    pkt2.calc_crc();
    pkt3.calc_crc();
    
    pkt1.count=100;
    
    pkt1.print("signed to 100");
    pkt2.print("untouched");
    pkt3.print("untouched");
  end
endmodule

//# --- signed to 100 ---
//#   count: 100
//#   DA: 'h625a0d56, SA: 'he58058f4
//#   len (Local/Protected): 10
//#   data (Local): 'h0
//#   CRC: 'h87da55a8
//# payload : '{-51, -99, -18, -71, -68, -58, 20, 120, 111, 37}
//# --- untouched ---
//#   count: 100
//#   DA: 'he456dc00, SA: 'he6642290
//#   len (Local/Protected): 14
//#   data (Local): 'h0
//#   CRC: 'h232fe9e
//# payload : '{67, 67, -59, 28, 76, -117, -6, 103, -46, -19, 26, -41, 111, -50}
//# --- untouched ---
//#   count: 100
#   DA: 'habb5a65d, SA: 'hbe94991f
#   len (Local/Protected): 10
#   data (Local): 'h0
#   CRC: 'h15213f48
# payload : '{43, -19, -125, 77, 55, 21, 64, 115, 112, 111}
