clear;

nameMap=['newMaps2/Map10B12.mat'];
for iSTA = 1:1
%  nameMap=['newMaps2/Map10B' num2str(iSTA) '.mat'];
  load(nameMap); % Map

  dim=10; %节点个数
  ORIGI=5; %路径起点
  DESTI=10; %路径终点

  [Optimal, D]=DijkstraArithmetic(Map, dim, ORIGI, DESTI );
          
  Display(Optimal, D);
endfor