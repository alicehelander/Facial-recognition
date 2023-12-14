function hybrid_mask = hybrid(img)
img = im2double(img);

C2 = rgb2ycbcr(img);
C3 = double(C2);

y=C3(:,:,1);
cb=C3(:,:,2);
cr=C3(:,:,3);
ccb=cb.^2;

ccr=(1-cr).^2;
cbcr=ccb./cr;

%EyemapC
EyemapC=(ccb+ccr+cbcr)/3;
% imshow(EyemapC)

%EyemapL
SE=strel('disk',10);
o=imdilate(y,SE);
p=1+imerode(y,SE);
EyemapL=o./p;
% imshow(EyemapC)

%Find edges
gray = im2gray(img);
find_edges = edge(gray,"sobel");
dil_edge = strel("disk",5);
erode_edge = strel("disk",10);
edges = imdilate(find_edges,dil_edge);
edges = imerode(edges,erode_edge);
% imshow(edges)

%Eyemap
illu = imbinarize(EyemapL,"adaptive"); %Threshholds might be wrong
col = imbinarize(EyemapC,"adaptive");

IlluCol = illu & col;
ColEdge = col & edges;
IlluEdge = illu & edges;

hybrid_mask = IlluCol | ColEdge;
hybrid_mask = hybrid_mask | IlluEdge;
end