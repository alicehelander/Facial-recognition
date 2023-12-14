function normalized_img = normalize_img(img, eye1, eye2 , mouth)

offsetX = abs(eye1(1,2)-eye2(1,2)); %Distance between the eyes.
offsetY = ((eye1(1,1) - mouth) + (eye2(1,1) - mouth))/2; %distance between eyes and mouth

normalized_img = img(eye1(1,1)-offsetY:eye2(1,1)+2*offsetY,eye1(1,2)-offsetX:eye2(1,2)+offsetX);

end