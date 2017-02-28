
close all
clear variables


rspec = 287.058;% J/(kg·K)
g = 9.81;

p1 = [1000,925,850,700];
p2 = [925,850,700,500];

T = [286,276,269,255];

dz = -rspec/g*T.*log(p2./p1);

z500 = sum(dz);


%% 

water_mass_fraction = 0.3/100;
% divide this in troposphere

dp_troposphere = 900*100; % Pa


water_average_p = 0.3*100; % Pa

rspec = 287.058;% J/(kg·K)

T = 273-15;


rho_water_vapour = water_average_p./(rspec*T); % kg/m3

column_height = 75000;
water_column_mass_m2 = rho_water_vapour*column_height;

rho_water_liquid = 1000; % kg/m3

water_column_height = water_column_mass_m2/rho_water_liquid





