function varargout = NumericalOpt(varargin)
% NUMERICALOPT MATLAB code for NumericalOpt.fig
%      NUMERICALOPT, by itself, creates a new NUMERICALOPT or raises the existing
%      singleton*.
%
%      H = NUMERICALOPT returns the handle to a new NUMERICALOPT or the handle to
%      the existing singleton*.
%
%      NUMERICALOPT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NUMERICALOPT.M with the given input arguments.
%
%      NUMERICALOPT('Property','Value',...) creates a new NUMERICALOPT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NumericalOpt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NumericalOpt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NumericalOpt

% Last Modified by GUIDE v2.5 02-May-2018 03:08:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NumericalOpt_OpeningFcn, ...
                   'gui_OutputFcn',  @NumericalOpt_OutputFcn, ...
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


% --- Executes just before NumericalOpt is made visible.
function NumericalOpt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NumericalOpt (see VARARGIN)

% Choose default command line output for NumericalOpt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NumericalOpt wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% ---------------------------INITIALIZATION---------------------------
warning off

set(handles.uibuttongroup1,'selectedobject',handles.radiobutton1)
set(handles.text9, 'Visible', 'off');
set(handles.edit5, 'Visible', 'off');


% nVar = length(symvar(sym(    get(handles.edit1,'string'))));
nVar = length(symvar(str2sym(    get(handles.edit1,'string'))));
x0 = ones(1,nVar);
A0 = ones(nVar);
x0str=[];
A0str=[];
for i = 1:nVar
    stri='';
    if i ~= nVar; stri = ';';end
    x0str=[x0str, num2str(x0(i)), stri];
    for j = 1:nVar
        strj='';
        if j ~= nVar; strj = ',';end
            A0str = [A0str, num2str(A0(i,j)), strj];
    end
    A0str = [A0str,stri];
end
set (handles.edit2,'String',['[',x0str,']'])
set (handles.edit5,'String',['[',A0str,']'])
% -----------
% Adding My Numerical Library
addpath('NumericalLib')


% color button
c1 = [1      0      0];
set(handles.pushbutton3,'BackgroundColor',c1);

% --------------------------------------------------------------------


% --- Outputs from this function are returned to the command line.
function varargout = NumericalOpt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
nVar = length(symvar(sym(    get(handles.edit1,'string'))));

x0 = ones(1,nVar);
A0 = ones(nVar);
x0str=[];
A0str=[];
for i = 1:nVar
    stri='';
    if i ~= nVar; stri = ';';end
    x0str=[x0str, num2str(x0(i)), stri];
    for j = 1:nVar
        strj='';
        if j ~= nVar; strj = ',';end
            A0str = [A0str, num2str(A0(i,j)), strj];
    end
    A0str = [A0str,stri];
end
set (handles.edit2,'String',['[',x0str,']'])
set (handles.edit5,'String',['[',A0str,']'])
% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% f  = sym(    get(handles.edit1,'string'));
f    = str2sym(get(handles.edit1,'string'));
x0   = str2num(get(handles.edit2,'string'));
tol  = str2num(get(handles.edit3,'string'));
maxit= str2num(get(handles.edit4,'string'));
AB0  = str2num(get(handles.edit5,'string'));

func = inline(f);
gfunc= inline(gradient(f));
func_graph = func;
h = hessian(f);

vars = symvar(f);
nVar = length(vars);

switch nVar
    case 2
        func  = @(x)func(x(1),x(2));
        gfunc = @(x)gfunc(x(1),x(2));
        hfunc = inline(f,char(vars(1)),char(vars(2)));
        hfunc = @(x)hfunc(x(1),x(2));
    case 3
        func  = @(x)func(x(1),x(2),x(3));
        gfunc = @(x)gfunc(x(1),x(2),x(3));
        hfunc = inline(f,char(vars(1)),char(vars(2)),char(vars(3)));
        hfunc = @(x)hfunc(x(1),x(2),x(3));
    case 4
        func  = @(x)func(x(1),x(2),x(3),x(4));
        gfunc = @(x)gfunc(x(1),x(2),x(3),x(4));
        hfunc = inline(f,char(vars(1)),char(vars(2)),char(vars(3)),...
                         char(vars(4)));
        hfunc = @(x)hfunc(x(1),x(2),x(3),x(4));
    case 5
        func  = @(x)func(x(1),x(2),x(3),x(4),x(5));
        gfunc = @(x)gfunc(x(1),x(2),x(3),x(4),x(5));
        hfunc = inline(f,char(vars(1)),char(vars(2)),char(vars(3)),...
                         char(vars(4)),char(vars(5)));
        hfunc = @(x)hfunc(x(1),x(2),x(3),x(4),x(5));
end

if get(handles.radiobutton1,'Value')==1; method = 1; end
if get(handles.radiobutton2,'Value')==1; method = 2; end
if get(handles.radiobutton3,'Value')==1; method = 3; end
if get(handles.radiobutton4,'Value')==1; method = 4; end
if get(handles.radiobutton5,'Value')==1; method = 5; end

if get(handles.radiobutton6,'Value')==1
    alpha = str2num(get(handles.edit6,'String'));
end
if get(handles.radiobutton7,'Value')==1; alpha = -1; end


switch method
    case 1
        solutions = SDA(func,gfunc,x0,tol,maxit,alpha);
    case 2   
        solutions = CGA(func,gfunc,x0,tol,maxit,alpha);
    case 3
        solutions = NWT(func,gfunc,x0,hfunc,tol,maxit,alpha);
    case 4
        solutions = DFP (func,gfunc,x0,AB0,tol,maxit,alpha);
    case 5
        solutions = BFGS(func,gfunc,x0,AB0,tol,maxit,alpha);
end


% axis/graphical part
if nVar==2
%   cla(handles.axes1)
    grid(handles.axes1,'on');
    hold(handles.axes1,'on');
    xLim = str2num(get(handles.edit7,'string'));
    yLim = str2num(get(handles.edit8,'string'));

    nstep = 100;
    x1_ls = linspace(xLim(1),xLim(2),nstep);
    x2_ls = linspace(yLim(1),yLim(2),nstep);
    [x1_mesh, x2_mesh] = meshgrid(x1_ls,x2_ls);
    f_mesh = func_graph(x1_mesh, x2_mesh);

    plot(handles.axes1,x1_ls,zeros(size(x1_ls)),'k-','LineWidth',1.5)
    plot(handles.axes1,zeros(size(x1_ls)),x2_ls,'k-','LineWidth',1.5)
    
    nContour = str2num(get(handles.edit9,'string'));
    if isempty(get(handles.edit9,'string'))
        [~,h] = contour (handles.axes1,x1_mesh,x2_mesh,f_mesh);
    else
        [~,h] = contour (handles.axes1,x1_mesh,x2_mesh,f_mesh,nContour);
    end
    set(h,'ShowText','on','TextStep',get(h,'LevelStep')*1)
    
    color=get(handles.pushbutton3,'BackgroundColor');
    for i = 1:length(solutions)-1
        plot ([solutions(i,1), solutions(i+1,1)],...
              [solutions(i,2), solutions(i+1,2)],...
              '--*','Color',color)
        set(handles.uitable1,'data',solutions(1:i+1,:))
        pause(str2num(get(handles.edit10,'string')));
    end
    
else
    set(handles.uitable1,'data',solutions)
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1)


function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
if get(hObject,'Value')
    set(handles.text9, 'Visible', 'on');
    set(handles.edit5, 'Visible', 'on');
    set(handles.text9, 'String' , 'A0=');
end


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
if get(hObject,'Value')
    set(handles.text9, 'Visible', 'on');
    set(handles.edit5, 'Visible', 'on');
    set(handles.text9, 'String' , 'B0=');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
if get(hObject,'Value')
    set(handles.text9, 'Visible', 'off');
    set(handles.edit5, 'Visible', 'off');
end

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
if get(hObject,'Value')
    set(handles.text9, 'Visible', 'off');
    set(handles.edit5, 'Visible', 'off');
end

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
if get(hObject,'Value')
    set(handles.text9, 'Visible', 'off');
    set(handles.edit5, 'Visible', 'off');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c = uisetcolor('Pick a Color');
set(handles.pushbutton3,'BackgroundColor',c); 



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path,valid] = uiputfile('figure.png','Save Current Graphical View');
if valid
    saveas(handles.axes1,[path,file])
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
