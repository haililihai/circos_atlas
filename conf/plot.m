% generate rule.conf

wd='/DATA/233/hli/BA_fs/MPM/circos_atlas/';

mkdir(strcat(wd,'conf/plot'));
for i=1:246
	fid=fopen(strcat(wd,'conf/plot/plot_',num2str(i),'.conf'),'w');
	fprintf(fid,'<plots>\n');
	fprintf(fid,'<<include conf/heatmap.conf>>\n');
	fprintf(fid,'<<include conf/label_region.conf>>\n');
	fprintf(fid,'<<include conf/label_subregion/label_subregion_%d.conf>>\n',i);
	fprintf(fid,'<<include conf/highlight/highlight_%d.conf>>\n',i);
	fprintf(fid,'</plots>\n');
	fclose(fid);
end
