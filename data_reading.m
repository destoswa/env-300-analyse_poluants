close all;
clear all;
clc;
%extraction des macroparamètres:
macroparametre_raw = readtable('data/2021_TP_Resultats_macroparamètres.csv','TreatAsEmpty','-');
macroparametre = table2array(macroparametre_raw);
%traitement des données:
emptyValues = isnan(macroparametre);
macroparametre(emptyValues) = 0;

%extraction des PCB et PAH:
PCB_raw = readtable('data/PCB_2021.csv','HeaderLines',2);
PAH_raw = readtable('data/PAH_2021.csv','HeaderLines',2);
PAH_raw = PAH_raw(1:17,:);
%traitement des données:
PCB_calibrate = str2double(table2array(PCB_raw(2:end,2:9)));
PCB_datas = str2double(table2array(PCB_raw(2:end,9:end)));
PCB_datas(isnan(PCB_datas)) = 0;
PAH_calibrate = str2double(table2array(PAH_raw(5:end,2:13)));
PAH_datas = str2double(table2array(PAH_raw(5:end,14:end)));
PAH_datas(isnan(PAH_datas)) = 0;
PCB_elements = table2cell(PCB_raw(2:end,1));
PAH_elements = table2cell(PAH_raw(5:end,1));



save data_macroparametre.mat macroparametre;
save data_PCB_PAH.mat PCB_calibrate PCB_datas PCB_elements PAH_calibrate PAH_datas PAH_elements;