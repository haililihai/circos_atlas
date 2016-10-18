% generate rule.conf

wd='/DATA/233/hli/BA_fs/MPM/circos_atlas/';

mkdir(strcat(wd,'conf/link'));
for i=1:246
	%fid=fopen(strcat(wd,'conf/link/link_prob_1_p001_color_',num2str(i),'.conf'),'w');
	fid=fopen(strcat(wd,'conf/link/link_prob_1_p001_color_',num2str(i),'.conf'),'w');
	fprintf(fid,'<links>\n');
	fprintf(fid,'<link>\n');
	fprintf(fid,'\n');
	%fprintf(fid,'ribbon = yes\n');
	%fprintf(fid,'ribbon = no\n');
	%fprintf(fid,'color = white\n');
	fprintf(fid,'bezier_radius = 0r\n');
	fprintf(fid,'crest = 0.5\n');
	fprintf(fid,'bezier_radius_purity = 0.75\n');
	fprintf(fid,'\n');
	fprintf(fid,'z = 0\n');
	%fprintf(fid,'file = links_prob_1_p001/link_%03d.txt\n',i);
	%fprintf(fid,'file = links_det_1/link_%03d.txt\n',i);
	fprintf(fid,'file = links_prob_1_p001/link_%03d.txt\n',i);
	fprintf(fid,'radius = 1r-125p\n');
	%for links_prob_1
	%fprintf(fid,'color = black_a4\n');
	fprintf(fid,'thickness = 6\n');
	fprintf(fid,'\n');
	%for links_prob_2,links_det_1
	fprintf(fid,'<rules>\n');
	fprintf(fid,'<rule>\n');
	fprintf(fid,'condition = var(col) eq "greys"\n');
	fprintf(fid,'color = lgrey_a3\n');
	fprintf(fid,'z = eval(var(val))\n');
	fprintf(fid,'</rule>\n');
	fprintf(fid,'\n');
	fprintf(fid,'<rule>\n');
	fprintf(fid,'condition = 1\n');
	%fprintf(fid,'condition = var(val) gt 0.1\n');
	%fprintf(fid,'color = eval(sprintf("greys-9-seq-%%d",remap_int(var(val),0,1,1,9)))\n');
	%fprintf(fid,'color = eval(sprintf("ylorrd-9-seq-%%d",remap_int(var(val),0,1,2,9)))\n');
	fprintf(fid,'color = eval(sprintf("%%s-9-seq-6_a3",var(col)))\n');
	%fprintf(fid,'thickness = eval(sprintf("%%f",remap_round(var(val),0,1,1,10)))\n');
	fprintf(fid,'z = eval(var(val))\n');
	fprintf(fid,'stroke_color = vdgrey\n');
	fprintf(fid,'stroke_thickness = 0.001\n');
	fprintf(fid,'</rule>\n');
	fprintf(fid,'</rules>\n');
	fprintf(fid,'\n');
	fprintf(fid,'</link>\n');
	fprintf(fid,'</links>\n');
	fclose(fid);
end
