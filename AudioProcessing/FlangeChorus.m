%flange the maximum delay value
R=1000;
%attenuations in the echo, and can be set between [-1,1]
a=0.5;
a2=-1;
a3=1;
omega=2*pi*6;
%read in file 
[x,fs,nbits] = wavread('change the name to the sound file.wav');
%seperate sound into L and R channels
size(x);
left=x(:,1);
right=x(:,2);
%plot sound
figure;
time=(1/fs)*length(left);
t=linspace(0,time,length(left));
subplot(2, 1, 1);
plot(t,left);
xlabel('time (sec)');
ylabel('signal strength-L channel')
time=(1/fs)*length(right);
t=linspace(0,time,length(right));
subplot(2, 1, 2);
plot(t,right);
xlabel('time (sec)');
ylabel('signal strength-R channel')
%play file
soundsc(x,fs);
pause(10)
%flange, plot and play
omega=2*pi*6;
y=flang(x,R,a,omega,fs);
figure;
time=(1/fs)*length(x);
t=linspace(0,time,length(x));
plot(t,y)
xlabel('time (sec)');
ylabel('flange signal strength');
soundsc(y,fs);
pause(10)
audiowrite('11.wav',y,fs);
%new chorus, plot and play
[x,fs]=wavread('1.wav');
buffer=zeros(1,1000);
y=zeros(1,length(x));
f=0.1;
startIdx=500;
sineTable=abs(sin(2*pi*f*[0:length(x)-1]/fs));
bufferIndex=round(sineTable*(length(buffer)-startIdx))+startIdx;
for i=1:length(x)
c(i)=x(i)+buffer(bufferIndex(i));
buffer(2:end)=buffer(1:end-1);
buffer(1)=x(i);
end
figure;
time=(1/fs)*length(x);
t=linspace(0,time,length(x));
plot(t,c);
soundsc(c,fs)

 
