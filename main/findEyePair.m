function [eye1,eye2] = findEyePair(indexX,indexY,mouth_center,img)
% Calculate the distance of each eye center from the mouth center
eye_centers = [indexX(:) + indexY(:)/2, indexY(:)];
distances = sqrt(sum((eye_centers - mouth_center).^2, 2));
% 
% % Find the indices of the two eyes with the closest distance to the mouth
% [~, sorted_indices] = sort(distances)
% selected_eye_indices = [];
% % Iterate through sorted indices to find the eyes where the mouth index is between them
% for i = 1:length(sorted_indices)-1
%     left_eye_index = min(sorted_indices(i), sorted_indices(i+1));
%     right_eye_index = max(sorted_indices(i), sorted_indices(i+1));
% 
%     % Check if both eyes are between the mouth index
%     if eye_centers(left_eye_index, 1) > x && eye_centers(right_eye_index, 1) > x
%         selected_eye_indices = [left_eye_index, right_eye_index];
%         break;  % Break the loop when the condition is satisfied
%     end
% end
% %selected_eye_indices = sorted_indices(1:2)
% %selected_eye_indices = sorted_indices(find(eye_centers(sorted_indices, 1) < x & eye_centers(sorted_indices, 2) > y, 2));
% 
% % Extract the coordinates of the selected eyes
% selected_eyes = [indexX(selected_eye_indices), indexY(selected_eye_indices)];
% 
% viscircles([selected_eyes(1),selected_eyes(3)],10)
% viscircles([selected_eyes(2),selected_eyes(4)],10)
% 
% eye1 = [selected_eyes(1),selected_eyes(3)];
% eye2 = [selected_eyes(2),selected_eyes(4)];
% 
% figure;
% imshow(img);
% hold on;
% viscircles([eye1; eye2], 10, 'EdgeColor', 'r');
% plot([eye1(1), eye2(1)], [eye1(2), eye2(2)], 'LineWidth', 2, 'Color', 'r')
face_mid = [size(img, 2) / 2, size(img, 1) / 2]; % Mitt av ansiktet
eye_distances_to_mid = sqrt((indexX - face_mid(1)).^2 + (indexY - face_mid(2)).^2);

% Sortera ögonen baserat på avståndet till ansiktets mitt
[sorted_mid_distances, sorted_mid_indices] = sort(eye_distances_to_mid);


% Välj de två ögonen som är närmast ansiktets mitt
closest_mid_eye_indices = sorted_mid_indices(1:2);
selected_eyes = [indexX(closest_mid_eye_indices), indexY(closest_mid_eye_indices)];

viscircles([selected_eyes(1),selected_eyes(3)],10)
viscircles([selected_eyes(2),selected_eyes(4)],10)

eye1 = [selected_eyes(1),selected_eyes(3)];
eye2 = [selected_eyes(2),selected_eyes(4)];


