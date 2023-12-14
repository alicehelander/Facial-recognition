function [id] = tnm034(im)
    load("eigen_data.mat", "weights","meanface", "eigenVectors", "commonsize")

    knownWeights = weights;

    % Normalize the new image
    img = normalize_face(im, commonsize);
    img = im2gray(img);

    % Ensure img is a column vector
    img = double(img(:))/255;

    % Subtract meanface from img
    meanface_diff = img - meanface;
  
    % Project the new image onto the eigenspace
    new_weights = eigenVectors' * meanface_diff;
    
    % Initialize minimum distance and personIndex
    minDistance = inf;
    id = 0;


   % Iterate over each known face and compute distances
for i = 1:size(knownWeights, 2)
    % Compute distances between the known weights and the weights of the new image
    distances = sqrt(sum((knownWeights(:,i) - new_weights).^2, 1));
%     distances = sqrt(sum((knownWeights(i, :) - new_weights).^2, 1));
    % Find the minimum distance and its index
    currentMinDistance = min(distances);

    % Check if the current minimum distance is below the threshold
    if currentMinDistance < minDistance
        minDistance = currentMinDistance;
        id = i; % Update to use minIndex instead of i
    end
end

   
    % Set a distance threshold for matching
    threshold = 22;
    
    
    % Check if the minimum distance is below the threshold
    if minDistance < threshold
        % Return the index of the most similar person
        return;
    else
        % If no match found, return 0
        id = 0;
    end
end
