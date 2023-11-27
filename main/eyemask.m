function eye_mask = eyemask(eye_map)
eye_map = eye_map./(max(max(eye_map)));

eye_mask = imbinarize(eye_map);
eyeSE = strel('disk',10);
eye_mask = imclose(eye_mask,eyeSE);
end