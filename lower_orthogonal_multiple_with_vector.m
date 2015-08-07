function [ outcome] = lower_orthogonal_multiple_with_vector( u,vector );
%LOWER_ORTHOGONAL_MULTIPLE_WITH_VECTOR Summary of this function goes here
%   Detailed explanation goes here
%U_perp^T*vector%
u_up=u(1:length(u)-1);
u_low=u(length(u));

a=1/(1+abs(u_low))
b=((u_low~=0)*(sign(u_low))+(u_low==0))

assert(b==1||b==-1)


end
