% call: group.m
% cyclic group function

function [ Tps ] = group (p,s,N )

Tps=zeros(N,2);
  p1=0; s1=0;
  for k=0:N-1
      Tps(k+1,:)=[p1,s1];
      p1=p1+p; 
      if p1>=N p1=p1-N; end
      s1=s1+s;
      if s1>=N s1=s1-N; end

end

