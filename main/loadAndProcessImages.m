function [DataMatrix, ImageFiles] = loadAndProcessImages(folder_path, commonsize)
    ImageFiles = dir(fullfile(folder_path, '*.jpg')); %--------------------------------------------------
    NumberOfImages = numel(ImageFiles);
    DataMatrix = zeros(NumberOfImages, prod(commonsize));

% Loopa igenom varje bild i cell-arrayen och skapa bildvektorer
     for i = 1:NumberOfImages
        Img = imread(fullfile(folder_path, ImageFiles(i).name)); 
        grayImg = rgb2gray(Img); % Omvandla till gråskala om det behövs
        resizeImg = imresize(grayImg, commonsize);
        DataMatrix(i, :) = reshape(resizeImg, 1, prod(commonsize));
    end
end


