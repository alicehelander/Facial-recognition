function [selected_eyes] = select_eyes(mouth_center,eye_index_X,eye_index_Y,img)

% Calculate the distance of each eye center from the mouth center
eye_centers = [eye_index_X(:) + eye_index_Y(:)/2, eye_index_Y(:)];
%distances = sqrt(sum((eye_centers - mouth_center).^2, 2));

% Calculate the distance to the middle
face_mid = [size(img, 2) / 2, size(img, 1) / 2];
eye_distances_to_mid = sqrt((eye_index_X - face_mid(1)).^2 + (eye_index_Y - face_mid(2)).^2);

% Sort eyes based on distance to the middle
[sorted_mid_distances, sorted_mid_indices] = sort(eye_distances_to_mid);

closest_mid_eye_indices = zeros(1,4);

for i = 1:length(sorted_mid_indices)-1
    for j = i:length(sorted_mid_indices)
        if eye_index_X(sorted_mid_indices(i)) < mouth_center(1,1) && eye_index_X(sorted_mid_indices(j)) > mouth_center(1,1)
            closest_mid_eye_indices = [sorted_mid_indices(i), sorted_mid_indices(j)];
            break
        elseif eye_index_X(sorted_mid_indices(i)) > mouth_center(1,1) && eye_index_X(sorted_mid_indices(j)) < mouth_center(1,1)
            closest_mid_eye_indices = [sorted_mid_indices(i), sorted_mid_indices(j)];
            break
        end
    end
end

if max(max(closest_mid_eye_indices)) == 0
    closest_mid_eye_indices = sorted_mid_indices(1:2);
end

% Choose the two closest eyes
selected_eyes = [eye_index_X(closest_mid_eye_indices), eye_index_Y(closest_mid_eye_indices)];
end