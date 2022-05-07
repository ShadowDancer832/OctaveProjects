clear;
cutlist = [2 3 8];
Map = [ 475   476     1;
   1   1     1;
   1    1     1;
    30   478     1;
   478    28     1;
    30   479     1;
   479  480     1;
   1   1     1;
   481   482     1;
   482    29     1];
disp(Map);
count_for = 0;  % Remenber every time cut the edge, the matrix gets shorter
for k = cutlist  % Cut the edges in cutlist
%  disp(k)
  k -= count_for;  
  Map(k,:) = [];
  count_for += 1;
%  disp(Map);
endfor