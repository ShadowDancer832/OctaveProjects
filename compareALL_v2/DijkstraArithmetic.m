function [ Optimal, D ] = DijkstraArithmetic( Map, dim, ORIGI, DESTI )

Map=OrderMap(Map, dim); % Create adjacency matrix
 
[path, D]=Compute(Map,dim, ORIGI); % Get all shortest paths (path) and all shortest cost (D) 

cur=[];
V=[];
[Optimal]=print_path( ORIGI, DESTI, cur,V , path );

