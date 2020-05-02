%% MATLAB Initialization
format compact
close all
clc
%% Paramaters
deformation = 0.1; %[mm] Plunger maximum movement
angles_vec = [80 70 60 50 40 30 20]; % [deg] 
leg_vec = ['b' 'k' 'r' 'g' 'y' 'c' 'm'];
for j=1:length(angles_vec)
w = angles_vec(j); %[deg] Half traingle top angle 
deg=deg2rad(w); 
x=deformation/cos(deg);% [mm] Vertex length as function of plunger deformation and triangle angle
a = [0,0]; % Triangle 1st edge
b = [x*cos(deg),x*sin(deg)]; % Triangle 2nd edge
c = [x*cos(deg),0];% Triangle 3rd edge
base = linspace(0,max(b(1)));
line = polyfit([a(1),b(1)],[a(2),b(2)],1);

figure(1) %Plotting triangle shape
color = leg_vec(j);
plot(base,polyval(line,base),color)
hold on
plot(base,-1*polyval(line,base),color)
hold on
plot(0.1*ones(1,100),linspace(0,b(2)),color)
hold on
plot(0.1*ones(1,100),-1*linspace(0,b(2)),color)
hold on

tri_func = @(d) line(1).*d + line(2);

 for i = 1:length(base)
     tri_area(i) = integral(tri_func,0,base(i));
     
 end
 figure(2)
 plot(base,2.*tri_area,color)
 hold on
end
% hold off
xlabel('Plunger Movement [mm]')
ylabel('Tap Area [mm^2]')
grid on
title('Triangular Tap Shape Comperration')

legend('80^{\circ}','70^{\circ}','60^{\circ}','50^{\circ}','40^{\circ}','30^{\circ}','20^{\circ}','location','northwest')