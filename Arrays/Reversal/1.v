//reverse a number 

module tb;
 integer num,rev,rem;

 initial begin
  num=1234;
  rev=0;

  while(num!=0) begin
   rem = num % 10;
   rev = rev * 10 + rem;
   num = num / 10;
  end

  $display("%0d",rev);
 end
endmodule
