function [ H12,H13,H23 ] = Generate_associated_matrixH_P( Data1,Data2,Data3,W1,W2,W3 )

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
% Using the graph-smoothing similarity measurement
Data1=(1-gamma)*Data1*W1+gamma*Data1;
Data2=(1-gamma)*Data2*W2+gamma*Data2;
Data3=(1-gamma)*Data3*W3+gamma*Data3;

H12 = zeros(nF1, nF2);
for i = 1 : nF1
	for j = 1 : nF2
		H12(i, j) = calculateDis(Data1(:, i), Data2(:, j));
	end
end

H13 = zeros(nF1, nF3);
for i = 1 : nF1
	for j = 1 : nF3
		H13(i, j) = calculateDis(Data1(:, i), Data3(:, j));
	end
end

H23 = zeros(nF2, nF3);
for i = 1 : nF2
	for j = 1 : nF3
		H23(i, j) = calculateDis(Data2(:, i), Data3(:, j));
	end
end
end
%% Pearson correlation coefficient
function dis = calculateDis(vec1, vec2)
v1 =vec1 - mean(vec1);
v2 =vec2 - mean(vec2);
dis = abs( v1'*v2 / (sqrt(v1' * v1) * sqrt(v2' * v2)) );
end
