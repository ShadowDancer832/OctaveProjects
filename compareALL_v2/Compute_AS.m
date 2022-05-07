function  [path, D]  = Compute_AS( Map, dim ,ORIGI, DESTI, time_table)

path=zeros(1,dim); % father node of each node
D=zeros(1,dim); % shortest cost to each node
fb=zeros(1,dim);

% Init：
fb(ORIGI)=1; % fb(i)=1 means node i will not longer be searched
for i=1:dim 
    D(i)=Map(ORIGI,i);
    path(1,i)=ORIGI;
end
path(1,ORIGI)=0;

while(sum(fb)~=dim) % Keep search untill all fb(i)=1
    min=inf;
    for k=1:dim % Search 
        if (fb(k)~=1)&&D(k)<min
            v=k;
            min=D(k);
        end
    end
    fb(v)=1; % Mark node v
    for k=1:dim % Search all neighbours of node v
        if (fb(k)~=1)&& (min + Map(v,k) < D(k)&& Map(v,k)~=inf)
            D(k)=min + Map(v,k);
            path(k)=v;
          endif
    endfor
      
    if (v == DESTI)&& (time_table(D(v),v)==path(v)) % If DESTI be marked，and confirm the path is shortest by time_table，early exit
      break;
    endif
endwhile

end