function [data_sequence] = Gendata(num_of_datas)
%GENDATA Summary of this function goes here
%   Detailed explanation goes here
%%make datasequence from subspace
Dimension = 100;
rank_of_subspace = 5;

U=rand(Dimension,rank_of_subspace);
normalized_U = U./sqrt(repmat(sum(U.^2,1),Dimension,1))

coordinate=rand(rank_of_subspace,num_of_datas); %keisuuco

data_sequence=normalized_U*coordinate;


%{
correlation_matrix=zeros(Dimension,Dimension);

for k=1:num_of_datas
correlation_matrix = correlation_matrix + data_sequence(:,k)*data_sequence(:,k)';
end
correration_matrix=correlation_matrix/num_of_datas;
%}

%コメント追加～～～～～
end

