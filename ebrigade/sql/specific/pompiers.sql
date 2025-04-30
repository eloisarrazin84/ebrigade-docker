# ------------------------------------;
# specific data for pompier
# ------------------------------------;

UPDATE configuration set value='1' where NAME='grades';

delete from equipe where EQ_ID in (3,5);
INSERT INTO equipe (EQ_ID,EQ_NOM,EQ_ORDER) VALUES
('3','Secourisme','3'),
('5','Pompier','5');

delete from poste where EQ_ID in (3,5) or PS_ID in (18,30,31);
INSERT INTO poste (PS_ID,PS_ORDER,EQ_ID,TYPE,DESCRIPTION,PS_FORMATION,PS_EXPIRABLE,PS_AUDIT,PS_DIPLOMA,PS_NUMERO,PS_RECYCLE,PS_USER_MODIFIABLE,PS_PRINTABLE,PS_PRINT_IMAGE,PS_NATIONAL,PS_SECOURISME,F_ID,PH_CODE,PH_LEVEL) VALUES
('21','20','5','FDF1','Feux de forêt niveau 1','0','0','0','0','0','0','0','0','0','0','0','4','FDF','1'),
('22','21','5','FDF2','Feux de forêt niveau 2','0','0','0','0','0','0','0','0','0','0','0','4','FDF','2'),
('23','22','5','FDF3','Feux de forêt niveau 3','0','1','0','1','0','0','0','0','0','0','0','4','FDF','3'),
('24','23','5','FDF4','Feux de forêt niveau 4','0','0','0','0','0','0','0','0','0','0','0','4','FDF','4'),
('25','24','5','SAP2','Chef d\'agrès ambulance','0','0','0','0','0','0','0','0','0','0','0','4',NULL,NULL),
('26','25','5','DIV2','Chef d\'agrès divers','0','0','0','0','0','0','0','0','0','0','0','4','DIV','2'),
('27','1','5','INC1','Equipier incendie','1','0','0','0','0','0','0','0','0','0','0','4','INC','1'),
('28','1','5','CE','Chef d\'équipe incendie','1','0','0','0','0','0','0','0','0','0','0','4','INC','2'),
('29','1','5','INC2','Chef d\'agrès incendie','1','0','0','0','0','0','0','0','0','0','0','4','INC','3'),
('30','1','4','COD1','Conducteur engin pompe','0','0','0','0','0','0','0','0','0','0','0','4','COD','1'),
('31','1','4','COD2','Conducteur CCF','0','0','0','0','0','0','0','0','0','0','0','4','COD','2'),
('32','1','5','DIV1','Equipier divers','1','0','0','0','0','0','0','0','0','0','0','4','DIV','1'),
('12','12','3','PSE1','Equipier secouriste PSE1','1','1','0','1','1','1','0','1','0','0','1','4','Secourisme','1'),
('13','13','3','PSE2','Equipier secouriste PSE2','1','1','0','1','1','1','0','1','0','0','1','4','Secourisme','2'),
('14','14','3','PAE PSC','Formateur en Prévention et Secours Civiques','1','1','0','1','1','1','0','0','0','0','1','4',NULL,NULL),
('15','15','3','PAE PS','Formateur aux Premiers Secours','1','1','0','1','1','1','0','0','0','0','1','4',NULL,NULL),
('16','16','3','FDF PSE','Formateur de Formateurs aux Premiers Secours','1','1','0','1','1','1','0','0','0','0','1','4',NULL,NULL),
('20','11','3','PSC1','Premiers secours civique','1','0','0','1','1','0','0','1','0','0','1','4','Secourisme','0'),
('18','18','4','PB','Permis blanc','0','0','0','1','1','0','0','0','0','0','0','4',NULL,NULL);

delete from poste where PS_ID = 19;
INSERT INTO poste (PS_ID,PS_ORDER,EQ_ID,TYPE,DESCRIPTION,PS_FORMATION,PS_EXPIRABLE,PS_AUDIT,PS_DIPLOMA,PS_NUMERO,PS_RECYCLE,PS_USER_MODIFIABLE,PS_PRINTABLE,PS_PRINT_IMAGE,PS_NATIONAL,PS_SECOURISME,F_ID,PH_CODE,PH_LEVEL) VALUES
('19','19','4','PL','Permis poids lourd','0','0','0','1','1','0','0','0','0','0','0','4','COD','0');

delete from poste_hierarchie where PH_CODE in ('Secourisme','FDF','INC','COD','DIV');
INSERT INTO poste_hierarchie (PH_CODE,PH_NAME,PH_HIDE_LOWER,PH_UPDATE_LOWER_EXPIRY,PH_UPDATE_MANDATORY) VALUES
('Secourisme','Premiers secours','1','1','0'),
('FDF','Feux de forêt','1','0','0'),
('INC','Incendie','0','0','0'),
('COD','Conducteur engins incendie','0','0','0'),
('DIV','Interventions Diverses','1','0','0');

delete from grade where G_CATEGORY='SP';
INSERT INTO grade (G_GRADE,G_DESCRIPTION,G_LEVEL,G_TYPE,G_CATEGORY) VALUES
('ADC','adjudant-chef','108','sous-officiers','SP'),
('ADJ','adjudant','107','sous-officiers','SP'),
('CCH','caporal-chef','104','caporaux et sapeurs','SP'),
('CDT','commandant','114','officiers','SP'),
('COL','colonel','116','officiers','SP'),
('CPL','caporal','103','caporaux et sapeurs','SP'),
('CPT','capitaine','113','officiers','SP'),
('ISPC','Infirmier Chef Capitaine','122','SSSM','SP'),
('ICS','Infirmier classe supérieure','121','SSSM','SP'),
('JSP1','jeune sapeur pompier 1','-10','Jeunes Sapeurs Pompiers','SP'),
('JSP2','jeune sapeur pompier 2','-9','Jeunes Sapeurs Pompiers','SP'),
('JSP3','jeune sapeur pompier 3','-8','Jeunes Sapeurs Pompiers','SP'),
('JSP4','jeune sapeur pompier 4','-7','Jeunes Sapeurs Pompiers','SP'),
('LCL','lieutenant-colonel','115','officiers','SP'),
('LTN1','lieutenant 1ère classe','112','officiers','SP'),
('LTN2','lieutenant 2ème classe','111','officiers','SP'),
('MAJ','major','109','officiers','SP'),
('ISPP','Infirmier Principal','121','SSSM','SP'),
('ICN','Infirmier classe normale','120','SSSM','SP'),
('ISP','Infirmier','120','SSSM','SP'),
('SAP1','sapeur 1ère classe','102','caporaux et sapeurs','SP'),
('SAP2','sapeur 2ème classe','101','caporaux et sapeurs','SP'),
('SCH','sergent-chef','106','sous-officiers','SP'),
('SGT','sergent','105','sous-officiers','SP'),
('JSPB','jeune sapeur pompier breveté','-6','Jeunes Sapeurs Pompiers','SP'),
('IHC','Infirmier hors classe','122','SSSM','SP'),
('ISPE','Infirmier d\'encadrement ','123','SSSM','SP'),
('MASP','Médecin Aspirant','124','SSSM','SP'),
('MLTN','Médecin Lieutenant','125','SSSM','SP'),
('MCPT','Médecin Capitaine','126','SSSM','SP'),
('MCDT','Médecin Commandant','127','SSSM','SP'),
('MHC','Médecin hors classe','127','SSSM','SP'),
('MLCL','Médecin Lieutenant Colonel','128','SSSM','SP'),
('MCOL','Médecin Colonel','129','SSSM','SP'),
('PPH','Préparateur Pharmacie','130','SSSM','SP'),
('PPHS','Préparateur Pharmacie cl sup','130','SSSM','SP'),
('PHCPT','Pharmacien Capitaine','132','SSSM','SP'),
('PHCDT','Pharmacien Commandant','133','SSSM','SP'),
('PHLCL','Pharmacien Lieutenant Colonel','135','SSSM','SP'),
('PHCOL','Pharmacien Colonel','136','SSSM','SP'),
('VETCPT','Vétérinaire Capitaine','140','SSSM','SP'),
('VETCDT','Vétérinaire Commandant','142','SSSM','SP'),
('VETLCL','Vétérinaire Lieutenant Colonel','145','SSSM','SP'),
('VETCOL','Vétérinaire Colonel','146','SSSM','SP'),
('CSAN2','Cadre de santé 2ème classe','150','SSSM','SP'),
('CSAN1','Cadre de santé 1ère classe','151','SSSM','SP'),
('CSANSU','Cadre supérieur de santé','152','SSSM','SP'),
('MCN','Médecin Classe Normale','126','SSSM','SP'),
('CG1','Contrôleur général','117','officiers','SP'),
('LTNHC','lieutenant hors classe','113','officiers','SP');


UPDATE grade SET G_ICON = 'images/grades_sp/SAP1.png', G_FLAG = 1 WHERE G_GRADE = 'SAP1' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/CPL.png', G_FLAG = 1 WHERE G_GRADE = 'CPL' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/CCH.png', G_FLAG = 1 WHERE G_GRADE = 'CCH' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/SGT.png', G_FLAG = 1 WHERE G_GRADE = 'SGT' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/SCH.png', G_FLAG = 1 WHERE G_GRADE = 'SCH' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/ADJ.png', G_FLAG = 1 WHERE G_GRADE = 'ADJ' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/ADC.png', G_FLAG = 1 WHERE G_GRADE = 'ADC' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/MAJ.png', G_FLAG = 0 WHERE G_GRADE = 'MAJ' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/CPT.png', G_FLAG = 1 WHERE G_GRADE = 'CPT' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/CDT.png', G_FLAG = 1 WHERE G_GRADE = 'CDT' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/LCL.png', G_FLAG = 1 WHERE G_GRADE = 'LCL' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/COL.png', G_FLAG = 1 WHERE G_GRADE = 'COL' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/SAP2.png', G_FLAG = 1 WHERE G_GRADE = 'SAP2' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/JSP1.png', G_FLAG = 1 WHERE G_GRADE = 'JSP1' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/JSP2.png', G_FLAG = 1 WHERE G_GRADE = 'JSP2' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/JSP3.png', G_FLAG = 1 WHERE G_GRADE = 'JSP3' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/JSP4.png', G_FLAG = 1 WHERE G_GRADE = 'JSP4' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/IHC.png', G_FLAG = 1 WHERE G_GRADE = 'IHC' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/ISPC.png', G_FLAG = 1 WHERE G_GRADE = 'ISPC' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/ICS.png', G_FLAG = 1 WHERE G_GRADE = 'ICS' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/ISPP.png', G_FLAG = 1 WHERE G_GRADE = 'ISPP' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/ICN.png', G_FLAG = 1 WHERE G_GRADE = 'ICN' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/ISP.png', G_FLAG = 1 WHERE G_GRADE = 'ISP' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/JSPB.png', G_FLAG = 1 WHERE G_GRADE = 'JSPB' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/ISPE.png', G_FLAG = 1 WHERE G_GRADE = 'ISPE' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/MASP.png', G_FLAG = 1 WHERE G_GRADE = 'MASP' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/MLTN.png', G_FLAG = 1 WHERE G_GRADE = 'MLTN' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/MCPT.png', G_FLAG = 1 WHERE G_GRADE = 'MCPT' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/MCDT.png', G_FLAG = 1 WHERE G_GRADE = 'MCDT' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/MHC.png', G_FLAG = 1 WHERE G_GRADE = 'MHC' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/MLCL.png', G_FLAG = 1 WHERE G_GRADE = 'MLCL' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/MCOL.png', G_FLAG = 1 WHERE G_GRADE = 'MCOL' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/PPH.png', G_FLAG = 1 WHERE G_GRADE = 'PPH' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/PPHS.png', G_FLAG = 1 WHERE G_GRADE = 'PPHS' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/PHCPT.png', G_FLAG = 1 WHERE G_GRADE = 'PHCPT' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/PHCDT.png', G_FLAG = 1 WHERE G_GRADE = 'PHCDT' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/PHLCL.png', G_FLAG = 1 WHERE G_GRADE = 'PHLCL' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/PHCOL.png', G_FLAG = 1 WHERE G_GRADE = 'PHCOL' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/VETCPT.png', G_FLAG = 1 WHERE G_GRADE = 'VETCPT' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/VETCDT.png', G_FLAG = 1 WHERE G_GRADE = 'VETCDT' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/VETLCL.png', G_FLAG = 1 WHERE G_GRADE = 'VETLCL' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/VETCOL.png', G_FLAG = 1 WHERE G_GRADE = 'VETCOL' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/CSAN2.png', G_FLAG = 1 WHERE G_GRADE = 'CSAN2' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/CSAN1.png', G_FLAG = 1 WHERE G_GRADE = 'CSAN1' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/CSANSU.png', G_FLAG = 1 WHERE G_GRADE = 'CSANSU' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/MCN.png', G_FLAG = 1 WHERE G_GRADE = 'MCN' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/CG1.png', G_FLAG = 1 WHERE G_GRADE = 'CG1' and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/DEFAULT.png', G_FLAG = 1 WHERE G_CATEGORY = 'PATS';
UPDATE grade SET G_ICON = 'images/grades_sp/EQ.png', G_FLAG = 1 WHERE G_GRADE = 'EQ' and G_CATEGORY = 'SC';
UPDATE grade SET G_ICON = 'images/grades_sp/CE.png', G_FLAG = 1 WHERE G_GRADE = 'CE' and G_CATEGORY = 'SC';
UPDATE grade SET G_ICON = 'images/grades_sp/CS.png', G_FLAG = 1 WHERE G_GRADE = 'CS' and G_CATEGORY = 'SC';
UPDATE grade SET G_ICON = 'images/grades_sp/CD.png', G_FLAG = 1 WHERE G_GRADE = 'CD' and G_CATEGORY = 'SC';
UPDATE grade SET G_ICON = 'images/grades_sp/NR.png' WHERE G_GRADE = '-';
UPDATE grade SET G_ICON = 'images/grades_sp/DEFAULT.png' WHERE G_GRADE in ('PPH','PPHS') and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/LTN.png' WHERE G_GRADE in ('LTN1','LTN2','LTNHC') and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/ISP.png' WHERE G_GRADE in ('ISP','ICN') and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/ISPP.png' WHERE G_GRADE in ('ISPP','ICS') and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/ISPC.png' WHERE G_GRADE in ('ISPC','ISPE','IHC') and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/MCPT.png' WHERE G_GRADE in ('MCPT','MCN') and G_CATEGORY = 'SP';
UPDATE grade SET G_ICON = 'images/grades_sp/MCDT.png' WHERE G_GRADE in ('MCDT','MHC') and G_CATEGORY = 'SP';
UPDATE grade SET G_DESCRIPTION='lieutenant 1ère classe' WHERE G_GRADE ='LTN1' and G_CATEGORY = 'SP';

delete from groupe where GP_ID in (1,2,3,109);
INSERT INTO groupe (GP_ID,GP_DESCRIPTION,TR_CONFIG,TR_SUB_POSSIBLE,TR_ALL_POSSIBLE,TR_WIDGET,GP_USAGE,GP_ASTREINTE,GP_ORDER) VALUES
('1','bureau opérations','1','0','0','0','internes','0','50'),
('2','chef de section','1','0','0','0','internes','0','50'),
('3','chef de centre','1','0','0','0','internes','0','50'),
('109','Responsable véhicules/matériel','3','1','0','0','internes','0','50');

delete from habilitation where GP_ID in (1,2,3,109);
INSERT INTO habilitation (GP_ID,F_ID) VALUES
('1','0'),
('1','1'),
('1','2'),
('1','3'),
('1','4'),
('1','5'),
('1','6'),
('1','8'),
('1','10'),
('1','11'),
('1','12'),
('1','13'),
('1','15'),
('1','16'),
('1','17'),
('1','18'),
('1','26'),
('1','27'),
('1','38'),
('1','39'),
('1','40'),
('1','41'),
('1','42'),
('1','43'),
('1','44'),
('1','51'),
('1','52'),
('1','54'),
('1','56'),
('1','58'),
('1','60'),
('1','61'),
('1','70'),
('1','71'),
('1','76'),
('1','77'),
('2','0'),
('2','4'),
('2','6'),
('2','8'),
('2','10'),
('2','11'),
('2','16'),
('2','17'),
('2','27'),
('2','38'),
('2','39'),
('2','40'),
('2','41'),
('2','42'),
('2','43'),
('2','44'),
('2','51'),
('2','52'),
('2','56'),
('2','58'),
('2','60'),
('2','61'),
('2','70'),
('2','71'),
('2','76'),
('2','77'),
('3','0'),
('3','1'),
('3','2'),
('3','3'),
('3','4'),
('3','8'),
('3','11'),
('3','12'),
('3','13'),
('3','16'),
('3','17'),
('3','27'),
('3','38'),
('3','39'),
('3','40'),
('3','41'),
('3','42'),
('3','43'),
('3','44'),
('3','51'),
('3','52'),
('3','56'),
('3','58'),
('3','61'),
('3','70'),
('3','71'),
('3','76'),
('3','77'),
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
('EXT','Personnel externe','1'),
('JSP','Jeune Sapeur Pompier','1'),
('PATS','Personnel Administratif Technique et Spécialisé','1'),
('SPP','Sapeur Pompier Professionnel','1'),
('SPV','Sapeur Pompier Volontaire','1');

delete from type_evenement where TE_CODE in ('AIP','AH','DPS','MAN');
INSERT INTO type_evenement (TE_CODE,TE_LIBELLE,CEV_CODE,TE_MAIN_COURANTE,TE_VICTIMES,TE_MULTI_DUPLI,TE_ICON,EVAL_PAR_STAGIAIRES,PROCES_VERBAL,FICHE_PRESENCE,ORDRE_MISSION,CONVENTION,EVAL_RISQUE,CONVOCATIONS,FACTURE_INDIV,ACCES_RESTREINT,TE_PERSONNEL,TE_VEHICULES,TE_MATERIEL,TE_CONSOMMABLES,COLONNE_RENFORT) VALUES
('AIP','Aide aux populations','C_OPE','1','1','0','AIP.png','0','0','0','1','0','0','1','0','0','1','1','1','1','1'),
('AH','Autres actions humanitaires','C_OPE','1','0','1','AH.png','0','0','0','1','0','0','1','0','0','1','1','1','1','1'),
('DPS','Dispositif Prévisionnel de Secours','C_SEC','1','1','0','DPS.png','0','0','0','1','1','1','1','0','0','1','1','1','1','1'),
('MAN','Manoeuvre','C_FOR','0','0','1','MAN.png','0','0','1','1','0','0','1','0','0','1','1','1','1','0');

delete from type_garde;
INSERT INTO type_garde (EQ_ID,EQ_NOM,EQ_JOUR,EQ_NUIT,S_ID,EQ_PERSONNEL1,EQ_PERSONNEL2,EQ_VEHICULES,EQ_SPP,EQ_DEBUT1,EQ_FIN1,EQ_DUREE1,EQ_DEBUT2,EQ_FIN2,EQ_DUREE2,EQ_ICON,ASSURE_PAR1,ASSURE_PAR2,ASSURE_PAR_DATE,EQ_REGIME_TRAVAIL,EQ_ADDRESS,EQ_LIEU) VALUES
('1','Garde en caserne','1','1','0','6','6','1','0','07:30:00','19:30:00','12','19:30:00','07:30:00','12','images/gardes/GAR.png','2','2','2018-06-09 15:20:27','3','',NULL),
('2','Feux de forêts','1','0','0','4','0','1','0','12:00:00','20:00:00','8',NULL,NULL,NULL,'images/gardes/FDF.png','1','1','2007-11-19 00:00:00','0',NULL,NULL);

delete from type_participation where TE_CODE='GAR';
INSERT INTO type_participation (TP_ID,TE_CODE,TP_NUM,TP_LIBELLE,PS_ID,PS_ID2,INSTRUCTOR,EQ_ID) VALUES
('9','GAR','1','Chef d\'agrés fourgon','0','0','0','1'),
('10','GAR','2','Conducteur fourgon','0','0','0','1'),
('11','GAR','3','Chef BAL','0','0','0','1'),
('12','GAR','4','Equipier BAL','0','0','0','1'),
('13','GAR','5','Chef BAT','0','0','0','1'),
('14','GAR','6','Equipier BAT','0','0','0','1'),
('15','GAR','7','Chef d\'agrès échelle','0','0','0','1'),
('16','GAR','8','Conducteur échelle','0','0','0','1'),
('17','GAR','9','Chef d\'agrés VSAV','0','0','0','1'),
('18','GAR','9','Conducteur VSAV','0','0','0','1'),
('19','GAR','10','Brancardier','0','0','0','1'),
('20','GAR','1','Chef d\'agrès CCF','0','0','0','2'),
('21','GAR','2','Conducteur CCF','0','0','0','2'),
('22','GAR','3','Equipier CCF','0','0','0','2'),
('23','GAR','4','Chef de GIFF','0','0','0','2'),
('24','GAR','5','Conducteur VLHR','0','0','0','2');


INSERT INTO type_vehicule (TV_CODE,TV_LIBELLE,TV_NB,TV_USAGE,TV_ICON) VALUES
('VLC','Véhicule Léger de Commandement','2','DIVERS','images/vehicules/VLCG.png'),
('VCYN','Véhicule Cynotechnique','1','DIVERS','images/vehicules/CYNO.png'),
('ASSU','Ambulance de secours et de soins d\'urgence','3','SECOURS','images/vehicules/VSAV.png'),
('CCFL','Camion citerne Forêt léger','2','FEU','images/vehicules/CCF.png'),
('CCFM','Camion citerne Forêt moyen','4','FEU','images/vehicules/CCF.png'),
('CCFS','Camion citerne Forêt super','4','FEU','images/vehicules/CCGC.png'),
('CCGC','Camion citerne grande capacité','3','FEU','images/vehicules/CCGC.png'),
('CTU','Camionnette tous usages','3','DIVERS','images/vehicules/VTU.png'),
('EPA','Echelle pivotante automatique','3','FEU','images/vehicules/EPA.png'),
('ERS','Embarcation de Reconnaissance et de Sauvetage','3','SECOURS','images/vehicules/SR6.png'),
('FPT','Fourgon pompe tonne','8','FEU','images/vehicules/FPT.png'),
('FPTL','Fourgon pompe tonne léger','6','FEU','images/vehicules/FPT.png'),
('FPTLHR','Fourgon pompe tonne léger hors route','6','FEU','images/vehicules/FMOGP.png'),
('GER','Groupe Electrogène Remorquable','0','DIVERS',NULL),
('MPS','Moto de premiers secours','1','SECOURS','images/vehicules/MOTO.png'),
('PCM','Poste de Commandement Mobile','2','DIVERS','images/vehicules/PC.png'),
('QUAD','Véhicule quad','1','DIVERS','images/vehicules/QUAD.png'),
('VPI','Véhicule polyvalent d\'intervention','3','DIVERS','images/vehicules/VPI.png'),
('VPS','Véhicule de premier secours','3','SECOURS','images/vehicules/AMBULANCE1.png'),
('VSAV','Véhicule de secours aux blessés','3','SECOURS','images/vehicules/VSAV.png'),
('VSR','Véhicule de secours routier','3','SECOURS','images/vehicules/VSR.png'),
('VTD','Véhicule technique déblaiement','2','DIVERS','images/vehicules/VSD.png'),
('VTH','Véhicule technique hébergement','2','LOGISTIQUE','images/vehicules/CMIC.png'),
('VTI','Véhicule technique soutien intendance','2','LOGISTIQUE','images/vehicules/VIRT.png'),
('VTU','Véhicule tous usages','2','DIVERS','images/vehicules/VTU.png');

INSERT INTO type_vehicule_role (TV_CODE,ROLE_ID,ROLE_NAME,PS_ID) VALUES
('CCFL','1','chef d\'agrès','0'),
('CCFL','2','conducteur','0'),
('CCFM','1','chef d\'agrès','0'),
('CCFM','2','conducteur','0'),
('CCFM','3','équipier 1','0'),
('CCFM','4','équipier 2','0'),
('CCFS','1','chef d\'agrès','0'),
('CCFS','2','conducteur','0'),
('CCFS','3','équipier 1','0'),
('CCFS','4','équipier 2','0'),
('CCGC','1','chef d\'agrès','0'),
('CCGC','2','conducteur','0'),
('EPA','1','chef d\'agrès','0'),
('EPA','2','conducteur','0'),
('EPA','3','équipier','0'),
('ERS','1','pilote','0'),
('ERS','2','plongeur 1','0'),
('ERS','3','plongeur 2','0'),
('FPT','1','chef d\'agrès','0'),
('FPT','2','conducteur','0'),
('FPT','3','chef BAT','0'),
('FPT','4','équipier BAT','0'),
('FPT','5','chef BAL','0'),
('FPT','6','équipier BAL','0'),
('FPT','7','chef ATT','0'),
('FPT','8','équipier ATT','0'),
('FPTL','1','chef d\'agrès','0'),
('FPTL','2','conducteur','0'),
('FPTL','3','chef BAT','0'),
('FPTL','4','équipier BAT','0'),
('FPTL','5','chef BAL','0'),
('FPTL','6','équipier BAL','0'),
('FPTLHR','1','chef d\'agrès','0'),
('FPTLHR','2','conducteur','0'),
('FPTLHR','3','chef BAT','0'),
('FPTLHR','4','équipier BAT','0'),
('FPTLHR','5','chef BAL','0'),
('FPTLHR','6','équipier BAL','0'),
('PCM','1','chef d\'agrès','0'),
('PCM','2','conducteur','0'),
('QUAD','1','conducteur','0'),
('VCYN','1','conducteur','0'),
('VLC','1','chef d\'agrès','0'),
('VLC','2','conducteur','0'),
('VPI','1','chef d\'agrès','0'),
('VPI','2','conducteur','0'),
('VPI','3','équipier','0'),
('VSAV','1','chef d\'agrès','0'),
('VSAV','2','conducteur','0'),
('VSAV','3','équipier','0'),
('VSR','1','chef d\'agrès','0'),
('VSR','2','conducteur','0'),
('VSR','3','équipier','0'),
('VTD','1','chef d\'agrès','0'),
('VTD','2','conducteur','0'),
('VTH','1','chef d\'agrès','0'),
('VTH','2','conducteur','0'),
('VTI','1','chef d\'agrès','0'),
('VTI','2','conducteur','0'),
('VTU','1','chef d\'agrès','0'),
('VTU','2','conducteur','0'),
('VTU','3','équipier','0');

# ------------------------------------;
# end of specific data
# ------------------------------------;