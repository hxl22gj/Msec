function PEP(SeqFile,ResultFile,tmp)

data=fastaread(SeqFile);

gap2=zeros(size(data,1),400);
gap5=zeros(size(data,1),400);
gap0=zeros(size(data,1),400);

for i=1:1:size(data,1)
    gap2(i,:)=protein2twomer_ngap(data(i,1).Sequence,2);
end
for i=1:1:size(data,1)
    gap5(i,:)=protein2twomer_ngap(data(i,1).Sequence,5);
end
for i=1:1:size(data,1)
    gap0(i,:)=protein2twomer_ngap(data(i,1).Sequence,0);
end

gap2=gap2';
gap5=gap5';
gap0=gap0';

save([pwd,'/',tmp,'gap2'],'gap2','-v7.3')
save([pwd,'/',tmp,'gap5'],'gap5','-v7.3')
save([pwd,'/',tmp,'gap0'],'gap0','-v7.3')

clear gap2 gap5 gap0

cmd=['python ',pwd,'/predict.py ',pwd,'/',tmp];unix(cmd);

delete([pwd,'/',tmp,'gap2.mat']);
delete([pwd,'/',tmp,'gap5.mat']);
delete([pwd,'/',tmp,'gap0.mat']);

predict2=dlmread([pwd,'/',tmp,'predict2.csv']);
predict5=dlmread([pwd,'/',tmp,'predict5.csv']);
predict0=dlmread([pwd,'/',tmp,'predict0.csv']);

%delete([pwd,'/',tmp,'predict2.csv']);
%delete([pwd,'/',tmp,'predict5.csv']);
%delete([pwd,'/',tmp,'predict0.csv']);

predict=mean([predict2,predict5,predict0],2);

for i=1:1:size(data,1)
    data(i,1).score=predict(i,1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for i=1:1:size(data,1)
    scores=data(i,1).score;
    if scores>=0.5
        data(i,1).prediction='Extracellular_secretory_protein';
    else
        data(i,1).prediction='Non_extracellular_secretory_protein';
    end
end

            

for i=1:1:size(data,1)
    result{i,1}=data(i,1).Header;
    result{i,2}=size(data(i,1).Sequence,2);
    result{i,3}=data(i,1).score;
    result{i,4}=data(i,1).prediction;
end

result=cell2table(result,'VariableNames',{'Header','Length','score','predition_result'});
writetable(result,ResultFile);

disp(' ')
