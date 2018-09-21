function plot_original_data( Data11,Data22,Data33,Data1,Data2,Data3,param)
%% Extract all variables from Data
strNames = fieldnames(param);
for i = 1:length(strNames), eval([strNames{i} '= param.' strNames{i} ';']); end
%% Save the figure of pure data and contaminative data
figure(1)
imagesc(Data11,[0,1])
str=[file_path,num2str(P1),'_Tdata1.eps'];
print(gcf, '-depsc2', '-loose', str);
figure(2)
imagesc(Data22,[0,1])
str=[file_path,num2str(P1),'_Tdata2.eps'];
print(gcf, '-depsc2', '-loose', str);
figure(3)
imagesc(Data33,[0,1])
str=[file_path,num2str(P1),'_Tdata3.eps'];
print(gcf, '-depsc2', '-loose', str);
figure(4)
imagesc(Data1,[0,1])
str=[file_path,num2str(P1),'_data1.eps'];
print(gcf, '-depsc2', '-loose', str);
figure(5)
imagesc(Data2,[0,1])
str=[file_path,num2str(P1),'_data2.eps'];
print(gcf, '-depsc2', '-loose', str);
figure(6)
imagesc(Data3,[0,1])
str=[file_path,num2str(P1),'_data3.eps'];
print(gcf, '-depsc2', '-loose', str);
title('Data3')
close all
end

