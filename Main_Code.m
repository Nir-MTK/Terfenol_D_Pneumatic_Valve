%% Initializing Matlab
format compact
clear all
close all
clc
%% Raw Data Preprossecing

run('H:\Terfenol_D_Pneumatic_Valve\TD_Raw_Data.m'); %Load Terfenol-D Raw S-H data for 7.1[Mpa] Pre-stress value 

%% ========================================================================
%  Uncomment this section to processing data for different Pre-Stress Value
%  ========================================================================
% raw_data = xlsread('S-H_B-H graphs.xls','Data','AV5:AW1149'); %Load Raw
% Data from factory Excel file. Change the last argument according to required pre-stress columns (S-H data). 
% HH = 1e3*raw_data(:,1); %convert H from [kA/m] to [A/m]
% SS = raw_data(:,2);

%% 
max_ppm = 1010; %[ppm] - max required Strain value

%UNCOMMENT NEXT LINE FOR MAXIMUM DATA PMM 
%max_ppm = max(SS+1)

% Creating S-H data for required Strain value
j=1;
for i=1:length(HH)
    if SS(i)<1010
    S(j) =SS(i);
    H(j)=HH(i);
    j=j+1;
    end
end
% polyopt(H,S,2,8,'Terfenol-D Magnetostriction','ppm') %Calculation optimal polynomial order


close all
%% Display Polynomial fitting
figure('Name','HS DATA')
plot(H,S); %Plotting raw data
hold 'on'
hspoly = polyfit(H,S,4); %Polynomial fit: Strain(Magnetic field)
hbase = linspace(0,max(H),length(H)); % X axis 
hsval = polyval(hspoly,hbase); %Y axis
plot(hbase,hsval); % ploting polynomial fitting: Strain as function of Magnetic fiels intensity
grid 'on'
ylabel('Strain [ppm]')
xlabel('Magnetic Field [kA/m]')
title({'Terfenol-D Strain Modeling';'4th order Polynomial fitting'})
%% Required Magetic Field for Specified Strain
figure('Name','SH DATA')
plot(S,H)
hold 'on'
grid 'on'
xlabel('Strain [ppm]')
ylabel('Magnetic Field [kA/m]')
title('Required Magetic Field for Specified Strain')

shpoly = polyfit(S,H,3);
sbase = linspace(0,max(S));
shval = polyval(shpoly,sbase);
plot(sbase,shval);
%% Raw Data vs. Polynomial Data

for i = 1:length(H)
    dif_s(i) = S(i)-polyval(hspoly,H(i));
end
figure()
plot(H,dif_s)
grid 'on'
xlabel('Magnetic Field [kA/m]')
ylabel('Difference [ppm]')
title({'Raw Data vs. Polynomial Data' ; ['RMS: ' num2str(rms(dif_s)) '[ppm]']})
hold on
plot(H,zeros(1,length(H)),'k');
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FEMM Simulation
casename ='TerfenolD_Plunger_10ma'; 
CircName = 'Coil'; % Circuit name, as defined in FEMM
i_vec = 0:1:10; % from 0[A] to 10[A], 500[mA] resolution
n_coil = 1200; %Number of coil turns
save_fig = 1; % set as 1 to save FEMM simulation bitmap. Else: define as 0.
if(save_fig)
    fig_dir = [casename '_Analysis figs__' datestr(now,'mmmm dd, yyyy HH;MM;SS')];
    mkdir (fig_dir); %Create a new sub-folder for simulation figs
    frame = 1;
end

z = linspace(-50,50,length(i_vec));

%% Open existing problem and run an analysis
openfemm;

opendocument('H:\Terfenol_D_Pneumatic_Valve\FEMM\Terfenol_Solenoid_2.FEM') %load FEMM problem
for i = 1:length(i_vec)
mi_selectlabel(35,-12);
mi_setblockprop('12 AWG', 1,0,'Coil', 0, 0, n_coil);
mi_setcurrent(CircName,i_vec(i)) %Set the current to 0
close all
mi_analyze(1)

mi_loadsolution
mo_selectblock(12,1)
if(save_fig)
    mo_savebitmap([ fig_dir '\' num2str(frame) '.bmp']);
    frame = frame+1;
end
AJ_sol(i) = mo_blockintegral(0); 
A_sol(i) = mo_blockintegral(1);
MFE_sol(i) =  mo_blockintegral(2);
HL_sol(i) =  mo_blockintegral(3);
RL_sol(i) =  mo_blockintegral(4);
Bcsa_sol(i) =  mo_blockintegral(5);
Tl_sol(i) =  mo_blockintegral(6);
Tc_sol(i) =  mo_blockintegral(7);
IoBr_sol(i) =  mo_blockintegral(8);
IoBz_sol(i) =  mo_blockintegral(9);
Bv_sol(i) =  mo_blockintegral(10);
r_SS_LorentzForce_sol(i) =  mo_blockintegral(11);
z_SS_LorentzForce_sol(i) =  mo_blockintegral(12);
r_2x_LorentzForce_sol(i) =  mo_blockintegral(13);
z_2x_LorentzForce_sol(i) =  mo_blockintegral(14);
SS_Lorents_torque_sol(i) =  mo_blockintegral(15);
Lorentz_torque_x2_component_sol(i) =  mo_blockintegral(16);
Magnetic_field_coenergy_sol(i) =  mo_blockintegral(17);
r_SS_weighted_stress_tensor_force_sol(i) =  mo_blockintegral(18);
z_SS_weighted_stress_tensor_force_sol(i) =  mo_blockintegral(19);
r_2x_weighted_stress_tensor_force_sol(i) =  mo_blockintegral(20);
r_2x_weighted_stress_tensor_force_sol(i) =  mo_blockintegral(21);
SS_weighted_stress_tensor_torque_sol(i) =  mo_blockintegral(22);
two_component_of_weighted_stress_tensor_torque_sol(i) =  mo_blockintegral(23);
R2_sol(i) =  mo_blockintegral(24); %Moment of inertia/density

%% line
% mo_clearblock
% mo_addcontour(10,50);
% mo_addcontour(10,-50);
% axis_data(i,:) = abs(mo_lineintegral(1));

mo_clearcontour
mo_addcontour(30,-50);
mo_addcontour(30,50);
axis_data(i,:) = abs(mo_lineintegral(1));


end
closefemm

%% Create I-H Polynome
%% ===================
%% RAW DATA
Hn = axis_data(:,2);
Hn=Hn';
figure(1)
plot(i_vec,Hn)
grid on
title('Plunger Magnetic field')
xlabel('Current [A]')
ylabel('Magnetic Field Intensity [A/m]')
hold on

%% I-H Polynom order optimization
ihopt = polyopt(i_vec,Hn,2,10,'Magmetic Field','A/m');
%% I-H polynom
ihpoly = polyfit(i_vec,Hn,5);
ihpolyval = polyval(ihpoly,i_vec);
figure(1)
plot(i_vec,ihpolyval);
grid on
xlabel('Current [A]')
ylabel('H [A/m]')
title('Magnetic Field Intensity as function of Current')
figure(2)
plot(i_vec,Hn-ihpolyval);
grid on
xlabel('Current [A]')
ylabel('Diff [A/m]')

%% I-S Polynomial fitting

for i=1:length(i_vec)
    h = polyval(ihpoly,i_vec(i));
    td_is(i) = polyval(hspoly,h);
end
% close all
plot(i_vec,td_is*100e-6);
hold on
plot(i_vec,zeros(1,length(i_vec)),'k')
title('Terfenol-D Plunger Simulation')
grid on
xlabel('Current [A]')
ylabel('Plunger Strain [mm]')

%% Function composition
plunger_length = 100; %[mm]
ppm2mm = 1e-6;
plung_movement = td_is*plunger_length*ppm2mm; % [mm]*ppm/ppm = [mm] // Translate td_is vector from [ppm] to [mm]

polyopt(i_vec,plung_movement,2,6,'Plunger Movement','mm') % 4th order

tdpoly = polyfit(i_vec,plung_movement,4);
tdpolyval = polyval(tdpoly,i_vec);
figure()
plot(i_vec,tdpolyval)
grid on
xlabel('Current [A]')
ylabel('Plunger Movement [mm]')
%%legend('Raw Data','4th Order Polynomial Fitting')
title('Terfenol-D Solenoid Simulation')
figure()
plot(i_vec,plung_movement-tdpolyval)
grid on
xlabel('Current [A]')
ylabel('Plunger Movement Diff [mm]')

%% inhole Diameter analysis for Pneumatic Relation

D_range=2:6; % [mm] Diameter of Valve input hole 
F=5; %[kg/s] Flow in 
P = @(h,d) F/(pi*h*d); 

figure()
for j = 1:length(D_range)
    D = D_range(j);
    for i = 1:length(i_vec) 
       press_i= P(0.11-plung_movement(i),D); 
       if press_i>=0.1
           press(i) = press_i;
           current(i) = i_vec(i);
       end
    end
    %figure()
    plot(current,press)
    hold on
    grid on
    xlabel('Current [A]')
    ylabel('Preassure [atm]')
    title('Holes Diameter Compearation [mm]')
    legend('2','3', '4', '5', '6')
end
%% Flow rate analysis for D=5[mm] Pneumatic Relation
F_range=2:8; % [mm] Diameter of Valve input hole 
D=5; %[kg/s] Flow in 
 

figure()
for j = 1:length(F_range)
    F = F_range(j);
    P = @(h,d) 1/(pi*h*d);
    for i = 1:length(i_vec) 
       press_i= F*P(0.11-plung_movement(i),D); 
       if press_i>=0.1
           press(i) = press_i;
           current(i) = i_vec(i);
       end
    end
    plot(current,press)
    hold on
    grid on
    xlabel('Current [A]')
    ylabel('Preassure [atm]')
    title('Flow Rate Compearation [kg/m^2]')
    legend('show')
end

%% Finale Pneumatic Relation

D=5; % [mm] Diameter of Valve input hole 
F=5; %[kg/s] Flow in 
P = @(h,d) F/(pi*h*d); 
    for i = 1:length(i_vec) 
       press_i= P(0.11-plung_movement(i),D); 
       if press_i>=0.1
           press(i) = press_i;
           current(i) = i_vec(i);
       end
    end 
figure()
plot(current,press)
grid 'on'
xlabel('Current [A]')
ylabel('Preasure [atm]')
title('Pressure-Current Curve')
figure()
plot(press,current)
grid 'on'
xlabel('Preasure [atm]')
ylabel('Current [A]')
title('Required Current for Specified Pressure')

%% Test Prosedure
% required current for raw data field intensity
polyopt(Hn,i_vec,1,8,'Required Current for Raw Data Field Intensity', 'A');
hipoly = polyfit(Hn,i_vec,4);
hipolyval = polyval(hipoly,H);
figure()
plot(H,hipolyval);
grid 'on'
xlabel('Magnetic Field Intensity [A/m]')
ylabel('Required Current [A]')
title('Required Current for Raw Data Field Intensity')

H_t = zeros(1,11);
S_t = zeros(1,11);
i_t = zeros(1,11);
j=1;
for k = 1:10:length(H)
    H_t(j) = H(k);
    S_t(j) = S(k)*100e-6;
    
    i_t(j) = polyval(hipoly,H(k));
    j=j+1;
end
%%
model_S = polyval(tdpoly,i_t);
figure()
plot(i_t,model_S,'-*')
hold 'on'
plot(i_t,S_t,'-o')
grid 'on'
xlabel('Current [A]')
ylabel('Plunger Movement [mm]')
title('Mathematical Model vs Raw Data')
legend('Model Data','Raw Data')
%%
test_diff = (model_S - S_t);
figure()
plot(i_t,test_diff)
grid 'on'
xlabel('Current [A]')
ylabel('Error [mm]')
title('Mathematical Model vs Raw Data Difference')
%% Flowrate test
p=[5,10,20,30,50,60]; %[atm]
d = 5e-3; %[m]
figure()
for j = 1:length(p)
    k=1;
    for i = 1:length(i_vec)        
        f = p(j)*pi()*d*(0.1-(polyval(tdpoly,i_vec(i))));
        if f>=0
            f_test_vec(k) = f*1.225; %Convert from [m^3/s] to [kg/s]
            i_test_vec(k)=i_vec(i);
            k=k+1;
        end
        
    end
   plot(i_test_vec,f_test_vec)
   hold 'on'
end
hold 'off'
grid 'on'
xlabel('Current [A]')
ylabel('Flaw Rate [kg/s]')
title({'Flow Rate Dynamic Analysis' ; 'D = 5 [mm]'})
legend('5 [atm]','10 [atm]','20 [atm]','30 [atm]','50 [atm]','60 [atm]')