//12. practical usage of above example
//a. if we have 3 slaves, we want to target more txs to slve#2, then we can distribution constraint

class sample;
 rand int slave_id;
 rand int data;

 constraint slave_weight_c {
  slave_id dist {0 := 10 ,1 := 20, 2 := 70};
 }

 constraint data_c {
  data inside {[100:200]};
 }

endclass

module tb;
 sample s;
 int count[3];
 initial begin
  s=new();
  for(int i=0;i<20;i++) begin
  assert(s.randomize());
    count[s.slave_id]++;
    $display("TX(%0d) : slave_id=%0d data=%0d",i,s.slave_id,s.data);
 end
 $display("-------------count---------");
 $display("Slave#0 : %0d txs",count[0]);
 $display("Slave#1 : %0d txs",count[1]);
 $display("Slave#2 : %0d txs",count[2]);
 end
endmodule


//TX(0) : slave_id=1 data=122
//TX(1) : slave_id=1 data=166
//TX(2) : slave_id=2 data=197
//TX(3) : slave_id=2 data=161
//TX(4) : slave_id=1 data=198
//TX(5) : slave_id=2 data=187
//TX(6) : slave_id=2 data=181
//TX(7) : slave_id=0 data=145
//TX(8) : slave_id=2 data=193
//TX(9) : slave_id=1 data=174
//TX(10) : slave_id=1 data=182
//TX(11) : slave_id=2 data=149
//TX(12) : slave_id=1 data=194
//TX(13) : slave_id=1 data=122
//TX(14) : slave_id=2 data=117
//TX(15) : slave_id=2 data=141
//TX(16) : slave_id=1 data=194
//TX(17) : slave_id=2 data=193
//TX(18) : slave_id=2 data=199
//TX(19) : slave_id=2 data=134
//------count----------------
//Slave#0 : 1 txs
//Slave#1 : 8 txs
//Slave#2 : 11 txs
