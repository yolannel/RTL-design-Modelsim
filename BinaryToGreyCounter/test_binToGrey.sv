`timescale 1ns/1ps
module test_binToGrey;

   reg[3:0] bin;
   reg[3:0] grey;
   binToGrey sys(bin,grey);
    
   initial begin        
        bin <= 0;   #10;
        bin <= 1;   #10;
        bin <= 2;   #10;
        bin <= 3;   #10;
        bin <= 4;   #10;
        bin <= 5;   #10;
        bin <= 6;   #10;
        bin <= 7;   #10;
        bin <= 8;   #10;
        bin <= 9;   #10;
        bin <= 10;  #10;
        bin <= 11;  #10;
        bin <= 12;  #10;
        bin <= 13;  #10;
        bin <= 14;  #10;
        bin <= 15;  #10;
        #100;   
      $stop;
   end
   initial begin //response monitor
   $monitor("binary = %b , grey = %b", bin, grey);
   end

endmodule