typedef enum bit[1:0]{GOOD=2'b00,BAD=2'b01,ILL=2'b10} pkt_type;
class eth_pkt;
  static int count; 
  rand bit [9:0]len;
  rand byte payload[$];
  rand pkt_type p_t;
  
  function new();
    count ++;
  endfunction
  
  function void print(input string str="ETH_PKT");
    $display("------------------- %0s -------------------",str);
    $display("p_t=%0s",p_t.name()); 
    $display("no.of packets =%0d",count);
    $display("len=%0d",len);
    $display("payload size=%p",payload,payload.size()); 
  endfunction
    
  constraint a_c {
    len inside {[15:25]};
    payload.size()==len;
  }
  
  constraint p_c {
    p_t != 2'b11; 
  }
endclass
