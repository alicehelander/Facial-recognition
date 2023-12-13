function [featureVector] = create_feature_vector(input_face, eigenfaces, meanface)
input_face = reshape(input_face(:,:),1, []);
Phi = input_face - meanface;

featureVector = zeros(1,size(eigenfaces, 2));
featureVector = eigenfaces' * Phi';
end