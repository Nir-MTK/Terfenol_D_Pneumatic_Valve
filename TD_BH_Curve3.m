%% Matlab initialization
format compact
close all
clc

j=1;
for i=1:length(H)
    if H(i)>=0
    pos_H(j) = H(i);
    pos_B(j) = B(i);
    j=j+1;
    end
end
 polyopt(pos_H,pos_B,2,8,'B-H Curve','Tesla');
 pol = polyfit(pos_H,pos_B,6);
 B_pol = polyval(pol,pos_H);
figure()
%plot(H,B)
%hold 'on'
plot(pos_H,pos_B)
hold 'on'
plot(pos_H,B_pol)
grid 'on'
xlabel('H [Kiloamper/M]')
ylabel('B [Tesla]')
title('B-H Raw Data and Polynomial Data Comperration')
grid 'on'
legend('Raw Data', 'Polynomial Data', 'Location','southeast' )
int_x = linspace(min(pos_H),max(pos_H));

figure()
zero = zeros(length(pos_H));
plot(pos_H,pos_B-B_pol)
hold 'on';
plot(pos_H,zero,'black');
title('B-H Raw Data and Polynomial Data Differance')
xlabel('H [Kiloamper/M]')
ylabel('\Delta B [Tesla]')
grid 'on'