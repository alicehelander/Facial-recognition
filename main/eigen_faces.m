function [meanface, eigenfaces] = eigen_faces(input)
% 
% if size(input, 3) == 3
%     % Convert color image to grayscale
%     input = rgb2gray(input);
% end
% 
% commonsize = [400, 400];
% 
% % 2. Represent the image as an n-vector "X_i"
% [M, ~, ~] = size(input); % M is the total number of images
% N = prod(commonsize); % N is the number of pixels in each image
% 
% X = zeros(M, N);
% 
% for i = 1:M
%     % Reshape the image into a 1D vector
%     n_vector = reshape(input(:,:), 1, []);
%     X(i, :) = n_vector;
% end
% 
% % Rest of your code...
% 
% % 3. Find average face vector, "u" represents the "mean face" for the training data set.
% u = mean(X);
% 
% % 4. Subtract the mean, "u", face for each face vector, "X_i"
% phi = X - u;
% 
% % 5. Find the covariance matrix, C
% C = phi' * phi / (M - 1);
% 
% % 6a. Compute eigenvectors and eigenvalues of the covariance matrix
% [V, D] = eig(C);
% 
% % 6b. Sort eigenvectors and eigenvalues in descending order
% [D, order] = sort(diag(D), 'descend');
% V = V(:, order);
% 
% % 6c. Compute the eigenfaces
% eigenfaces = phi * V;
% 
% % Display the mean face
% imshow(uint8(reshape(u, size(input, 1), size(input, 2))));
% 
% % Display the first few eigenfaces
% % num_eigenfaces_to_display = min(5, M);
% % for i = 1:num_eigenfaces_to_display
% %     figure;
% %     imshow(uint8(reshape(eigenfaces(:, i), size(input, 1), size(input, 2))));
% %     title(['Eigenface ', num2str(i)]);
% % end
% 
% meanface = u;
% 
% end

% 2. Represent the image as a n-vector "X_i"
M = size(input,3);   % M is the total number of images
for i = 1:1:M
    n_vector = reshape(input(:,:,i),1, []);
    X(i,:) = n_vector(1,:);
end


%"Create Eigenfaces using PCA"
% 3. Find average face vector, "u" represents the "mean face" for the training data set.

u = double((1/M) * sum(X));
%imshow(reshape(u,400,[]))
u = u'; % Transpose u

% 4. Subtract the mean, "u", face for each face vector, "X_i"
phi = X(:,:) - u;


% 5. Find the covariance matrix, C
A = phi';

% 6b.
v = transpose(A)*A;

% 6c.
eigenfaces = A*v;

% for i = 1:1:M
%     normalize = mat2gray(u_i);
%     imshow(reshape(normalize(:,i),400,[]))
% end

meanface = u;

end
