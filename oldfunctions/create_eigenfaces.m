function [eigenVectors, meanface] = create_eigenfaces(input)

M = size(input,3);   % M is the total number of images
for i = 1:1:M
    n_vector = reshape(input(:,:,i),1, []);
    X(i,:) = n_vector(1,:);
end

u = (1/M) * sum(X);
%imshow(reshape(u,400,[]))
phi = X(:,:) - u;
A = phi';
v = transpose(A)*A;
eigenVectors = A*v;
% for i = 1:1:M
%     normalize = mat2gray(u_i);
%     imshow(reshape(normalize(:,i),400,[]))
% end
meanface = u;

featureVectors = create_feature_vector(X(1,:));
    for i = 2:16
        featureVectors = [featureVectors; create_feature_vector(X(i,:))]; %adds a row under with a new feature_vector
    end


        save("eigen_data.mat","eigenVectors","meanface","featureVectors")

end