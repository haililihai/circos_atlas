% generate rule.conf

wd='/DATA/233/hli/BA_fs/MPM/circos_atlas/';

mkdir(strcat(wd,'conf/circos'));
for i=1:246
	fid=fopen(strcat(wd,'conf/circos/circos_prob_1_p001_color_',num2str(i),'.conf'),'w');
	%fid=fopen(strcat(wd,'conf/circos/circos_prob_2_p001_ylorrd_',num2str(i),'.conf'),'w');
	%fid=fopen(strcat(wd,'conf/circos/circos_det_1_rdpu_',num2str(i),'.conf'),'w');
	fprintf(fid,'<image>\n');
	fprintf(fid,'<<include etc/image.conf>>\n');
	fprintf(fid,'background* = vdgrey\n');
	fprintf(fid,'angle_orientation* = counterclockwise\n');
	fprintf(fid,'</image>\n');
	fprintf(fid,'\n');
	fprintf(fid,'<<include etc/colors_fonts_patterns.conf>>\n');
	fprintf(fid,'\n');
	fprintf(fid,'<<include etc/housekeeping.conf>>\n');
	fprintf(fid,'\n');
	fprintf(fid,'<<include conf/data.conf>>\n');
	fprintf(fid,'<<include conf/ideogram.conf>>\n');
	fprintf(fid,'<<include conf/plot/plot_white_%d.conf>>\n',i);
	%fprintf(fid,'<<include conf/link/link_%d.conf>>\n',i);
	fprintf(fid,'<<include conf/link/link_prob_1_p001_color_%d.conf>>\n',i);
	%fprintf(fid,'<<include conf/link/link_prob_2_p001_ylorrd_%d.conf>>\n',i);
	fclose(fid);
end
