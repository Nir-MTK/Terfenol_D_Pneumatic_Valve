%% MATLAB Initialization
format compact
close all
clc
%% Paramaters
deformation = 0.1; %[mm] Plunger maximum movement
angles_vec = linspace(10,80,8); % [deg] 
for j=1:length(angles_vec)
w = angles_vec(j); %[deg] Half traingle top angle 
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
 plot(base,2.*tri_area)
 hold on
end
% hold off
xlabel('Plunger Movement [mm]')
ylabel('Tap Area [mm^2]')
grid on
title('Triangular Tap Shape Comperration')

% legend('10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','60^{\circ}','70^{\circ}','80^{\circ}' ,'location','northwest')

run('Circular.m')
plot(x,area)
% hold on
% plot(base,2.*tri_area)