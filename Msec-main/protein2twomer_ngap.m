function vec=protein2twomer_ngap(seq,n)
seq=upper(seq);
vec=zeros(1,400);
for i=1:1:size(seq,2)-n-1
    id=aa2num(seq(i))*20+aa2num(seq(i+n+1))+1;
    if id>=0
        vec(id)=vec(id)+1;
    end
end
vec=vec/sum(vec);