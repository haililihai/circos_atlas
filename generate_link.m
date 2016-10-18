%generate links
load('prob_matrix_2_p001/matrix_signrank_bfr_avg.mat');
input_matrix=matrix_bfr_avg;

% normalization
max_row=max(input_matrix,[],2);
max_matrix=repmat(max_row,1,246);
matrix=input_matrix./max_matrix;

%[lobe,st,en,name]=textread('label_bands.txt','%s%d%d%s');
[lobe,id,name,st,en,color]=textread('subregion_band_name_color.txt','%s%d%s%d%d%s');
%T=readtable('label_bands.txt','Delimiter',' ','Format','%s%d%d%s','ReadVariableNames',false);
%Color=readtable('color.txt','Delimiter',' ','Format','%d%s','ReadVariableNames',false);

%mkdir('links_prob_1');
%for n=1:246
%    seq=input_matrix(n,:);
%    id=sprintf('%03d',n);   
%    fid=fopen(strcat('./links_prob_1/link_',id,'.txt'),'w');
%    for i=1:246
%        %if seq(i)== 1
%            fprintf(fid,'%s %d %d %s %d %d val=%f\n',lobe{n},st(n),en(n),lobe{i},st(i),en(i),matrix(n,i));
%        %end
%    end
%    fclose(fid);
%end


mkdir('links_prob_2_p001');
for n=1:246
    seq=input_matrix(n,:);
	col=strtok(color{n},'-');
    id=sprintf('%03d',n);   
    fid=fopen(strcat('./links_prob_2_p001/link_',id,'.txt'),'w');
    for i=1:246
        if matrix(n,i) ~= 0
            fprintf(fid,'%s %d %d %s %d %d val=%f,col=%s\n',lobe{n},st(n),en(n),lobe{i},st(i),en(i),matrix(n,i),col);
        end
    end
    fclose(fid);
end
