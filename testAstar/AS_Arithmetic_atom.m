function [ Optimal, D, tAS ] = AS_Arithmetic (Map, dim, ORIGI, DESTI)
  
[ Map_0, augment_dim]=OrderMap_AS(Map, dim); % Map网格化
Map_1=OrderMap(Map_0, augment_dim); %创建邻接矩阵
[path, H]=Compute(Map_1,augment_dim, DESTI); % Compute all sp from destination

tic
[Pr, D]=Compute_AS(Map_1,augment_dim, ORIGI, DESTI, H); 
tAS=toc;

cur=[];
V=[];
[Optimal]=print_path( ORIGI, DESTI, cur,V , Pr );