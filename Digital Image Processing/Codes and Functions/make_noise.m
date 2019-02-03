function [X_c,Y_c] = make_noise( N,M,n_noise )
% (x,y) noisy points in vextors X_c and Y_c
X_c=zeros(1,n_noise);  % coordinates (x)
Y_c=zeros(1,n_noise);  % ordinates (y)

NN=(N-4)*(M-4);
X1=unidrnd(NN,1,n_noise);
X_c=mod(X1,N-4);
Y_c=(X1-X_c)/(N-4);
X_c=X_c+2; Y_c=Y_c+2;


end

