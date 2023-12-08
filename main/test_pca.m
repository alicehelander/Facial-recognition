function [result] = test_pca(img)

    commonSize = [400, 400];
    
    grayScale = rgb2gray(img);

    resizedImg = imresize(grayScale, commonSize);
   
    imgVector = double(resizedImg(:));
   

load('.mat', '');


load('','');

 
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