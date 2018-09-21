function Y = SVT(X,lambda)
lambda = max(lambda,0);
[U,W,V] = svd(X,'econ');
VT = V';
w = diag(W);
index = find(w>lambda);
W = diag(w(index)-lambda);
Y = U(:,index)*W*VT(index,:);
end

