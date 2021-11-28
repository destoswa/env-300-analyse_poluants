
clc;
clear all;
close all;
% -------------------------------------------------------------------------
% test 1
% -------------------------------------------------------------------------
figure('Position',[1000 50 674 798]);
% Create subplots and save handles
subplot(5,2,1);       h1 = plot(rand(1,10),'r');
subplot(5,2,2);       h2 = plot(rand(1,10),'g');
subplot(5,2,3);       h3 = plot(rand(1,10),'b');
subplot(5,2,4);       h4 = plot(rand(1,10),'k');
subplot(5,2,5);       h5 = plot(rand(1,10),'m');
subplot(5,2,6);       h6 = plot(rand(1,10),'c');
subplot(5,2,7);       h7 = plot(rand(1,10),'y');
subplot(5,2,8);       h8 = plot(rand(1,10),'r-*');
% Create dummy subplot for legend
hLegend = subplot(5,2,9.5);
posLegend = get(hLegend,'Position');
% Creating the legend
leg = legend(hLegend,[h1;h2;h3;h4;h5;h6;h7;h8],'Plot1','Plot2','Plot3','Plot4','Plot5','Plot6','Plot7','Plot8');
axis(hLegend,'off');
set(leg,'Position',posLegend);


% -------------------------------------------------------------------------
% test 2
% -------------------------------------------------------------------------
% Construct a figure with subplots and data
figure(2)
subplot(2,2,1);
line1 = plot(1:10,rand(1,10),'b');
title('Axes 1');
subplot(2,2,2);
line2 = plot(1:10,rand(1,10),'g');
title('Axes 2');
subplot(2,2,3);
line3 = plot(1:10,rand(1,10),'r');
title('Axes 3');
subplot(2,2,4);
line4 = plot(1:10,rand(1,10),'y');
title('Axes 4');
% Construct a Legend with the data from the sub-plots
hL = legend([line1,line2,line3,line4],{'Data Axes 1','Data Axes 2','Data Axes 3','Data Axes 4'});
% Programatically move the Legend
newPosition = [0.4 0.4 0.2 0.2];
newUnits = 'normalized';
set(hL,'Position', newPosition,'Units', newUnits);


% -------------------------------------------------------------------------
% test 3
% -------------------------------------------------------------------------
figure(3)
subplot(2, 2, 1)
A = rand(10, 3);
plot(A, '-o')
hold on
b = rand(10, 1);
plot(b, '-k', 'LineWidth', 3)
subplot(2, 2, 2)
A = rand(10, 3);
plot(A, '-o')
hold on
b = rand(10, 1);
plot(b, '-k', 'LineWidth', 3)
subplot(2, 2, 3)
A = rand(10, 3);
plot(A, '-o')
hold on
b = rand(10, 1);
plot(b, '-k', 'LineWidth', 3)
subplot(2, 2, 4)
A = rand(10, 3);
plot(A, '-o', 'DisplayName', 'Data')
hold on
b = rand(10, 1);
plot(b, '-k', 'LineWidth', 4, 'DisplayName', 'Trend')
% add a bit space to the figure
fig = gcf;
fig.Position(3) = fig.Position(3) + 250;
% add legend
Lgnd = legend('show');
Lgnd.Position(1) = 0.01;
Lgnd.Position(2) = 0.4;