function [indexX, indexY] = eye_index(img)

minSize = 60;
bw = bwareaopen(img, minSize);

% Use regionprops to get properties of connected components
stats = regionprops(bw, 'Centroid', 'Circularity','Area');

indexX = [];
indexY = [];

for k = 1:length(stats)
    if stats(k).Circularity > 0.4 %&& stats(k).Area > 100
%         stats(k).Area
        indexX = [indexX, stats(k).Centroid(1)];
        indexY = [indexY, stats(k).Centroid(2)];
    end
end

end



