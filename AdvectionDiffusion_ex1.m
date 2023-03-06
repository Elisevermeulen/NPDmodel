%Skeleton of an NPZD model in a water column

%function [t, grid, y] = AdvectionDiffusion(dz)        %Write as a function to be able to vary dz easily.

u = 1;
D = 1;
dz = 5;
depth = 100;
n = depth/dz;
par = [u;D;dz;n]

grid = dz*0.5:dz:depth-dz*0.5;
initial = zeros(1,n);
initial(2)=10;
time = 0:0.5:400;

[t,y] = ode45(@odefun, time, initial, [], [par]);   %ode45(odefun, tspan, y0, options) -> options is not filled in here, so brackets and then parameters.

figure()
surface(t,grid,y')
set(gca,'YDir','reverse')
shading flat
xlabel('time (days)')
ylabel('depth watercolumn (m)')
title('Phytoplankton concentration (mass/volume)')
%end
%Put on 'shading flat' to see the right figure! 