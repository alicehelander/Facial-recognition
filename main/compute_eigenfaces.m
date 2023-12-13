function [meanface, eigenVectors, weights] = compute_eigenfaces(X,commonsize)
    % X is a flattened out image (1 x prod(commonsize))
    meanface = mean(X);
    centered_data = X - meanface;
    [eigenVectors,weights] = pca(centered_data);
    save("eigen_data.mat","eigenVectors","meanface","weights","commonsize","centered_data")
end