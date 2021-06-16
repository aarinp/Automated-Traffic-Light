function varargout = Number_Plate(varargin)
% NUMBER_PLATE MATLAB code for Number_Plate.fig
%      NUMBER_PLATE, by itself, creates a new NUMBER_PLATE or raises the existing
%      singleton*.
%
%      H = NUMBER_PLATE returns the handle to a new NUMBER_PLATE or the handle to
%      the existing singleton*.
%
%      NUMBER_PLATE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NUMBER_PLATE.M with the given input arguments.
%
%      NUMBER_PLATE('Property','Value',...) creates a new NUMBER_PLATE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Number_Plate_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Number_Plate_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Number_Plate

% Last Modified by GUIDE v2.5 14-Jun-2021 22:00:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Number_Plate_OpeningFcn, ...
                   'gui_OutputFcn',  @Number_Plate_OutputFcn, ...
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


% --- Executes just before Number_Plate is made visible.
function Number_Plate_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Number_Plate (see VARARGIN)

% Choose default command line output for Number_Plate
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Number_Plate wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Number_Plate_OutputFcn(hObject, eventdata, handles) 
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
       Plate_image = imread(filename);
       handles.Plate_image = Plate_image;
       guidata(hObject, handles);
    end
    
input1 = handles.Plate_image;
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
set(handles.numberplate , 'String', string(NumberPlate));

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
strGui3 = ('F:\Major_project\Traffic_management_based_on_image\new.fig');
open (strGui3);
closereq; 
