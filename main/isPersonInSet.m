function personIndex = isPersonInSet(img, meanface, eigenVectors, commonsize)
    % Set a distance threshold for matching
    threshold = 0.1;

    % Normalize the new image
    img = normalize_face(img, commonsize);
    img = im2gray(img);

    % Ensure img is a column vector
    img = double(img(:));

    % Transpose meanface to match the size of img
    meanface = meanface';

    % Subtract meanface from img
    img = img - meanface;

    % Project the new image onto the eigenspace
    weights = eigenVectors' * img;

    
    % Calculate distances to each image in the set
    distances = sqrt(sum((eigenVectors * weights - img).^2, 1))

    % Check if the minimum distance is below the threshold
    [minDistance, personIndex] = min(distances);

    % Check if the minimum distance is below the threshold
    if minDistance < threshold
        % Return the index of the most similar person
        return;
    else
        % If no match found, return 0
        personIndex = 0;
    end
end
