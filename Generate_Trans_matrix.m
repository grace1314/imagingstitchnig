% 对每一张图片与相邻的图片进行PCIAM，即图像对，返回相对位置
% 声明方向，deriction = 1 表示 图 1 在图 2的北部， direction = 0 表示 图1 在图 2的西部
% 按照从左往右的顺序

% 创建 平移矩阵，T，对左右方向和上下方向分别创建平移矩阵，保留平移信息 T_N，T_W
% 根据计算 T_N 大小为 (m-1) x n , T_W 大小为 m x (n-1)

function [T_N ,T_W] = Generate_Trans_matrix(ImageGrid,m,n,yy,xx)

T_N = zeros(m-1,n,3);
T_W = zeros(m ,n-1,3);

for ind = 1 : m * n   
        if (yy(ind) == m)&&(xx(ind) == n) 
            continue
        elseif (yy(ind)~= m)&&(xx(ind)== n) % 即 只有 北方向的图像对
            direction = 1;            
            [y,x,v]= PCIAM( ImageGrid(:,:,yy(ind),xx(ind)), ImageGrid(:,:,yy(ind)+1,xx(ind)),direction);
            T_N(yy(ind),xx(ind),:) = [y,x,v]; 
        elseif (yy(ind) == m)&&(xx(ind) ~= n) % 即 只有 西方向的图像对
            direction = 0;
            [y,x,v]= PCIAM(ImageGrid(:,:,yy(ind),xx(ind)),ImageGrid(:,:,yy(ind),xx(ind)+1),direction) ;
            T_W(yy(ind),xx(ind),:) = [y,x,v]; 
        else                    % 其他 %即 有 北与西两个方向的图像对
            direction = 1;
            [y,x,v]= PCIAM(ImageGrid(:,:,yy(ind),xx(ind)),ImageGrid(:,:,yy(ind)+1,xx(ind)),direction);
            T_N(yy(ind),xx(ind),:) = [y,x,v]; 
            direction = 0;
            [y,x,v]= PCIAM(ImageGrid(:,:,yy(ind),xx(ind)),ImageGrid(:,:,yy(ind),xx(ind)+1),direction);
            T_W(yy(ind),xx(ind),:) = [y,x,v]; 
        end
end
