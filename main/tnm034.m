function [id] = tnm034(im)
    % Load precomputed eigenface data
    load('eigen_data.mat', 'eigenVectors', 'meanface', 'weights', 'commonsize', 'centered_data');

    % Normalize and convert the input image to grayscale
    new_face = normalize_face(im, commonsize);
    new_face = im2gray(new_face);

    % Ensure img is a column vector
    new_face = double(new_face(:));

    % Subtract meanface from input image
    face_diff = (new_face - meanface');

    threshold = 100;

    % Project the new face onto the principal components space
    new_face_coeff = eigenVectors' * face_diff;

    % Calculate distances to each image in the set
    distances = sqrt(sum((centered_data' * new_face_coeff - face_diff).^2, 1));

    % Check if the minimum distance is below the threshold
    [minDistance, id] = min(distances);

    % Check if the minimum distance is below the threshold
    if minDistance < threshold
        % Return the index of the most similar person
        return;
    else
        % If no match found, return 0
        id = 0;
    end
