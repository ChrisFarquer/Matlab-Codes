%  Call: shift1D_LL.m
%  To shift by LL to right, to correct output

function  out1=shift1D_LL(out,N1,LL);

        out1=zeros(1,N1);
        for j=1:N1
           j1=j+LL-1; if j1>N1 j1=j1-N1; end;
           out1(j1)=out(j);
        end;        
        
        
