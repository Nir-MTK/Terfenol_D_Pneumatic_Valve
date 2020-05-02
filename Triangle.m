%% MATLAB Initialization
format compact
close all
clc
%% Paramaters
deformation = 0.1; %[mm] Plunger maximum movement
w = 20; %[deg] Half traingle top angle 
deg=deg2rad(w); 
x=deformation/cos(deg);% [mm] Vertex length as function of plunger deformation and triangle angle
a = [0,0]; % Triangle 1st edge
b = [x*cos(deg),x*sin(deg)]; % Triangle 2nd edge
c = [x*cos(deg),0];% Triangle 3rd edge
base = linspace(0,max(b(1)));
line = polyfit([a(1),b(1)],[a(2),b(2)],1);

% figure() %Plotting triangle shape
% plot(base,polyval(line,base))
% hold on
% plot(base,-1*polyval(line,base))

tri_func = @(d) line(1).*d + line(2);

 for i = 1:length(base)
     tri_area(i) = integral(tri_func,0,base(i));
 end
 figure()
 plot(base,2.*tri_area)

%  run('Circular.m')
% figure()
% plot(x,area)
% hold on
% plot(base,2.*tri_area)