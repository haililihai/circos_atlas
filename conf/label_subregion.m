% generate rule.conf

wd='/DATA/233/hli/BA_fs/MPM/circos_atlas/';

mkdir(strcat(wd,'conf/label_subregion'));
for i=1:246
	fid=fopen(strcat(wd,'conf/label_subregion/label_subregion_',num2str(i),'.conf'),'w');
	fprintf(fid,'<plot>\n');
	fprintf(fid,'type = text\n');
	fprintf(fid,'color = white\n');
	fprintf(fid,'file = label_bands.txt\n');
	fprintf(fid,'\n');
	fprintf(fid,'r0 = 1r\n');
	fprintf(fid,'r1 = 1r+300p\n');
	fprintf(fid,'\n');
	fprintf(fid,'show_links = yes\n');
	fprintf(fid,'link_dims = 0p,2p,6p,2p,5p\n');
	fprintf(fid,'link_thickness = 3p\n');
	fprintf(fid,'link_color = grey\n');
	fprintf(fid,'\n');
	fprintf(fid,'label_snuggle = yes\n');
	fprintf(fid,'max_snuggle_distance = 1r\n');
	fprintf(fid,'snuggle_tolerance = 0.25r\n');
	fprintf(fid,'snuggle_sampling = 2\n');
	fprintf(fid,'snuggle_refine = yes\n');
	fprintf(fid,'\n');
	fprintf(fid,'label_size = 24p\n');
	fprintf(fid,'label_font = bold\n');
	fprintf(fid,'padding = 0p\n');
	fprintf(fid,'rpadding = 0p\n');
	fprintf(fid,'\n');
	fprintf(fid,'<<include conf/rule/rule_%s.conf>>\n',num2str(i));
	fprintf(fid,'\n');
	fprintf(fid,'</plot>\n');
	fclose(fid);
end
