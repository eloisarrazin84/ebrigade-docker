# ------------------------------------;
# specific data for association secours
# ------------------------------------;

UPDATE configuration set value='0' where NAME='grades';

delete from equipe where EQ_ID in (3);
INSERT INTO equipe (EQ_ID,EQ_NOM,EQ_ORDER) VALUES
('3','Secourisme','3');

delete from poste where EQ_ID in (3,5) or PS_ID in (18,30,31);
INSERT INTO poste (PS_ID,PS_ORDER,EQ_ID,TYPE,DESCRIPTION,PS_FORMATION,PS_EXPIRABLE,PS_AUDIT,PS_DIPLOMA,PS_NUMERO,PS_RECYCLE,PS_USER_MODIFIABLE,PS_PRINTABLE,PS_PRINT_IMAGE,PS_NATIONAL,PS_SECOURISME,F_ID,PH_CODE,PH_LEVEL) VALUES
('12','12','3','PSE1','Equipier secouriste PSE1','1','1','0','1','1','1','0','1','0','0','1','4','Secourisme','1'),
('13','13','3','PSE2','Equipier secouriste PSE2','1','1','0','1','1','1','0','1','0','0','1','4','Secourisme','2'),
('14','14','3','PAE PSC','Formateur en Prévention et Secours Civiques','1','1','0','1','1','1','0','0','0','0','1','4',NULL,NULL),
('15','15','3','PAE PS','Formateur aux Premiers Secours','1','1','0','1','1','1','0','0','0','0','1','4',NULL,NULL),
('16','16','3','FDF PSE','Formateur de Formateurs aux Premiers Secours','1','1','0','1','1','1','0','0','0','0','1','4',NULL,NULL),
('20','11','3','PSC1','Premiers secours civique','1','0','0','1','1','0','0','1','0','0','1','4','Secourisme','0'),
('18','18','4','PB','Permis blanc','0','0','0','1','1','0','0','0','0','0','0','4',NULL,NULL);

delete from poste_hierarchie where PH_CODE in ('Secourisme');
INSERT INTO poste_hierarchie (PH_CODE,PH_NAME,PH_HIDE_LOWER,PH_UPDATE_LOWER_EXPIRY,PH_UPDATE_MANDATORY) VALUES
('Secourisme','Premiers secours','1','1','0');

delete from destination where D_CODE in ('ACC','DOUCH','MISS');
INSERT INTO destination (D_CODE,D_NAME) VALUES
('ACC','Accueil de jour/nuit'),
('DOUCH','Douche publique'),
('MISS','Mission locale');

delete from grade where G_CATEGORY='SC';
INSERT INTO grade (G_GRADE,G_DESCRIPTION,G_LEVEL,G_TYPE,G_CATEGORY) VALUES
('EQ','Equipier','1','secouriste','SC'),
('CE','Chef d\'Equipe','2','secouriste','SC'),
('CS','Chef de Secteur','3','secouriste','SC'),
('CD','Chef de Dispositif','4','secouriste','SC');

delete from groupe where GP_ID in (104,105,106,107,108,109);
INSERT INTO groupe (GP_ID,GP_DESCRIPTION,TR_CONFIG,TR_SUB_POSSIBLE,TR_ALL_POSSIBLE,TR_WIDGET,GP_USAGE,GP_ASTREINTE,GP_ORDER) VALUES
('104','Trésorier','2','1','0','0','internes','0','50'),
('105','Secrétaire général','2','0','0','0','internes','0','50'),
('106','Directeur','2','0','0','0','internes','0','50'),
('107','Responsable opérationnel','3','1','0','1','internes','1','50'),
('108','Webmaster','3','1','0','0','internes','0','50'),
('109','Responsable véhicules/matériel','3','1','0','0','internes','0','50');

delete from habilitation where GP_ID in (104,105,106,107,108,109);
INSERT INTO habilitation (GP_ID,F_ID) VALUES
('104','38'),
('104','39'),
('104','40'),
('104','41'),
('104','42'),
('104','43'),
('104','44'),
('104','51'),
('104','52'),
('104','56'),
('104','58'),
('104','61'),
('105','38'),
('105','39'),
('105','40'),
('105','41'),
('105','42'),
('105','43'),
('105','44'),
('105','51'),
('105','52'),
('105','56'),
('105','58'),
('105','61'),
('106','38'),
('106','39'),
('106','40'),
('106','41'),
('106','42'),
('106','43'),
('106','44'),
('106','51'),
('106','52'),
('106','56'),
('106','58'),
('106','61'),
('107','38'),
('107','39'),
('107','40'),
('107','41'),
('107','42'),
('107','43'),
('107','44'),
('107','51'),
('107','52'),
('107','56'),
('107','58'),
('107','61'),
('108','38'),
('108','39'),
('108','40'),
('108','41'),
('108','42'),
('108','43'),
('108','44'),
('108','51'),
('108','52'),
('108','56'),
('108','58'),
('108','61'),
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
('BEN','Personnel bénévole','0'),
('EXT','Personnel externe','0'),
('SAL','Personnel salarié','0');

delete from transporteur where T_CODE='ASS';
INSERT INTO transporteur (T_CODE,T_NAME) VALUES
('AUTASS','Autre Association'),
('ASS','Notre Association');

delete from type_document where TD_CODE='DPS';
INSERT INTO type_document (TD_CODE,TD_LIBELLE,TD_SECURITY,TD_SYNDICATE) VALUES
('DPS','D.P.S.','0','0');

delete from type_evenement where TE_CODE in ('AIP','AH','COOP','EXE','HEB','MAR','ALERT','NAUT','MED','DPS');
INSERT INTO type_evenement (TE_CODE,TE_LIBELLE,CEV_CODE,TE_MAIN_COURANTE,TE_VICTIMES,TE_MULTI_DUPLI,TE_ICON,EVAL_PAR_STAGIAIRES,PROCES_VERBAL,FICHE_PRESENCE,ORDRE_MISSION,CONVENTION,EVAL_RISQUE,CONVOCATIONS,FACTURE_INDIV,ACCES_RESTREINT,TE_PERSONNEL,TE_VEHICULES,TE_MATERIEL,TE_CONSOMMABLES,COLONNE_RENFORT) VALUES
('AIP','Aide aux populations','C_OPE','1','1','0','AIP.png','0','0','0','1','0','0','1','0','0','1','1','1','1','1'),
('AH','Autres actions humanitaires','C_OPE','1','0','1','AH.png','0','0','0','1','0','0','1','0','0','1','1','1','1','1'),
('COOP','Coopération état-sdis-samu','C_SEC','1','1','0','COOP.png','0','0','0','1','0','0','1','0','0','1','1','1','1','1'),
('EXE','Participation à exercice état-sdis-samu','C_FOR','1','1','0','EXE.png','0','0','1','1','0','0','1','0','0','1','1','1','1','0'),
('HEB','Hébergement d\'urgence','C_OPE','1','1','0','HEB.png','0','0','0','1','0','0','1','0','0','1','1','1','1','1'),
('MAR','Maraude','C_SEC','1','1','1','MAR.png','0','0','0','1','0','0','1','0','0','1','1','1','1','1'),
('ALERT','Alerte des bénévoles','C_OPE','1','1','0','MET.png','0','0','0','1','0','0','1','0','0','1','1','1','1','1'),
('NAUT','Activité nautique','C_SEC','1','1','0','NAUT.png','0','0','0','1','0','0','1','0','0','1','1','1','1','1'),
('MED','Médicalisation, équipe médicale','C_SEC','0','0','0','MED.png','0','0','0','1','0','0','1','0','0','1','1','1','1','1'),
('DPS','Dispositif Prévisionnel de Secours','C_SEC','1','1','0','DPS.png','0','0','0','1','1','1','1','0','0','1','1','1','1','1');

INSERT INTO type_garde (EQ_ID,EQ_NOM,EQ_JOUR,EQ_NUIT,S_ID,EQ_PERSONNEL1,EQ_PERSONNEL2,EQ_VEHICULES,EQ_SPP,EQ_DEBUT1,EQ_FIN1,EQ_DUREE1,EQ_DEBUT2,EQ_FIN2,EQ_DUREE2,EQ_ICON,ASSURE_PAR1,ASSURE_PAR2,ASSURE_PAR_DATE,EQ_REGIME_TRAVAIL,EQ_ADDRESS,EQ_LIEU) VALUES
('1','Garde en caserne','1','1','0','6','6','1','0','07:30:00','19:30:00','12','19:30:00','07:30:00','12','images/gardes/GAR.png','2','2','2018-06-09 15:20:27','3','',NULL);

delete from type_participation where TE_CODE in ('GAR','DPS');
INSERT INTO type_participation (TP_ID,TE_CODE,TP_NUM,TP_LIBELLE,PS_ID,PS_ID2,INSTRUCTOR,EQ_ID) VALUES
('17','GAR','9','Chef d\'agrés VSAV','0','0','0','1'),
('18','GAR','9','Conducteur VSAV','0','0','0','1'),
('19','GAR','10','Brancardier','0','0','0','1'),
('5','DPS','1','Chef de dispositif','0','0','0','0'),
('6','DPS','2','Chef de secteur','0','0','0','0'),
('7','DPS','3','Chef de poste','0','0','0','0'),
('8','DPS','4','Conducteur ambulance','0','0','0','0');

INSERT INTO type_vehicule (TV_CODE,TV_LIBELLE,TV_NB,TV_USAGE,TV_ICON) VALUES
('VLC','Véhicule Léger de Commandement','2','DIVERS','images/vehicules/VLCG.png'),
('VCYN','Véhicule Cynotechnique','1','DIVERS','images/vehicules/CYNO.png'),
('ASSU','Ambulance de secours et de soins d\'urgence','3','SECOURS','images/vehicules/VSAV.png'),
('CTU','Camionnette tous usages','3','DIVERS','images/vehicules/VTU.png'),
('ERS','Embarcation de Reconnaissance et de Sauvetage','3','SECOURS','images/vehicules/SR6.png'),
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
('PCM','1','chef d\'équipe','0'),
('PCM','2','conducteur','0'),
('QUAD','1','conducteur','0'),
('VCYN','1','conducteur','0'),
('VLC','1','chef d\'équipe','0'),
('VLC','2','conducteur','0'),
('VPI','1','chef d\'équipe','0'),
('VPI','2','conducteur','0'),
('VPI','3','équipier','0'),
('VSAV','1','chef d\'équipe','0'),
('VSAV','2','conducteur','0'),
('VSAV','3','équipier','0'),
('VSR','1','chef d\'équipe','0'),
('VSR','2','conducteur','0'),
('VSR','3','équipier','0'),
('VTD','1','chef d\'équipe','0'),
('VTD','2','conducteur','0'),
('VTH','1','chef d\'équipe','0'),
('VTH','2','conducteur','0'),
('VTI','1','chef d\'équipe','0'),
('VTI','2','conducteur','0'),
('VTU','1','chef d\'équipe','0'),
('VTU','2','conducteur','0'),
('VTU','3','équipier','0');


# ------------------------------------;
# end of specific data
# ------------------------------------;