%   Call: hist_my(Y,n,m,k,color)
%   calculate the histogram of Y and drawing the curve in the subplot(n,m,k)


function H = hist_my(Y,m1,m2,k_show_histogram,S_color) 

	[N1 N2]=size(Y);
	n1=round(max(max(double(Y))))+1; 	
		
	H=zeros(1,n1+1);

	for j=1:N1
        for i=1:N2
            n=round(double(Y(j,i)))+1; 
            H(n)=H(n)+1;
        end;
	end;

   H=(H/N1)/N2;	

   if k_show_histogram~=0 
       subplot(m1,m2,k_show_histogram);	   
       xx=0:n1;    
       plot(xx,H,S_color);     
       title('Histogram');
   end
   
		
