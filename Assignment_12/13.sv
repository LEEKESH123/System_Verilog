//13. Write constraints for following
//a. int intD[];
//b. intDA each element can be either 2,4,8,16
//c. intDA each element must be bigger than 2*i (i is index of the
//element in the array)

class sample;
  rand int intDA[];

  constraint size_c {
    intDA.size inside {[6:8]};
  }

  constraint val_c {
    foreach(intDA[i]) {
      intDA[i] inside {2,4,8,16};
      intDA[i] > (2*i);
    }
  }

  function void print();
    $display("intDA = %p (size = %0d)", intDA, intDA.size());
  endfunction
endclass


module tb;
  sample s;
  initial begin
    s = new();
    if (!s.randomize())
      $display("Randomization failed!");
    else
      s.print();
  end
endmodule

//# intDA = '{2, 16, 16, 8, 16, 16} (size = 6)
