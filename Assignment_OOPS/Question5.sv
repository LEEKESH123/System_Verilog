// 5. Randomize pkt
// a. Try without assert
// b. Try with assert
// i. Keep payload as not a random variable
// ii. Then Keep payload as a random variable
// c. Try with if condition to confirm if randomize is passing or
// failing
// i. Keep payload as not a random variable
// d. You should notice of above 3, b is better.


class eth_pkt;
  static bit count;
  rand bit[47:0]data; //6 bytes
  rand int unsigned len;
  rand bit[31:0]da;   //4 bytes
  rand bit[31:0]sa;
  rand byte payload[$];
  bit [31:0]crc;
  
    constraint p_c {
    len inside {[50:1430]};
    payload.size() == len;
  }
  
  function new();
  	count++;
  endfunction
  
  function void print(input string str="ETH_PKT");
    $display("-------%0s--------",str);
    $display("data=%p",data);
    $display("destination address=%p",da);
    $display("source=%p",sa);
    $display("payload=%0d",payload.size());
    $display("crc=%p",crc);
  endfunction
  
  function void calculation_crc();
    this.crc = da[31:0] ^ sa[31:0] ^ len;
  endfunction

endclass

module top;
  eth_pkt pkt;
  
  initial begin
    pkt = new();
    assert(pkt.randomize()) begin
      pkt.calculation_crc();
      pkt.print();
      $display("Randomization succussfull!");
    end
    
  
  end
endmodule


//-------ETH_PKT--------
//# data=262309276038219
//# destination address=1650068822
//# source=3850393844
//# payload=967
//# crc=2279233125
//# Randomization succussfull!
