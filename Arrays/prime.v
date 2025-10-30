module tb;
 integer i,val;
 reg is_prime;

 initial begin
  for(i=0;i<50;i=i+1) begin
   if(i<=1) 
    is_prime=0;
   else begin
    is_prime=1;
    for(val=2; val<= i/2 && is_prime; val=val+1 ) begin
	 if(i % val == 0)
	 is_prime=0;
	end
   end
   if(is_prime)
    $display("%0d",val);
  end
  
 end
endmodule

//2
//3
//5
//7
//11
//13
//17
//19
//23
//29
//31
//37
//41
//43
//47
//   
