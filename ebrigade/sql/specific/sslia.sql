# ------------------------------------;
# specific data for SSLIA
# ------------------------------------;

UPDATE configuration set value='1' where NAME='grades';

delete from equipe where EQ_ID in (3,5);
INSERT INTO equipe (EQ_ID,EQ_NOM,EQ_ORDER) VALUES
('3','Secourisme','3'),
('5','Pompier','5');

delete from poste where EQ_ID in (3,5) or PS_ID in (18,30,32);
INSERT INTO poste (PS_ID,PS_ORDER,EQ_ID,TYPE,DESCRIPTION,PS_FORMATION,PS_EXPIRABLE,PS_AUDIT,PS_DIPLOMA,PS_NUMERO,PS_RECYCLE,PS_USER_MODIFIABLE,PS_PRINTABLE,PS_PRINT_IMAGE,PS_NATIONAL,PS_SECOURISME,F_ID,PH_CODE,PH_LEVEL) VALUES
('25','24','5','SAP2','Chef d\'agrès ambulance','0','0','0','0','0','0','0','0','0','0','0','4',NULL,NULL),
('26','25','5','DIV2','Chef d\'agrès divers','0','0','0','0','0','0','0','0','0','0','0','4','DIV','2'),
('27','1','5','INC1','Equipier incendie','1','0','0','0','0','0','0','0','0','0','0','4','INC','1'),
('28','1','5','CE','Chef d\'équipe incendie','1','0','0','0','0','0','0','0','0','0','0','4','INC','2'),
('29','1','5','INC2','Chef d\'agrès incendie','1','0','0','0','0','0','0','0','0','0','0','4','INC','3'),
('30','1','4','COD1','Conducteur engin pompe','0','0','0','0','0','0','0','0','0','0','0','4','COD','1'),
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

delete from poste_hierarchie where PH_CODE in ('Secourisme','INC','COD','DIV');
INSERT INTO poste_hierarchie (PH_CODE,PH_NAME,PH_HIDE_LOWER,PH_UPDATE_LOWER_EXPIRY,PH_UPDATE_MANDATORY) VALUES
('Secourisme','Premiers secours','1','1','0'),
('INC','Incendie','0','0','0'),
('COD','Conducteur engins incendie','0','0','0'),
('DIV','Interventions Diverses','1','0','0');

delete from grade where G_CATEGORY='SSLIA';
INSERT INTO grade (G_GRADE,G_DESCRIPTION,G_LEVEL,G_TYPE,G_CATEGORY) VALUES
('CS','Chef de Service','10','pompiers','SSLIA'),
('PA','Pompier d\'aéroport','5','pompiers','SSLIA'),
('CM','Chef de manoeuvre','7','pompiers','SSLIA');

UPDATE grade SET G_ICON = 'images/grades_sp/CPT.png', G_FLAG = 1 WHERE G_GRADE = 'CS' and G_CATEGORY = 'SSLIA';
UPDATE grade SET G_ICON = 'images/grades_sp/ADJ.png', G_FLAG = 1 WHERE G_GRADE = 'CM' and G_CATEGORY = 'SSLIA';
UPDATE grade SET G_ICON = 'images/grades_sp/CPL.png', G_FLAG = 1 WHERE G_GRADE = 'PA' and G_CATEGORY = 'SSLIA';


delete from statut;
INSERT INTO statut (S_STATUT,S_DESCRIPTION,S_CONTEXT) VALUES
('PRES', 'Prestataire', '0'),
('SAL','Personnel salarié','0'),
('SPP','Sapeur Pompier Professionnel','3'),
('SPV','Sapeur Pompier Volontaire','3');

delete from type_evenement where TE_CODE in ('MAN');
INSERT INTO type_evenement (TE_CODE,TE_LIBELLE,CEV_CODE,TE_MAIN_COURANTE,TE_VICTIMES,TE_MULTI_DUPLI,TE_ICON,EVAL_PAR_STAGIAIRES,PROCES_VERBAL,FICHE_PRESENCE,ORDRE_MISSION,CONVENTION,EVAL_RISQUE,CONVOCATIONS,FACTURE_INDIV,ACCES_RESTREINT,TE_PERSONNEL,TE_VEHICULES,TE_MATERIEL,TE_CONSOMMABLES,COLONNE_RENFORT) VALUES
('MAN','Manoeuvre','C_FOR','0','0','1','MAN.png','0','0','1','1','0','0','1','0','0','1','1','1','1','0');

INSERT INTO type_garde (EQ_ID,EQ_NOM,EQ_JOUR,EQ_NUIT,S_ID,EQ_PERSONNEL1,EQ_PERSONNEL2,EQ_VEHICULES,EQ_SPP,EQ_DEBUT1,EQ_FIN1,EQ_DUREE1,EQ_DEBUT2,EQ_FIN2,EQ_DUREE2,EQ_ICON,ASSURE_PAR1,ASSURE_PAR2,ASSURE_PAR_DATE,EQ_REGIME_TRAVAIL,EQ_ADDRESS,EQ_LIEU) VALUES
('1','Garde aéroport','1','1','0','6','6','1','0','07:30:00','19:30:00','12','19:30:00','07:30:00','12','images/gardes/CCGC.png','2','2','2018-06-09 15:20:27','3','',NULL);

delete from type_participation where TE_CODE='GAR';
INSERT INTO type_participation (TP_ID,TE_CODE,TP_NUM,TP_LIBELLE,PS_ID,PS_ID2,INSTRUCTOR,EQ_ID) VALUES
('9','GAR','1','Chef d\'agrés fourgon','0','0','0','1'),
('10','GAR','2','Conducteur fourgon','0','0','0','1'),
('11','GAR','3','Chef BAL','0','0','0','1'),
('12','GAR','4','Equipier BAL','0','0','0','1'),
('13','GAR','5','Chef BAT','0','0','0','1'),
('14','GAR','6','Equipier BAT','0','0','0','1'),
('17','GAR','9','Chef d\'agrés VSAV','0','0','0','1'),
('18','GAR','9','Conducteur VSAV','0','0','0','1'),
('19','GAR','10','Brancardier','0','0','0','1');

INSERT INTO type_vehicule (TV_CODE,TV_LIBELLE,TV_NB,TV_USAGE,TV_ICON) VALUES
('VLC','Véhicule Léger de Commandement','2','DIVERS','images/vehicules/VLCG.png'),
('CCGC','Camion citerne grande capacité','3','FEU','images/vehicules/CCGC.png'),
('CTU','Camionnette tous usages','3','DIVERS','images/vehicules/VTU.png'),
('EPA','Echelle pivotante automatique','3','FEU','images/vehicules/EPA.png'),
('ERS','Embarcation de Reconnaissance et de Sauvetage','3','SECOURS','images/vehicules/SR6.png'),
('FPT','Fourgon pompe tonne','8','FEU','images/vehicules/FPT.png'),
('FPTL','Fourgon pompe tonne léger','6','FEU','images/vehicules/FPT.png'),
('GER','Groupe Electrogène Remorquable','0','DIVERS',NULL),
('MPS','Moto de premiers secours','1','SECOURS','images/vehicules/MOTO.png'),
('QUAD','Véhicule quad','1','DIVERS','images/vehicules/QUAD.png'),
('VPI','Véhicule polyvalent d\'intervention','3','DIVERS','images/vehicules/VPI.png'),
('VSAV','Véhicule de secours aux blessés','3','SECOURS','images/vehicules/VSAV.png'),
('VTI','Véhicule technique soutien intendance','2','LOGISTIQUE','images/vehicules/VIRT.png'),
('VTU','Véhicule tous usages','2','DIVERS','images/vehicules/VTU.png'),
('VIM','Véhicule d\'intervention massive','2','DIVERS','images/vehicules/VIM.png');


INSERT INTO type_vehicule_role (TV_CODE,ROLE_ID,ROLE_NAME,PS_ID) VALUES
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
('VTU','3','équipier','0'),
('VIM','1','chef d\'agrès','0'),
('VIM','2','conducteur','0');

# ------------------------------------;
# end of specific data
# ------------------------------------;