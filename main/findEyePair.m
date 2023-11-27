function [eye1,eye2,angle] = findEyePair(indexX,indexY,mouth_center)

% Calculate the distance of each eye center from the mouth center
eye_centers = [indexX(:) + indexY(:)/2, indexY(:)];
distances = sqrt(sum((eye_centers - mouth_center).^2, 2));


% Find the indices of the two eyes with the closest distance to the mouth
[~, sorted_indices] = sort(distances);
selected_eye_indices = sorted_indices(1:2);

% Extract the coordinates of the selected eyes
selected_eyes = [indexX(selected_eye_indices), indexY(selected_eye_indices)];

viscircles([selected_eyes(1),selected_eyes(3)],10)
viscircles([selected_eyes(2),selected_eyes(4)],10)

eye1 = [selected_eyes(1),selected_eyes(3)];
eye2 = [selected_eyes(2),selected_eyes(4)];

% Find the angle between the eyes
angle = atan2(eye2(2)-eye1(2),eye2(1) - eye1(1));

% Check additional conditions for selecting the right eye based on the desired angle
if abs(rad2deg(angle)) > 4
    for i = 2:length(selected_eye_indices)
        % Check if the x-coordinate is within a certain range
        if (abs((selected_eyes(i, 1) - eye1(1))) > 120) && (abs((selected_eyes(i, 1) - eye1(1))) < 150) && (i ~= length(selected_eye_indices))
            eye2 = selected_eyes(i, :);
            break;  % Exit the loop once a suitable eye is found
        end
    end
end

% Visualize the line connecting the eyes
hold on;
plot([eye1(1), eye2(1)], [eye1(2), eye2(2)], 'LineWidth', 2, 'Color', 'r');

end