clear all;
close all;
clc;
set(0,'DefaultFigureWindowStyle','normal');
load('HeavyMetals.mat');
[M,N] = size(HM_datas);
for i=2:N
   fig = figure(i);
   hold on;
   bar(HM_datas(:,i)*0.05./(HM_mass'/1000));
   plot(xlim,[HM_indicatives(i) HM_indicatives(i)],'red','LineWidth',2);
   Y = round(HM_datas(:,i)*0.05./(HM_mass'/1000));
   text(1:length(Y),Y,num2str(Y),'vert','bottom','horiz','center');
   text(2,HM_indicatives(i)*1.05,['Indicative value = ' num2str(HM_indicatives(i)) 'mg/kg'],'color','red');
   hold off;
   title(HM_Elements(i));
   set(gca,'xtick',1:13);
   set(gca,'XTickLabel',HM_GroupNames);
   grid on;
   ylim([0 HM_indicatives(i)*1.2]);
   xlabel('Group');
   ylabel('Concentration [mg/kg]');
   fig.Position = [300 300 1000 500];
%    saveas(fig,"figures/HM_"+HM_Elements(i)+".jpg");
end