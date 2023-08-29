% 图像网格拼接  拼接顺序 
% 生成蛇形顺序
function [yy ,xx] = Generate_snake_index(m,n)
   xx = zeros(m,n);
   yy = zeros(m,n);
%% 蛇形序列 竖直方向
 for i = 1:n
     xx(:,i) = i ;
     if mod(i,2)==0 
        yy(:,i) =flip(1:m);
     else
        yy(:,i) = 1:m; 
     end   
 end

   xx = xx(:)';
   yy = yy(:)';

%   temp = xx(:); 
%    xx = yy(:);
%    yy = temp;
%% 蛇形序列  水平方向

%    for s1 = 1:m
%        if mod(s1,2)==0 
%           xx(s1,:) = flip(1:n);
%        else 
%           xx(s1,:)=1:n;
%        end  
%     yy(s1,:) = s1*ones(1,n);
%    end
%    yy = yy';
%    xx = xx';
%    yy = yy(:);
%    xx = xx(:);
% %逆序   
%   yy = flip(yy(:));
%   xx = flip(xx(:));      
end