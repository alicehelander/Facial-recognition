function [x,y] = mouth_index(img)

minSize = 80;
bw = bwareaopen(img,minSize);

[B] = bwboundaries(bw,"noholes");

if isempty(B)
    x = -1;
    y = -1;
else 
    for k = 1:length(B)
        boundary = B{k};
        x = boundary(:,1);
        y = boundary(:,2);
    end
end

x = round(mean(x));
y = round(mean(y));

