# ------------------------------------;
# specific data for hospital
# ------------------------------------;

delete from equipe where EQ_ID in (3,5);
INSERT INTO equipe (EQ_ID,EQ_NOM,EQ_ORDER) VALUES
('3','Secourisme','3');

delete from poste where EQ_ID in (3) or PS_ID in ('18');
INSERT INTO poste (PS_ID,PS_ORDER,EQ_ID,TYPE,DESCRIPTION,PS_FORMATION,PS_EXPIRABLE,PS_AUDIT,PS_DIPLOMA,PS_NUMERO,PS_RECYCLE,PS_USER_MODIFIABLE,PS_PRINTABLE,PS_PRINT_IMAGE,PS_NATIONAL,PS_SECOURISME,F_ID,PH_CODE,PH_LEVEL) VALUES
('12','12','3','PSE1','Equipier secouriste PSE1','1','1','0','1','1','1','0','1','0','0','1','4','Secourisme','1'),
('13','13','3','PSE2','Equipier secouriste PSE2','1','1','0','1','1','1','0','1','0','0','1','4','Secourisme','2'),
('14','14','3','PAE PSC','Formateur en Prévention et Secours Civiques','1','1','0','1','1','1','0','0','0','0','1','4',NULL,NULL),
('15','15','3','PAE PS','Formateur aux Premiers Secours','1','1','0','1','1','1','0','0','0','0','1','4',NULL,NULL),
('16','16','3','FDF PSE','Formateur de Formateurs aux Premiers Secours','1','1','0','1','1','1','0','0','0','0','1','4',NULL,NULL),
('20','11','3','PSC1','Premiers secours civique','1','0','0','1','1','0','0','1','0','0','1','4','Secourisme','0'),
('18','18','4','PB','Permis blanc','0','0','0','1','1','0','0','0','0','0','0','4',NULL,NULL);

delete from poste_hierarchie where PH_CODE in ('Secourisme','INC','COD','DIV');
INSERT INTO poste_hierarchie (PH_CODE,PH_NAME,PH_HIDE_LOWER,PH_UPDATE_LOWER_EXPIRY,PH_UPDATE_MANDATORY) VALUES
('Secourisme','Premiers secours','1','1','0');

delete from grade where G_CATEGORY='HOSP';
INSERT INTO grade (G_GRADE,G_DESCRIPTION,G_LEVEL,G_TYPE,G_CATEGORY) VALUES
('MED','Médecin','10','soignants','HOSP'),
('INF','Infirmier(e)','5','soignants','HOSP'),
('AS','Aide Soignant','2','soignants','HOSP'),
('AMB','Ambulancier','1','soignants','HOSP');

delete from statut;
INSERT INTO statut (S_STATUT,S_DESCRIPTION,S_CONTEXT) VALUES
('PRES', 'Prestataire', '0'),
('EXT','Personnel externe','0'),
('SAL','Personnel salarié','0'),
('FONC','Fonctionnaire','0');

INSERT INTO type_garde (EQ_ID,EQ_NOM,EQ_JOUR,EQ_NUIT,S_ID,EQ_PERSONNEL1,EQ_PERSONNEL2,EQ_VEHICULES,EQ_SPP,EQ_DEBUT1,EQ_FIN1,EQ_DUREE1,EQ_DEBUT2,EQ_FIN2,EQ_DUREE2,EQ_ICON,ASSURE_PAR1,ASSURE_PAR2,ASSURE_PAR_DATE,EQ_REGIME_TRAVAIL,EQ_ADDRESS,EQ_LIEU) VALUES
('1','Garde hôpital','1','1','0','6','6','1','0','07:30:00','19:30:00','12','19:30:00','07:30:00','12','images/gardes/COU.png','2','2','2018-06-09 15:20:27','3','',NULL);

delete from type_participation where TE_CODE='GAR';
INSERT INTO type_participation (TP_ID,TE_CODE,TP_NUM,TP_LIBELLE,PS_ID,PS_ID2,INSTRUCTOR,EQ_ID) VALUES
('17','GAR','9','Accueil urgence','0','0','0','1'),
('18','GAR','9','Soins urgence','0','0','0','1'),
('19','GAR','10','Conducteur SMUR','0','0','0','1'),
('20','GAR','10','Infirmier SMUR','0','0','0','1'),
('21','GAR','10','Médecin SMUR','0','0','0','1');


INSERT INTO type_vehicule (TV_CODE,TV_LIBELLE,TV_NB,TV_USAGE,TV_ICON) VALUES
('ASSU','Ambulance de secours et de soins d\'urgence','2','SECOURS','images/vehicules/VSAV.png'),
('MPS','Moto de premiers secours','1','SECOURS','images/vehicules/MOTO.png'),
('PCM','Poste de Commandement Mobile','2','DIVERS','images/vehicules/PC.png'),
('VPS','Véhicule de premier secours','3','SECOURS','images/vehicules/AMBULANCE1.png'),
('VSAV','Véhicule de secours aux blessés','3','SECOURS','images/vehicules/VSAV.png'),
('VSR','Véhicule de secours routier','3','SECOURS','images/vehicules/VSR.png'),
('VTI','Véhicule technique soutien intendance','2','LOGISTIQUE','images/vehicules/VIRT.png');


INSERT INTO type_vehicule_role (TV_CODE,ROLE_ID,ROLE_NAME,PS_ID) VALUES
('ASSU','1','chef d\'équipe','0'),
('ASSU','2','conducteur','0'),
('VSAV','1','chef d\'équipe','0'),
('VSAV','2','conducteur','0'),
('VSAV','3','équipier','0'),
('VSR','1','chef d\'équipe','0'),
('VSR','2','conducteur','0'),
('VSR','3','équipier','0'),
('VTI','1','chef d\'équipe','0'),
('VTI','2','conducteur','0');

# ------------------------------------;
# end of specific data
# ------------------------------------;