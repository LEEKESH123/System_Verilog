mailbox gen2bfm = new();
`include "eth_pkt.sv"
`include "eth_good_pkt.sv"
`include "eth_bad_pkt.sv"
`include "eth_ill_pkt.sv"
`include "eth_gen.sv"
`include "eth_bfm.sv"
`include "eth_env.sv"

module tb;
  eth_env env;
  
  initial begin
    env = new();
    env.run(); 
    $finish;
  end
endmodule

