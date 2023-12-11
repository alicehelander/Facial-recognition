function [meanface, eigenVectors, weights] = compute_eigenfaces(X)
    % X is a flattened out image (1 x prod(commonsize))
    meanface = mean(X);
    centered_data = X - meanface;
    [eigenVectors] = pca(centered_data);
    weights = eigenVectors' * centered_data';
    
end
