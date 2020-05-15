%This program used for dynamic simulatiob of a Terfenol-D Actuator using
%FEMM.
%% MATLAB Initiallization
format compact
close all
clc
CircName = 'Coil';
%% Open existing problem
openfemm;
opendocument('H:\Terfenol_D_Pneumatic_Valve\FEMM\Terfenol_Solenoid_2.FEM') %load FEMM problem
mi_setcurrent(CircName,10) %Set the current to 0
mi_analyze(0)
mi_loadsolution
mo_selectblock(15,50)
mo_blockintegral(2)
