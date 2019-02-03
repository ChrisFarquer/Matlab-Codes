% call: f_pst.m
% calculate the splitting-signal

function [image_signal] = f_pst(A,p,s)

[N,M]=size(A);
  % if M>N M=N; end
  image_signal=zeros(1,N);  
  t=0;
  for n=1:N
      for m=1:M
         %t=(n-1)*p+(m-1)*s;
         t=mod(t,N);
         a1=A(n,m);
         image_signal(t+1)=image_signal(t+1)+a1;
         t=t+s;
      end
      t=t+p;

end

