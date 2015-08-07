function [ outcome] = shrink_vector( u,x );
%LOWER_ORTHOGONAL_MULTIPLE_WITH_VECTOR Summary of this function goes here
%   Detailed explanation goes here
%U_perp^H*vector%
N=length(u);
u_up=u(1:N-1);
u_low=u(N);
x_up = x(1:N-1);
x_low=x(N);

%{
U=zeros(length(u),length(u)-1);
U(1:length(u)-1,:)=(eye(length(u)-1) - (1/(1+abs(u_low)))* u_up * u_up' );
U(length(u),:) = -sign(u_low)*u_up';

outcome = U'*x;
%}
a=1/(1+abs(u_low));
b=((u_low~=0)*(sign(u_low))+(u_low==0));

outcome = x_up-(u_up*(a*(u_up'*x_up))) - u_up*(b*x_low);


end
