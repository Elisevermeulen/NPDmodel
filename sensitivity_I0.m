%Sensitivity analysis I0

I0_vector= linspace(100*86400, 600*86400,4);
figure()
legende = strings(length(I0_vector),1);
colors = [0.3,0.9,0.8;0.3,0.7,0.5;0.3,0.6,0.1;0.3,0.3,0.4];

 
for i = 1:length(I0_vector)
    I0 = I0_vector(i);
    AdvectionDiffusion_sensitivity;
    subplot(2,2,1)
    plot(P(51,:),grid_P,col=colors(i,:))
    title('Sensitivity analysis of incident light intensity at day 50')
    xlabel('Phytoplankton concentration (cells/m³)')
    ylabel('Depth watercolumn (m)')
    set(gca,'YDir','reverse')
    legende(i) = (strcat('I0 = ', num2str(I0_vector(i))))
    hold on

    subplot(2,2,2)
    plot(P(801,:),grid_P,col=colors(i,:))
    title('Sensitivity analysis of incident light intensity at day 800')
    xlabel('Phytoplankton concentration (cells/m³)')
    ylabel('Depth watercolumn (m)')
    set(gca,'YDir','reverse')
    legende(i) = (strcat('I0 = ', num2str(I0_vector(i))))
    hold on

    subplot(2,2,3)
    plot(N(51,:),grid_P, col=colors(i,:))
    title('Sensitivity analysis of incident light intensity at day 50')
    xlabel('Nutrient concentration (mmol/m³)')
    ylabel('Depth watercolumn (m)')
    set(gca,'YDir','reverse')
     legende(i) = (strcat('I0 = ', num2str(I0_vector(i))))
    hold on

     subplot(2,2,4)
    plot(N(801,:),grid_P,col=colors(i,:))
   title('Sensitivity analysis of incident light intensity at day 800')
    xlabel('Nutrient concentration (mmol/m³)')
    ylabel('Depth watercolumn (m)')
    set(gca,'YDir','reverse')
    legende(i) = (strcat('I0 = ', num2str(I0_vector(i))))
    hold on
end
legend(legende)