function [y,x,v] = Compute_PCC(I1, I2, x, y, direction)

[h,w] = size(I1);

% 虽然从互功率谱的多个峰值中解算出拼接点的位置(x，y),但由于是在
% 傅里叶域中计算，所以其值有奇异性，以(x,y)为起点的裁剪有一下四种可能
% 1) (x,y);     2) (w-x,y);       3) (x, h-y);      4) (w-x, h-y);
% 创建四种可能的结合行列矢量
m = [y, y, h-y, h-y];
n = [x, w-x, x, w-x];

% 判断方向，并生成16种可能
if direction == 1
  m = [m, m];
  n = [n, -n];
elseif direction == 0
  m = [m, -m];
  n = [n, n];
end

% 初始化在每一种结合下的峰值
peaks = zeros(numel(m),1);

%计算每一种结合的互相关参数，正确的值会是最大的。
for i = 1:numel(m)
  x = n(i);
  y = m(i);
% 从I1平移至I2是从I2平移至I1的逆
  peaks(i) = Compute_CCM(Grasp_Subregion(I1, x, y), Grasp_Subregion(I2, -x, -y));
end

%实际平移值对应于重叠区域之间的最大相关性
idx = 1;
for i = 2:numel(peaks)
  if peaks(i) > peaks(idx), idx = i; end
end
% assign the right output
v = peaks(idx);
y = m(idx);
x = n(idx);
end






