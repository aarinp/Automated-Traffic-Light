Test_Image=imread('test_image.jpg');
Reference_Image=imread('reference_image.jpg');

[x,y,z] = size(Test_Image);
if(z==1)
    ;
else
    Test_Gray_Image = rgb2gray(Test_Image);
end
[x,y,z] = size(Reference_Image);
if(z==1)
    ;
else
 Reference_Gray_Image = rgb2gray(Reference_Image);
end

figure(1);
Test_Image_1=imcrop(Test_Gray_Image,[270 130 150 200]);
Test_Image_1= imadjust(Test_Image_1,[],[],2);
Test_Image_1=imfill(Test_Image_1);
edge_detection_Test_Image = edge(Test_Image_1,'canny');
Structural_Element = strel('line',1,90);
edge_detection_Test_Image=imdilate(edge_detection_Test_Image,Structural_Element);
imshow(Test_Gray_Image);

figure(2);
Reference_Image_1=imcrop(Reference_Gray_Image,[270 130 150 200]);
Reference_Image_1=imadjust(Reference_Image_1,[],[],2);
Reference_Image_1=imfill(Reference_Image_1);
Edge_Detection_Reference_Image = edge(Reference_Image_1,'canny');
Structural_Element = strel('line',1,90);
Edge_Detection_Reference_Image=imdilate(Edge_Detection_Reference_Image,Structural_Element);
imshow(Reference_Gray_Image);

Output_Message_Red_Light_For_90_Seconds = ' Set traffic light to - RED for 90 seconds ';
Output_Message_Green_Light_For_20_Seconds = ' Set traffic light to - GREEN for 20 seconds ';
Output_Message_Green_Light_For_30_Seconds = ' Set traffic light to - GREEN for 30 seconds ';
Output_Message_Green_Light_For_60_Seconds = ' Set traffic light to - GREEN for 60 seconds ';
Output_Message_Green_Light_For_90_Seconds = ' Set traffic light to - GREEN for 90 seconds ';

matched_data = 0;
white_points = 0;
black_points = 0;
x=0;
y=0;
l=0;
m=0;

for a = 1:1:201
 for b = 1:1:151
 if(edge_detection_Test_Image(a,b)==1)
 white_points = white_points+1;
 else
 black_points = black_points+1;
 end
 end
end

for i = 1:1:201
 for j = 1:1:151
 if(edge_detection_Test_Image(i,j)==1)&&(Edge_Detection_Reference_Image(i,j)==1)
 matched_data = matched_data+1;
 else
     ;
 end
 end
end

total_data = white_points;
total_matched_percentage = (matched_data/total_data)*100;

if total_matched_percentage > 90 
 disp(' '); disp(Output_Message_Red_Light_For_90_Seconds);
elseif total_matched_percentage <= 90 && total_matched_percentage > 70
 disp(' '); disp(Output_Message_Green_Light_For_20_Seconds);
elseif total_matched_percentage <= 70 && total_matched_percentage > 50
 disp(' '); disp(Output_Message_Green_Light_For_30_Seconds);
elseif total_matched_percentage <= 50 && total_matched_percentage > 10
 disp(' '); disp(Output_Message_Green_Light_For_60_Seconds);
else
 disp(' '); disp(Output_Message_Green_Light_For_90_Seconds);
end