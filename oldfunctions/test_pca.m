function [result] = test_pca(img)

size = [400, 400];
grayscale = rgb2gray(img);
resized_img = imresize(grayScale, size);
img_vector = double(resized_img(:));
   
load('eigen_data.mat');

weights = phi_i' * train.eigenVectors;

distances = zeros(size(train.weights, 1), 1);
    for i = 1:size(train.weights, 1)
        distances(i) = norm(weights - train.weights(i, :));
    end

[~, min_index] = min(distances);

thresh = 500;  

    if distances(min_index) < thresh
        result = min_index; 

        else
            result = 0;  
    end
end