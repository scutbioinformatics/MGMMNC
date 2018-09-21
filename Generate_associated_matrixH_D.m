function [ H12,H13,H23 ] = Generate_associated_matrixH_D( Data1,Data2,Data3,W1,W2,W3 )
%GENERATE_ASSOCIATED_MATRIXH 此处显示有关此函数的摘要
%   此处显示详细说明
gamma=0.4;
nF1=size(Data1,2);
nF2=size(Data2,2);
nF3=size(Data3,2);

W11=W1+eye(nF1);
W22=W2+eye(nF2);
W33=W3+eye(nF3);
for i=1:nF1
    W1(:,i)=W11(:,i)/sum(W11(:,i));
end
for i=1:nF2
    W2(:,i)=W22(:,i)/sum(W22(:,i));
end
for i=1:nF3
    W3(:,i)=W33(:,i)/sum(W33(:,i));
end

Data1=(1-gamma)*Data1*W1+gamma*Data1;
Data2=(1-gamma)*Data2*W2+gamma*Data2;
Data3=(1-gamma)*Data3*W3+gamma*Data3;

H12 = zeros(nF1, nF2);
for i = 1 : nF1
	for j = 1 : nF2
		H12(i, j) = calculateDis1(Data1(:, i), Data2(:, j));
	end
end

H13 = zeros(nF1, nF3);
for i = 1 : nF1
	for j = 1 : nF3
		H13(i, j) = calculateDis1(Data1(:, i), Data3(:, j));
	end
end

H23 = zeros(nF2, nF3);
for i = 1 : nF2
	for j = 1 : nF3
		H23(i, j) = calculateDis1(Data2(:, i), Data3(:, j));
	end
end
H12=exp(-H12);
H13=exp(-H13);
H23=exp(-H23);
end
%% Euclidean distance
function dis = calculateDis1(vec1, vec2)
dis = norm(vec1-vec2);
end
