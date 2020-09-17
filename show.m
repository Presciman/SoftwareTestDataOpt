function varargout = show(varargin)
% SHOW MATLAB code for show.fig
%      SHOW, by itself, creates a new SHOW or raises the existing
%      singleton*.
%
%      H = SHOW returns the handle to a new SHOW or the handle to
%      the existing singleton*.
%
%      SHOW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHOW.M with the given input arguments.
%
%      SHOW('Property','Value',...) creates a new SHOW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before show_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to show_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help show

% Last Modified by GUIDE v2.5 19-Oct-2016 13:28:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @show_OpeningFcn, ...
                   'gui_OutputFcn',  @show_OutputFcn, ...
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


% --- Executes just before show is made visible.
function show_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to show (see VARARGIN)

% Choose default command line output for show
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes show wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = show_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function nums_Callback(hObject, eventdata, handles)
% hObject    handle to nums (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of nums as text
%        str2double(get(hObject,'String')) returns contents of nums as a double
input=str2double(get(hObject,'string'));
if(isempty(input))
    set(hObject,'String',0);
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function nums_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nums (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initpop_Callback(hObject, eventdata, handles)
% hObject    handle to initpop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

initpop=str2double(get(hObject,'string'));
if(isempty(initpop))
    set(hObject,'string',0);
end
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of initpop as text
%        str2double(get(hObject,'String')) returns contents of initpop as a double


% --- Executes during object creation, after setting all properties.
function initpop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initpop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in testfun.
function testfun_Callback(hObject, eventdata, handles)
% hObject    handle to testfun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns testfun contents as cell array
%        contents{get(hObject,'Value')} returns selected item from testfun
global testfun;
value=get(hObject,'value');
switch value
    case 2
        testfun=@bubbleTest;%  冒泡程序
    case 3
        testfun=@triangel; % 三角形程序
end

% --- Executes during object creation, after setting all properties.
function testfun_CreateFcn(hObject, eventdata, handles)
% hObject    handle to testfun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global testfun;
initpop =str2double(get(handles.initpop,'String'));
nums =str2double(get(handles.nums,'String'));
dim =str2double(get(handles.dim,'String'));
interval =str2double(get(handles.interval,'String'));
%testfun=@bubbleTest;
[routenum,access,relData]=testData(initpop,nums,testfun,dim,interval);
x=1:size(routenum,2);
bar(handles.axes1,x,routenum);
pie(handles.axes2,access,[1,0,0]);


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1



function dim_Callback(hObject, eventdata, handles)
% hObject    handle to dim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dim as text
%        str2double(get(hObject,'String')) returns contents of dim as a double


% --- Executes during object creation, after setting all properties.
function dim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function interval_Callback(hObject, eventdata, handles)
% hObject    handle to interval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of interval as text
%        str2double(get(hObject,'String')) returns contents of interval as a double


% --- Executes during object creation, after setting all properties.
function interval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to interval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
