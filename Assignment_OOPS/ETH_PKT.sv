//
//APB Example
//a. Declare APB transaction
//i. Declare addr(8 bit), data(16 bit), wr_rd(l bit)
//ii. Understand why valid and ready are not declared in
//transaction class.
//iii. Implement print, copy and compare methods
//iv. Write a constraint to generate 4-byte boundary aligned
//address.
//1. Try 8-byte boundary aligned address
//b. Instantiate apb_tx in module top
//i. Allocate memory, randomize and print
//c. Define an array of apb_tx class, size of array is 5
//i. Allocate memory, randomize all object of array
//d. Define another array of apb—tx class, size of array is 5
//i. Use copy method above to copy ISt array object to 2nd
//array
//ii. Use compare method to compare the objects of both
//the arrays.



// APB Transaction class
class apb_tx;
  rand bit [7:0]  addr;
  rand bit [15:0] data;
  rand bit        wr_rd;   // 1 = WRITE, 0 = READ
  
  function new();
  endfunction
  
  function void print(input string str="APB_TRANSACTION");
    $display("---------- %0s ----------", str);
    $display("addr = %p", addr);
    $display("data = %0d", data);
    $display("wr_rd = %s (%0d)", (this.wr_rd==1) ? "WRITE" : "READ", this.wr_rd);
  endfunction
  
  function apb_tx copy();
    apb_tx new_tx = new();
    new_tx.addr  = this.addr;
    new_tx.data  = this.data;
    new_tx.wr_rd = this.wr_rd;
    return new_tx;
  endfunction
  
  function bit compare(apb_tx compare_tx);
    bit match;
    if (this.addr == compare_tx.addr &&
        this.data == compare_tx.data &&
        this.wr_rd == compare_tx.wr_rd)
      match = 1;
    else
      match = 0;
    return match;
  endfunction
  
  constraint a_c {
    addr % 4 == 0;   // address must be 4-byte aligned
  }
  
endclass : apb_tx

module top;
  apb_tx my_tx;
  apb_tx new_tx, copy_tx;
  apb_tx array1[5];
  apb_tx array2[5];
  int i;               
  bit all_match;       

  initial begin
    // ---------------- Single object test ----------------
    my_tx = new(); 
    if (my_tx.randomize()) begin
      $display("\n*** Single Transaction Test ***");
      my_tx.print("Randomized Single APB TX");
    end else begin
      $display("Randomization FAILED for my_tx!");
    end
    
    new_tx = new();
    if (new_tx.randomize())
      new_tx.print("Original Transaction");
      
    copy_tx = new_tx.copy();
    copy_tx.print("Copied Transaction");
    
    if (new_tx.compare(copy_tx))
      $display("Transactions MATCH");
    else
      $display("Transactions DO NOT MATCH");
    
    // ---------------- Array1 randomization ----------------
    $display("\n*** Array1 Transactions ***");
    for (i = 0; i < 5; i++) begin
      array1[i] = new();
      if (array1[i].randomize()) begin
        $display("--- TX Array1, Index %0d ---", i);
        array1[i].print($sformatf("Object %0d (Array1)", i));
      end else begin
        $display("Randomization FAILED for array1[%0d]!", i);
      end
    end
    
    // ---------------- Array2 copy ----------------
    $display("\n*** Array2 (Copied from Array1) ***");
    for (i = 0; i < 5; i++) begin
      array2[i] = array1[i].copy();
      $display("--- TX Array2, Index %0d ---", i);
      array2[i].print($sformatf("Object %0d (Array2)", i));
    end
        
    // ---------------- Compare ----------------
    $display("\n*** Array Comparison ***");
    all_match = 1;
    for (i = 0; i < 5; i++) begin
      if (array1[i].compare(array2[i])) begin
        $display("Compare PASS: array1[%0d] == array2[%0d]", i, i);
      end else begin
        $display("Compare FAIL: array1[%0d] != array2[%0d]", i, i);
        all_match = 0;
      end
    end

    if (all_match)
      $display("All transactions MATCH!");
    else
      $display("Some transactions DID NOT match!");
  end
endmodule : top



