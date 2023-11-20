function similarityScore = isoscelesTriangleScore(x1, y1, x2, y2, x3, y3)
    % Calculate lengths of the sides of the triangle
    side1 = sqrt((x2 - x1)^2 + (y2 - y1)^2);
    side2 = sqrt((x3 - x2)^2 + (y3 - y2)^2);
    side3 = sqrt((x1 - x3)^2 + (y1 - y3)^2);

    % Check if the triangle is isosceles
    isIsosceles = (abs(side1 - side2) < eps || abs(side1 - side3) < eps || abs(side2 - side3) < eps);

    % Check if the triangle is upright
    isUpright = false;
    if ~isIsosceles
        % Calculate the slope of the line formed by points 1 and 2
        slope12 = (y2 - y1) / (x2 - x1);
        
        % Check if point 3 is below the line formed by points 1 and 2
        isUpright = y3 < slope12 * (x3 - x1) + y1;
    end

    % Calculate the similarity score
    if isUpright
        % If it is upright, set the score to 0
        similarityScore = 0;
    else
        % If it is not upright, set the score based on the differences in side lengths
        maxSide = max([side1, side2, side3]);
        minSide = min([side1, side2, side3]);
        similarityScore = 1 - (maxSide - minSide) / maxSide;
    end
end
