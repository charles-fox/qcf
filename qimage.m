function qimage(m)
%qimage(m)
%plot with black=-1, gray=0, while=+1

image(64*cf_rescale(m, -1, 1, 0, 1))
colormap gray
