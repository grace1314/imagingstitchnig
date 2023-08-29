function [sub_I] = Grasp_Subregion(I, x, y)

[h, w] = size(I);
% 检查
if abs(x) >= w || abs(y) >= h
  sub_I = [];
  return;
end
% 计算子区域的位置初始值与end值
x_st = 1 + x;
x_end = x_st + w - 1;
y_st = 1 + y;
y_end = y_st + h - 1;
% 限制到有效的坐标区域
x_st = max(1, min(x_st, w));
x_end = max(1, min(x_end, w));
y_st = max(1, min(y_st, h));
y_end = max(1, min(y_end, h));

sub_I = I(y_st:y_end, x_st:x_end);
end