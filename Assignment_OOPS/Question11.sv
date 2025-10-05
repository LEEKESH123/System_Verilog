// 11. Constraint conflict
// a. Existing code constraints len in between 40 to 50.
// b. Define another constraint, to limit payload below 20
// i. Use the same constraint name as ISt one
// c. Now call print, payload size will be 'O', not only payload, every
// other field also will be 'O'. Because randomize failed due to
// constraint conflict. This causes all other fields to fail.
// d. To confirm randomize failure call assert(pkt.randomize()); this
// will print out assertion error message
// e. Now you notice randomization is failing, how do we still
// ensure that our requirement takes effect
// Merge both constraints in to single constraint
// GI VLSIGURU
// ii. len inside {O, [J} type of constraint

class eth_pkt;
  static int count=0;
  rand bit [31:0]sa,da;
  rand bit [47:0]data;
  rand bit unsigned len;
  rand byte payload[$];
  bit[31:0]crc;
  rand bit [2:0]sof;
               
               constraint p_c {
                 
                 len inside {[40:50]};
                 payload.size()== len;
               }
               
               constraint p_c1 {
                 payload.size() <20;
               }
  
  function new();
    count ++;
  endfunction
  
  function void print(input string str="ETH_PKT");
    $display("no.of packets = %0d",count);
    $display("source address=%p",sa);
    $display("destination address=%p",da);
    $display("data=%0p",data);
    $display("payload=%0p",payload);
    $display("len=%0d",len);
    $display("crc=%0d",crc);
  endfunction
  
endclass

module top;
  eth_pkt pkt;
  
  initial begin
    pkt = new();
    
    assert(pkt.randomize());
    pkt.print("Failed randomize");
  end
endmodule

//# ** Error: Assertion error.
//#    Time: 0 ns  Scope: top File: testbench.sv Line: 45
//# no.of packets = 1
//# source address=0
//# destination address=0
//# data=0
//# payload=
//# len=0
//# crc=0
