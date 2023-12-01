function [left_eye_coords,right_eye_coords] = findEyePairTest(indexX,indexY,mouth_center)

% Calculate the distance of each eye center from the mouth center
eye_centers = [indexX(:), indexY(:)];
distances = sqrt(sum((eye_centers - mouth_center).^2, 2));


% Find the indices of the two eyes with the closest distance to the mouth
[~, sorted_indices] = sort(distances);
% selected_eye_indices = sorted_indices(1:2);

%eye_centers in sorted order
sorted_eye_centers = eye_centers(sorted_indices, :);


likely_pairs = {}; % Initialize an empty cell array to store likely pairs

for left = 1:length(sorted_indices)-1
    angle_left_eye = rad2deg(atan2(sorted_eye_centers(left, 2) - mouth_center(2), ...
                                   sorted_eye_centers(left, 1) - mouth_center(1)));
    for right = left+1:length(sorted_indices)
        angle_right_eye = rad2deg(atan2(sorted_eye_centers(right, 2) - mouth_center(2), ...
                                        sorted_eye_centers(right, 1) - mouth_center(1)));
        
        % Calculate the absolute difference between the angles
        angle_difference = abs(angle_left_eye - angle_right_eye);
        
        % Check if the absolute difference is less than n degrees
        n = 10;
        if angle_difference < n
            if 
                % Store the indexes of the likely pair in the cell array
                likely_pairs{end+1} = [left, right];
                disp(['Likely pair found: Left eye index ', num2str(left), ' and Right eye index ', num2str(right)]);
            end
        end
    end
end

% Identify the most likely pair based on some criterion (e.g., smallest angle difference)
if ~isempty(likely_pairs)
    % Calculate angle differences for all likely pairs
    angle_diffs = zeros(1, numel(likely_pairs));
    for i = 1:numel(likely_pairs)
        angle_left_eye = rad2deg(atan2(sorted_eye_centers(likely_pairs{i}(1), 2) - mouth_center(2), ...
                                       sorted_eye_centers(likely_pairs{i}(1), 1) - mouth_center(1)));
        angle_right_eye = rad2deg(atan2(sorted_eye_centers(likely_pairs{i}(2), 2) - mouth_center(2), ...
                                        sorted_eye_centers(likely_pairs{i}(2), 1) - mouth_center(1)));
        angle_diffs(i) = abs(angle_left_eye - angle_right_eye);
    end
    
    % Find the index of the pair with the smallest angle difference
    [~, min_index] = min(angle_diffs);
    
    % Access the most likely pair
    most_likely_pair = likely_pairs{min_index};
    disp(['Most likely pair: Left eye index ', num2str(most_likely_pair(1)), ' and Right eye index ', num2str(most_likely_pair(2))]);
else
    disp('No likely pairs found.');
end


left_eye_coords = sorted_eye_centers(most_likely_pair(1), :);
right_eye_coords = sorted_eye_centers(most_likely_pair(2), :);
    
% Radius of the circles (adjust as needed)
radius = 10;

% Draw circles around the eyes
hold on;
viscircles(left_eye_coords, radius, 'EdgeColor', 'r');
viscircles(right_eye_coords, radius, 'EdgeColor', 'b');

% Visualize the line connecting the eyes
plot([left_eye_coords(1),right_eye_coords(1)], [left_eye_coords(2),right_eye_coords(2)], 'LineWidth', 2, 'Color', 'r');
end