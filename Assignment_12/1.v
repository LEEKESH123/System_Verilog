class sample;
	
  rand int que1[$];
  rand int que2[$];
  
  rand int size1;
  rand int size2;
  
  function void print();
    $display("que1 (size = %0d) = %p",que1.size(),que1);
    $display("que2 (size = %0d) = %p",que2.size(),que2);

  endfunction
  
  constraint size_c {
    size1 inside {[1:10]};
    size2 inside {[1:10]};
    
    que1.size() == size1;
    que2.size() == size2;
    
  }

   constraint b_c {
     foreach(que1[i]) que1[i] inside {[50:200]};
     foreach(que2[i]) que2[i] inside {[50:200]};
     
     //for que1
     foreach (que1[i]) 
       foreach(que1[j]) 
         if(i != j)
           que1[i] != que1[j];
       
     
           
     //for que2
           foreach (que2[i]) 
             foreach(que2[j]) 
               if(i != j)
                 que2[i] != que2[j];
             
   }
endclass

module tb;
	sample s;
  
  initial begin
    s = new();
    repeat(3) begin
    if(!s.randomize())
      $display("Randomization failed!");
    else
    s.print();
    end
  end

endmodule

//# que1 (size = 6) = '{124, 199, 88, 109, 137, 182}
//# que2 (size = 5) = '{57, 179, 144, 156, 62}
//# que1 (size = 3) = '{133, 121, 145}
//# que2 (size = 10) = '{84, 139, 179, 120, 143, 113, 55, 173, 74, 152}
//# que1 (size = 7) = '{71, 138, 188, 192, 146, 68, 179}
//# que2 (size = 10) = '{167, 133, 93, 147, 53, 64, 87, 67, 102, 169}


