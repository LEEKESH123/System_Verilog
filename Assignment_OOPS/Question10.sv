// 10. Declaring constraints inside a class
// a. In eth_pkt.sv class, define print method, call print method in
// module top
// i. Eth-Pkt pkt; pkt = new(); pkt.print();
// ii. By default payload will be printed as O elements
// b. Constraints can be used to set the size payload in our required
// range
// • It also ensures that payload automatically gets the
// required memory, without user calling new method to
// allocate memory to dynamic array
// ii. Write a constraint payload-c {payload.size() > 40:
// payload.size() < 50;}
// iii. Call print method in module top;
// 1. payload is printing required size, since it got
// memory automatically
// 2. If payload is part of constraint, its values get
// assigned automatically

class eth_pkt;
  static int count=0;
  rand int unsigned len;
  rand bit [2:1]sof;
  rand bit [31:0]da;
  rand bit [31:0]sa;
  rand bit [47:0]data;
  rand byte payload[$];
  //bit [31:0]crc;
  
  constraint p_c {
    len inside {[40:50]};
    payload.size() == len;
  }
  
  function new();
  	count++;
  endfunction
  
  
  function void print(input string str="ETH_PKT");
    $display("-------%0s-------",str);
    $display("sof=%0d",sof);
    $display("da=%d sa=%d",da,sa);
    $display("len=%p",len);
    $display("data=%p",data);
    $display("payload=%p",payload);
    //$display("crc=%p",crc);
  endfunction
  
//   function void calc_crc();
//     this.crc = da[31:0] ^ sa[31:0] ^ len;
//   endfunction
  
  
  endclass
  module top;
    eth_pkt pkt;
    
    initial begin
      repeat(20) begin
      pkt=new();
      assert(pkt.randomize());
      pkt.print();
      end
    end
  endmodule

