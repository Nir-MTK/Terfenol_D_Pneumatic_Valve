%% MATLAB Initiallization
format compact
close all
clc
%% Actuator Settings
plunger_xy =[
0 , 20.7; ...
14.45 , 20.7; ...
14.45 , 46.9; ...
0 , 46.9; ...
];

plunger_x = plunger_xy(:,1);
plunger_y = plunger_xy(:,2);



%% Creating Problem in FEMM
openfemm; 
newdocument(0)
mi_probdef(400,'millimeters','axi',1e-8,0,-30,0)
%Draw Plunger:
mi_drawpolygon(plunger_xy)
mi_zoomnatural
mi_showgrid