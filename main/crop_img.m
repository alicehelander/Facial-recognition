function [cropped_img] = crop_img(img,selected_eyes,mouth)
% crop an image for normalization
% Define face pixels 
pixels_down_from_eyes = 180; 
pixels_up_from_eyes = 50;    
pixels_sideways_from_eyes = 40; 

%Configure eyes
eye1 = [selected_eyes(1),selected_eyes(3)];
eye2 = [selected_eyes(2),selected_eyes(4)];

% Calculate coordinates for the new triangle
xmin = min([eye1(1), eye2(1)]) - pixels_sideways_from_eyes;
ymin = min([eye1(2), eye2(2)]) - pixels_up_from_eyes;
width = max([eye1(1), eye2(1)]) - xmin + pixels_sideways_from_eyes;
height = max([mouth(2), eye1(2), eye2(2)]) - ymin + pixels_down_from_eyes;

% Image boundries
xmin = max(1, xmin);
ymin = max(1, ymin);
width = min(size(img, 2) - xmin + 1, width);
height = min(size(img, 1) - ymin + 1, height);

% Integer type
xmin = round(xmin);
ymin = round(ymin);
width = round(width);
height = round(height);

% Crop image based on the coordinates
cropped_img = img(ymin:ymin+height-1, xmin:xmin+width-1, :);
end