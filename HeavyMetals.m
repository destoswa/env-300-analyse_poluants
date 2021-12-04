clear all;
close all;
clc;

load('HeavyMetals.mat');
[M,N] = size(HM_datas);
for i=1:N
   fig = figure(i);
   bar(HM_datas(:,i));
   hold on;
   Y = round(HM_datas(:,i),2);
   text(1:length(Y),Y,num2str(Y),'vert','bottom','horiz','center');
   hold off;
   title(HM_Elements(i));
   set(gca,'XTickLabel',HM_GroupNames);
   grid on;
   xlabel('Group');
   ylabel('Concentration [mg/L]');
   fig.Position = [300 300 1000 500];
   saveas(fig,"figures/HM_"+HM_Elements(i)+".jpg");
end