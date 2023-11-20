function result_img = mouth_map(C1)

C2 = rgb2ycbcr(C1);
imshow(C2)
C3 = double(C2);
imshow(C3,[])

cb=C3(:,:,2);
cr=C3(:,:,3);

ccr=(cr).^2;
imshow(ccr,[])

crcb=cr./cb;
imshow(crcb,[])

%Mouth Map
n = 0.95*mean(cr(:).^2)./(mean(cr(:)./cb(:)));

MouthMap = (ccr).*((ccr - n*(crcb)).^2);
imshow(MouthMap,[])

% Dilation 
se = strel(10);
result_img = imdilate(MouthMap,se);
imshow(MouthMap,[])

%Diffrence och AND
result_img=(ccr-crcb).*(MouthMap);

%Normaliz
result_img=(result_img./max(result_img(:)));
imshow(result_img,[])