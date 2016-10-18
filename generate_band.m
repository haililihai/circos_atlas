% generate band.txt
part=importdata('subregion_name.txt');

lobe={'FRO_L';'INS_L';'LIM_L';'TEM_L';'PAR_L';'OCC_L';'SUB_L';'SUB_R';'OCC_R';'PAR_R';'TEM_R';'LIM_R';'INS_R';'FRO_R'};
%lobe=[lobe;lobe(end:-1:1)];
num_lobe=[34;6;7;28;19;11;18];
num_lobe=[num_lobe;num_lobe(end:-1:1)];

index=ones(1,246);
index(163:174)=2;
index(175:188)=3;
index(69:124)=4;
index(125:162)=5;
index(189:210)=6;
index(211:246)=7;
tmp=index(2:2:end);
tmp=15-tmp;
index(2:2:end)=tmp;

% colorbrewer palette
warm={'reds';'oranges';'purd';'rdpu';'ylorrd';'ylorbr';'orrd'};
cold={'ylgn';'blues';'purples';'greens';'ylgnbu';'gnbu';'bugn';'bupu';'pubugn';'greys'};

rand_cold=rand(10,8);
[b,c_I]=sort(rand_cold(:));
[c_x,c_y]=ind2sub(size(rand_cold),c_I(1:78));
rand_warm=rand(7,8);
[b,w_I]=sort(rand_warm(:));
[w_x,w_y]=ind2sub(size(rand_warm),w_I(1:45));

num_w=1;
num_c=1;
color=cell(246,1);
for i=1:2:245
    if mod(index(i),2)~=0 %cold
        color{i}=strcat(cold{c_x(num_c)},'-9-seq-',num2str(c_y(num_c)+1));
        color{i+1}=color{i};
        num_c=num_c+1;
    else
        color{i}=strcat(warm{w_x(num_w)},'-9-seq-',num2str(w_y(num_w)+1));
        color{i+1}=color{i};
        num_w=num_w+1;
    end
end

fid_1=fopen('band.txt','w');
fid_2=fopen('label_bands.txt','w');
fid_3=fopen('color.txt','w');

for i=1:numel(lobe)
    fprintf(fid_1,'chr - lobe%d %s 0 %d chr1\n',i,lobe{i},num_lobe(i));
end

num=ones(1,14);
for i=1:246
        fprintf(fid_1,'band lobe%d %d %s %d %d %s\n',index(i),i,part{i},num(index(i))-1,num(index(i)),color{i});
        fprintf(fid_2,'lobe%d %d %d %s\n',index(i),num(index(i))-1,num(index(i)),part{i});
        fprintf(fid_3,'%d %s\n',i,color{i});
        num(index(i))=num(index(i))+1;
end
fclose(fid_1);
fclose(fid_2);
fclose(fid_3);

