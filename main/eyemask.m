function eye_mask = eyemask(eye_map)
threshold_eye = 0.5;
eye_mask = eye_map > threshold_eye;
eyeSE = strel('disk',10);
eye_mask = imopen(eye_mask,eyeSE);
end