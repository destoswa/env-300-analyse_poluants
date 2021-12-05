

%% Year 2021
mean_T_A21=mean(nonzeros(macroparametre(1,:)));
%Temperature (1)
Group={'1M' '2M' '3P' '4M1' '4M2' '5M' '7S1' '7S2' '9S1' '9S2' '8S' '6C1' '6C2'};
Group_T=Group' ; 
figure(1)
bar(macroparametre(1,:));
grid on 
grid minor
hold on 
yline(mean_T_A21, '-', 'Moyenne', 'linewidth', 3)
hold off
Y = round(macroparametre(1,:),2);
text(1:length(Y),Y,num2str(Y'),'vert','bottom','horiz','center'); 
set(gca,'XTickLabel',Group_T);
xlabel('Site de prélèvement')
ylabel('Température [°C]')
title("Température et moyenne annuelle pour 2021")
saveas(figure(1),'./figures/T°_2021.png')




%% Old 
%Temperature 


Temp_old_T=Temp_old';

for i=1:10
 mean_T_A(i)=mean(nonzeros(Temp_old(i,:)));
 
end
mean_T_A(11)=nan;
mean_T_A(12)=nan;
mean_T_A(13)=nan;
mean_T_A(14)=nan;
mean_T_A(15)=mean_T_A21;


for j=1:8
    meanS(j)=mean(nonzeros(Temp_old_T(j,:)));
end
figure(2)
b = bar(Temp_old_T,'FaceColor','flat');

b(1).CData = [0.6 0.3 0] ;
b(2).CData = [1 0.5 0.3] ;
b(3).CData = [0.3 0.9 0.5] ;
b(4).CData = [0 0.7 0.9] ;
b(5).CData = [0.8 0.2 0.3] ;
b(6).CData = [1 0 0.5] ;
b(7).CData = [0.1 0 0.5] ;
b(8).CData = [0.7 0 0.9] ;
b(9).CData = [0.2 0.5 0.7] ;
%bar(Temp_old' ,  'b' | 'r' | 'g' | 'c' | 'm' | 'y' | 'k' | 'w'|[0.9290 0.6940 0]| [0.9290 0.6940 0.1250])

hold on 
plot(meanS, 'k', 'LineWidth',3)

hold off
grid on 
grid minor
set(gca,'XTickLabel',Groups_old);
xlabel('Site de prélèvement')
ylabel('Température [°C]')
title("Température et moyennes de 2007 à 2016")
legend('2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','Moyenne','location','northwestoutside');
saveas(figure(2),'./figures/T°_old.png')


%% Mean per year
%Temperature

y=[2007:2021];
y_T=y';
figure(3)
scatter(y,mean_T_A,'LineWidth',2)
hold on
plot(y,mean_T_A)
hold off
set(gca,'Ylim',[10 15]);
grid on 

xlabel('Année')
ylabel('Température [°C]')
title("Moyenne des températures de 2007 à 2021")

saveas(figure(3),'./figures/T°_meanA.png')






