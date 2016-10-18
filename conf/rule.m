% generate rule.conf

wd='/DATA/233/hli/BA_fs/MPM/circos_atlas/';
[lobe,s0,s1,name]=textread(strcat(wd,'label_bands.txt'),'%s %d %d %s');

mkdir(strcat(wd,'conf/rule'));
for i=1:246
	fid=fopen(strcat(wd,'conf/rule/rule_',num2str(i),'.conf'),'w');
	fprintf(fid,'<rules>\n');
	fprintf(fid,'<rule>\n');
	fprintf(fid,strcat('condition = ',32,'var(chr) eq ''%s'' && var(start) eq ''%d''\n'),lobe{i},s0(i));
	fprintf(fid,'color = dred\n');
	fprintf(fid,'label_size = 35p\n');
	fprintf(fid,'label_font = bold\n');
	fprintf(fid,'link_color = dred\n');
	fprintf(fid,'</rule>\n');
	fprintf(fid,'</rules>\n');
	fclose(fid);
end
