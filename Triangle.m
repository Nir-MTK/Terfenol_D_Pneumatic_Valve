%% MATLAB Initialization
format compact
close all
clc
%% Paramaters
x = 0.5; %[mm] Vertex length
deg=deg2rad(30); 
a = [0,0];
b = [x*cos(deg),x*sin(deg)];
c = [x*cos(deg),0];
base = linspace(0,max(b(1)));
line = polyfit([a(1),b(1)],[a(2),b(2)],1);
figure()
plot(base,polyval(line,base))
tri_func = @(d) line(1).*d + line(2);

 for i = 1:length(base)
     tri_area(i) = integral(tri_func,0,base(i));
 end
 figure()
 plot(base,2.*tri_area)
