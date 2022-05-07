% Atomize the Maps !
function [m, augment_dim]=OrderMap_AS(Map, dim)
  
augment_dim = dim;
cutlist = [];
for i = 1:length(Map)
  if Map(i, 3) ~= 1  % Find edge cost is not 1
    cutlist = [cutlist i];  % Write down the edge, cut it later
    
    % Add 1-cost edges
    Map = [Map ; [Map(i,1)  augment_dim+1  1]];  % Add the first 1-cost edge
    for j = 1:Map(i, 3)-2 
      augment_dim += 1;
      Map = [Map ; [augment_dim  augment_dim+1  1]];  % Add transitional 1-cost edges
    endfor
    augment_dim += 1;
    Map = [Map ; [augment_dim  Map(i,2)  1]];  % Add the last 1-cost edge
  endif
endfor

count_for = 0;  % Remenber every time cut the edge, the matrix gets shorter
for k = cutlist  % Cut the edges in cutlist
  k -= count_for;  
  Map(k,:) = [];
  count_for += 1;
endfor

m = Map;
  