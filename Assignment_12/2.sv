class sample;
	
	rand int que[$];
	rand int size;
	static int valid_vals[$];

	static function void built_valid_list();
      int val;
	 if(valid_vals.size() == 0) begin
       valid_vals.push_back(2);
	    val = 4;
       repeat(19) begin
		valid_vals.push_back(val);
		val= val << 1;
		end
	end

	endfunction

  function new();
      built_valid_list();
	endfunction

	constraint size_c{
	  size inside {[6:12]};
      que.size() == size;
	}

	constraint value_c {
		foreach(que[i]) 
		que[i] inside {valid_vals};

      foreach(que[i])
        foreach(que[j])
			if(i != j)
              que[i] != que[j];
      que.size() >= 1;
      que[0] == 2;
      
	}
  
  function void print();
    if (que.size() > 1) begin
      int temp[$] = que[1:$];
      temp.sort();

      que = {que[0], temp};
    end
    $display("que (size = %0d) = %p", que.size(), que);
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


//# que (size = 10) = '{2, 4, 16, 32, 128, 512, 32768, 65536, 262144, 1048576}
//# que (size = 8) = '{2, 8, 16, 256, 1024, 2048, 4096, 32768}
//# que (size = 12) = '{2, 4, 8, 64, 256, 512, 1024, 2048, 16384, 65536, 262144, 1048576}
//# que (size = 11) = '{2, 4, 128, 256, 512, 2048, 4096, 8192, 16384, 32768, 1048576}
//# que (size = 11) = '{2, 4, 64, 128, 256, 512, 4096, 8192, 16384, 32768, 262144}
//
