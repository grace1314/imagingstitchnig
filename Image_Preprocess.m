clc
clear
%% 输入  
% 从图像矩阵块 - 改为图像序列 ，依然假设为一个 ImagesGrid
% 图像网格的大小 m，n
m = 13;
n = 13;
%读取图像 并进行下采样，
gap = 8;
t=1:169;
for i=1:m*n  
       i
       imgTemp = imread(['D:\ManualWSI\MIST-mist-matlab\MIST-mist-matlab\test\selftest\C46_breastcancer\BreastCancer_',num2str(t(i)),'.tif']);
       imgTemp1 = double(imgTemp(1:gap:end,1:gap:end,:));  % 下采样操作
       imgTemp2 = double(imgTemp1);
       ImagesGrid_RGB2(:,:,:,i) =  imgTemp2 ;
        
end

save('ImagesGrid_RGB2.mat','ImagesGrid_RGB2')

%test
% zz1 =ImagesGrid_RGB(:,:,:,5);
% figure,imshow(uint8(zz1));
% zz2 =ImagesGrid_RGB(:,:,:,6);
% figure,imshow(uint8(zz2));


