%% Flow into the piston
Preg = 5; %[Mpa] - Regulated input pressure (constant)
Din = 0.1:0.1:5; % [mm] - Piston input drill diameter range
Fin = pi*Din*Preg; %Flow in

%% Flow outo the valve
Fout = Fin; %Equillibrium status
Dout = Din; % [mm] Piston input drill diameter range
h = plung_movement


% h = 0.1; % [mm] - Max plunger movement
% Din = 0.1:0.1:5; % [mm] - Piston input nozzle size
% Dout = 3*h; % [mm] - Piston output nozzle size
% Pin = inspcae(5,40,length(i_vec)); %[atm] - internal piston pressure (controlled pressure)
% Preg = 50; %[atm] - Regulated input pressure (constant)
% Fin = pi*Din*Pin; %Flow in
% Fout = pi*Dout*x*Pin;

Preg = 5; %[atm] - Regulated input pressure (constant)
% Pout = 5:1:40; %[atm] - internal piston pressure range (controlled pressure)
Din = 0.2; % [mm] - Piston input nozzle size
Dout = 0.2; % [mm] - Piston output nozzle size
% i=1; % plunger movement vector index
% h = plung_movement(i); % [mm] 

Fin = pi*Din*Preg; %Flow in
% Pout = pi*Dout.*Pout;


for i = 1:length(i_vec)
    P(i) = (Preg*pi*Din)./(pi*Dout*plung_movement(i));% [atm] internal piston pressure
end
figure('Name','Internal P')
plot(i_vec,P);



%%


