
function  Image_Sequence = Genarate_Image_Sequence(path,m ,n)
% 导入mat文件
load(path);
t = 1;
Image_Sequence = [];
for i = 1:m
   for j = 1:n
       Image_Sequence(:,:,t) = ImagesGrid1(:,:,i,j);
       if t~=m*n
       t = t+1;
       end
   end
end

end

