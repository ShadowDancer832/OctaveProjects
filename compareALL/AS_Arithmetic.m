function [ Optimal, D2, tAS ] = AS_Arithmetic (Map, dim, ORIGI, DESTI)
  
Map=OrderMap(Map, dim); %创建邻接矩阵
% make time_table
[path, D1] = Compute(Map,dim, ORIGI); % Compute all sp
time_table = make_time_table(path, D1, dim);

tic
[Pr, D2]  = Compute_AS( Map, dim ,ORIGI, DESTI, time_table);
tAS=toc;

cur=[];
V=[];
[Optimal]=print_path( ORIGI, DESTI, cur,V , Pr );