class eth_env;
  eth_gen gen;
  eth_bfm bfm;
  
  task run();
    gen = new();
    bfm = new();
    fork
      gen.run();
      bfm.run();
    join
   endtask
endclass
