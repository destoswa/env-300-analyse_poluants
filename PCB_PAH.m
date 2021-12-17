clear all;
close all;
clc;
set(0,'DefaultFigureWindowStyle','docked');
load('data_PCB_PAH.mat');
load('data_PCB_old.mat');

% -------------------------------------------------------------------------
% Plotting the graphs for all PCB
% -------------------------------------------------------------------------

fig_PCB_all = figure(1);
PCB_concentrations = zeros(12,13);
%     PCB_concentrations_Unite = zeros(12,13);
%for each PCB:
for i=1:12
    pl = polyfit([PCB_calibrate(i,1) PCB_calibrate(i,3) PCB_calibrate(i,5) PCB_calibrate(i,7)],[PCB_calibrate(i,2) PCB_calibrate(i,4) PCB_calibrate(i,6) PCB_calibrate(i,8)],1);
    x = linspace(PCB_calibrate(i,1),PCB_calibrate(i,7),200);
    PCB_concentrations(i,:) = (PCB_datas(i,:))./pl(1);
%     PCB_concentrations_Unite(i,:) = PCB_concentrations(i,:)*0.946/5000;
    subplot(4,3,i);
    %linear regression
    lr = plot(x,pl(1)*x,'-','color','red','LineWidth',1.2);
    hold on
    %calibrating values
    plot(PCB_calibrate(i,1:2:end),PCB_calibrate(i,2:2:end),'o',...
        'color','black','Markersize',4,'MarkerFaceColor','black');
    %data values
    plot((PCB_datas(i,:))./pl(1),PCB_datas(i,:),'*','color','blue'...
        ,'markersize',8);
    hold off
    title(PCB_elements(i));
    legend('calibrating values','linear regression','Measured values','location','northwest');
    xlabel('Concentration [ng/ml]');
    ylabel('Surface');
    xmax = max([PCB_datas(i,:)./pl(1) PCB_calibrate(i,1:2:end)]);
    xlim([0 xmax*1.05]);
    ymax = max([PCB_datas(i,:) PCB_calibrate(i,2:2:end)]);
    ylim([0 ymax*1.05]);
end
suptitle('All PCBs detected in the sites of interest');
% % % % % % % saveas(fig_PCB_all,'./figures/PCB_all.png');ne pas lancer cette ligne de code!!!

% -------------------------------------------------------------------------
% Computing and plotting of total PCBs:
% -------------------------------------------------------------------------
PCB_totaux = zeros(13,1);
PCB_totaux = sum(PCB_concentrations);
PCB_totaux = PCB_totaux*0.946/5;
fig_PCB_Tot = figure(2);
bar(PCB_totaux)
Y = round(PCB_totaux,2);
text(1:length(Y),Y,num2str(Y'),'vert','bottom','horiz','center'); 
title('PCB totaux 2021');
set(gca,'XTickLabel',PCBPAHgroupNames);
ylabel('Concentration [ng/g]');
ylim([0 max(Y)*1.2]);
grid on
grid minor
% saveas(fig_PCB_Tot,'./figures/PCB_Totaux_2021.png');

% -------------------------------------------------------------------------
% Computing of total PCBs over time
% -------------------------------------------------------------------------
%  Computing of total PCBs for 2019:
pl = zeros(size(PCB_2019_calibrate,1),2);
for i=1:size(pl,1)
    pl(i,:) = polyfit(PCB_2019_calibrate(i,1:2:end),PCB_2019_calibrate(i,2:2:end),1);
end
% x = linspace(0,50,200);
% y = x.*pl(:,1);
% plot(x,y);
PCB_2019_concentrations = diag(1./pl(:,1))*PCB_2019_datas;
PCB_2019_tot = sum(PCB_2019_concentrations,1)*0.946/5;
PCB_2019_tot_mean = [PCB_2019_tot(1),mean([PCB_2019_tot(2) PCB_2019_tot(3)])...
    ,PCB_2019_tot(4),PCB_2019_tot(5),PCB_2019_tot(6),mean([PCB_2019_tot(7)...
    PCB_2019_tot(8)]),PCB_2019_tot(9),mean([PCB_2019_tot(10),PCB_2019_tot(11)])];
% Computing of total PCBs for 2021 (adjusted to match with other years):
PCB_2021_tot_mean = [PCB_totaux(1),PCB_totaux(2),PCB_totaux(13),...
    mean([PCB_totaux(3) PCB_totaux(4)]),PCB_totaux(5),mean([PCB_totaux(11)...
    PCB_totaux(12)]),mean([PCB_totaux(6) PCB_totaux(7)]),PCB_totaux(8)];
% Computing matice with all values:
PCB_totaux_ot = zeros(size(PCB_tot_08to16,1)+2,size(PCB_tot_08to16,2));
PCB_totaux_ot(3:end,:) = PCB_tot_08to16;
PCB_totaux_ot(1,:) = PCB_2021_tot_mean;
PCB_totaux_ot(2,:) = PCB_2019_tot_mean;
PCB_totaux_ot = flipud(PCB_totaux_ot);
PCB_totaux_ot_years = [flipud(PCB_tot_08to16_years)' 2019 2021];
%removing an absurd value
PCB_totaux_ot(10,5) = 0;
% Plotting the graph for the total PCBs over the year
fig_PCB_over_time = figure(12);
for i=1:size(PCB_totaux_ot,2)
   subplot(4,2,i)
%    plot(PCB_totaux_ot_years, PCB_totaux_ot(:,i),'x','MarkerSize',12);
%    bar(PCB_totaux_ot_years, PCB_totaux_ot(:,i));
   bar(PCB_totaux_ot(:,i));
   hold on
   ylabel('Concentration [ng/g]');
   title(extractAfter(PCB_tot_08to16_groupNames(i),'x'));
   Y = round(PCB_totaux_ot(:,i),2);
   text(1:length(Y),Y,num2str(Y),'vert','bottom','horiz','center');
   hold off
   set(gca,'XTickLabel',PCB_totaux_ot_years);
   ylim([0 max(PCB_totaux_ot(:,i))*1.2]);
   ylim([0 32]);
   if i == 5
      ylim([0 32]); 
   end
end
suptitle('Total concentration of PCBs over the years for each group');
% saveas(fig_PCB_over_time,'./figures/PCB_tot_over_time.png');
% -------------------------------------------------------------------------
% Plotting the graph for the 3 PCB of interest
% -------------------------------------------------------------------------
fig_PCB_ofInterest = figure(3);
for i=7:9
    pl = polyfit(PCB_calibrate(i,1:2:end),PCB_calibrate(i,2:2:end),1);
    x = linspace(0,PCB_calibrate(i,7),200);
    subplot(2,3,i-6);
    %linear regression
    lr = plot(x,pl(1)*x,'-','color','red','LineWidth',1.2);
    hold on
    %calibrating values
    plot(PCB_calibrate(i,1:2:end),PCB_calibrate(i,2:2:end),'o',...
        'color','black','Markersize',4,'MarkerFaceColor','black');
    %data values
    plot((PCB_datas(i,:))./pl(1),PCB_datas(i,:),'*','color','blue'...
        ,'markersize',8);
    plot(PCB_datas(i,1)/pl(1),PCB_datas(i,1),'o','markersize',6,...
        'MarkerFaceColor',[.0 1 .0],'MarkerEdgeColor',[.0 .3 .0]);
    hold off
    title(PCB_elements(i));
    legend('linear regression','calibrating values','Measured values',"1M's value",'location','northwest');
    xlabel('Concentration [ng/ml]');
    ylabel('Surface');
    xmax = max([PCB_datas(i,:)./pl(1) PCB_calibrate(i,1:2:end)]);
    xlim([0 xmax*1.05]);
    ymax = max([PCB_datas(i,:) PCB_calibrate(i,2:2:end)]);
    ylim([0 ymax*1.05]);
end
%zoom for our data:
for i=7:9
    pl = polyfit(PCB_calibrate(i,1:2:end),PCB_calibrate(i,2:2:end),1);
    x = linspace(0,PCB_calibrate(i,7),200);
    subplot(2,3,i-3);
    %linear regression
    lr = plot(x,pl(1)*x,'-','color','red','LineWidth',1.2);
    hold on
    %calibrating values
    plot(PCB_calibrate(i,1:2:end),PCB_calibrate(i,2:2:end),'o',...
        'color','black','Markersize',4,'MarkerFaceColor','black');
    %data values
    plot(PCB_datas(i,:)./pl(1),PCB_datas(i,:),'*','color','blue'...
        ,'markersize',6);
    %enlighting our result:
    x_1M = PCB_datas(i,1)/pl(1);
    y_1M = PCB_datas(i,1);
    color = [.3 .3 .3];
    plot([0 x_1M],[y_1M y_1M],'--','color',color,'LineWidth',1,'HandleVisibility','off');
    plot([x_1M x_1M],[0 y_1M],'--','color',color,'LineWidth',1,'HandleVisibility','off');
    plot(PCB_datas(i,1)/pl(1),PCB_datas(i,1),'o','markersize',6,...
        'MarkerFaceColor',[.0 1 .0],'MarkerEdgeColor',[.0 .3 .0]);
    text(x_1M*1.1,y_1M/2,[num2str(round(x_1M,3)) ' ng/ml']...
        ,'color',color,'Fontsize',12,'Fontweight','bold');
    hold off
    title('zoom');
    legend('linear regression','calibrating values','Measured values',...
        "1M's value",'location','northwest');
    xlabel('Concentration [ng/ml]');
    ylabel('Surface');
    xlim([0 3*x_1M]);
    ylim([0 2*y_1M]);
end
suptitle('PCB of interest for group 1M');
% saveas(fig_PCB_ofInterest,'./figures/PCB_ofInterest.png');

% -------------------------------------------------------------------------
% Plotting the graph for all PAH:
% -------------------------------------------------------------------------
PAH_concentrations = zeros(16,13);
fig_PAH_all = figure(4);
for i=4:16
    pl = polyfit(PAH_calibrate(i,1:2:end),PAH_calibrate(i,2:2:end),1);
    x = linspace(PAH_calibrate(i,1),PAH_calibrate(i,11),200);
    PAH_concentrations(i,:) = (PAH_datas(i,:))./pl(1);
    subplot(5,3,i-3);
    plot(x,pl(1)*x,'-','color','red','LineWidth',1.2);
    hold on
    plot(PAH_calibrate(i,1:2:end),PAH_calibrate(i,2:2:end),'o',...
    'color','black','Markersize',4,'MarkerFaceColor','black');
    plot((PAH_datas(i,:))./pl(1),PAH_datas(i,:),'*','color','blue'...
    ,'markersize',8);
%     plot(PAH_calibrate(i,1:2:end),PAH_calibrate(i,2:2:end),'d','color','blue');
%     hold on
%     plot(x,pl(1)*x,'-','color','blue');
%     plot((PAH_datas(i,:))./pl(1),PAH_datas(i,:),'x','color','red');
    hold off
    legend('calibrating values','linear regression','Measured values','location','northwest');
    xmax = max([PAH_datas(i,:)./pl(1) PAH_calibrate(i,1:2:end)]);
    xlim([0 xmax*1.05]);
    ymax = max([PAH_datas(i,:) PAH_calibrate(i,2:2:end)]);
    ylim([0 ymax*1.05]);
    title(PAH_elements(i));
    xlabel('Concentration [ng/ml]');
    ylabel('Surface');
end
suptitle('All PAHs detected in the sites of interest');
% % % % % % % saveas(fig_PAH_all,'./figures/PAH_all.png');ne pas lancer cette ligne de code!!!

% -------------------------------------------------------------------------
% Computation and plotting of total PAHs:
% -------------------------------------------------------------------------
PAH_totaux = zeros(13,1);
PAH_totaux = sum(PAH_concentrations);

fig_PAH_Tot = figure(5);
bar(PAH_totaux)
Y = round(PAH_totaux,2);
text(1:length(Y),Y,num2str(Y'),'vert','bottom','horiz','center'); 
title('PAH totaux 2021');
set(gca,'XTickLabel',PCBPAHgroupNames);
ylabel('Concentration [ng/ml]');
grid on
grid minor
% saveas(fig_PAH_Tot,'figures/PAH_Totaux.png');

% -------------------------------------------------------------------------
% Plotting the graph for the 6 PAH of interest
% -------------------------------------------------------------------------
fig_PAH_interest = figure(6);
for i=4:10
    if i ~= 9
        pl = polyfit(PAH_calibrate(i,1:2:end),PAH_calibrate(i,2:2:end),1);
        x = linspace(0,PAH_calibrate(i,11),200);
        if i == 10
            subplot(6,2,11);
        else
            subplot(6,2,(i-3)*2-1);
        end
        plot(x,pl(1)*x,'-','color','red','LineWidth',1.2);
        hold on
        plot(PAH_calibrate(i,1:2:end),PAH_calibrate(i,2:2:end),'o',...
        'color','black','Markersize',4,'MarkerFaceColor','black');
        plot((PAH_datas(i,:))./pl(1),PAH_datas(i,:),'*','color','blue'...
        ,'markersize',8);
        plot(PAH_datas(i,1)/pl(1),PAH_datas(i,1),'o','markersize',6,...
        'MarkerFaceColor',[.0 1 .0],'MarkerEdgeColor',[.0 .3 .0]);
        hold off
        title(PAH_elements(i));
        legend('calibrating values','linear regression','Measured values',"1M's value",'location','northwest');
        xlabel('Concentration [ng/ml]');
        xmax = max([PAH_datas(i,:)./pl(1) PAH_calibrate(i,1:2:end)]);
        xlim([0 xmax+100]);
        ymax = max([PAH_datas(i,:) PAH_calibrate(i,2:2:end)]);
        ylim([0 ymax*1.05]);
        ylabel('Surface');
    end
end
%zoom on our data
for i=4:10
    if i ~= 9
        pl = polyfit(PAH_calibrate(i,1:2:end),PAH_calibrate(i,2:2:end),1);
        x = linspace(0,PAH_calibrate(i,11),200);
        if i == 10
            subplot(6,2,12);
        else
            subplot(6,2,(i-3)*2);
        end
        plot(x,pl(1)*x,'-','color','red','LineWidth',1.2);
        hold on
        plot(PAH_calibrate(i,1:2:end),PAH_calibrate(i,2:2:end),'o',...
        'color','black','Markersize',4,'MarkerFaceColor','black');
        plot((PAH_datas(i,:))./pl(1),PAH_datas(i,:),'*','color','blue'...
        ,'markersize',8);
        %enlighting our result:
        x_1M = PAH_datas(i,1)/pl(1);
        y_1M = PAH_datas(i,1);
        color = [.3 .3 .3];
        plot([0 x_1M],[y_1M y_1M],'--','color',color,'LineWidth',1,'HandleVisibility','off');
        plot([x_1M x_1M],[0 y_1M],'--','color',color,'LineWidth',1,'HandleVisibility','off');
        plot(PAH_datas(i,1)/pl(1),PAH_datas(i,1),'o','markersize',6,...
        'MarkerFaceColor',[.0 1 .0],'MarkerEdgeColor',[.0 .3 .0]);
        text(x_1M*1.1,y_1M/2,[num2str(round(x_1M,3)) ' ng/ml']...
            ,'color',color,'Fontsize',12,'Fontweight','bold');
        hold off
        title('zoom');
        legend('calibrating values','linear regression','Measured values',"1M's value",'location','northwest');
        xlabel('Concentration [ng/ml]');
        xlim([0 3.5*x_1M]);
        ylim([0 2.5*y_1M]);
        ylabel('Surface');
    end
end
suptitle('PAH of interest for group 1M');
% % % % % % % saveas(fig_PAH_interest,'./figures/PAH_ofInterest.png');ne pas lancer cette ligne de code!!!
