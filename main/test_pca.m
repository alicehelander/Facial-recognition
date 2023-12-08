function [result] = test_pca(img)

size = [400, 400];
grayscale = rgb2gray(img);
resized_img = imresize(grayScale, size);
img_vector = double(resized_img(:));
   
load('weights.mat', weights)
load('eigenvalues.mat', eigenValues)

weights = phi_i' * TrainingSet.eigenVectors;

distances = zeros(size(TrainingSet.weights, 1), 1);
    for i = 1:size(TrainingSet.weights, 1)
        distances(i) = norm(weights - TrainingSet.weights(i, :));
    end

[~, minIndex] = min(distances);

threshold = 500;  

    if distances(minIndex) < threshold
        result = minIndex; 

        else
            result = 0;  
    end
end