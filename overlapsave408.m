close All
clear All
clc
x=input('x=');
h=input('h=');
L=input('L=');
N1=length(x);
M=length(h);
lc=conv(x,h)
x=[x zeros(1,mod(-N1,L)) zeros(1,L)];
N2=length(x);
h=[h zeros(1,L-1)];
H=fft(h,L+M-1);
S=N2/L;
index=1:L;
xm=x(index); % For first stage Special Case
x1=[zeros(1,M-1) xm]; %zeros appeded at Start point
X=[];
for stage=1:S
    X1=fft(x1,L+M-1);
    Y=X1.*H;
    Y=ifft(Y);
    index2=M:M+L-1;
    Y=Y(index2); %Discarding Samples
    X=[X Y];
    index3=(((stage)*L)-M+2):((stage+1)*L); % Selecting Sequence to process
    if(index3(L+M-1)<=N2)
        x1=x(index3);
    end
end
i=1:N1+M-1;
X=X(i)
similarity=corrcoef(X,lc); % Similarity between Inbuilt and Calculated conv
figure()
subplot(2,1,1)
stem(lc);
title('Convolution Using conv() function')
xlabel('n');
ylabel('y(n)');
subplot(2,1,2);
stem(X);
title('Convolution Using Overlap Save Method');
xlabel('n');
ylabel('y(n)');
