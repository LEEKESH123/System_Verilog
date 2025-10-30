//reverse a string

module tb;
 reg[8*5-1:0]str= "HELLO";
 reg[8*5-1:0]rev;
 integer i;

 initial begin
  for(i=0;i<5;i=i+1) begin
   rev[8*i+:8] = str[8*(5-1-i)+:8];  
  end
  $display("original : %0s",str);
  $display("revesed : %0s",rev);
 end
endmodule 

//# KERNEL: original : HELLO
//# KERNEL: revesed : OLLEH

