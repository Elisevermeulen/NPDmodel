%Skeleton of an NPZD model in a water column

param.v = 0.042*24;                               %m*d^-1, transform from m*h^-1
param.D = 5*3600*24*10^-4;                        %m²*d^-1, transform from cm²*s^-1
param.dz = 2;
param.H_I = 20;                           %µmol photons*m^-2*d^-1
param.H_N = 0.0425;
param.I0 = 600*3600*12;                           %µmol photons*m^-2*d^-1, multiply with 12, assumption half a day of light.
param.kw = 0.045;                                 %m^-1
param.kp = 6*10^-14;                              %!!!!!, m²*cell, to zero better plot
param.m = 0.01*24;                                %d^-1
param.gmax = 0.04*24;                             %d^-1
param.z = 100;
param.Nb = 100;                                   %m
param.alpha = 1*10^-9;                            %mmol nutrients/cel
param.eta = 0.5;
param.n = param.z/param.dz;
n = param.n;

grid = param.dz*0.5:param.dz:2*param.z-param.dz*0.5;
grid_P = param.dz*0.5:param.dz:param.z-param.dz*0.5;
initial_Y = zeros(1,2*n);
initial_Y(1:n)=14*10^6; %10³ cell/m³, initial population density at every depth.
initial_Y(end) = 100;
time = 0:1:50;

[t,y] = ode45(@odefun_ex3, time, initial_Y, [], param);   %ode45(odefun, tspan, y0, options) -> options is not filled in here, so brackets and then parameters.


P = y(:,1:param.n);
N = y(:,param.n+1:2*param.n);

%% Surface plots
figure(1)

subplot(1,2,1)
surface(t,(grid_P), (P'))
set(gca,'YDir','reverse')
title('surfaceplot of phytoplankton (cell/m³)')
xlabel("Time (d)")
ylabel("Depth (m)")
shading flat

subplot(1,2,2)
surface(t,grid_P, N')
set(gca,'YDir','reverse')
title('surfaceplot of nutrients (mmol nutrient/m³)')
xlabel("Time (d)")
ylabel("Depth (m)")

shading flat
%Put on 'shading flat' to see the right figure! 

%% Line plots not used

I1 = LightFunction_2(P(140,:), param);

I = I1./(I1 + param.H_I);
N1 = N(140,:)./(N(140,:)+param.H_N);

figure(2)
plot(I, grid_P')
set(gca,'YDir','reverse')
hold on
plot(N1,grid_P', 'g')
xlabel('Light/nutrients')
ylabel('depth (m)')
hold off

figure(3)
plot(I1, grid_P')

figure(4)
plot(I1./param.H_I, grid_P')

%%
II = I./(I+param.H_I)

NN = N./(N+param.H_N)

figure(5)
plot(II(:,1),grid_P)
hold on
plot(NN(:,4), grid_P)

%%
figure(6)

subplot(3,2,1)
plot(P(:,1),grid)
%xlim([0 15])
hold on 
plot(N(:,1), grid)
ylim([0 100])
ylabel("Depth (m)")
xlabel("0 days")

set(gca, 'XAxisLocation', 'top')
set(gca, 'YDir','reverse')
hold off


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
