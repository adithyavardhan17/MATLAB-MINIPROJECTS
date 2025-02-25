close All
clear All
clc
x=input('x='); 
h=input('h=');
L=input('l=');
N1=length(x);
M=length(h);
lc=conv(x,h)
x=[x zeros(1,mod(-N1,L))];
N2=length(x);
h=[h zeros(1,L-1)];
H=fft(h,L+M-1);
S=N2/L;
index=1:L;
X=[zeros(M-1)];
for stage=1:S
    xm=[x(index) zeros(1,M-1)]; % Selecting sequence to process
    X1=fft(xm,L+M-1);
    Y=X1.*H;
    Y=ifft(Y);
    Z=X((length(X)-M+2):length(X))+Y(1:M-1); %Samples Added in every stage
    X=[X(1:(stage-1)*L) Z Y(M:M+L-1)];
    index=stage*L+1:(stage+1)*L;
end
i=1:N1+M-1;
X=X(i)
similarity=corrcoef(X,lc) % Similarity b/w Inbuilt and Calculated one
figure()
subplot(2,1,1)
stem(lc);
title('Convolution Using conv() function')
xlabel('n');
ylabel('y(n)');
subplot(2,1,2)
stem(X);
disp(X);
title('Convolution Using Overlap Add Method')
xlabel('n');
ylabel('y(n)');
    
