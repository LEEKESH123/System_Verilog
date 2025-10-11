module tb;
	string str;
	int a;
	int arr[10];
	bit exist_f;
	initial begin
		for(int i=0;i<10;) begin	
			a=$urandom_range(65,92);
			exist_f=0;
			for(int j=0;j<i;j++) begin
				if(arr[j]==a) begin
					exist_f=1;
					j=i;
				end
			end
			if(exist_f==0) begin
				arr[i]=a;
				str=string'(arr[i]);
				$display("str=%0s",str);
				i++;
			end
		end
	end
endmodule



