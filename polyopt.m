function [opt] = polyopt(x,y,min_order,max_order,ttl,rms_u)
%Polynimial fitting optimization 
%   Detailed explanation goes here
i = 1;
opt = zeros(max_order-min_order+1,2);
for order = min_order:max_order
   opt(i,1) = order;
   poly = polyfit(x,y,order);
   opt(i,2) = rms((polyval(poly,x))-y); %RMS Calculation
   i=i+1;
end % end for loop

    figure('Name','RMS Plotting')
    plot(opt(:,1),opt(:,2),'-*')
    grid on
    xlabel('Polynomial Order')
    ylabel(['RMS [' rms_u ']'])
    title({'Polynomial Order Optimization tool'; ttl})
    hold off

end % end function

