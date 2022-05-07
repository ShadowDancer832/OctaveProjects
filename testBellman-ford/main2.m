clear;

%nameMap=['newMaps2/Map' num2str(iiSTA) 'B' num2str(iSTA) '.mat'];
nameMap=['newMaps2/Map10B1.mat'];
load(nameMap); % Map

dim=10; %节点个数
ORIGI=6; %路径起点
DESTI=3; %路径终点

tic
[Optimal_BF, D_BF]=BF_Arithmetic(Map, dim, ORIGI, DESTI );
tBF=toc;
        
disp(['Bellman-ford:' num2str(tBF)]);
Display(Optimal_BF, D_BF);