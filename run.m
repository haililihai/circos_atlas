%system call

% Windows
% parpool('local');
%parfor i=11:246
%    id=sprintf('%03d',i);
%    cmd=strcat('perl D:\Documents\Copy\circos\circos-0.67-7\bin\circos -param links/file=.\links\link_',id,'.txt -outputdir .\png -outputfile ',32,id,'.png');
%    system(cmd);
%end
%delete(gcp);

matlabpool('local');

% Linux
%mkdir('png_svg_prob_1_p001_color');
mkdir('png_svg_prob_1_p001_color_white');
%mkdir('png_svg_prob_2_p001_ylorrd');
%mkdir('png_svg_prob_2_ribbon_ylgnbu');
%mkdir('png_svg_det_1_ribbon');
%mkdir('png_svg_det_1_ribbon_rdpu');
parfor i=1:246
	id=sprintf('%03d',i);
	%cmd_1=sprintf('circos -conf conf/circos/circos_prob_1_p001_color_%d.conf -outputdir png_svg_prob_1_p001_color -outputfile %s.png',i,id);
	cmd_1=sprintf('circos -conf conf/circos/circos_prob_1_p001_color_white_%d.conf -outputdir png_svg_prob_1_p001_color_white -outputfile %s.png',i,id);
	%cmd_2=sprintf('circos -conf conf/circos/circos_prob_2_%d.conf -outputdir png_svg_prob_2_ribbon -outputfile %s.png',i,id);
	%cmd_2=sprintf('circos -conf conf/circos/circos_prob_2_p001_ylorrd_%d.conf -outputdir png_svg_prob_2_p001_ylorrd -outputfile %s.png',i,id);
	%cmd_3=sprintf('circos -conf conf/circos/circos_det_1_%d.conf -outputdir png_svg_det_1_ribbon -outputfile %s.png',i,id);
	%cmd_3=sprintf('circos -conf conf/circos/circos_det_1_rdpu_%d.conf -outputdir png_svg_det_1_ribbon_rdpu -outputfile %s.png',i,id);
	system(cmd_1);
	%system(cmd_2);
	%system(cmd_3);
end
matlabpool('close');
