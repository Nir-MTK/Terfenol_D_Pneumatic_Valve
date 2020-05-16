function femm_ref
% This proram calculates the force and flux of a solenoid.
% The program uses OctaveFEMM toolbox  which enables to write all commands in MATLAB form.
% The MATLAB code includes explanations to all OctaveFEMM functions.
% These functions are designated as "mi_functionname" for the preprocessor commands,
% and as "mo_functionname" for the postprocessor commands.
% Whenever a function is used more than one time it is indicated by the words "defined previously"
% The inputs to the program are as follows:
% - Magnetic gap vector
% - Electrical current vector
% - Solenoid drawing
% - Material of the solenoid parts
% - Number of the windings of the coil
% The output of the program is a file including a matrix of the following parameters:
% - Magnetic gap (mm)
% - Electrical current (Amp)
% - Magnetic force (N)
% - Magnetic flux (Wb)


outt=[];
%
  gap_vec=[2:-0.2:0.2 0.01];
  gap_vec=[1 ];
  % gap vector
  %
  isol_vec=0:0.25:3 ;
  isol_vec=1;
  % electrical current vector
  %
n_coil=806;
% number of coils
%
type='ref_1';
%solenoid type. ref_1, external spring; ref_2,PH(Predetor Hawk) valve, two springs, both installed in the plunger
% and in the body
flag=0 ;
% flag=0, drawing the solenoid only
% flag=1, runs the gap_vector and the current vector. Saaving results to a file
%
for mmm=1:length(gap_vec)
    tic
    disp(mmm)
gap=gap_vec(mmm);
out=femm_test(gap,mmm,isol_vec,n_coil,type,flag);
outt=[outt; out];
if flag==1
%closefemm
end
toc
end
outt
 save res_femm_ref.txt outt -ascii
 % saving results to a file named res_ref.txt

function out=femm_test(gap,mmm,isol_vec,n_coil,type,flag);
flag_geom=type
%define solenoid type
gap
%
       if flag_geom=='ref_1'

   xy_plunger=[...
               3 24.8;...
               6.1 24.8;...
               6.1 19.1;...
               9.0 19.1;...
               14.45 19.1;...
               14.45 45.3;...
               6.1 45.3;...
               6.1 26.6;...
               3 26.6;...
               ];
  % plunger coordinates
  %
           
           xy_body=[...
        0 5;...
        0  7.8;...
        6.1 7.8;...
        6.1 19.1;...
        9.0 19.1;...
        14.5 19.1;...
        14.5 49.8;...
        25.3 49.8;...
        25.3 45;...
        29 45;...
        29 40;...
        30 40;...
        30 30;...
        30 30;...
        30 0;
         0 0;...
        ];
%
%body coordinates

   
  



elseif flag_geom=='ref_2'

   xy_plunger=[...
               0    19.0;
               14.5 19.0;...
               14.5 47.4;...
               0 47.4;
               ]; 
  %
 % plunger coordinates
           
           xy_body=[...
          0  19;
      14.5 19;...
      14.5 4;
       24.2  4;
       24.2 38;
       14.51 38;
       14.51 47
        30 47;...
         30 0;...
          0  0;        
 ];

%body coordinates
%
   
  
end







xy_coil=[...
            17.4 6;...
            24.2 6;...
            24.2 36;...
            17.4 36;...
            ];
%coil ooordinates
        %
xy_coil_sleeve=[...
                   15.5 4;...
                   24.2 4;...
                   24.2  6;...           
                   17.4  6;...
                   17.4  36;...
                   24.2  36;...
                   24.2 38;...
                   15.5  38;...
                   ];
%coil sleeve coordinates              

xyc=[xy_coil(:,1)/2 xy_coil(:,2)];

xycs=[xy_coil_sleeve(:,1)/2 xy_coil_sleeve(:,2)];
xyp=[xy_plunger(:,1)/2 xy_plunger(:,2)+gap];
xyb= [xy_body(:,1)/2 xy_body(:,2)];

openfemm
newdocument(0)
% newdocument(doctype) Creates a new preprocessor document and opens up a new preprocessor
% window. Specify doctype to be 0 for a magnetics problem, 1 for an electrostatics
% problem, 2 for a heat flow problem, or 3 for a current flow problem. Alternative syntax for
% this function is create(doctype)
%

u0=4*pi*1.e-7;
% Air Permeability
%
mm2m=1.e-3;
% Conversion of mm to m.
%
mi_probdef(0,'millimeters','axi',1e-8,0,30,0);
%
% mi probdef(freq,units,type,precision,depth,minangle,(acsolver)) changes the
% problem definition. Set freq to the desired frequency in Hertz. The units parameter specifies
% the units used for measuring length in the problem domain. Valid ’units’ entries
% are ’inches’, ’millimeters’, ’centimeters’, ’mils’, ’meters’, and ’micrometers’.
% Set the parameter problemtype to ’planar’ for a 2-D planar problem, or to ’axi’ for an
% axisymmetric problem. The precision parameter dictates the precision required by the
% solver. For example, entering 1E-8 requires the RMS of the residual to be less than 10?8.
% A fifth parameter, representing the depth of the problem in the into-the-page direction for
% 2-D planar problems. Specify the depth to be zero for axisymmetric problems. The sixth
% parameter represents the minimum angle constraint sent to the mesh generator – 30 degrees
% is the usual choice for this parameter. The acsolver parameter specifies which solver is to be
% used for AC problems: 0 for successive approximation, 1 for Newton.



%
mi_zoom(0,-40,40,40);
%
%mi zoom(x1,y1,x2,y2) Set the display area to be from the bottom left corner specified by
%(x1,y1) to the top right corner specified by (x2,y2).

 mi_addnode([0 0  0 70],[-70 0 70 0] );
 % mi addnode(x,y) Add a new node at x,y
 %
mi_addsegment(0,-70,0,0)
%
%mi addsegment(x1,y1,x2,y2) Add a new line segment from node closest to (x1,y1) to
%node closest to (x2,y2)
%
mi_addsegment(0,0,0,70) % defined previously
%
 mi_addarc(0,-70,70,0,90,10);
%
% mi addarc(x1,y1,x2,y2,angle,maxseg) Add a new arc segment from the nearest node
% to (x1,y1) to the nearest node to (x2,y2) with angle ‘angle’ divided into ‘maxseg’ segments.
%
mi_addarc(70,0,0,70,90,10); % defined previously
%
mi_showgrid
% mi_showgrid Show the grid points

mi_addboundprop('boundary1', 0, 0, 0, 0, 0, 0, 1/(u0*50*mm2m), 0, 2);
%
% mi addboundprop(’propname’, A0, A1, A2, Phi, Mu, Sig, c0, c1, BdryFormat)
% adds a new boundary property with name ’propname’
% – For a “Prescribed A” type boundary condition, set the A0, A1, A2 and Phi parameters
% as required. Set all other parameters to zero.
% – For a “Small Skin Depth” type boundary condtion, set the Mu to the desired relative
% permeability and Sig to the desired conductivity in MS/m. Set BdryFormat to 1 and
% all other parameters to zero.
% – To obtain a “Mixed” type boundary condition, set C1 and C0 as required and BdryFormat
% to 2. Set all other parameters to zero.
% 10
% – For a “Strategic dual image” boundary, set BdryFormat to 3 and set all other parameters
% to zero.
% – For a “Periodic” boundary condition, set BdryFormat to 4 and set all other parameters
% to zero.
% – For an “Anti-Perodic” boundary condition, set BdryFormat to 5 set all other parameters
% to zero.

%
mi_selectarcsegment(0,50);
%
% Select the arc segment closest to (x,y)
%
mi_setarcsegmentprop(10, 'boundary1', 0, 0)
%
%mi setarcsegmentprop(maxsegdeg, ’propname’, hide, group) Set the selected arc
% segments to:
% – Meshed with elements that span at most maxsegdeg degrees per element
% – Boundary property ’propname’
% – hide: 0 = not hidden in post-processor, 1 == hidden in post processor
% – A member of group number group

     %
     mi_selectarcsegment(0,-50); %defined previously
     %
     mi_setarcsegmentprop(10, 'boundary1', 0, 0) % %defined previously
     %
     %            

%
name1='Air';
name2='AWG 29';
name3='430F';
%name3='1020';
name4='Teflon';

 mi_addmaterial(name1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0,0);
 %
%   mi getmaterial(’materialname’) fetches the material specified by materialname from
% the materials library.
% mi addmaterial(’matname’, mu x, mu y, H c, J, Cduct, Lam d, Phi hmax, lam fill,
% LamType, Phi hx, Phi hy, nstr, dwire) adds a new material with called ’matname’
% with the material properties:
% – mu x Relative permeability in the x- or r-direction.
% – mu y Relative permeability in the y- or z-direction.
% – H c Permanent magnet coercivity in Amps/Meter.
% – J Applied source current density in Amps/mm2
% .
% 9
% – Cduct Electrical conductivity of the material in MS/m.
% – Lam d Lamination thickness in millimeters.
% – Phi hmax Hysteresis lag angle in degrees, used for nonlinear BH curves.
% – Lam fill Fraction of the volume occupied per lamination that is actually filled with
% iron (Note that this parameter defaults to 1 in the femm preprocessor dialog box because,
% by default, iron completely fills the volume)
% – Lamtype Set to
% ? 0 – Not laminated or laminated in plane
% ? 1 – laminated x or r
% ? 2 – laminated y or z
% ? 3 – magnet wire
% ? 4 – plain stranded wire
% ? 5 – Litz wire
% ? 6 – square wire
% – Phi hx Hysteresis lag in degrees in the x-direction for linear problems.
% – Phi hy Hysteresis lag in degrees in the y-direction for linear problems.
% – nstr Number of strands in the wire build. Should be 1 for Magnet or Square wire.
% – dwire Diameter of each of the wire’s constituent strand in millimeters.
% Note that not all properties need be defined – properties that aren’t defined are assigned
% default values.
%
mi_addmaterial(name2, 1, 1, 0, 0, 58*0.65, 0, 0, 1, 0, 0, 0,0);
%
mi_addmaterial(name3, 409, 409, 0, 0, 0, 0, 0, 1, 0, 0, 0,0);
%
 mi_addmaterial(name4, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0,0);
 %
bhcurve_1020 = [ 0.,0.3,0.8,1.12,1.32,1.46,1.54,1.62,1.74,1.87,1.99,2.046,2.08; 
0, 40, 80, 160, 318, 796, 1590, 3380, 7960, 15900, 31800, 55100, 79600]';
%
bhcurve_430f=[2.004e-001  6.008e-001  1.102e+000  1.386e+000  1.465e+000  1.6675480e+000  1.7895090e+000  1.8782090e+000  2.08e+000;
  3.1831e+002  6.3662e+002  1.59155e+003  4.77465e+003  7.95775e+003  3.2902233e+004  9.2585397e+004  1.6068535e+005  3.1831e+005]';
%
mi_addbhpoints(name3, bhcurve_430f);
%
% mi addbhpoint(’blockname’,b,h) Adds a B-H data point the the material specified by
% the string ’blockname’. The point to be added has a flux density of b in units of Teslas and
% a field intensity of h in units of Amps/Meter
%
%mi_addbhpoints(name3, '1020',bhcurve_1020);
%
  mi_addblocklabel(11,17);
  %
  % Add a new block label at (x,y)
  %
mi_selectlabel(11,17);
% mi selectlabel(x,y) Select the label closet to (x,y). Returns the coordinates of the selected
% label.

mi_setblockprop(name2, 0, 1, 'coil', 0, 0, n_coil);
%
% • mi setblockprop(’blockname’, automesh, meshsize, ’incircuit’, magdir, group,
% turns) Set the selected block labels to have the properties:
% – Block property ’blockname’.
% – automesh: 0 = mesher defers to mesh size constraint defined in meshsize, 1 = mesher
% automatically chooses the mesh density.
% – meshsize: size constraint on the mesh in the block marked by this label.
% – Block is a member of the circuit named ’incircuit’
% – The magnetization is directed along an angle in measured in degrees denoted by the
% parameter magdir
% – A member of group number group
% – The number of turns associated with this label is denoted by turns.
%

     mi_clearselected
%
% Clear all selected nodes, blocks, segments and arc segments
%

    %
   mi_addblocklabel(30,20); % defined previously
   %
      mi_selectlabel(30,20); %defined previously
      %
mi_setblockprop(name1, 0, 2, '<None>', 0, 0, 0); % defined previously
%
mi_clearselected %defined previously
%
     mi_addblocklabel(6,12.4); % defined previously
     mi_selectlabel(6,12.4);   % defined previously
mi_setblockprop(name3, 0, 1, '<None>', 0, 0, 0); %defined previously
%
mi_clearselected %defined previously
%
     mi_addblocklabel(6,30);% defined previously
      mi_selectlabel(6,30);% defined previously
mi_setblockprop(name3, 0, 1, '<None>', 0, 0, 0);% defined previously
%
mi_clearselected %defined previously
%

     mi_addblocklabel(8,10);% defined previously
      mi_selectlabel(8,10);% defined previously
mi_setblockprop(name4, 0, 1, '<None>', 0, 0, 0);% defined previously
%
mi_clearselected %defined previously

   % draw  solenoid
mi_drawpolygon(xyc); % draws coil
%
% mi drawpolygon([x1,y1;x2,y2’...]) Adds nodes at each of the specified points and
% connects them with segments to form a closed contour.
%
mi_drawpolygon(xyp); % draws plunger. defined previously
mi_drawpolygon(xyb); % draws body. defined previously
mi_drawpolygon(xycs); %draws coil sleeve. defined previously
%

%
 mi_setgrid(2.5,'cart');
%  • mi_setgrid(density,’type’) Change the grid spacing. The density parameter speci-
% fies the space between grid points, and the type parameter is set to ’cart’ for cartesian
% coordinates or ’polar’ for polar coordinates.

         mi_showgrid %defined previously
  if flag==0
      return
  end
 mi_zoomnatural
 %
 %mi zoomnatural zooms to a “natural” view with sensible extents
 %
  mi_saveas('test.fem');
  %
%mi saveas(’filename’) saves the file with name ’filename’.
%
ress=[];
   for jj=1:length(isol_vec)
        isol=isol_vec(jj)
     mi_addcircprop('coil', isol, 1);
     %
% mi addcircprop(’circuitname’, i, circuittype)
% adds a new circuit property with name ’circuitname’ with a prescribed current. The
% circuittype parameter is 0 for a parallel-connected circuit and 1 for a series-connected
% circuit.
%
     mi_analyze(0)
     %
% mi analyze(flag) runs the magnetics solver. The flag parameter controls whether the
% solver window is visible or minimized. For a visible window, either specify no value for
% flag or specify 0. For a minimized window, flag should be set to 1.
%
mi_loadsolution
%
%mi_loadsolution loads and displays the solution corresponding to the current geometry.
mo_selectblock(5,30)
%
%mo selectblock(x,y) Select the block that contains point (x,y).
%
forcee=-mo_blockintegral(19);
%
% mo blockintegral(type) Calculate a block integral for the selected blocks
% Type Definition
% 0 A· J
% 1 A
% 2 Magnetic field energy
% 3 Hysteresis and/or lamination losses
% 4 Resistive losses
% 5 Block cross-section area
% 6 Total losses
% 7 Total current
% 8 Integral of Bx (or Br) over block
% 9 Integral of By (or Bz) over block
% 10 Block volume
% 11 x (or r) part of steady-state Lorentz force
% 12 y (or z) part of steady-state Lorentz force
% 13 x (or r) part of 2? Lorentz force
% 14 y (or z) part of 2? Lorentz force
% 15 Steady-state Lorentz torque
% 16 2? component of Lorentz torque
% 17 Magnetic field coenergy
% 18 x (or r) part of steady-state weighted stress tensor force
% 19 y (or z) part of steady-state weighted stress tensor force
% 20 x (or r) part of 2? weighted stress tensor force
% 21 y (or z) part of 2? weighted stress tensor force
% 22 Steady-state weighted stress tensor torque
% 23 2? component of weighted stress tensor torque
% 24 R
% 2
% (i.e. moment of inertia / density)
% •

qq=23;
mo_addcontour(0,qq)
%
% mo addcontour(x,y) Adds a contour point at (x,y). If this is the first point then it starts a
% contour, if there are existing points the contour runs from the previous point to this point.
% The mo addcontour command has the same functionality as a right-button-click contour
% point addition when the program is running in interactive mode.
%
 mo_addcontour(7.25,qq);


flux1=mo_lineintegral(0);
%
% mo lineintegral(type) Calculate the line integral for the defined contour
% type name values 1 values 2 values 3 values 4
% 0 B.n total B.n avg B.n - -
% 1 H.t total H.t avg H.t - -
% 2 Contour length surface area - -
% 3 Stress Tensor Force DC r/x force DC y/z force 2? r/x force 2? y/z force
% 4 Stress Tensor Torque DC torque 2? torque - -
% 5 (B.n)ˆ2 total (B.n)ˆ2 avg (B.n)ˆ2 - -
% 13
% Returns typically two values. The first value is the result of the integral calculation, and the
% second value is the average of the quantity of interest over the contour. The only exception
% is integral 3, which evaluates Maxwell’s stress tensor. This integral can return up to four
% results. For force and torque results, the 2? results are only relevant for problems where
% ? 6= 0.
%
fluxx=flux1(1);
 ress=[ress; [mmm gap isol  fluxx   forcee]];
    end
     out=ress;

