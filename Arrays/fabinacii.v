module tb;
 integer a=0;
 integer b=1;
 integer sum;
 integer i;
 initial begin

   $display("a=%0d",a);
   $display("b=%0d",b);
  for(i=0;i<10;i=i+1) begin
   sum= a+b;
   $display("sum=%0d",sum);
   a=b;
   b=sum;
  end
 end
endmodule

//a=0
//b=1
//sum=1
//sum=2
//sum=3
//sum=5
//sum=8
//sum=13
//sum=21
//sum=34
//sum=55
//sum=89
