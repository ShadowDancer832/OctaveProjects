clear;

%nameMap=['newMaps2/Map' num2str(iiSTA) 'B' num2str(iSTA) '.mat'];
for iSTA = 1:50
  nameMap=['newMaps2/Map10B' num2str(iSTA) '.mat'];
  load(nameMap); % Map

  dim=10; %节点个数
  ORIGI=6; %路径起点
  DESTI=3; %路径终点

  [Optimal_AS, D_AS, tAS]=AS_Arithmetic(Map, dim, ORIGI, DESTI );
          
  disp(['A-star:' num2str(tAS)]);
  Display(Optimal_AS, D_AS);
endfor
