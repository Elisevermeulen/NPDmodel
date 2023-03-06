%Skeleton of an NPZD model in a water column

param.v = 0.04*24;                                %m*d^-1, transform from m*h^-1
param.D = 5*3600*24*10^-4;                        %m²*d^-1, transform from cm²*s^-1
param.dz = 2;
param.H = 30*3600*24;                             %µmol photons*m^-2*d^-1
param.I0 = 600*3600*12;                           %µmol photons*m^-2*d^-1, multiply with 12, assumption half a day of light.
param.kw = 0.2;                                   %m^-1
param.kp = 15*10^-14;                             %m²*cell !!!!!
param.m = 0.01*24;                                %d^-1
param.gmax = 0.04*24;                             %d^-1
param.z = 100;                                    %m
n = param.z/param.dz;

grid = param.dz*0.5:param.dz:param.z-param.dz*0.5;
initial = zeros(1,n);
initial(:)=14*10^6;                               %10³ cell/m³, initial population density at every depth.
time = 0:1:400;

[t,y] = ode45(@odefun_L, time, initial, [], param);   %ode45(odefun, tspan, y0, options) -> options is not filled in here, so brackets and then parameters.

P = y';

figure(1)
surface(P) %converged, time at least 100, to see it converging
ylim([0 100])
title('Phytoplankton concentration (cells/m³)')
xlabel("Time (d)")
ylabel("Depth (m)")
set(gca,'YDir','reverse')

figure(2)

subplot(3,2,1)
plot(P(:,1),grid)
%xlim([0 15])
ylim([0 100])
ylabel("Depth (m)")
xlabel("0 days")

set(gca, 'XAxisLocation', 'top')
set(gca, 'YDir','reverse')

subplot(3,2,2)
plot(P(:,2),grid)
%xlim([0 15])
ylim([0 100])
xlabel("1 day")
set(gca, 'XAxisLocation', 'top')
set(gca, 'YDir','reverse')
ylabel("Depth (m)")

subplot(3,2,3)
plot(P(:,6),grid)
%xlim([0 15])
ylim([0 100])
ylabel("Depth (m)")
xlabel('5 days')
set(gca, 'XAxisLocation', 'top')
set(gca, 'YDir','reverse')

subplot(3,2,4)
plot(P(:,11),grid)
%xlim([0 15])
ylim([0 100])
set(gca, 'XAxisLocation', 'top')
set(gca, 'YDir','reverse')
xlabel("10 days")
ylabel("Depth (m)")

subplot(3,2,5)
plot(P(:,21),grid)
%xlim([0 15])
ylim([0 100])
ylabel("Depth (m)")
set(gca, 'XAxisLocation', 'top')
set(gca, 'YDir','reverse')
xlabel("20 days")

subplot(3,2,6)
plot(P(:,101),grid)
%xlim([0 15])
ylim([0 100])
set(gca, 'XAxisLocation', 'top')
set(gca, 'YDir','reverse')
xlabel("100 days")
ylabel("Depth (m)")

sgtitle("Phytoplankton (10³ cells/m³)")

%D small not lot of turbulence


%% Light plot
%put kp to *10^-10 instead of *10^-12, to see difference in light function
%plot
I1 = LightFunction_L(P(end,:), param);
I2 = LightFunction_L(0*P(end,:), param);

figure(3)
plot(I1(400,:), grid)
xlabel('Light (µmol photons/m²s)')
ylabel('depth (m)')
%legend('phytoplankton (cells/m³)')
hold on
plot(I2, grid, 'r')
set(gca, 'YDir','reverse')
title('penetrating light in absence/presence of phytoplankton')

hold off
legend('phytoplankton (cells/m³)', 'no phytoplankton')
