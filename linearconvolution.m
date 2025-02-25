%linear convolution of two sequences
clc;
clear all;
close all;
%define the input sequence
x=input('enter the first sequence x(n)');
h=input('enter the second sequence h(n)');
%define the length of sequences
p=length(x);
q=length(h);
%append the zeros;
X=[x,zeros(1,q-1)];
H=[h,zeros(1,p-1)];
%perform the linear convolution
for n=1:p+q-1
    y(n)=0;
    for k=1:p
        if(n-k+1>0)
            y(n)=y(n)+X(k)*H(n-k+1);
        end
    end
end
disp('linear convolution of two sequences is y(n) =');
disp(y);
%plot the first input sequence x(n)
subplot(3,1,1);
stem(x);
xlabel('samples--->n');
ylabel('amplitude');
title('first sequence x(n)');
%plot the second input sequence h(n)
subplot(3,1,2);
stem(h);
xlabel('samples--->n');
ylabel('amplitude');
title('second sequence h(n)');
%plot the linear convolution sequence sequence y(n)=x(n)*h(n)
subplot(3,1,3);
stem(y);
xlabel('samples--->n');
ylabel('amplitude');
title('linear convolution sequence y(n)');
