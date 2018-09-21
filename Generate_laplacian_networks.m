function [ L1,L2,L3,W1,W2,W3 ] = Generate_laplacian_networks( nF1,nF2,nF3,percentage)

W1=zeros(nF1,nF1);
W2=zeros(nF2,nF2);
W3=zeros(nF3,nF3);

for i=1:60
    for j=i+1:60
        if rand(1)<percentage
            W1(j,i)=1;
        end
    end
end
for i=61:nF1
    for j=i+1:nF1
        if rand(1)<percentage
            W1(j,i)=1;
        end
    end
end
a1=tril(W1,-1);
W1=a1+a1';
for i=1:60
    for j=i+1:60
        if rand(1)<percentage
            W2(j,i)=1;
        end
    end
end
for i=61:nF2
    for j=i+1:nF2
        if rand(1)<percentage
            W2(j,i)=1;
        end
    end
end
a2=tril(W2,-1);
W2=a2+a2';

for i=1:30
    for j=i+1:30
        if rand(1)<percentage
            W3(j,i)=1;
        end
    end
end
for i=31:nF3
    for j=i+1:nF3
        if rand(1)<percentage
            W3(j,i)=1;
        end
    end
end
a3=tril(W3,-1);
W3=a3+a3';

diagD1 = sum(W1, 2);
D1 = sparse(nF1, nF1, 0);
for i = 1 : nF1
    D1(i, i) = diagD1(i);
end
D1(find(D1 ~= 0)) = 1./sqrt(D1(find(D1 ~= 0)));
L1 =  - D1 * W1 * D1;
for i = 1 : nF1
    L1(i, i) = (1 + 1e-10);
end

diagD2 = sum(W2, 2);
D2 = sparse(nF2, nF2, 0);
for i = 1 : nF2
    D2(i, i) = diagD2(i);
end
D2(find(D2 ~= 0)) = 1./sqrt(D2(find(D2 ~= 0)));
L2 =  - D2 * W2 * D2;
for i = 1 : nF2
    L2(i, i) = (1 + 1e-10);
end

diagD3 = sum(W3, 2);
D3 = sparse(nF3, nF3, 0);
for i = 1 : nF3
    D3(i, i) = diagD3(i);
end
D3(find(D3 ~= 0)) = 1./sqrt(D3(find(D3 ~= 0)));
L3 =  - D3 * W3 * D3;
for i = 1 : nF3
    L3(i, i) = (1 + 1e-10);
end

end

