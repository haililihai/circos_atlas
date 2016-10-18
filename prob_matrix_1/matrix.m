% generate matrix
sub=textread('/DATA/233/hli/Data/HCP_40/sub_HCP.txt','%s');

for i=1:40
    matrix=zeros(246,246);
    for iseed=1:246
        seed=sprintf('%03d',iseed);
        seq=importdata(strcat(sub{i},'/',seed,'/',seed,'_fingerprint.txt'));
        if length(seq)~=246
            sprintf('Wrong length of %s_%s',sub{i},seed);
        else
            matrix(iseed,:)=seq;
        end
    end
    matrix_avg=zeros(246,246);
    for m=1:246
        for n=1:m
            matrix_avg(m,n)=(matrix(m,n)+matrix(n,m))/2;
            matrix_avg(n,m)=matrix_avg(m,n);
        end
    end
    
    save(strcat(sub{i},'_matrix_avg.mat'),'matrix_avg');
    sprintf('%s Done!',sub{i});
end