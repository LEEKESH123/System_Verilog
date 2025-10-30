class sample;
  rand int que[$];
  rand int size;

  
  constraint size_c {
    size inside {[10:16]};
    size % 2 == 0;
    que.size() == size;
  }
  
  constraint value_c{
    foreach(que[i]) {
      que[i] inside {[1:20]};
      if(i %2 == 0)
        que[i] % 2 == 1;
      else
        que[i] % 2 == 0;
  }
      unique{que};
  }
  
  function void print();
    que.sort();
    $display("que (size=%0d) :%p",que.size(),que);
  endfunction
endclass

module tb;
	sample s;
   initial begin
     s = new();
     repeat(5) begin
       if(!s.randomize())
         $display("Randomization failed!");
       else
         s.print();
     end

end
endmodule

//# que (size=10) :'{2, 3, 5, 10, 12, 13, 14, 15, 19, 20}
//# que (size=12) :'{3, 4, 5, 6, 9, 11, 12, 13, 16, 17, 18, 20}
//# que (size=16) :'{2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 16, 17, 18, 19, 20}
//# que (size=14) :'{3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 20}
//# que (size=14) :'{2, 4, 5, 7, 9, 10, 11, 12, 14, 15, 17, 18, 19, 20}
