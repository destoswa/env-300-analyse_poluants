clear all;
close all;
clc;
load('data_PCB_PAH.mat');

%plotting the graphs for all PCB
figure(1)
for i=1:12
    pl = polyfit([PCB_calibrate(i,1) PCB_calibrate(i,3) PCB_calibrate(i,5) PCB_calibrate(i,7)],[PCB_calibrate(i,2) PCB_calibrate(i,4) PCB_calibrate(i,6) PCB_calibrate(i,8)],1);
    x = linspace(PCB_calibrate(i,1),PCB_calibrate(i,7),200);
    subplot(4,3,i);
    plot([PCB_calibrate(i,1) PCB_calibrate(i,3) PCB_calibrate(i,5) PCB_calibrate(i,7)],[PCB_calibrate(i,2) PCB_calibrate(i,4) PCB_calibrate(i,6) PCB_calibrate(i,8)],'d','color','blue');
    hold on
    plot(x,pl(1)*x+pl(2),'-','color','blue');
    plot((PCB_datas(i,:)-pl(2))./pl(1),PCB_datas(i,:),'x','color','red');
    hold off
    title(PCB_elements(i));
    legend('calibrating values','linear regression','Measured values','location','southeast');
    xlabel('Concentration [ng/ml]');
    ylabel('Surface');
end

%plotting the graph for the 3 PCB of interest
figure(2)
for i=7:9
    pl = polyfit([PCB_calibrate(i,1) PCB_calibrate(i,3) PCB_calibrate(i,5) PCB_calibrate(i,7)],[PCB_calibrate(i,2) PCB_calibrate(i,4) PCB_calibrate(i,6) PCB_calibrate(i,8)],1);
    x = linspace(PCB_calibrate(i,1),PCB_calibrate(i,7),200);
    subplot(1,3,i-6);
    plot([PCB_calibrate(i,1) PCB_calibrate(i,3) PCB_calibrate(i,5) PCB_calibrate(i,7)],[PCB_calibrate(i,2) PCB_calibrate(i,4) PCB_calibrate(i,6) PCB_calibrate(i,8)],'d','color','blue');
    hold on
    plot(x,pl(1)*x+pl(2),'-','color','blue');
    plot((PCB_datas(i,:)-pl(2))./pl(1),PCB_datas(i,:),'x','color','red');
    hold off
    title(PCB_elements(i));
    legend('calibrating values','linear regression','Measured values','location','northwest');
    xlabel('Concentration [ng/ml]');
    ylabel('Surface');
end

%plotting the graph for all PAH:
figure(3)
for i=1:13
    pl = polyfit([PAH_calibrate(i,1) PAH_calibrate(i,3) PAH_calibrate(i,5) PAH_calibrate(i,7) PAH_calibrate(i,9) PAH_calibrate(i,11)],[PAH_calibrate(i,2) PAH_calibrate(i,4) PAH_calibrate(i,6) PAH_calibrate(i,8) PAH_calibrate(i,10) PAH_calibrate(1,12)],1);
    x = linspace(PAH_calibrate(i,1),PAH_calibrate(i,11),200);
    subplot(4,4,i);
    plot([PAH_calibrate(i,1) PAH_calibrate(i,3) PAH_calibrate(i,5) PAH_calibrate(i,7) PAH_calibrate(i,9) PAH_calibrate(i,11)],[PAH_calibrate(i,2) PAH_calibrate(i,4) PAH_calibrate(i,6) PAH_calibrate(i,8) PAH_calibrate(i,10) PAH_calibrate(i,12)],'d','color','blue');
    hold on
    plot(x,pl(1)*x+pl(2),'-','color','blue');
    plot((PAH_datas(i,:)-pl(2))./pl(1),PAH_datas(i,:),'x','color','red');
    hold off
    title(PAH_elements(i));
    legend('calibrating values','linear regression','Measured values','location','southeast');
    xlabel('Concentration [ng/ml]');
    ylabel('Surface');
end
