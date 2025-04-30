# ------------------------------------;
# specific data for army
# ------------------------------------;

UPDATE configuration set value='1' where NAME='grades';

delete from categorie_materiel where TM_USAGE='Armement';
INSERT INTO categorie_materiel (TM_USAGE, CM_DESCRIPTION, PICTURE)
VALUES ('Armement', 'Tous types d\'armes', 'crosshairs');

delete from categorie_consommable where CC_CODE='MUNITIONS';
INSERT INTO categorie_consommable (CC_CODE, CC_NAME, CC_DESCRIPTION, CC_IMAGE, CC_ORDER)
VALUES ('MUNITIONS', 'Munitions tous calibres', '', 'crosshairs', '60');


delete from equipe where EQ_ID in (3,6);
INSERT INTO equipe (EQ_ID,EQ_NOM,EQ_ORDER) VALUES
('3','Secourisme','3'),
('6','Militaire','5');

delete from poste where EQ_ID in (3,5) or PS_ID in (18,30,31,32,33,34);
INSERT INTO poste (PS_ID,PS_ORDER,EQ_ID,TYPE,DESCRIPTION,PS_FORMATION,PS_EXPIRABLE,PS_AUDIT,PS_DIPLOMA,PS_NUMERO,PS_RECYCLE,PS_USER_MODIFIABLE,PS_PRINTABLE,PS_PRINT_IMAGE,PS_NATIONAL,PS_SECOURISME,F_ID,PH_CODE,PH_LEVEL) VALUES
('30','1','4','CODBL','Conducteur engin blindé','0','0','0','0','0','0','0','0','0','0','0','4','COD','1'),
('12','12','3','PSE1','Equipier secouriste PSE1','1','1','0','1','1','1','0','1','0','0','1','4','Secourisme','1'),
('13','13','3','PSE2','Equipier secouriste PSE2','1','1','0','1','1','1','0','1','0','0','1','4','Secourisme','2'),
('14','14','3','PAE PSC','Formateur en Prévention et Secours Civiques','1','1','0','1','1','1','0','0','0','0','1','4',NULL,NULL),
('15','15','3','PAE PS','Formateur aux Premiers Secours','1','1','0','1','1','1','0','0','0','0','1','4',NULL,NULL),
('16','16','3','FDF PSE','Formateur de Formateurs aux Premiers Secours','1','1','0','1','1','1','0','0','0','0','1','4',NULL,NULL),
('20','11','3','PSC1','Premiers secours civique','1','0','0','1','1','0','0','1','0','0','1','4','Secourisme','0'),
('18','18','4','PB','Permis blanc','0','0','0','1','1','0','0','0','0','0','0','4',NULL,NULL),
('31','30','6','TIR1','Tir pistolet automatique','1','1','0','0','0','1','0','0','0','0','0','4',NULL,NULL),
('32','30','6','TIR2','Tir fusil d\'assaut','1','1','0','0','0','1','0','0','0','0','0','4',NULL,NULL),
('33','30','6','TIR3','Tir mitrailleuse','1','1','0','0','0','1','0','0','0','0','0','4',NULL,NULL),
('34','30','6','TIR4','Tir lance roquettes','1','1','0','0','0','1','0','0','0','0','0','4',NULL,NULL);

delete from poste where PS_ID = 19;
INSERT INTO poste (PS_ID,PS_ORDER,EQ_ID,TYPE,DESCRIPTION,PS_FORMATION,PS_EXPIRABLE,PS_AUDIT,PS_DIPLOMA,PS_NUMERO,PS_RECYCLE,PS_USER_MODIFIABLE,PS_PRINTABLE,PS_PRINT_IMAGE,PS_NATIONAL,PS_SECOURISME,F_ID,PH_CODE,PH_LEVEL) VALUES
('19','19','4','PL','Permis poids lourd','0','0','0','1','1','0','0','0','0','0','0','4','COD','0');

delete from poste_hierarchie where PH_CODE in ('Secourisme','FDF','INC','COD','DIV');
INSERT INTO poste_hierarchie (PH_CODE,PH_NAME,PH_HIDE_LOWER,PH_UPDATE_LOWER_EXPIRY,PH_UPDATE_MANDATORY) VALUES
('Secourisme','Premiers secours','1','1','0'),
('COD','Conducteur','0','0','0');

delete from grade where G_CATEGORY='ARMY';
INSERT INTO grade (G_GRADE,G_DESCRIPTION,G_LEVEL,G_TYPE,G_CATEGORY) VALUES
('SDT','Soldat de 2ème classe','1','Hommes du rang','ARMY'),
('SDT1','Soldat de 1ère classe','2','Hommes du rang','ARMY'),
('BG','Brigadier','5','Hommes du rang','ARMY'),
('BGC','Brigadier Chef','6','Hommes du rang','ARMY'),
('CA','Caporal','5','Hommes du rang','ARMY'),
('CAC','Caporal Chef','6','Hommes du rang','ARMY'),
('SG1','Sergent appelé','10','Sous-Officiers','ARMY'),
('SG','Sergent','11','Sous-Officiers','ARMY'),
('SC','Sergent Chef','12','Sous-Officiers','ARMY'),
('MDL','Maréchal des Logis','11','Sous-Officiers','ARMY'),
('MCH','Maréchal des Logis Chef','12','Sous-Officiers','ARMY'),
('AJ','Adjudant','15','Sous-Officiers','ARMY'),
('AC','Adjudant Chef','16','Sous-Officiers','ARMY'),
('MJ','Major','17','Sous-Officiers','ARMY'),
('AS','Aspirant','30','Officiers','ARMY'),
('SL','Sous Lieutenant','31','Officiers','ARMY'),
('LT','Lieutenant','32','Officiers','ARMY'),
('CP','Capitaine','33','Officiers','ARMY'),
('CT','Commandant','34','Officiers','ARMY'),
('LC','Lieutenant Colonel','35','Officiers','ARMY'),
('CL','Colonel','36','Officiers','ARMY'),
('GLBR','Général de Brigade','100','Officiers Généraux','ARMY'),
('GLDIV','Général de Division','105','Officiers Généraux','ARMY'),
('GLCA','Général de Corps d\'armée','110','Officiers Généraux','ARMY'),
('GLA','Général d\'armée ','120','Officiers Généraux','ARMY');

UPDATE grade SET G_ICON = 'images/grades_army/SDT.png', G_FLAG = 1 WHERE G_GRADE = 'SDT' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/SDT1.png', G_FLAG = 1 WHERE G_GRADE = 'SDT1' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/DEFAULT.png', G_FLAG = 1 WHERE G_GRADE = 'DRA2' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/DEFAULT.png', G_FLAG = 1 WHERE G_GRADE = 'DRA1' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/SG.png', G_FLAG = 1, G_LEVEL = 11, G_TYPE = 'Sous-Officiers' WHERE G_GRADE = 'BG' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/SC.png', G_FLAG = 1, G_LEVEL = 11, G_TYPE = 'Sous-Officiers' WHERE G_GRADE = 'BGC' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/CA.png', G_FLAG = 1 WHERE G_GRADE = 'CA' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/CAC.png', G_FLAG = 1 WHERE G_GRADE = 'CAC' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/SG1.png', G_FLAG = 1 WHERE G_GRADE = 'SG1' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/SG.png', G_FLAG = 1 WHERE G_GRADE = 'SG' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/SC.png', G_FLAG = 1 WHERE G_GRADE = 'SC' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/SG.png', G_FLAG = 1 WHERE G_GRADE = 'MDL' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/SC.png', G_FLAG = 1 WHERE G_GRADE = 'MCH' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/AJ.png', G_FLAG = 1 WHERE G_GRADE = 'AJ' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/AC.png', G_FLAG = 1 WHERE G_GRADE = 'AC' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/MJ.png', G_FLAG = 1 WHERE G_GRADE = 'MJ' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/AS.png', G_FLAG = 1 WHERE G_GRADE = 'AS' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/SL.png', G_FLAG = 1 WHERE G_GRADE = 'SL' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/LT.png', G_FLAG = 1 WHERE G_GRADE = 'LT' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/CP.png', G_FLAG = 1 WHERE G_GRADE = 'CP' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/CT.png', G_FLAG = 1 WHERE G_GRADE = 'CT' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/LC.png', G_FLAG = 1 WHERE G_GRADE = 'LC' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/CL.png', G_FLAG = 1 WHERE G_GRADE = 'CL' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/GLBR.png', G_FLAG = 1 WHERE G_GRADE = 'GLBR' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/GLDIV.png', G_FLAG = 1 WHERE G_GRADE = 'GLDIV' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/GLCA.png' WHERE G_GRADE = 'GLCA' and G_CATEGORY = 'ARMY';
UPDATE grade SET G_ICON = 'images/grades_army/GLA.png' WHERE G_GRADE = 'GLA' and G_CATEGORY = 'ARMY';

# ------------------------------------;
# grades militaires plus génériques
# ------------------------------------;
UPDATE grade SET G_DESCRIPTION = 'Caporal/Brigadier' WHERE G_GRADE = 'CA' and G_CATEGORY='army';
UPDATE grade SET G_DESCRIPTION = 'Caporal Chef/Brigadier Chef' WHERE G_GRADE = 'CAC' and G_CATEGORY='army';
UPDATE grade SET G_DESCRIPTION = 'Sergent/Maréchal des Logis' WHERE G_GRADE = 'SG' and G_CATEGORY='army';
UPDATE grade SET G_DESCRIPTION = 'Sergent Chef/Maréchal des Logis Chef' WHERE G_GRADE = 'SC' and G_CATEGORY='army';

update pompier set P_GRADE='SDT1' where P_GRADE='DRA1';
update pompier set P_GRADE='SDT' where P_GRADE='DRA2';
update pompier set P_GRADE='SG' where P_GRADE='MDL';
update pompier set P_GRADE='SC' where P_GRADE='MCH';
update pompier set P_GRADE='CA' where P_GRADE='BG';
update pompier set P_GRADE='CAC' where P_GRADE='BGC';

delete from grade where G_GRADE in ('DRA1','DRA2','MDL','MCH','BG','BGC') and G_CATEGORY='army';


delete from groupe where GP_ID in (109);
INSERT INTO groupe (GP_ID,GP_DESCRIPTION,TR_CONFIG,TR_SUB_POSSIBLE,TR_ALL_POSSIBLE,TR_WIDGET,GP_USAGE,GP_ASTREINTE,GP_ORDER) VALUES
('109','Responsable véhicules/matériel','3','1','0','0','internes','0','50');

delete from habilitation where GP_ID in (109);
INSERT INTO habilitation (GP_ID,F_ID) VALUES
('109','38'),
('109','39'),
('109','40'),
('109','41'),
('109','42'),
('109','43'),
('109','44'),
('109','51'),
('109','52'),
('109','56'),
('109','58'),
('109','61');

delete from statut;
INSERT INTO statut (S_STATUT,S_DESCRIPTION,S_CONTEXT) VALUES
('PRES', 'Prestataire', '0'),
('EXT','Personnel externe','0'),
('SAL','Personnel salarié','0'),
('ACT','Militaire d\'active','0'),
('RES','Militaire de réserve','0'),
('CIV','Personnel civil','0');

delete from type_evenement where TE_CODE in ('AIP','AH','MAN');
INSERT INTO type_evenement (TE_CODE,TE_LIBELLE,CEV_CODE,TE_MAIN_COURANTE,TE_VICTIMES,TE_MULTI_DUPLI,TE_ICON,EVAL_PAR_STAGIAIRES,PROCES_VERBAL,FICHE_PRESENCE,ORDRE_MISSION,CONVENTION,EVAL_RISQUE,CONVOCATIONS,FACTURE_INDIV,ACCES_RESTREINT,TE_PERSONNEL,TE_VEHICULES,TE_MATERIEL,TE_CONSOMMABLES,COLONNE_RENFORT) VALUES
('AIP','Aide aux populations','C_OPE','1','1','0','AIP.png','0','0','0','1','0','0','1','0','0','1','1','1','1','1'),
('AH','Autres actions humanitaires','C_OPE','1','0','1','AH.png','0','0','0','1','0','0','1','0','0','1','1','1','1','1'),
('MAN','Manoeuvre','C_FOR','0','0','1','MAN.png','0','0','1','1','0','0','1','0','0','1','1','1','1','0');

delete from type_garde where EQ_ID=1;
INSERT INTO type_garde (EQ_ID,EQ_NOM,EQ_JOUR,EQ_NUIT,S_ID,EQ_PERSONNEL1,EQ_PERSONNEL2,EQ_VEHICULES,EQ_SPP,EQ_DEBUT1,EQ_FIN1,EQ_DUREE1,EQ_DEBUT2,EQ_FIN2,EQ_DUREE2,EQ_ICON,ASSURE_PAR1,ASSURE_PAR2,ASSURE_PAR_DATE,EQ_REGIME_TRAVAIL,EQ_ADDRESS,EQ_LIEU) VALUES
('1','Garde casernement','1','1','0','6','6','1','0','07:30:00','19:30:00','12','19:30:00','07:30:00','12','images/gardes/Soldat.png','2','2','2018-06-09 15:20:27','3','',NULL);

delete from type_participation where TE_CODE='GAR';
INSERT INTO type_participation (TP_ID,TE_CODE,TP_NUM,TP_LIBELLE,PS_ID,PS_ID2,INSTRUCTOR,EQ_ID) VALUES
('9','GAR','1','Sous officier garde','0','0','0','1'),
('10','GAR','2','Caporal de garde','0','0','0','1'),
('11','GAR','3','Planton','0','0','0','1');

delete from type_materiel where TM_USAGE='Armement';
INSERT INTO type_materiel (TM_ID,TM_CODE,TM_DESCRIPTION,TM_USAGE,TM_LOT,TT_CODE) VALUES
('60','PA','Pistolet automatique','Armement','0',NULL),
('61','FA','Fusil d\'assaut','Armement','0',NULL),
('62','12.7','Mitrailleuse lourde 12.7','Armement','0',NULL),
('63','MORT80','Mortier 80','Armement','0',NULL),
('64','MORT120','Mortier 120','Armement','0',NULL);

INSERT INTO type_vehicule (TV_CODE,TV_LIBELLE,TV_NB,TV_USAGE,TV_ICON) VALUES
('VLR','Véhicule Léger de Reconnaissance','2','COMBAT','images/vehicules/HUMVEE.png'),
('ERS','Embarcation de Reconnaissance et de Sauvetage','3','SECOURS','images/vehicules/SR6.png'),
('MPS','Moto de premiers secours','1','SECOURS','images/vehicules/MOTO.png'),
('PCM','Poste de Commandement Mobile','2','DIVERS','images/vehicules/PC.png'),
('QUAD','Véhicule quad','1','DIVERS','images/vehicules/QUAD.png'),
('VPS','Véhicule de premier secours','3','SECOURS','images/vehicules/AMBULANCE1.png'),
('VBL','Véhicule blindé léger','4','COMBAT','images/vehicules/VBL.png'),
('TANK','Char léger','4','COMBAT','images/vehicules/TANK.png'),
('TANK2','Char lourd','4','COMBAT','images/vehicules/TANK2.png'),
('BUS','Autobus','30','DIVERS','images/vehicules/BUS.png');

# ------------------------------------;
# end of specific data
# ------------------------------------;