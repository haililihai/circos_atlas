% 2/5000,thresholed matrix,sign_test, correction
sub=textread('/DATA/233/hli/Data/HCP_40/sub_HCP.txt','%s');
n=246;
k=40;
matrix=zeros(n,n,k);
for i=1:k
    load(strcat(sub{i},'_matrix_avg.mat'));
    matrix(:,:,i)=(matrix_avg>0);   
end

index_st=zeros(n,n);
p_st=zeros(n,n);
for i=2:n
    for j=1:(i-1)
        data_seq=matrix(i,j,:);
        data_seq=reshape(data_seq(:),[k 1]);
        tmp=data_seq-0.5;
        [p,h]=signtest(tmp,0,'tail','right'); % one sample sign test, greater than 0
        if ~isnan(p)
            p_st(i,j)=p;
            index_st(i,j)=h;
        end
    end
end
index_st=index_st+index_st';


% matrix probability
matrix_pm=zeros(n,n);
for i=1:n
    for j=1:n
        matrix_pm(i,j)=length(nonzeros(matrix(i,j,:)));
    end
end
save('group_matrix_pm.mat','matrix_pm');

% extract lower triangular part of matrix,for correction
mask=tril(true(n),-1);
p_st_seq=p_st(mask);

% Bonferroni correction
p=0.05;
bonferroni=p./nchoosek(n,2);
p_bfr=p_st_seq;
p_bfr(p_bfr>=bonferroni)=0;
index_bfr=tril(ones(n),-1); % vector to lower triangular
index_bfr(index_bfr==1)=logical(p_bfr);
index_bfr=index_bfr+index_bfr'; % symmetric

% FDR correction, BH
q=0.05;
p_fdr=p_st_seq;
p_fdr_dep=p_st_seq;
p_fdr_seq = sort(p_fdr(:));
V = length(p_fdr_seq);
I = (1:V)';

cVN = sum(1./(1:V));

pID = p_fdr_seq(max(find(p_fdr_seq<=I/V*q)));% pID - p-value threshold based on independence or positive dependence
pN = p_fdr_seq(max(find(p_fdr_seq<=I/V*q/cVN))); % pN  - Nonparametric p-value threshold, for dependency structure

p_fdr(p_fdr>=pID)=0;
index_fdr=tril(ones(n),-1); % vector to lower triangular
index_fdr(index_fdr==1)=logical(p_fdr);
index_fdr=index_fdr+index_fdr'; % symmetric

p_fdr_dep(p_fdr_dep>=pN)=0;
index_fdr_dep=tril(ones(n),-1); % vector to lower triangular
index_fdr_dep(index_fdr_dep==1)=logical(p_fdr_dep);
index_fdr_dep=index_fdr_dep+index_fdr_dep'; % symmetric

% alternative FDR, BKY 
% TBD

save('matrix_sign_test.mat','index_st','p_st');
save('matrix_sign_test_bonferroni.mat','index_bfr','p_bfr');
save('matrix_sign_test_FDR.mat','index_fdr','p_fdr');
save('matrix_sign_test_FDR_dep.mat','index_fdr_dep','p_fdr_dep');



