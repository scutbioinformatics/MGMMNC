function plot_ROC_curve(TX12,TX13,TX23,X12,X13,X23,X12_no,X13_no,X23_no,param)
%PLOT_ROC_CURVE 此处显示有关此函数的摘要
%   此处显示详细说明
%% Extract all variables from Data
strNames = fieldnames(param);
for i = 1:length(strNames), eval([strNames{i} '= param.' strNames{i} ';']); end
%%
figure(1)
imagesc(TX12,[0,1])
str=[file_path,num2str(P1),'_TX12.eps'];
print(gcf, '-depsc2', '-loose', str);
imagesc(TX13,[0,1])
str=[file_path,num2str(P1),'_TX13.eps'];
print(gcf, '-depsc2', '-loose', str);
imagesc(TX23,[0,1])
str=[file_path,num2str(P1),'_TX23.eps'];
print(gcf, '-depsc2', '-loose', str);

imagesc(X12,[0,1])
str=[file_path,num2str(P1),'_X12.eps'];
print(gcf, '-depsc2', '-loose', str);
imagesc(X13,[0,1])
str=[file_path,num2str(P1),'_X13.eps'];
print(gcf, '-depsc2', '-loose', str);
imagesc(X23,[0,1])
str=[file_path,num2str(P1),'_X23.eps'];
print(gcf, '-depsc2', '-loose', str);

imagesc(X12_no,[0,1])
str=[file_path,num2str(P1),'_X12_no.eps'];
print(gcf, '-depsc2', '-loose', str);
imagesc(X13_no,[0,1])
str=[file_path,num2str(P1),'_X13_no.eps'];
print(gcf, '-depsc2', '-loose', str);
imagesc(X23_no,[0,1])
str=[file_path,num2str(P1),'_X23_no.eps'];
print(gcf, '-depsc2', '-loose', str);

figure(2)
[FPR12_our, TPR12_our]=perfcurve(TX12(:),X12(:), '1');
[FPR12_no, TPR12_no]=perfcurve(TX12(:),X12_no(:), '1');

[FPR12_our,TPR12_our]=plot_my_roc(FPR12_our,TPR12_our);
[FPR12_no, TPR12_no]=plot_my_roc(FPR12_no, TPR12_no);

plot(FPR12_our,TPR12_our,'b-s',FPR12_no, TPR12_no,'k-<');
xlabel('FPR'); ylabel('TPR')
legend('MGMMNC','MGM');
str=[file_path,num2str(P1),'_X12_ROC.fig'];
saveas(gcf,str,'fig');

figure(3)
[FPR13_our, TPR13_our]=perfcurve(TX13(:),X13(:), '1');
[FPR13_no, TPR13_no]=perfcurve(TX13(:),X13_no(:), '1');

[FPR13_our,TPR13_our]=plot_my_roc(FPR13_our,TPR13_our);
[FPR13_no, TPR13_no]=plot_my_roc(FPR13_no, TPR13_no);

plot(FPR13_our,TPR13_our,'b-s',FPR13_no, TPR13_no,'k-<');
xlabel('FPR'); ylabel('TPR')
legend('MGMMNC','MGM');
str=[file_path,num2str(P1),'_X13_ROC.fig'];
saveas(gcf,str,'fig');

figure(4)
[FPR23_our, TPR23_our]=perfcurve(TX23(:),X23(:), '1');
[FPR23_no, TPR23_no]=perfcurve(TX23(:),X23_no(:), '1');

[FPR23_our,TPR23_our]=plot_my_roc(FPR23_our,TPR23_our);
[FPR23_no, TPR23_no]=plot_my_roc(FPR23_no, TPR23_no);

plot(FPR23_our,TPR23_our,'b-s',FPR23_no, TPR23_no);
xlabel('FPR'); ylabel('TPR')
legend('MGMMNC','MGM');
str=[file_path,num2str(P1),'_X23_ROC.fig'];
saveas(gcf,str,'fig');
close all
end

