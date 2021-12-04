close all;
clear all;
clc;

% -------------------------------------------------------------------------
% EXTRACTION DES DONNEES
% -------------------------------------------------------------------------
%extraction des macroparamètres:
macroparametre_raw = readtable('data/2021_TP_Resultats_macroparamètres.csv','TreatAsEmpty','-');
macro_old_raw = readtable('data/Macroparametres_07-16.csv','FileEncoding','UTF8');

%extraction des PCB et PAH:
PCB_raw = readtable('data/PCB_2021.csv','HeaderLines',2);
PAH_raw = readtable('data/PAH_2021.csv','HeaderLines',2);
PCB_2019_raw = readtable('data/PCB_2019.csv','HeaderLines',2);
PCB_tot_08to16_raw = readtable('data/PCB_Tot_08-16.csv');
PAH_raw = PAH_raw(1:17,:);

%extraction des métaux lourds:
HM_raw = readtable('data/Heavy_metals_2021.csv');

% -------------------------------------------------------------------------
% TRAITEMENT PCB ET PAH
% -------------------------------------------------------------------------
%traitement des données pour 2021:
PCBPAHgroupNames = PCB_raw.Properties.VariableNames;
PCBPAHgroupNames = PCBPAHgroupNames(10:end);
PCBPAHgroupNames = extractAfter(PCBPAHgroupNames,"x");
PCB_calibrate = str2double(table2array(PCB_raw(2:end,2:9)));
PCB_datas = str2double(table2array(PCB_raw(2:end,10:end)));
PCB_datas(isnan(PCB_datas)) = 0;
PAH_calibrate = str2double(table2array(PAH_raw(2:end,2:13)));
PAH_calibrate(isnan(PAH_calibrate))=0;
PAH_datas = str2double(table2array(PAH_raw(2:end,14:end)));
PAH_datas(isnan(PAH_datas)) = 0;
PCB_elements = table2cell(PCB_raw(2:end,1));
PAH_elements = table2cell(PAH_raw(2:end,1));

%traitement des données pour 2019:
PCB_2019_calibrate = str2double(table2array(PCB_2019_raw(2:end,2:11)));
PCB_2019_datas = str2double(table2array(PCB_2019_raw(2:end,12:end)));
PCB_2019_datas(isnan(PCB_2019_datas)) = 0;
PCB_2019_groupNames = PCB_2019_raw.Properties.VariableNames;
PCB_2019_groupNames = PCB_2019_groupNames(12:end);
%traitement des données de 2008 à 2016:
PCB_tot_08to16 = table2array(PCB_tot_08to16_raw(:,2:end));
PCB_tot_08to16(isnan(PCB_tot_08to16)) = 0;
PCB_tot_08to16_years = table2array(PCB_tot_08to16_raw(:,1));
PCB_tot_08to16_groupNames = PCB_tot_08to16_raw.Properties.VariableNames;
PCB_tot_08to16_groupNames = PCB_tot_08to16_groupNames(2:end);
% -------------------------------------------------------------------------
% TRAITEMENT DES METAUX LOURDS
% -------------------------------------------------------------------------
HM_datas = str2double(table2array(HM_raw(2:end,2:end)));
HM_datas(isnan(HM_datas)) = 0;
HM_GroupNames = table2array(HM_raw(2:end,1));
HM_Elements = HM_raw.Properties.VariableNames;
HM_Elements = HM_Elements(2:end);

% -------------------------------------------------------------------------
% TRAITEMENT DES MACRO-PARAMETRES
% -------------------------------------------------------------------------
%extraction des macroparamètres de 2021:
macroparametre = table2array(macroparametre_raw);
macroparametre(isnan(macroparametre)) = 0;

%extraction des macroparamètres de 2007 à 2016:
Temp_old = str2double(table2array(macro_old_raw(1:10,2:end)));
Temp_old(isnan(Temp_old))=0;
Cond_old = str2double(table2array(macro_old_raw(13:22,2:end)));
Cond_old(isnan(Cond_old))=0;
pH_old = str2double(table2array(macro_old_raw(25:34,2:end)));
pH_old(isnan(pH_old))=0;
Ox_old = str2double(table2array(macro_old_raw(37:46,2:end)));
Ox_old(isnan(Ox_old))=0;
Nitrate_old = str2double(table2array(macro_old_raw(49:58,2:end)));
Nitrate_old(isnan(Nitrate_old))=0;
Nitrite_old = str2double(table2array(macro_old_raw(61:70,2:end)));
Nitrite_old(isnan(Nitrite_old))=0;
Chlorure_old = str2double(table2array(macro_old_raw(73:82,2:end)));
Chlorure_old(isnan(Chlorure_old))=0;
Sulfate_old = str2double(table2array(macro_old_raw(85:94,2:end)));
Sulfate_old(isnan(Sulfate_old))=0;
Ammonium_old = str2double(table2array(macro_old_raw(97:106,2:end)));
Ammonium_old(isnan(Ammonium_old))=0;
Phosphate_old = str2double(table2array(macro_old_raw(109:118,2:end)));
Phosphate_old(isnan(Phosphate_old))=0;
TOC_old = str2double(table2array(macro_old_raw(121:130,2:end)));
TOC_old(isnan(TOC_old))=0;
DOC_old = str2double(table2array(macro_old_raw(133:142,2:end)));
DOC_old(isnan(DOC_old))=0;
Years_old = str2double(table2array(macro_old_raw(1:10,1)));
Groups_old = table2array(macro_old_raw(12,2:end))';

% -------------------------------------------------------------------------
% ENREGISTREMENT DES DONNEES TRAITEES
% -------------------------------------------------------------------------
% save data_macroparametre.mat macroparametre;
% save data_PCB_PAH.mat PCB_calibrate PCB_datas PCB_elements PAH_calibrate PAH_datas PAH_elements PCBPAHgroupNames;
% save data_PCB_old PCB_tot_08to16 PCB_tot_08to16_groupNames PCB_tot_08to16_years PCB_2019_calibrate PCB_2019_datas PCB_2019_groupNames;
% save HeavyMetals.mat HM_datas HM_GroupNames HM_Elements;
% save data_old_macro.mat Years_old Groups_old Temp_old Cond_old pH_old Ox_old Nitrate_old Nitrite_old Chlorure_old Sulfate_old Ammonium_old Phosphate_old TOC_old DOC_old;

