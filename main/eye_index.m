function [indexX, indexY] = eye_index(img)

minSize = 60;
bw = bwareaopen(img, minSize);

% Use regionprops to get properties of connected components
stats = regionprops(bw, 'Centroid', 'Circularity','Area');

indexX = [];
indexY = [];

for k = 1:length(stats)
    if stats(k).Circularity > 0.7 %&& stats(k).Area > 100
%         stats(k).Area
        indexX = [indexX, stats(k).Centroid(1)];
        indexY = [indexY, stats(k).Centroid(2)];
    end
end

end


% function [indexX,indexY] = eye_index(img)
% 
% minSize = 80;
% bw = bwareaopen(img,minSize);
% 
% [B] = bwboundaries(bw,"noholes");
% 
% 
% if length(B) < 2
%     indexX = [];
%     indexY = []; 
% else 
%     for k = 1:length(B)
%         boundary = B{k};
%         x = boundary(:,2);
%         x = round(mean(x));
%         indexX(k) = x;
% 
%         y = boundary(:,1);
%         y = round(mean(y));
%         indexY(k) = y;
%     end
% end




