%This program used for dynamic simulatiob of a Terfenol-D Actuator using
%FEMM.
%% MATLAB Initiallization
format compact
close all
clc
CircName = 'Coil';
%% 
i_vec =0.0:0.1:10 ;
%% Open existing problem
openfemm;

opendocument('H:\Terfenol_D_Pneumatic_Valve\FEMM\Terfenol_Solenoid_2.FEM') %load FEMM problem
for i = 1:length(i_vec)
mi_setcurrent(CircName,i_vec(i)) %Set the current to 0
mi_analyze(0)

mi_loadsolution
mo_selectblock(15,50)
mo_savebitmap(['Analyze_figs\' num2str(i_vec(i)) '.bmp']);
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
end
mo_makeplot(4)
%plot(i_vec,r_SS_LorentzForce_sol)
closefemm