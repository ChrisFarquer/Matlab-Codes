function c = chorus(x,a11,a22,a33,R,omega,fs)
c=zeros(size(x)); 
a1=R-5;
b1=R+5;
r1=(b1-a1).*rand+a1;
a2=R-10;
b2=R+10;
r2=(b2-a2).*rand+a2;
a3=R-15;
b3=R+15;
r3=(b3-a3).*rand+a3;
% filter the signal 
max_length = length(x);
for i=1:max_length   
   delay1 = R/2*r1;
   delay1_ceiling = ceil(delay1);
   
   delay2 = R/2*r2;
   delay2_ceiling = ceil(delay2);
   
   delay3 = R/2*r3;
   delay3_ceiling = ceil(delay3);
   
   c(i) = x(i);
   if (delay1 <= (i - 1) && delay2 <= (i - 1) && delay3 <= (i - 1))
      %Use linear interpolation
      c(i) = c(i)+a11*( x(i-delay1_ceiling) + (x(i-delay1_ceiling+1) - x(i-delay1_ceiling))*(delay1_ceiling - delay1))+...
                a22*( x(i-delay2_ceiling) + (x(i-delay2_ceiling+1) - x(i-delay2_ceiling))*(delay2_ceiling - delay2))+...
                a33*( x(i-delay3_ceiling) + (x(i-delay3_ceiling+1) - x(i-delay3_ceiling))*(delay3_ceiling - delay3));
   end 
end

