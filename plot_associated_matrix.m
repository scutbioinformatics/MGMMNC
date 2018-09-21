function plot_associated_matrix(TX12,TX13,TX23,X12,X13,X23,X12_no,X13_no,X23_no,H12,H13,H23,...
    X12_jNMF,X13_jNMF,X23_jNMF,X12_NMNMF,X13_NMNMF,X23_NMNMF,X12_SNPLS,X13_SNPLS,X23_SNPLS)
%PLOT_ASSOCIATED_MATRIX 此处显示有关此函数的摘要
%   此处显示详细说明
figure(2)
subplot(7,3,1)
imagesc(TX12)
title('TX12')
subplot(7,3,2)
imagesc(TX13)
title('TX13')
subplot(7,3,3)
imagesc(TX23)
title('TX23')
subplot(7,3,4)
X12 = imadjust(X12);
imagesc(X12)
title('X12ours')
subplot(7,3,5)
X13 = imadjust(X13);
imagesc(X13)
title('X13ours')
subplot(7,3,6)
X23 = imadjust(X23);
imagesc(X23)
title('X23ours')
subplot(7,3,7)
X12_no = imadjust(X12_no);
imagesc(X12_no)
title('X12_no')
subplot(7,3,8)
X13_no = imadjust(X13_no);
imagesc(X13_no)
title('X12_no')
subplot(7,3,9)
X23_no = imadjust(X23_no);
imagesc(X23_no)
title('X12_no')
subplot(7,3,10)
H12 = imadjust(H12);
imagesc(H12)
title('X12euc')
subplot(7,3,11)
H13 = imadjust(H13);
imagesc(H13)
title('X13euc')
subplot(7,3,12)
H23 = imadjust(H23);
imagesc(H23)
title('X23euc')
subplot(7,3,13)
X12_jNMF = imadjust(X12_jNMF);
imagesc(X12_jNMF)
title('X12_jNMF')
subplot(7,3,14)
X13_jNMF = imadjust(X13_jNMF);
imagesc(X13_jNMF)
title('X13_jNMF')
subplot(7,3,15)
X23_jNMF = imadjust(X23_jNMF);
imagesc(X23_jNMF)
title('X23_jNMF')
subplot(7,3,16)
X12_NMNMF = imadjust(X12_NMNMF);
imagesc(X12_NMNMF)
title('X12_NMNMF')
subplot(7,3,17)
X13_NMNMF = imadjust(X13_NMNMF);
imagesc(X13_NMNMF)
title('X13_NMNMF')
subplot(7,3,18)
X23_NMNMF = imadjust(X23_NMNMF);
imagesc(X23_NMNMF)
title('X23_NMNMF')
subplot(7,3,19)
X12_SNPLS = imadjust(X12_SNPLS);
imagesc(X12_SNPLS)
title('X13_SNPLS')
subplot(7,3,20)
X13_SNPLS = imadjust(X13_SNPLS);
imagesc(X13_SNPLS)
title('X12_SNPLS')
subplot(7,3,21)
X23_SNPLS = imadjust(X23_SNPLS);
imagesc(X23_SNPLS)
title('X23_SNPLS')
end

