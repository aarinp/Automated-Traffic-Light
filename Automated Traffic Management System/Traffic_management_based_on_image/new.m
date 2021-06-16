function varargout = new(varargin)
% NEW MATLAB code for new.fig
%      NEW, by itself, creates a new NEW or raises the existing
%      singleton*.
%
%      H = NEW returns the handle to a new NEW or the handle to
%      the existing singleton*.
%
%      NEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEW.M with the given input arguments.
%
%      NEW('Property','Value',...) creates a new NEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before new_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to new_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help new

% Last Modified by GUIDE v2.5 14-Jun-2021 22:24:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @new_OpeningFcn, ...
                   'gui_OutputFcn',  @new_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before new is made visible.
function new_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to new (see VARARGIN)

% Choose default command line output for new
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes new wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = new_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.*', 'Pick a MATLAB code file');
    if isequal(filename,0) || isequal(pathname,0)
       disp('User pressed cancel')
    else
       filename = strcat(pathname,filename);
       Reference_image = imread(filename);
       axes(handles.axes1);
       imshow(Reference_image);
       handles.Reference_image = Reference_image;
       guidata(hObject, handles);
    end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.*', 'Pick a MATLAB code file');
    if isequal(filename,0) || isequal(pathname,0)
       disp('User pressed cancel')
    else
       filename = strcat(pathname,filename);
       Test_image = imread(filename);
       axes(handles.axes4);
       imshow(Test_image);
       handles.Test_image = Test_image;
       guidata(hObject, handles);
    end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Test_Image=handles.Test_image;
Reference_Image=handles.Reference_image;

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

Test_Image_1=imcrop(Test_Gray_Image,[270 130 150 200]);
Test_Image_1= imadjust(Test_Image_1,[],[],2);
Test_Image_1=imfill(Test_Image_1);
edge_detection_Test_Image = edge(Test_Image_1,'canny');
Structural_Element = strel('line',1,90);
edge_detection_Test_Image=imdilate(edge_detection_Test_Image,Structural_Element);

Reference_Image_1=imcrop(Reference_Gray_Image,[270 130 150 200]);
Reference_Image_1=imadjust(Reference_Image_1,[],[],2);
Reference_Image_1=imfill(Reference_Image_1);
Edge_Detection_Reference_Image = edge(Reference_Image_1,'canny');
Structural_Element = strel('line',1,90);
Edge_Detection_Reference_Image=imdilate(Edge_Detection_Reference_Image,Structural_Element);

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
 Red_Light = imread('Red_light.jpg');
 axes(handles.axes3);
 imshow(Red_Light);
 set(handles.timer, 'String', '90 SECONDS');
elseif total_matched_percentage <= 90 && total_matched_percentage > 70
 disp(' '); disp(Output_Message_Green_Light_For_20_Seconds);
 Green_Light = imread('Green_light.jpg');
 axes(handles.axes3);
 imshow(Green_Light);
 set(handles.timer, 'String', '20 SECONDS');
elseif total_matched_percentage <= 70 && total_matched_percentage > 50
 disp(' '); disp(Output_Message_Green_Light_For_30_Seconds);
 Green_Light = imread('Green_light.jpg');
 axes(handles.axes3);
 imshow(Green_Light);
 set(handles.timer, 'String', '30 SECONDS');
elseif total_matched_percentage <= 50 && total_matched_percentage > 10
 disp(' '); disp(Output_Message_Green_Light_For_60_Seconds);
 Green_Light = imread('Green_light.jpg');
 axes(handles.axes3);
 imshow(Green_Light);
 set(handles.timer, 'String', '60 SECONDS');
else
 disp(' '); disp(Output_Message_Green_Light_For_90_Seconds);
 Green_Light = imread('Green_light.jpg');
 axes(handles.axes3);
 imshow(Green_Light);
 set(handles.timer, 'String', '90 SECONDS');
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
strGui2 = ('F:\Major_project\Number Plate Detection\Number_Plate.fig'); 
open (strGui2);  
closereq;       

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
