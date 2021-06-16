close all;
clc;
clear all;

input1 = imread('Number Plate Images/image5.jpg');
subplot(1,2,1);
imshow(input1);
imgray = rgb2gray(input1);
binary_img = ~imbinarize(imgray); 
input = imcrop(binary_img);
[h, w] = size(input);
subplot(1,2,2);
imshow(input);

seg_img = regionprops(input,'BoundingBox','Area', 'Image');
count = numel(seg_img);
NumberPlate=[]; 
load NewTemplates 
global NewTemplates

for i=1:count 
   width = length(seg_img(i).Image(1,:));
   height = length(seg_img(i).Image(:,1));
   if width<(h/2) && height>(h/3)
       letter=Letter_detection(seg_img(i).Image);
       NumberPlate=[NumberPlate letter]; 
   end
end
NumberPlate