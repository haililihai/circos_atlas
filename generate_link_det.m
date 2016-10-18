%generate links for deterministic fiber tracking
load('det_matrix_1/matrix_fdr_avg.mat');
input_matrix=matrix_fdr_avg;

% normalization
max_row=max(input_matrix,[],2);
max_matrix=repmat(max_row,1,246);
matrix=input_matrix./max_matrix;

[lobe,st,en,name]=textread('label_bands.txt','%s%d%d%s');
%T=readtable('label_bands.txt','Delimiter',' ','Format','%s%d%d%s','ReadVariableNames',false);
%Color=readtable('color.txt','Delimiter',' ','Format','%d%s','ReadVariableNames',false);

mkdir('links_det_1');
for n=1:246
    seq=input_matrix(n,:);
    id=sprintf('%03d',n);   
    fid=fopen(strcat('./links_det_1/link_',id,'.txt'),'w');
    for i=1:246
        %if seq(i)== 1
            fprintf(fid,'%s %d %d %s %d %d val=%f\n',lobe{n},st(n),en(n),lobe{i},st(i),en(i),matrix(n,i));
        %end
    end
    fclose(fid);
end


