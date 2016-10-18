cd /DATA/233/hli/BA_fs/MPM/Anat_con_246/matrix
sub=textread('/DATA/233/hli/Data/HCP_40/sub_HCP.txt','%s');
n=246;
k=40;
thres=0.01

matrix=zeros(n,n,k);
for i=1:k
    load(strcat(sub{i},'_matrix_p_sym.mat'));
    matrix(:,:,i)=(m_sym>thres);
end

matrix_st=zeros(n,n);
p_st=zeros(n,n);
for i=2:n
    for j=1:(i-1)
        data_seq=matrix(i,j,:);
        data_seq=reshape(data_seq(:),[k 1]);
        tmp=data_seq-0.5;
        [p,h]=signtest(tmp,0,'tail','right'); % one sample sign test, greater than 0
        p_st(i,j)=p;
        matrix_st(i,j)=h;
    end
end
for i=1:(n-1)
    for j=(i+1):n
        p_st(i,j)=p_st(j,i);
        matrix_st(i,j)=matrix_st(j,i);
    end
end

% matrix probability
matrix_pm=zeros(n,n);
for i=1:n
    for j=1:n
        matrix_pm(i,j)=length(nonzeros(matrix(i,j,:)));
    end
end
save('group_matrix_pm.mat','matrix_pm');

% Bonferroni correction
p=0.05;
bonferroni=p./nchoosek(n,2);
p_bfr=p_st;
p_bfr(p_bfr>=bonferroni)=0;
matrix_bfr=(p_bfr~=0);

% FDR correction, BH
q=0.05;
p_fdr=p_st;
p_fdr_dep=p_st;
p_fdr_seq = sort(p_fdr(:));
V = length(p_fdr_seq);
I = (1:V)';

cVN = sum(1./(1:V));

pID = p_fdr_seq(max(find(p_fdr_seq<=I/V*q)));% pID - p-value threshold based on independence or positive dependence
pN = p_fdr_seq(max(find(p_fdr_seq<=I/V*q/cVN))); % pN  - Nonparametric p-value threshold, for dependency structure

p_fdr(p_fdr>=pID)=0;
matrix_fdr=(p_fdr~=0);

p_fdr_dep(p_fdr_dep>=pN)=0;
matrix_fdr_dep=(p_fdr_dep~=0);

% alternative FDR, BKY 
% TBD

save('matrix_sign_test.mat','matrix_st','p_st');
save('matrix_sign_test_bonferroni.mat','matrix_bfr','p_bfr');
save('matrix_sign_test_FDR.mat','matrix_fdr','p_fdr');
save('matrix_sign_test_FDR_dep.mat','matrix_fdr_dep','p_fdr_dep');



