function [DataMatrix, ImageFiles] = normalize_all_images(folder_path, commonsize)
    ImageFiles = dir(fullfile(folder_path, '*.jpg'));
    NumberOfImages = numel(ImageFiles);
    DataMatrix = zeros(NumberOfImages, prod(commonsize));

    for i = 1:NumberOfImages
        Img = imread(fullfile(folder_path, ImageFiles(i).name)); 
        resizeImg = normalize_face(Img, commonsize);
        
        % Ensure that the resized image has the correct size
        resizedImage = imresize(resizeImg, commonsize);
        
        % Ensure the image is in grayscale
        if size(resizedImage, 3) == 3
            resizedImage = rgb2gray(resizedImage);
        end

        DataMatrix(i, :) = resizedImage(:)';
    end
end
