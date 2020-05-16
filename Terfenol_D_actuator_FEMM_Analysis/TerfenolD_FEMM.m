%This program used for dynamic simulatiob of a Terfenol-D Actuator using
%FEMM.
%% MATLAB Initiallization
format compact
close all
clc
CircName = 'Coil';

%% 
casename ='TerfenolD Plunger 01';
fig_dir = [casename '_Analysis figs__' datestr(now,'mmmm dd, yyyy HH;MM;SS')];
mkdir (fig_dir); %Create a new sub-folder for simulation figs
i_vec = 0:0.1:10;
z = linspace(-50,50,length(i_vec));
%axis_data = zeros(length(i_vec),14);
%% Open existing problem
openfemm;

opendocument('H:\Terfenol_D_Pneumatic_Valve\FEMM\Terfenol_Solenoid_2.FEM') %load FEMM problem
for i = 1:length(i_vec)
mi_setcurrent(CircName,i_vec(i)) %Set the current to 0
mi_analyze(1)

mi_loadsolution
mo_selectblock(15,50)
mo_savebitmap([ fig_dir '\' num2str(i_vec(i)) '.bmp']);

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
mo_clearblock
mo_addcontour(15,-50);
mo_addcontour(15,50);
axis_data(i,:) = mo_lineintegral(1);


end
closefemm

%% Create I-H Polynome
H = axis_data(:,1);
H=H';
plot(i_vec,H)
grid on
xlabel('Current [A]')
ylabel('Magnetic Field Intensity [T]')
hold on

%% 1st order polynom
ihpoly1 = polyfit(i_vec,H,1);
ihpolyval1 = polyval(ihpoly1,i_vec);
plot(i_vec,ihpolyval1);
hold on

%% 2nd order polynom
ihpoly2 = polyfit(i_vec,H,2);
ihpolyval2 = polyval(ihpoly2,i_vec);
plot(i_vec,ihpolyval2);
hold on
%% 3rd order polynom
ihpoly3 = polyfit(i_vec,H,3);
ihpolyval3 = polyval(ihpoly3,i_vec);
plot(i_vec,ihpolyval3);
hold on
legend('Raw Data','1st order', '2nd order', '3rd order')
%%
run('Td_Callibration_Modeling_1k_ppm.m')
for i=1:length(i_vec)
    h=polyval(ihpoly3,i_vec(i));
    s(i) = polyval(shpoly,h);
end
close all
plot(i_vec,s);
title('Terfenol-D Plunger Simulation')
grid on
xlabel('Current[A]')
ylabel('Plunger Strain [mm]')


