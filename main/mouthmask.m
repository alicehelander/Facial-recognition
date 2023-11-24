function mouth_mask = mouthmask(mouth_map)
mouth_map = mouth_map./(max(max(mouth_map)));

threshold_mouth = 0.3;




mouth_mask = mouth_map > threshold_mouth;
mouthSE = strel('disk',10);
mouth_mask = imopen(mouth_mask,mouthSE);
end