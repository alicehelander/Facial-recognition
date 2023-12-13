% function personIndex = isPersonInSet(img, meanface, eigenVectors, commonsize)
%     load("eigen_data.mat", "weights")
% 
%     knownWeights = weights;
% 
%     % Normalize the new image
%     img = normalize_face(img, commonsize);
%     img = im2gray(img);
% 
%     % Ensure img is a column vector
%     img = double(img(:));
% 
%     % Transpose meanface to match the size of img
%     meanface = meanface';
% 
%     % Subtract meanface from img
%     meanface_diff = img - meanface;
% 
%     % Project the new image onto the eigenspace
%     new_weights = eigenVectors' * meanface_diff;
% 
%     % Initialize maximum cosine similarity and personIndex
%     maxCosineSimilarity = -1;  % initialized to a value less than -1
%     personIndex = 0;
% 
%     % Iterate over each known face and compute cosine similarity
%     for i = 1:size(knownWeights, 2)
%         % Compute cosine similarity between the known weights and the weights of the new image
%         numerator = sum(knownWeights(:, i)' .* new_weights);
%         denominator = norm(knownWeights(:, i)') * norm(new_weights);
%         
%         % Avoid division by zero
%         if denominator ~= 0
%             cosineSimilarity = numerator / denominator;
%         else
%             cosineSimilarity = 0;
%         end
%             fprintf('Cosine Similarity for person %d: %f\n', i, cosineSimilarity);
% 
%         % Update the maximum cosine similarity
%         if cosineSimilarity > maxCosineSimilarity
%             maxCosineSimilarity = cosineSimilarity;
%             personIndex = i
%         end
%     end
% 
%     % Set a threshold for matching based on cosine similarity
%     threshold = -0.8;  % You can adjust this threshold
% 
%     % Check if the maximum cosine similarity is above the threshold
%     if maxCosineSimilarity > threshold
%         % If a match is found, return the index of the most similar person
%         return;
%     else
%         % If no match found, return -1
%         personIndex = -1;
%     end
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function personIndex = isPersonInSet(img, meanface, eigenVectors, commonsize)
    load("eigen_data.mat", "weights")

    knownWeights = weights;

    % Normalize the new image
    img = normalize_face(img, commonsize);
    img = im2gray(img);

    % Ensure img is a column vector
    img = double(img(:));

    % Transpose meanface to match the size of img
    meanface = meanface';

    % Subtract meanface from img
    meanface_diff = img - meanface;

    % Project the new image onto the eigenspace
    new_weights = eigenVectors' * meanface_diff;

    % Initialize minimum distance and personIndex
    minDistance = inf;
    personIndex = 0;

    % Iterate over each known face and compute distances
    for i = 1:size(knownWeights, 2)
        % Compute distances between the known weights and the weights of the new image
        distances = sqrt(sum((knownWeights(:, i)' - new_weights).^2, 1));
%         distances = abs(sum(sum((knownWeights(:, i)' - new_weights), 1)))
        % Find the minimum distance
        currentMinDistance = min(distances);

        % Check if the current minimum distance is below the threshold
        if currentMinDistance < minDistance
            minDistance = currentMinDistance;
            personIndex = i;
        end
    end
   
    % Set a distance threshold for matching
    threshold = 3.0e+04;

    % Check if the minimum distance is below the threshold
    if minDistance < threshold
        % Return the index of the most similar person
        return;
    else
        % If no match found, return 0
        personIndex = 0;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% function personIndex = isPersonInSet(img, meanface, eigenVectors, commonsize)
%    
%     % Normalize the new image
%     img = normalize_face(img, commonsize);
%     img = im2gray(img);
%     
%     % Ensure img is a column vector
%     img = double(img(:));
%     
%     % Transpose meanface to match the size of img
%     meanface = meanface';
%     
%     % Subtract meanface from img
%     img = img - meanface;
% 
%     % Project the new image onto the eigenspace
%     weights = eigenVectors' * img;
%     
%     % Calculate distances to each image in the set
%     weighted_image = img - eigenVectors * weights;
% 
% 
%     whos weighted_image
%     whos eigenVectors
% 
%     distances = sqrt(sum((eigenVectors(:,1) .* (weighted_image)).^2, 1));
%     for i = 2:16
%         distances = sqrt(sum((eigenVectors(:,i) .* weighted_image).^2, 1));
%     end
%     % Check if the minimum distance is below the threshold
%     [minDistance, personIndex] = min(distances);
% 
%     % Set a distance threshold for matching
%     threshold = 0.1;
%     % Check if the minimum distance is below the threshold
%     if minDistance < threshold
%         % Return the index of the most similar person
%         return;
%     else
%         % If no match found, return 0
%         personIndex = 0;
%     end
% end
