function [bin_img] = facemask(img)

img = imread('../TNM034/Facial-recognition/db/DB0/db0_1.jpg')

% Binary image 
bin_img = zeros(size(img,1),size(img,2));

% YCbCr
YCbCr_img = rgb2ycbcr(img);
imshow(YCbCr_img);

y=YCbCr_img(:,:,1);
cb=YCbCr_img(:,:,2);
cr=YCbCr_img(:,:,3);

% Threshold
[row,col] = find(cb >= 65 & cb <= 200 & cr >= 131 & cr <= 155 & y >= 80);

% Change skin color
for k = 1:size(row)
    bin_img(row(k),col(k)) = 1;
end

% Morphology
SE = strel('disk',4);
bin_img = imopen(bin_img, SE);
SE1 = strel('disk',25);
bin_img = imclose(bin_img, SE1);

bin_img = imfill(bin_img, 'holes');
target = 256:-4:4;
bin_img = histeq(bin_img,target);
bin_img = imbinarize(bin_img,0.9);

binary_img = bwareafilt(bin_img,1);
%imshow(bin_img)
end