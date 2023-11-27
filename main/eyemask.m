function eye_mask = eyemask(eye_map)
eye_map = eye_map./(max(max(eye_map)));
eye_candidates = 3;
thresh = 0.9;

for i = thresh:-0.1:0
    eye_mask = imbinarize(eye_map,i);
    eyeSE = strel('disk',10);
    eye_mask = imclose(eye_mask,eyeSE);

    [centers, radii, metric] = imfindcircles(eye_map,[6 60]);
    if(centers > eye_candidates)
        break
    end
end
end