function [ outcome ] = shrink_correlation_matrix( u,X );
%SHRINK_CORRELATION_MATRIX Summary of this function goes here
%   Detailed explanation goes here
N=length(u);
u_up=u(1:N-1);
u_low=u(N);
outcome = zeros(N-1,N-1);

%{
U=zeros(N,N-1);
U(1:N-1,:)=(eye(N-1) - (1/(1+abs(u_low)))* u_up * u_up' );
U(N,:) = -sign(u_low)*u_up';

outcome = U'*X*U;
%}



a=1/(1+abs(u_low));
b=((u_low~=0)*(sign(u_low))+(u_low==0));



X_N1 = X(1:N-1,1:N-1);
x_v = X(1:N-1,N);
x_nn =X(N,N);

k1 = x_v'*u_up;
k2 = X_N1*u_up; %1*N-1 vector  O(N^2)

tmp1 = (-a*k2-b*x_v)*u_up'; % O(N^2)
tmp1 = tmp1+tmp1';

%outcome = X_N1 + tmp1 + ( ( a*a*(u_up'*k2) + b*b*x_nn + a*b*k1*2 ) * u_up) * u_up'; %O(N^2)



end

