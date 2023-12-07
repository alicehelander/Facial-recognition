function eye_mask = eyemask(eye_map,face_mask)
eye_map = eye_map./(max(max(eye_map)));
eye_candidates = 2;
thresh = 0.9;

for i = thresh:-0.5:0
    eye_mask = imbinarize(eye_map,i);
<<<<<<< Updated upstream
    eyeSE = strel('disk',11);
=======
    eyeSE = strel('disk',12);
>>>>>>> Stashed changes
    eye_mask = imopen(eye_mask,eyeSE);
    eye_mask = imclose(eye_mask,eyeSE);
    eye_mask = eye_mask & face_mask;
    bw = bwboundaries(eye_mask);

    if(length(bw) > eye_candidates)
        break
    end
end
end