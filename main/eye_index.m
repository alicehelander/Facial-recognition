function [indexX,indexY] = eye_index(img)

minSize = 80;
bw = bwareaopen(img,minSize);

[B] = bwboundaries(bw,"noholes");

if length(B) < 2
    indexX = [];
    indexY = []; 
else 
    for k = 1:length(B)
        boundary = B{k};
        x = boundary(:,2);
        x = round(mean(x));
        indexX(k) = x;

        y = boundary(:,1);
        y = round(mean(y));
        indexY(k) = y;
    end
end




