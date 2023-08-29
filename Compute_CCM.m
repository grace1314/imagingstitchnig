% CCM-Cross_Correlation_Matrix
function cr = Compute_CCM(I1, I2)

% 将输入转成列向量
I1 = I1(:);     I2 = I2(:);
nb_elem = size(I1,1);

% 求平均
mv = sum(I1)/nb_elem;
I1 = I1 - mv;
mv = sum(I2)/nb_elem;
I2 = I2 - mv;
% I1 = I1-mean(I1);       I2 = I2-mean(I2);

% 计算互相关公式的分子和分母
N = I1'*I2;
D = sqrt(I1'*I1) * sqrt(I2'*I2);

% 计算互相关因子
cr = N/D;

if ~isfinite(cr)
  cr = -1;
end

end