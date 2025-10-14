module tb;
	reg clk,valid,ready;

	always #5 clk=~clk;
	initial begin
		clk=0;
		valid=0;
		ready=0;
		#20;
		valid=1;
		#70;
		ready=1;
	end
	initial begin
		#200;
		$finish;
	end

	initial begin
		forever begin
			@(posedge clk);
			if(valid==1) begin
				fork
					begin
						@(posedge clk);
						wait(ready==1);
						$display("%0t: ready is happened",$time);
					end

					begin
						repeat(5) @(posedge clk);
						$display("%0t: ready is not happened",$time);
					end
				join_any
				disable fork;
			end
	    end
	end
	initial begin
		$dumpfile("tb.vcd");
		$dumpvars;
	end
endmodule







