class sample;
  rand int arr[20];
  constraint value_c{
    foreach(arr[i]) {
    arr[i] inside {[100:200]};
	}
	unique {arr};
  }
endclass

module tb;
  sample s;
  initial begin
  s=new();
  s.randomize();
  $display("arr = %0p",s.arr);
  end
endmodule

//arr = '{190, 109, 176, 155, 167, 173, 181, 143, 169, 165, 136, 174, 131, 132, 184, 106, 116, 121, 102, 104} 
