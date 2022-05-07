function [ Optimal, D ] = BF_Arithmetic (Map, dim, ORIGI, DESTI)
  
Map=OrderMap(Map, dim); %创建邻接矩阵
 
[Pr, D]=Compute_BF(Map,dim, ORIGI); %计算最优路径表path和对应最短距离表D（没有特定终点，而是计算从起点开始到其他任一点的最优路径和最短距离）

cur=[];
V=[];
[Optimal]=print_path( ORIGI, DESTI, cur,V , Pr );