//10. generate a random value between 1.21 to 1.44

class sample;
  rand int temp;
  real val;
  
  constraint value_c {
   temp inside {[121:144]};
  }

  function void post_randomize();
    val = temp/100.0;
  endfunction

endclass

module tb;
 sample s;
  initial begin
  s= new();
   repeat(5) begin
     s.randomize();
     $display("a=%0.2f",s.val);
   end
  end
endmodule

//a=1.38
//a=1.24
//a=1.23
//a=1.34
//a=1.30

