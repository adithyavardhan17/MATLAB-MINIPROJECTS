%calculating the N point DFT AND IDFT of a given sequence
clc;
clear all;
close all;
x=input('enter the sequence x(n)');
N=length(x);
%initializing the output variable to zero
Xk=zeros(1,N);
xn=zeros(1,N);
%N point DFT of the x(n)=X(k)
for k=0:N-1
    for n=0:N-1
        Xk(k+1)=Xk(k+1)+(x(n+1)*exp(-j*2*pi*n*k/N));
    end
end
disp('the N-point DFT of the sequence x(n) is X(k)');
disp(Xk);
%plot the given sequence x(n)
n=0:N-1;
subplot(3,1,1);
stem(n,x);
xlabel('time----->n');
ylabel('amplitute');
title('the given sequence x(n)');
%DFT of the x(n) is X(k)
k=0:N-1; 
magnitude=abs(Xk);
subplot(3,1,2);
stem(k,magnitude);
xlabel('frequency ---->k');
ylabel('amplitude');
title('DFT of the given sequence x(n)');

%IDFT of the sequence X(k)=x(n)
for n=0:N-1
    for k=0:N-1
        xn(n+1)=xn(n+1)+(Xk(k+1)*exp(j*2*pi*n*k/N));
    end
end
xn=xn/N;
disp('the IDFT of the sequence X(K) IS x(n)=');
disp(xn);
%IDFT of the sequence X(k) is x(n)
n=0:N-1;
subplot(3,1,3);
stem(n,xn);
xlabel('time ----->n');
ylabel('amplitude');
title('IDFT of the sequence X(k) is x(n)');