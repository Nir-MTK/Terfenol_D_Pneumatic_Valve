%This program used for dynamic simulatiob of a Terfenol-D Actuator using
%FEMM.
%% MATLAB Initiallization
format compact
close all
clc
CircName = 'Coil';
%% 
i_vec =0:0.25:10 ;
%% Open existing problem
openfemm;

opendocument('H:\Terfenol_D_Pneumatic_Valve\FEMM\Terfenol_Solenoid_2.FEM') %load FEMM problem
for i = 1:length(i_vec)
mi_setcurrent(CircName,i_vec(i)) %Set the current to 0
mi_analyze(0)
mi_loadsolution
mo_selectblock(15,50)
AJ_sol = mo_blockintegral(0); 
A_sol(i) = mo_blockintegral(1);
AL_sol(i) =  mo_blockintegral(2);
RL_sol(i) =  mo_blockintegral(3);
end

plot(i_vec,A_sol)