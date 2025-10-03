// 6. Declare a method print to display the contents of eth-pkt
// a. Pass string name as an argument
// i. name should indicate who is printing packet
// b. Notice in both prints above payload will print O elements
// c. How to solve above problem?
// i. Declare a constraint on payload size between IO to 20
// ii. Print the pkt contents after randomize
// 1. Notice payload printing with IO to 20 elements
// d. Implement calc_crc16 to return a value 16'h1234
// i. Implement this method in post_randomize


class eth_pkt;
    static int count = 0;
    
    rand bit[47:0]data;
    rand int unsigned len;
    rand bit[31:0]da;
    rand bit[31:0]sa;
    rand byte payload [];
  
    bit [31:0]crc16;
  	bit [31:0]crc32;
 
  constraint p_c{
    len inside {[10:20]};
    payload.size() == len;
  
  }
   
  function new();
     count++;
    endfunction
  
   
  function bit [15:0] calc_crc16();
        return 16'h1234;
    endfunction
  
     
  function void post_randomize();
        this.crc16 = calc_crc16(); 
        this.crc32 = da[31:0] ^ sa[31:0] ^ len; 
  endfunction

  function void print(input string str="ETH_PKT");
    	$display("-------------------------------------------");
    	$display("Printing Packet: %0s", str); 
        $display("-------------------------------------------");
        $display("total pkts = %0d", count);
        $display("data='h%0h, da='h%0h, sa='h%0h", data, da, sa);
        $display("payload size=%0d bytes", payload.size());
        $display("len=%0d", len);
        $display("CRC16='h%0h (Calculated in post_randomize)", crc16);
        $display("-------------------------------------------");
  endfunction
endclass

module top;
  eth_pkt gen;
  eth_pkt drv;
  
  initial begin
    gen=new();
    drv=new();
    if(gen.randomize()) begin
      gen.print("GEN_PKT");
      
    end
    else $fatal(1,"Genration fail!");
    
    if(drv.randomize()) begin
      drv.print("DRV_PKT");
    end
    else $fatal(1,"Genration fail!");
    
  end
endmodule


//-------------------------------------------
//# Printing Packet: GEN_PKT
//# -------------------------------------------
//# total pkts = 2
//# data='hee91a338344b, da='h625a0d56, sa='he58058f4
//# payload size=10 bytes
//# len=10
//# CRC16='h1234 (Calculated in post_randomize)
//# -------------------------------------------
//# -------------------------------------------
//# Printing Packet: DRV_PKT
//# -------------------------------------------
//# total pkts = 2
//# data='hc08bdfe7a158, da='he456dc00, sa='he6642290
//# payload size=14 bytes
//# len=14
//# CRC16='h1234 (Calculated in post_randomize)
//# -------------------------------------------
