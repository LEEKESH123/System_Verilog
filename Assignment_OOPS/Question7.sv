// 7. Define module top:
// a. instantiate eth_pkt in top.
// b. Declare some of properties as local/protected, try to access
// these in top module initial block
// c. Write code to set a value to the property in module
// i. ex: pkt.len = 100; len is local
// d. Write code to print local property using $display
// i. This results in compile error
// ii. Notice that same len variable cane be updated or
// displayed inside the class.
// iii. Any other property (not declared local, protected) can
// be access in module, and also display it in top module.
// e. Declare function print as local/protected
// i. Once declared as local, it can be called from module.
// f. Derive eth_new_pkt by extending eth—pkt
// i. Override print method. Write code to print len field of

// base class(eth_Pkt) using this.len
// ii. Try above once by declaring len as local, next by
// declaring protected
// 1. When declared local, it will result in error
// 2. When declared protected, it will work


class eth_pkt;
    static int count = 0;
    
    // 'local' access: Only visible/accessible inside this class (eth_pkt)
    local bit[47:0] data; 
    
    // 'protected' access: Visible inside this class AND any derived/extended classes
    protected rand int unsigned len;
    
    rand bit[31:0] da;
    rand bit[31:0] sa;
    rand byte payload [];
    bit [31:0]crc32;
    bit [15:0]crc16;
    
    local function void print(input string name="ETH_PKT");
        $display("--- %0s ---", name);
        $display("  count: %0d", count);
        $display("  DA: 'h%0h, SA: 'h%0h", da, sa);
        $display("  len (Local/Protected): %0d", this.len); 
        $display("  data (Local): 'h%0h", this.data);
        $display("  CRC16: 'h%0h", crc16);
    endfunction
    
    function void post_randomize();
        this.crc16 = 16'h1234;
        this.crc32 = da[31:0] ^ sa[31:0] ^ len;
    endfunction
    
    function void display_pkt(string caller_name);
        this.print(caller_name);
    endfunction

    function new();
        count++;
    endfunction
    
    constraint p_c {
        len inside {[10:20]}; 
        payload.size() == len; 
    }
endclass : eth_pkt

class eth_new_pkt extends eth_pkt;
    
    // Must declare as public/protected to override the base class protected method
    protected function void print(input string name="ETH_NEW_PKT");
        $display("Printing from DERIVED Class: %0s", name);

      $display("Derived: Accessing base class 'len' (protected): %0d", this.len);
        
        // $display("Derived: Accessing base class 'data' (local): 'h%0h", this.data);
        //super.print($sformatf("Base Data (Called by %s)", name));
    endfunction
endclass


module top;
    eth_pkt pkt;
    
    initial begin
        pkt = new();

        if (!pkt.randomize()) $fatal(1, "Randomization failed");

        $display("Top: Accessing Public property 'da': 'h%0h", pkt.da); 
        pkt.da = 32'hFEEDFACE; 
        $display("Top: Updated Public property 'da': 'h%0h", pkt.da);

        
        // pkt.len = 100; //COMPILE ERROR: Cannot access protected property 'len'
        
        // $display("Top: Accessing Protected property 'len': %0d", pkt.len); //COMPILE ERROR
        
        // pkt.data = 48'hFFFF; // COMPILE ERROR: Cannot access local property 'data'

        pkt.display_pkt("Top Module via Public Method"); 

        
        // pkt.print("Direct Call from Top"); // COMPILE ERROR: Cannot access local function 'print'
    end
endmodule : top
