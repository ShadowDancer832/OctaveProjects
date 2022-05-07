clear;

Map = [[1, 2, 4];
      [1, 10, 1];
      [2, 1, 4];
      [2, 5, 1];
      [2, 3, 2];
      [3, 7, 3];
      [4, 8, 1];
      [4, 9, 1];
      [5, 1, 1];
      [6, 4, 5];
      [7, 6, 4];
      [8, 6, 1];
      [9, 1, 5];
      [10, 8, 3]]; % Map

dim=10; %节点个数
ORIGI=5; %路径起点
%DESTI=10; %路径终点

for i=1:dim
  [Optimal, D]=DijkstraArithmetic(Map, dim, ORIGI, i);
  Display(Optimal, D);
endfor
  