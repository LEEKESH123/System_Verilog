class unique_rand;
  randc int a;  

  function void print();
    $display("%0d", a);
  endfunction
endclass

module tb;
  initial begin
    unique_rand obj = new();      

    for (int i=1; i<=100; i++) begin
      assert(obj.randomize() with { a inside {[1:100]}; });
      obj.print();
    end
  end
endmodule

