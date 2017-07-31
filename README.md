# circos_atlas
hierarchical circos config files for connectogram of Brainnetome Atlas

# demo connectogram

![001](https://github.com/haililihai/circos_atlas/blob/master/001.png)


# Usage
The configuration files, which are fed into Circos, are all located in directory `conf`. The overall configuration files hierarchically comprise several sub-configuration files relating to the different parts (ideogram, heatmap, label, highlight, link,...) of a circular image according to the manual of Circos. So, you can tweak the detailed parameters in those sub-configuration files: `ideogram.m`, `heatmap.m`, `label_region.m`, `label_subregion`, `plot.m`, `highlight.m`, `link.m`, `rule.m`, then run `circos.m` to generate the overall configuration files.

After getting those configuration files for each image, you can run the batch file `run.m` to generate all the images you want concurrently:)
