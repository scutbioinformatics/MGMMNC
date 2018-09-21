function [ Data1,Data2,Data3,TX12,TX13,TX23 ] = Generate_dataset( n,nF1,nF2,nF3,rate,noise1,noise2,noise3,param)
%GENERATE_DATASET 此处显示有关此函数的摘要
%   此处显示详细说明
%% Extract all variables from Data
strNames = fieldnames(param);
for i = 1:length(strNames), eval([strNames{i} '= param.' strNames{i} ';']); end
Data1=zeros(n,nF1);
Data2=zeros(n,nF2);
Data3=zeros(n,nF3);

for i=1:25
    k1=ceil(rate*60);
    rand_value1=randperm(60);
    Data1(i,rand_value1(1:k1))=1;
    Data1(i,rand_value1(k1+1:60))=0;
    k2=ceil(rate*60);
    rand_value2=randperm(60);
    Data2(i,rand_value2(1:k2))=1;
    Data2(i,rand_value2(k2+1:60))=0;
    k3=ceil(rate*50);
    rand_value3=randperm(50);    
    Data3(i,rand_value3(1:k3)+30)=1;
    Data3(i,rand_value3(k3+1:50)+30)=0;
end
for j=35:50
    k1=ceil(rate*60);
    rand_value1=randperm(60);    
    Data1(j,rand_value1(1:k1)+60)=1;
    Data1(j,rand_value1(k1+1:60)+60)=0;
    k2=ceil(rate*40);
    rand_value2=randperm(40);  
    Data2(j,rand_value2(1:k2)+60)=1;
    Data2(j,rand_value2(k2+1:40)+60)=0;
    k3=ceil(rate*30);
    rand_value3=randperm(30);  
    Data3(j,rand_value3(1:k3))=1;
    Data3(j,rand_value3(k3+1:30))=0;
end
Data11=Data1;
Data22=Data2;
Data33=Data3;

sigma1=noise1;
sigma2=noise2;
sigma3=noise3;
Data1=Data1+normrnd(0,sigma1,n,nF1);
Data2=Data2+normrnd(0,sigma2,n,nF2);
Data3=Data3+normrnd(0,sigma3,n,nF3);

temp_Data1=mapminmax(Data1',0,1);
temp_Data2=mapminmax(Data2',0,1);
temp_Data3=mapminmax(Data3',0,1);
Data1=temp_Data1';
Data2=temp_Data2';
Data3=temp_Data3';

TX12=zeros(nF1,nF2);
TX13=zeros(nF1,nF3);
TX23=zeros(nF2,nF3);
TX12(1:60,1:60)=1;
TX12(61:120,61:100)=1;
TX13(1:60,31:80)=1;
TX13(61:120,1:30)=1;
TX23(1:60,31:80)=1;
TX23(61:100,1:30)=1;
plot_original_data( Data11,Data22,Data33,Data1,Data2,Data3,param);
end

