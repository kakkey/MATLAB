function [ outcome ] = extend_vector( u,x );
%RAISE_ORTHOGONAL_MULTIPLE_WITH_VECTOR Summary of this function goes here
%   Detailed explanation goes here
N=length(u);
u_up=u(1:N-1);
u_low=u(N);
outcome = zeros(N,1);

%{
U=zeros(N,N-1);
U(1:N-1,:)=(eye(N-1) - (1/(1+abs(u_low)))* u_up * u_up' );
U(N,:) = -sign(u_low)*u_up';

outcome = U*x;
%}

a=1/(1+abs(u_low));
b=((u_low~=0)*(sign(u_low))+(u_low==0));

k=u_up'*x;
outcome(1:N-1) = x-(a*k)*u_up;
outcome(N) = -b*k;


end

