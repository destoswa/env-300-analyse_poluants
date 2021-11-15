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

%extraction des macroparamètres de 2007 à 2016:
macro_old_raw = readtable('data/Macroparametres_07-16.csv','FileEncoding','UTF8');
Temp_old = str2double(table2array(macro_old_raw(1:10,2:end)));
Temp_old(isnan(Cond_old))=0;
Cond_old = str2double(table2array(macro_old_raw(13:22,2:end)));
Cond_old(isnan(Cond_old))=0;
pH_old = str2double(table2array(macro_old_raw(25:34,2:end)));
pH_old(isnan(Cond_old))=0;
Ox_old = str2double(table2array(macro_old_raw(37:46,2:end)));
Ox_old(isnan(Cond_old))=0;
Nitrate_old = str2double(table2array(macro_old_raw(49:58,2:end)));
Nitrate_old(isnan(Cond_old))=0;
Nitrite_old = str2double(table2array(macro_old_raw(61:70,2:end)));
Nitrite_old(isnan(Cond_old))=0;
Chlorure_old = str2double(table2array(macro_old_raw(73:82,2:end)));
Chlorure_old(isnan(Cond_old))=0;
Sulfate_old = str2double(table2array(macro_old_raw(85:94,2:end)));
Sulfate_old(isnan(Cond_old))=0;
Ammonium_old = str2double(table2array(macro_old_raw(97:106,2:end)));
Ammonium_old(isnan(Cond_old))=0;
Phosphate_old = str2double(table2array(macro_old_raw(109:118,2:end)));
Phosphate_old(isnan(Cond_old))=0;
TOC_old = str2double(table2array(macro_old_raw(121:130,2:end)));
TOC_old(isnan(Cond_old))=0;
DOC_old = str2double(table2array(macro_old_raw(133:142,2:end)));
DOC_old(isnan(Cond_old))=0;
Years_old = str2double(table2array(macro_old_raw(1:10,1)));
Groups_old = table2array(macro_old_raw(12,2:end))';


%saving vairables
% save data_macroparametre.mat macroparametre;
% save data_PCB_PAH.mat PCB_calibrate PCB_datas PCB_elements PAH_calibrate PAH_datas PAH_elements;
% save data_old_macro.mat Years_old Groups_old Temp_old Cond_old pH_old Ox_old Nitrate_old Nitrite_old Chlorure_old Sulfate_old Ammonium_old Phosphate_old TOC_old DOC_old;

