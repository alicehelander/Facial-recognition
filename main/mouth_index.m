function [x, y] = mouth_index(img)
    minSize = 80;
    bw = bwareaopen(img, minSize);

    stats = regionprops(bw, 'Centroid', 'MajorAxisLength', 'MinorAxisLength', 'Area');

    maxArea = 0;  % Variable to store the maximum area
    maxAreaIndex = 0;  % Variable to store the index of the object with the maximum area

    for k = 1:length(stats)
        if stats(k).MajorAxisLength > 2 * stats(k).MinorAxisLength
            if stats(k).Area > maxArea
                maxArea = stats(k).Area;
                maxAreaIndex = k;
            end
        end
    end

    % Check if any valid object was found
    if maxAreaIndex > 0
        % Set x and y to the centroid of the object with the largest area
        x = stats(maxAreaIndex).Centroid(1);
        y = stats(maxAreaIndex).Centroid(2);
    else
        % If no valid object was found, set x and y to -1
        x = -1;
        y = -1;
    end
end
