function [meanface, eigenVectors, weights] = compute_eigenfaces(X,commonsize)
    % X is a flattened out image (1 x prod(commonsize))
%     meanface = mean(X);
%     centered_data = X - meanface;
%     [eigenVectors,weights] = pca(centered_data);
% 
%     for i=1:16
%         eigenVectors(i,:) = eigenVectors(i,:)/norm(eigenVectors(i,:));
%     end
%     save("eigen_data.mat","eigenVectors","meanface","weights","commonsize","centered_data")


X = X';
X = double(X)/255;

max(X)
meanface = mean(X,2);
FD = X - meanface;

C = FD' * FD;

A=FD;    % All 16 face differences, mean face substracted

[vi, eValues] = eig(C);

ui=A*vi;        % ui is the eigenface-vectors

eigenVectors = ui;

for i=1:16
        eigenVectors(:,i) = eigenVectors(:,i)/norm(eigenVectors(:,i));
end

weights = eigenVectors' * FD;


save("eigen_data.mat","eigenVectors","meanface","weights","commonsize")

end