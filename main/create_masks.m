function [face_mask, eye_mask, mouth_mask] = create_masks(img_gw)
%Takes in the image and creates the 3 different masks
face_mask = facemask(img_gw);
eyes = eyemap(img_gw);
eye_mask = eyemask((eyes),face_mask);

mouth = mouth_map(img_gw);
mouth_mask = mouthmask(mouth) & face_mask;
end