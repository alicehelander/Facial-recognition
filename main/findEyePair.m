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



% 
% % Find the angle between the eyes
% angle = atan2(0, eye2(1) - eye1(1));
% 
% % Check additional conditions for selecting the right eye based on the desired angle
% if abs(rad2deg(angle)) > 3 && size(selected_eyes, 1) >= 2
%     for i = 2:length(selected_eye_indices)
%       % Check if the x-coordinate is within a certain range
%         x_diff = abs(selected_eyes(i, 1) - eye1(1));
%         y_diff = abs(selected_eyes(i, 2) - eye1(2));
% 
%         if (x_diff > 120) && (x_diff < 150) && (selected_eyes(i, 2) < mouth_center(2)) && (y_diff < 50)
%             if x_diff > 0 % Check if the selected eye is on the right side
%                 eye2 = selected_eyes(i, :);
%                 break;  % Exit the loop once a suitable right eye is found
%             else
%                 eye1 = selected_eyes(i, :);
%             end
%         end
%     end
% end
% 
% % Visualize the line connecting the eyes
% hold on;
% plot([eye1(1), eye2(1)], [eye1(2), eye2(2)], 'LineWidth', 2, 'Color', 'r');
% 
% % end
% %  % Calculate the distance of each eye center from the mouth center
% %     eye_centers = [indexX(:) + indexY(:)/2, indexY(:)];
% %     distances = sqrt(sum((eye_centers - mouth_center).^2, 2));
% % 
% %     % Find the indices of the eyes
% %     [~, sorted_indices] = sort(distances);
% % 
% %     % Check additional conditions for selecting the eyes based on the angle
% %     min_angle = deg2rad(-10);
% %     max_angle = deg2rad(10);
% % 
% %     % Initialize eyes
% %     eye1 = [];
% %     eye2 = [];
% % 
% %     figure;  % Create a new figure
% % 
% %     for i = 1:length(sorted_indices)-1
% %         % Extract the coordinates of the selected eyes
% %         selected_eyes = [indexX(sorted_indices(i)), indexY(sorted_indices(i)), ...
% %                           indexX(sorted_indices(i+1)), indexY(sorted_indices(i+1))];
% % 
% %         % Calculate the angle between the eyes
% %         angle = atan2(selected_eyes(4) - selected_eyes(2), selected_eyes(3) - selected_eyes(1));
% % 
% %         % Check if the angle is within the expected range
% %         if angle > min_angle && angle < max_angle
% %             % Determine left and right eyes based on x-coordinates
% %             if selected_eyes(1) < selected_eyes(3)
% %                 eye1 = selected_eyes(1:2);  % Left eye
% %                 eye2 = selected_eyes(3:4);  % Right eye
% %             else
% %                 eye1 = selected_eyes(3:4);  % Left eye
% %                 eye2 = selected_eyes(1:2);  % Right eye
% %             end
% %             
% %             % Break the loop once the eyes are found
% %             break;
% %         end
% %     end
% % 
% %     % Visualize the final result
% %     if ~isempty(eye1) && ~isempty(eye2)
% %         viscircles([eye1; eye2], 10, 'EdgeColor', 'r');
% %         plot([eye1(1), eye2(1)], [eye1(2), eye2(2)], 'LineWidth', 2, 'Color', 'r');
% %         title('Detected Eyes and Angle');
% %     else
% %         title('No valid eyes detected');
% %     end
% % 
% %     hold off;
% % end