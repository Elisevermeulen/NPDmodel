%Sensitivity analysis

mortality_vector= [0.24 0.5 0.7 1];
figure()
legende = strings(length(mortality_vector),1);
colors = [0.3,0.9,0.8;0.3,0.7,0.5;0.3,0.6,0.1;0.3,0.3,0.4];

 
for i = 1:length(mortality_vector)
    m = mortality_vector(i);
    AdvectionDiffusion_sensitivity;
    subplot(2,2,1)
    plot(P(101,:),grid_P,col=colors(i,:))
    title('Sensitivity analysis of mortality at day 100')
    xlabel('Phytoplankton concentration (cells/m³)')
    ylabel('Depth watercolumn (m)')
    xlim([-2*10^9 14*10^9])
    set(gca,'YDir','reverse')
    legende(i) = (strcat('m =', num2str(mortality_vector(i))))
    hold on

    subplot(2,2,2)
    plot(P(801,:),grid_P,col=colors(i,:))
    title('Sensitivity analysis of mortality at day 800')
    xlabel('Phytoplankton concentration (cells/m³)')
    ylabel('Depth watercolumn (m)')
    set(gca,'YDir','reverse')
    legende(i) = (strcat('m =', num2str(mortality_vector(i))))
    hold on

    subplot(2,2,3)
    plot(N(101,:),grid_P, col=colors(i,:))
    title('Sensitivity analysis of mortality at day 100')
    xlabel('Nutrient concentration (mmol/m³)')
    ylabel('Depth watercolumn (m)')
    set(gca,'YDir','reverse')
    legende(i) = (strcat('m =', num2str(mortality_vector(i))))
    hold on

     subplot(2,2,4)
    plot(N(801,:),grid_P,col=colors(i,:))
    title('Sensitivity analysis of mortality at day 800')
    xlabel('Nutrient concentration (mmol/m³)')
    ylabel('Depth watercolumn (m)')
    set(gca,'YDir','reverse')
    legende(i) = (strcat('m =', num2str(mortality_vector(i))))
    hold on
end
legend(legende)