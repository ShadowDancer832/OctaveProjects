function [ Optimal, D ] = BF_Arithmetic (Map, dim, ORIGI, DESTI)
  
Map=OrderMap(Map, dim); % Create adjacency matrix
 
[Pr, D]=Compute_BF(Map,dim, ORIGI);  % Get all shortest paths (Pr) and all shortest cost (D) 

cur=[];
V=[];
[Optimal]=print_path( ORIGI, DESTI, cur,V , Pr );