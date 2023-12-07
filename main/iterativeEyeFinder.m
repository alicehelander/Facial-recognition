function [eye1,eye2] = iterativeEyeFinder(eyes,face_mask,mouth_center,img)
for radii = 7:1:20
    eye_mask = eyemask(eyes,face_mask,radii);
    [indexX,indexY] = eye_index(eye_mask);
    [eye1 , eye2] = findEyePair(indexX,indexY,mouth_center,img);
    if (eye1(1) < mouth_center(1) && eye1(2) > mouth_center(1))  || (eye1(1) > mouth_center(1) && eye1(2) < mouth_center(1))
        break
    end 
end
end