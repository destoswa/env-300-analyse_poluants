data_nul = readtable('data/2021_TP_Resultats_macroparamètres.csv','TreatAsEmpty','-');
data = table2array(data_nul);
emptyValues = isnan(data);
data(emptyValues) = 0;

save data.mat data;