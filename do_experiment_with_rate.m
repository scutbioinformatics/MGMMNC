function  do_experiment_with_rate( Data )
%% Extract all variables from Data
strNames = fieldnames(Data);
for i = 1:length(strNames), eval([strNames{i} '= Data.' strNames{i} ';']); end
%%
flag=0;
index=1;
iter=10;
x=zeros(1,5);
AUC12=zeros(2,5);
AUC13=zeros(2,5);
AUC23=zeros(2,5);
mkdir(filePath);
file_path=[filePath,'\'];
param.file_path=file_path;
for j=0.3:0.05:1
    frequency=j;
    param.P1=j;   
    sum_AUC12_our=0;
    sum_AUC12_no=0;
    sum_AUC13_our=0;
    sum_AUC13_no=0;
    sum_AUC23_our=0;
    sum_AUC23_no=0;
    for i=1:iter
        %produce dataset, associated matrix and prior network
        [ Data1,Data2,Data3,TX12,TX13,TX23 ] = Generate_dataset( n,nF1,nF2,nF3,frequency,sigma1,sigma2,sigma3,param);
        if flag==0
            [ L1,L2,L3,indPM1,indPM2,indPM3 ] = Generate_laplacian_networks( nF1,nF2,nF3,ratio);
            flag=1;
        end
        [ H12,H13,H23 ] = Generate_associated_matrixH_D( Data1,Data2,Data3,indPM1,indPM2,indPM3);
        %run MGMMNC
        [ X12,X13,X23 ] = MGMMNC(H12,H13,H23,L1,L2,L3,Alpha,Beta,Lambda,Mu);
        [ X12_no,X13_no,X23_no ] = MGMMNC(H12,H13,H23,L1,L2,L3,Alpha,Beta,0,Mu);
        
        %obtain value of AUC   
        [FPR12_our, TPR12_our, T12_our, AUC12_our]=perfcurve(TX12(:),X12(:), '1');
        [FPR12_no, TPR12_no, T12_no, AUC12_no]=perfcurve(TX12(:),X12_no(:), '1');        
        sum_AUC12_our=sum_AUC12_our+AUC12_our;
        sum_AUC12_no=sum_AUC12_no+AUC12_no;
        
        [FPR13_our, TPR13_our, T13_our, AUC13_our]=perfcurve(TX13(:),X13(:), '1');
        [FPR13_no, TPR13_no, T13_no, AUC13_no]=perfcurve(TX13(:),X13_no(:), '1');
        sum_AUC13_our=sum_AUC13_our+AUC13_our;
        sum_AUC13_no=sum_AUC13_no+AUC13_no;

        [FPR23_our, TPR23_our, T23_our, AUC23_our]=perfcurve(TX23(:),X23(:), '1');
        [FPR23_no, TPR23_no, T23_no, AUC23_no]=perfcurve(TX23(:),X23_no(:), '1');
        sum_AUC23_our=sum_AUC23_our+AUC23_our;
        sum_AUC23_no=sum_AUC23_no+AUC23_no;
    end
    x(index)=j;
    AUC12(1,index)=sum_AUC12_our/iter;
    AUC12(2,index)=sum_AUC12_no/iter;
    
    AUC13(1,index)=sum_AUC13_our/iter;
    AUC13(2,index)=sum_AUC13_no/iter;
    
    AUC23(1,index)=sum_AUC23_our/iter;
    AUC23(2,index)=sum_AUC23_no/iter;
    index=index+1;
    plot_ROC_curve(TX12,TX13,TX23,X12,X13,X23,X12_no,X13_no,X23_no,param);
end
save([file_path,'x_index.mat'],'x');
save([file_path,'AUC12.mat'],'AUC12');
save([file_path,'AUC13.mat'],'AUC13');
save([file_path,'AUC23.mat'],'AUC23');
%% display results
%display AUC curve
param.P1='missing value rate';
AUC12_1=zeros(2,15);
AUC13_1=zeros(2,15);
AUC23_1=zeros(2,15);
x_1=zeros(1,15);
for i=1:15
    AUC12_1(:,i)=AUC12(:,16-i);
    AUC13_1(:,i)=AUC13(:,16-i);
    AUC23_1(:,i)=AUC23(:,16-i);
    x_1(i)=1-x(16-i);
end
plot_AUC_curve( x_1,AUC12_1,AUC13_1,AUC23_1,param);
end



