clear;
%Map = [1 2 1;
%   1 3 1;
%   1 4 5;
%   2 1 1;
%   2 3 1;
%   2 5 1;
%   3 1 1;
%   3 2 1;
%   3 4 1;
%   3 5 1;
%   4 1 5;
%   4 3 1;
%   5 2 1;
%   5 3 1];
   
Map = [1 2 1;
   1 4 5;
   2 1 1;
   2 5 1;
   3 4 1;
   3 5 1;
   4 1 5;
   4 3 1;
   5 2 1;
   5 3 1];
disp(Map);
dim = 5;
ORIGI = 1;
DESTI = 4;

Map=OrderMap(Map, dim); %创建邻接矩阵
[path, D] = Compute(Map,dim, ORIGI); % Compute all sp
time_table = make_time_table(path, D, dim);
disp(time_table);