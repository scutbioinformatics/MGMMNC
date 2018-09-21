
clear all; close all; clc;
disp('************************ simulated experiment ************************'); disp(' ');

%%
%size of sample
Data.n=60;
%size of gene expression, DNA methylation and miRNA
Data.nF1=120;
Data.nF2=100;
Data.nF3=80;
%sparse parameter
Data.Alpha=0.1;
%low rank parameter
Data.Beta=0.2;
%regulatory network parameter
Data.Lambda=0.1;
Data.ratio=0.3;
%penalty factor
Data.Mu=0.3;%0.3;
%deviation of data noise sigma=[1,2]
Data.sigma1=0.3;
Data.sigma2=0.7;
Data.sigma3=0.8;
%missing-value rate
Data.rate=0.3; 
%size of data1 and data2
Data.Data1=zeros(Data.n,Data.nF1);
Data.Data2=zeros(Data.n,Data.nF2);
Data.Data3=zeros(Data.n,Data.nF3);
Data.filePath='';
condition=2;% 1 represents noise experiment, 2 is the missing-value experiment
switch condition
    case 1
        Data.filePath='result_file_noise';
        Data.mark=1;
        do_experiment_with_noise(Data);
    case 2
        Data.filePath='result_file_rate';
        Data.mark=2;
        do_experiment_with_rate(Data);
    otherwise
end