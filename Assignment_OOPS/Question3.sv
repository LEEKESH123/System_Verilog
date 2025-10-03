
// 3. Declare eth_pkt with following fields
// a.
// b.
// c.
// d.
// e.
// count, da, len, payload, crc
// i. Count used to count total eth_pkt instances in the whole
// ii. Count incremented as part function new
// Declare count as static
// Declare da, len. payload as random
// CRC is not random (why?)
// Payload declared either as dynamic array or Queue (why?)
// i. If declared static array it becomes limitation on changing
// payload size


class eth_pkt;
  static int count;
  rand bit[47:0]da; //6 bytes
  rand bit[47:0]sa;
  rand bit[15:0]len;
  rand byte payload[$];
  bit [31:0]crc;    //4 bytes
  
  function new();
  	count++;  //increment static count every time the new memeory allocated
  endfunction
  
  function void print(input string str="ETH_PKT");
    $display("----------%0s---------",str);
    $display("total pkts = %0d",count);
    $display("Destination Address=%p",da);
    $display("Source Address=%p",sa);
    $display("len=%p",len);
    $display("payload = %p",payload);
    $display("crc=%p",crc);
  endfunction
  
  function void clac_crc(); 
    this.crc = da[31:0] ^ sa[31:0] ^ len;
  endfunction
  
  constraint p_c {
    len inside {[50:1640]};
    payload.size() == len;
  }
  
endclass : eth_pkt

module top;
  eth_pkt pkt1;
  
  initial begin
    pkt1=new();
    pkt1.randomize();
    pkt1.print();
  end
  
endmodule : top


 ----------ETH_PKT---------
# total pkts = 1
# Destination Address=197270863703325
# Source Address=210838264658979
# len=1332
# payload = '{-51, -99, -18, -71, -68, -58, 20, 120, 111, 37, 31, -124, -1, 6, 115, 84, -91, 42, 118, 91, -108, 61, 19, 79, 111, -59, -30, 53, -61, -62, -40, 94, 109, -69, -94, 85, 35, -57, -70, -25, 121, -22, -38, -94, 81, -69, 98, 48, -57, -37, 123, 45, -55, -8, -91, -18, -79, 12, 72, -67, 66, -17, -124, -86, -38, 127, -35, -118, -48, 1, 102, 25, -55, 41, -82, 98, -6, -11, -29, 62, 44, 59, -94, -95, 50, -7, -76, -32, 7, 123, 22, -95, 26, -53, 16, 102, -69, -1, 104, -23, 80, -105, 81, -127, -31, 0, -47, -9, -79, -72, -88, -118, 63, -37, 69, 75, -102, -91, -40, 6, 104, 78, 90, -82, -66, 19, 110, 98, 57, 1, -94, -14, 15, 91, -107, -19, 109, -58, -97, -12, 107, -119, 105, -16, -6, -66, 27, 97, -52, 81, 124, 53, 8, 51, 38, -33, -52, -72, -101, -13, -29, 32, 77, -47, -86, -77, 78, 75, -121, -74, 7, -62, 54, -71, -60, -55, -72, -103, 50, 41, 0, 45, 79, 103, 115, -124, 98, 106, -1, -126, -87, -16, 25, -104, 46, 77, 126, -3, 60, -80, 77, -95, 106, -89, 58, -90, -92, 53, 27, -85, -55, -114, 9, 53, 21, -13, -22, -69, -128, -59, 90, -121, -47, 83, -67, 35, -41, -43, -108, 56, -84, 126, -79, -41, -119, -91, 95, 66, -31, -69, -99, -50, -119, 103, 13, 88, 82, -92, -11, -124, -46, 122, 68, 117, -63, 54, -7, 114, 78, -69, -120, 6, -78, -59, 87, 84, -40, -24, 122, 88, -106, -29, -37, 116, -60, -41, 28, -75, 98, -65, 47, -84, 78, -25, -5, -42, 18, -50, -5, 85, -106, 57, -104, -19, -91, 32, -39, 50, -36, 104, -62, 9, 105, -7, 101, 72, 66, -54, -13, -68, 60, -122, 27, 73, 81, 73, 50, 32, 95, -118, -76, 3, 118, -59, -101, -7, -124, 103, 40, 24, 107, -121, -110, 85, -4, 52, 113, 120, -4, -59, -56, 3, -12, 23, 7, 52, 34, -110, 41, 68, 36, 41, -20, 116, 67, 112, -8, 50, 20, -74, 7, -11, 15, -107, -44, 70, 118, 43, 71, -51, 43, 24, 32, 1, 119, 69, -31, 122, -74, 114, -59, 11, 25, 106, -122, -40, 58, -26, 76, -22, -50, -90, -75, 42, -125, -116, -28, -123, -70, -49, -55, -80, 127, -81, 30, 121, -6, -69, -72, -69, -116, 1, -11, 121, 23, 77, 5, -26, -114, 124, -49, -83, -95, -120, -110, -126, ***trimmed
# crc=0
