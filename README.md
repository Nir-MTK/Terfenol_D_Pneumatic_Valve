# Terfenol_D_Pneumatic_Valve
 
=============================
## 1. Description

This Code was developed in order to create a dynamic simulation and analysis of
Terfenol-D, using MATLAB and FEMM software. The code solving FEMM problem for
different current value, and save FEMM resoults in MATLAB workspace.


The code was written as part of Mechanical Engineering Final Project,
at Afeka College of Engineering, Israel.

## 2. Features

**- Modeling Terfenol-D Magnetostrictive behavior** for Different Pre-stress Values  
**- Modeling Terfenol-D B-H curve** for Different Pre-stress Values
**- Optimising Polinomial Fitting Order** for any required Polyfit
**- Analyze full magnetostriction problem for Terfevarfenol-D** for varieties of currents ranges
  
## 3. FrameWork

The code was written using MATLAB R2016b Frameworks.
Analysis using FEMM 4.2

## 4. Requirements

To use the program, a FEMM problem file should be pre-created.
FEMM is Finite Element Method Magnetics free software, 
and it can be downloadedd from the link below:

(http://www.femm.info/wiki/Download)

For more info, check FEMM Homepage:

(http://www.femm.info/wiki/HomePage)

## 5. How to use

1. **Create a FEMM problem** and save it
2. **run __TD_BH_Curve3.m__ file**. The code will create B-H curve values, which shoukd be insert to FEMM while defining 
"new material" (Terfenol-D)
3. **Open __Main_Code.m__ file** and defined the parameters according to your purposes
4. **Run  __Main_Code.m__ file**

## 6. Project Status
** Done! ** Yet, the code need a little bit of modifications for more robust abilities

## 7. Credits

Written by **Nir Maatuk**

## 8. Contact
Nir Maatuk - Nir.MTK@Gmail.com




## 6.License
GNU General Public License v3.0



