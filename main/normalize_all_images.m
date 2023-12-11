function [DataMatrix, ImageFiles] = normalize_all_images(folder_path, commonsize)
    ImageFiles = dir(fullfile(folder_path, '*.jpg')); %--------------------------------------------------
    NumberOfImages = numel(ImageFiles);
    DataMatrix = zeros(NumberOfImages, prod(commonsize));

     for i = 1:NumberOfImages
        Img = imread(fullfile(folder_path, ImageFiles(i).name)); 
        resizeImg = normalize_face(Img);
        imshow(resizeImg)
        %DataMatrix(i, :) = reshape(resizeImg, 1, prod(commonsize));
    end
end


