% generate rule.conf

wd='/DATA/233/hli/BA_fs/MPM/circos_atlas/';

mkdir(strcat(wd,'conf/highlight'));
for i=1:246
	fid=fopen(strcat(wd,'conf/highlight/highlight_',num2str(i),'.conf'),'w');
	fprintf(fid,'<plot>\n');
	fprintf(fid,'\n');
	fprintf(fid,'type = highlight\n');
	fprintf(fid,'file = highlight/highlight_%d.txt\n',i);
	fprintf(fid,'r0 = 1r-120p\n');
	fprintf(fid,'r1 = 1r\n');
	fprintf(fid,'fill = yes\n');
	fprintf(fid,'stroke_color = dred\n');
	fprintf(fid,'stroke_thickness = 12\n');
	fprintf(fid,'\n');
	fprintf(fid,'<rules>\n');
	fprintf(fid,'<rule>\n');
	fprintf(fid,'importance = 100\n');
	fprintf(fid,'condition = 1\n');
	fprintf(fid,'z = 100\n');
	fprintf(fid,'fill_color = eval(var(value))\n');
	fprintf(fid,'</rule>\n');
	fprintf(fid,'</rules>\n');
	fprintf(fid,'\n');
	fprintf(fid,'</plot>\n');
	fclose(fid);
end
