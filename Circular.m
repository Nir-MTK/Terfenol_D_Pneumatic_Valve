%% MATLAB Initialization
format compact
close all
clc
%% Paramaters
r = 0.1/2; %[mm] 
x = linspace(0,2*r);
area = zeros(1,length(x));
%% Functions Headers
top = @(x) r+(r.^2-(x-r).^2).^0.5; %Top half circle equation
bottom = @(x) r-(r.^2-(x-r).^2).^0.5;%Bottom half circle equation
%% Draw full circle
% figure()
% plot(x,top(x))
% hold 'on'
% plot(x,bottom(x))
% hold 'off'
%% Calculating the total area open for air fluid as function of deformation
for i = 1:length(x)
    area(i) = integral(top,0,x(i)) - integral(bottom,0,x(i));
end

% figure()
% plot(x,area)
% grid 'on'
% xlabel('d [mm]')
% ylabel('Area [mm^2]')
linear = linspace(area(1),area(length(area)));
figure()
plot(x,area)
hold 'on'
plot(x,linear,':')
grid 'on'
xlabel('d [mm]')
ylabel('Area [mm^2]')
legend('Output area','Linear comperation')