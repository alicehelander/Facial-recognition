function [meanface, eigenVectors, weights] = compute_eigenfaces(X,commonsize)
X = X';
X = double(X)/255;

meanface = mean(X,2);
FD = X - meanface;

C = FD' * FD;

A=FD;    % All 16 face differences, mean face substracted

[vi, ~] = eig(C);

ui=A*vi;        % ui is the eigenface-vectors

eigenVectors = ui;

for i=1:16
        eigenVectors(:,i) = eigenVectors(:,i)/norm(eigenVectors(:,i));
end

weights = eigenVectors' * FD;


save("eigen_data.mat","eigenVectors","meanface","weights","commonsize")

end