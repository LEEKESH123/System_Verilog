class sample;
  rand int que[$];
  rand int size;
  
  constraint size_c {
    size inside {[5:15]};
    que.size() == size; 
  
  }
  
  constraint value_c {
    foreach(que[i]) {
      que[i] inside {[21:1000]};
      que[i] % 21 == 0;
      }
      unique{que};

    }
  
  function void print();
    que.sort();
    $display("que (size : %0d) : %p",que.size(),que);
  
  endfunction
  
  
endclass

module tb;
  sample s;
  initial begin
    s = new();
    if(!s.randomize())
      $display("randomization failed!");
    else
      s.print();
  end
endmodule


//# que (size : 13) : '{231, 294, 315, 336, 357, 399, 546, 588, 693, 756, 798, 882, 903}
