// 9. Declaring a property rand and randc
// a. Declare sof as randc in eth_pkt, limit sof size to 3 bits only
// b. Generate 10 pkts of eth-pkt. new, randomize, print
// i. Value of sof will not repeat unless all values are taken, i.e
// called as cyclic randomization
// ii. Do not declare 10 pkts as array of 10 pkts, then randc
// will not take effect
// iii. Randc takes effect only same 'pkt' handle is randomized
// without doing 'new' repeatedly. Anytime we do new in
// between, randc behaviour is lost.
// c. For rand variable above restriction does not apply




class eth_pkt;
  static int count =0;
  randc bit[2:0] sof;
  
  bit[47:0] data;
  rand int unsigned len;
  rand bit[31:0] da;
  
  function new();
    count++;
  endfunction
  
  function void print(input string name="ETH_PKT");
    $display("----%0s-----",str);
    $display("count:%d",this.count);
    $display("sof (randc): %0d", this.sof);
    $display("len(rand): %0d",this.len);
  endfunction
  
  constraint p_c {
    len inside {[50:100]};
    payload.size() == len;
  }
  
  
endclass : eth_pkt

module top;
  eth_pkt pkt_randc;
  eth_pkt pkt_new_array[10];
  
  initial begin
    pkt_randc = new();
    for(int i=0; i<10; i++) begin
      assert(pkt_randc.randomize());
      pkt_randc.print("packet randc :%d",i+1);
    end
    
    for(int i=0; i<10;i++) begin
      pkt_new_array[i]= new();
      assert(pkt_new_array[i].randomize());
      pkt_new_array[i].print($sformatf("Packet NEW 50d",i+1));
      							          
     end
  end
  
endmodule


