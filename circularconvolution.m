%circular convolution of two sequences
clc;
clear all;
close all;
%define the input sequence
x=input('enter the first sequence x(n)');
h=input('enter the second sequence h(n)');
%define the length of sequences
p=length(x);
q=length(h);
N=max(p,q);
%append the zeros;
X=[x,zeros(1,N-p)];
H=[h,zeros(1,N-q)];
%perform the circular convolution
for n=1:N
    y(n)=0;
    for k=1:N
        j=n-k+1;
        if(j<=0)
            j=N+j;
        end
            y(n)=y(n)+X(k)*H(j);
     end
end
disp('circular convolution of two sequences is y(n) =');
disp(y);
%plot the input sequence x(n)
subplot(3,1,1);
stem(x);
xlabel('samples--->n');
ylabel('amplitude');
title('first sequence x(n)');
%plot the second sequence h(n)
subplot(3,1,2);
stem(h);
xlabel('samples--->n');
ylabel('amplitude');
title('second sequence h(n)');
%plot the circular convolution sequence sequence 
subplot(3,1,3);
stem(y);
xlabel('samples--->n');
ylabel('amplitude');
title('circular convolution sequence y(n)');