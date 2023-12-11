function normalized_face = normalize_face(im)
%Function to normalize an image of a face.

% Normalize colors
img_gw = gray_world(im);
[~, eye_mask, mouth_mask] = create_masks(img_gw);

[x,y] = mouth_index(mouth_mask);
mouth_center = [x, y]; 
[eye_index_x,eye_index_y] = eye_index(eye_mask);

selected_eyes = select_eyes(mouth_center,eye_index_x,eye_index_y,im);

normalized_face = crop_img(im,selected_eyes,mouth_center);






