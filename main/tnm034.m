%%%%%%%%%%%%%%%%%%%%%%%%%%
function id = tnm034(im)
%
% im: Image of unknown face, RGB-image in uint8 format in the 
% range [0,255]
%
% id: The identity number (integer) of the identified person,
% i.e. ‘1’, ‘2’,…,‘16’ for the persons belonging to ‘db1’ 
% and ‘0’ for all other faces.
%%%%%%%%%%%%%%%%%%%%%%%%%%

%[mean_face_vector, eigenfaces] = load('eigen_data.mat','mean_vector','eigenVectors');

% Normalize colors
img_gw = gray_world(im);
[~, eye_mask, mouth_mask] = create_masks(img_gw);


[x,y] = mouth_index(mouth_mask);
mouth_center = [x, y]; 
[eye_index_x,eye_index_y] = eye_index(eye_mask);

selected_eyes = select_eyes(mouth_center,eye_index_x,eye_index_y,im);

cropped_image = crop_img(im,selected_eyes,mouth_center);

imshow(cropped_image)

id = -1;





