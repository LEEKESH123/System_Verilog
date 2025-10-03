class eth_bfm;
  eth_pkt pkt;
  eth_good_pkt g_pkt;
  eth_bad_pkt b_pkt;
  eth_ill_pkt i_pkt;
  
  task run();
    repeat(10) begin 
     gen2bfm.get(pkt); 
      
        case(pkt.p_t.name())
        "GOOD" : begin
          $cast(g_pkt,pkt); 
          g_pkt.print("BFM_GOOD_PRINTS");
        end
        
        "BAD" : begin 
          $cast(b_pkt,pkt);
          b_pkt.print("BFM_BAD_PRINTS");
        end
        
        "ILL" : begin
          $cast(i_pkt,pkt);
          i_pkt.print("BFM_ILL_PRINTS");
        end
      endcase
    end
    $display("------------------- BFM DONE -------------------");
  endtask
endclass
