//bit reversal

module tb;
 reg[7:0]num,rev;
 integer i;

 initial begin
  num=8'b10010101;

  for(i=0;i<8;i=i+1) begin
    rev[i] = num[7-i];
  end

  $display("%0d",rev);
 end
endmodule

//# KERNEL: 10101001
