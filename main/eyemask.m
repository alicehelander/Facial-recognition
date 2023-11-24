function eye_mask = eyemask(eye_map)
eye_map = eye_map./(max(max(eye_map)));
threshold_eye = 0.5;
eye_mask = eye_map > threshold_eye;
eyeSE = strel('disk',5);
eye_mask = imopen(eye_mask,eyeSE);
end