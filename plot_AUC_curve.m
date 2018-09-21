function plot_AUC_curve( x,AUC12,AUC13,AUC23,param )
%PLOT_AUC_CURVE 此处显示有关此函数的摘要
%   此处显示详细说明
%% Extract all variables from Data
strNames = fieldnames(param);
for i = 1:length(strNames), eval([strNames{i} '= param.' strNames{i} ';']); end
%%
figure(1)
plot(x,AUC12(1,:),'b-s',x,AUC12(2,:),'k-<');
xlabel(P1); ylabel('AUC')
legend('MGMMNC','MGM');
axis([min(x),max(x),0.4,1]);
str=[file_path,'X12_AUC.fig'];
saveas(gcf,str,'fig');

figure(2)
plot(x,AUC13(1,:),'b-s',x,AUC13(2,:),'k-<');
xlabel(P1); ylabel('AUC')
legend('MGMMNC','MGM');
axis([min(x),max(x),0.4,1]);
str=[file_path,'X13_AUC.fig'];
saveas(gcf,str,'fig');

figure(3)
plot(x,AUC23(1,:),'b-s',x,AUC23(2,:),'k-<');
xlabel(P1); ylabel('AUC')
legend('MGMMNC','MGM');
axis([min(x),max(x),0.4,1]);
str=[file_path,'X23_AUC.fig'];
saveas(gcf,str,'fig');
close all
end

