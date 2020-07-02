H = 0:0.01:0.1;
D=5; % [mm] Diameter of Valve input hole 
F=5; %[kg/s] Flow in 
P = @(h,d) F/(pi*h*d); 
    for j = 1:length(H) 
       press(j)= P(0.1-H(j),D); 
    end 
plot(H,press)