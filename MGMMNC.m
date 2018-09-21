function [ X12,X13,X23 ] = MGMMNC(H12,H13,H23,L1,L2,L3,alpha,beta,lambda,mu)
    %% produce H and L
    [nF1,nF2]=size(H12);
    [~,nF3]=size(H23);
    N=nF1+nF2+nF3;
    %predefined variables
    One=ones(N);
    I=eye(N);
    I11=eye(nF1,nF1);
    I22=eye(nF2,nF2);
    I33=eye(nF3,nF3);
    H=[I11,H12,H13;H12',I22,H23;H13',H23',I33];
    L = blkdiag(L1,L2,L3);
    iter=100;
    %Initialize the symmetric matrix X, Y and Q
    X=rand(N,N);
    X=abs(1/2*(X+X'));
    Y=rand(N,N);
    Y=abs(1/2*(Y+Y')); 
    Q=rand(N,N);
    Q=abs(1/2*(Q+Q'));
    for i=1:N
        X(i,i)=1;
        Y(i,i)=1;
        Q(i,i)=1;
    end
    %the main algorithm
    for i=1:iter
        Z=(H-alpha*One-Q+mu*Y)*(lambda*L+lambda*L'+mu*I)^-1;
        X=max(1/2*(Z+Z'),0);
        Y=SVT(X+(1/mu)*Q,beta/mu);
        Q=Q+mu*(X-Y);
        mu=1.05*mu;
    end
    X12=X(1:nF1,nF1+1:nF1+nF2);
    X13=X(1:nF1,nF1+nF2+1:N);
    X23=X(nF1+1:nF1+nF2,nF1+nF2+1:N);
    %standarize
    MIN12 = min(min(X12));
    MAX12 = max(max(X12));
    X12 = (X12 - MIN12) / (MAX12 - MIN12);
    MIN13 = min(min(X13));
    MAX13 = max(max(X13));
    X13 = (X13 - MIN13) / (MAX13 - MIN13);
    MIN23 = min(min(X23));
    MAX23 = max(max(X23));
    X23 = (X23 - MIN23) / (MAX23 - MIN23);
end

