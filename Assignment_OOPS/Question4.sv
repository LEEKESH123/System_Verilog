// 4. Instantiate eth_pkt inside module top
// a. Write $display to display contexts of eth pkt
// b. List down disadvantages of $display to print pkt

class eth_pkt;
    static int count = 0;
    rand bit[47:0]da;
    rand bit[47:0]sa;
    rand int unsigned len;
  rand byte payload []; 
  bit [31:0]crc;

    constraint c_pkt_len {
        len inside {[64:1500]}; 
        payload.size() == len;
    }
    
    function new();
        count++;
    endfunction

    function void calculate_crc();
        this.crc = da[31:0] ^ sa[31:0] ^ len;
    endfunction
    
    function void print(input string str="ETH_PKT");
        $display("----------%0s---------",str);
        $display("total pkts = %0d",count);
      $display("Destination Address=%p",da); 
      $display("Source Address=%p",sa);     
        $display("len=%0d",len);
        $display("payload size = %0d bytes", payload.size());
      $display("crc=%p",crc);
    endfunction
endclass : eth_pkt

module top;
    eth_pkt pkt1;
    
    initial begin
        pkt1 = new();
        
        $display("--- Starting Randomization for pkt1 ---");

      pkt1.randomize();
            pkt1.calculate_crc();
            pkt1.print("Randomized Ethernet Packet"); 
            
        
    end
endmodule : top


//--- Starting Randomization for pkt1 ---
//# ----------Randomized Ethernet Packet---------
//# total pkts = 1
//# Destination Address=197270863703325
//# Source Address=210838264658979
//# len=610
//# payload size = 610 bytes
//# crc=673174364

