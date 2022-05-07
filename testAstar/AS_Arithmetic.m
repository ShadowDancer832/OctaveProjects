function [ Optimal, D, tAS ] = AS_Arithmetic (Map, dim, ORIGI, DESTI)
  
Map=OrderMap(Map, dim); %创建邻接矩阵
[path_inv, H]=Compute(Map,dim, DESTI); % Compute all sp from destination
% make time_table
[path, D] = Compute(Map,dim, ORIGI); % Compute all sp
time_table = make_time_table(path, D, dim);

tic
[Pr, D]=Compute_AS(Map, dim, ORIGI, DESTI, H, time_table); 
tAS=toc;

cur=[];
V=[];
[Optimal]=print_path( ORIGI, DESTI, cur,V , Pr );