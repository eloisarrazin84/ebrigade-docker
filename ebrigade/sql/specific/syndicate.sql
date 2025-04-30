# ------------------------------------;
# specific data for syndicate fonction publiqque
# ------------------------------------;

delete from grade where G_CATEGORY='PATS';
INSERT INTO grade (G_GRADE,G_DESCRIPTION,G_LEVEL,G_TYPE,G_CATEGORY) VALUES
('AA1','adjoint administratif 1�re classe','3','adjoints administratifs','PATS'),
('AA2','adjoint administratif 2�me classe','2','adjoints administratifs','PATS'),
('AA2NT','adjoint administratif 2�me classe non titulaire','1','adjoints administratifs','PATS'),
('AAP1','adjoint administratif principal de 1�re classe','5','adjoints administratifs','PATS'),
('AAP2','adjoint administratif principal de 2�me classe','4','adjoints administratifs','PATS'),
('AM','agent de ma�trise','25','agents de ma�trise','PATS'),
('AMP','agent de ma�trise principal','26','agents de ma�trise','PATS'),
('AT1','adjoint technique de 1�re classe','22','adjoints technique','PATS'),
('AT2','adjoint technique de 2�me classe','21','adjoints technique','PATS'),
('AT2NT','adjoint technique de 2�me classe non titulaire','20','adjoints technique','PATS'),
('ATP','attach� principal','10','adjoints administratifs','PATS'),
('ATP1','adjoint technique principal de 1�re classe','24','adjoints technique','PATS'),
('ATP2','adjoint technique principal de 2�me classe','23','adjoints technique','PATS'),
('ATT','attach�','9','attach�s','PATS'),
('COT','contr�leur de travaux','30','adjoints technique','PATS'),
('COTC','contr�leur de travaux en chef','32','adjoints technique','PATS'),
('COTP','contr�leur principal de travaux','31','adjoints technique','PATS'),
('DT','directeur territorial','11','cadres administratifs','PATS'),
('ICCE','ing�nieur en chef de classe exceptionnelle','35','cadres technique','PATS'),
('ICCNC','ing�nieur en chef de classe normale','36','cadres technique','PATS'),
('IG','ing�nieur','33','cadres technique','PATS'),
('IGP','ing�nieur principal','34','cadres technique','PATS'),
('RED','r�dacteur','6','r�dacteurs','PATS'),
('REDC','r�dacteur chef','8','r�dacteurs','PATS'),
('REDP','r�dacteur principal','7','r�dacteurs','PATS'),
('TS','technicien sup�rieur','27','adjoints technique','PATS'),
('TSC','technicien sup�rieur chef','29','adjoints technique','PATS'),
('TSP','technicien sup�rieur principal','28','adjoints technique','PATS'),
('ADM','administrateur','12','cadres administratifs','PATS'),
('ADMHC','administrateur hors classe','13','cadres administratifs','PATS'),
('AA','Adjoint Administratif','1','adjoints administratifs','PATS'),
('REDP1','r�dacteur principal de 1�re classe','7','r�dacteurs','PATS'),
('REDP2','r�dacteur principal de 2�me classe','7','r�dacteurs','PATS'),
('TEC','technicien','26','adjoints technique','PATS'),
('TECP1','technicien principal de 1�re classe','26','adjoints technique','PATS'),
('TECP2','technicien principal de 2�me classe','26','adjoints technique','PATS');

delete from groupe where GP_ID in (104,105);
INSERT INTO groupe (GP_ID,GP_DESCRIPTION,TR_CONFIG,TR_SUB_POSSIBLE,TR_ALL_POSSIBLE,TR_WIDGET,GP_USAGE,GP_ASTREINTE,GP_ORDER) VALUES
('104','Tr�sorier','2','1','0','0','internes','0','50'),
('105','Secr�taire g�n�ral','2','0','0','0','internes','0','50');

delete from habilitation where GP_ID in (104,105);
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
('105','61');

delete from statut;
INSERT INTO statut (S_STATUT,S_DESCRIPTION,S_CONTEXT) VALUES
('PRES', 'Prestataire', '0'),
('ADH','Adh�rent','0'),
('EXT','Personnel externe','0'),
('SAL','Personnel salari�','0'),
('FONC','Fonctionnaire','0');

delete from type_document where TD_CODE='DPS';
INSERT INTO type_document (TD_CODE,TD_LIBELLE,TD_SECURITY,TD_SYNDICATE) VALUES
('GADH','Guide de l\'adh�rent','0','1'),
('OUAD','Outils adh�rents','0','1');

delete from type_membre;
INSERT INTO type_membre (TM_ID,TM_SYNDICAT,TM_CODE) VALUES
('0','1','actif'),
('1','1','radi� - � sa demande'),
('2','1','radi� - d�part retraite'),
('3','1','radi� - impay�s'),
('4','1','radi� - d�mission'),
('5','1','radi� - d�c�d�'),
('6','1','radi� - mutation'),
('7','1','radi� - pr�sident'),
('8','1','radi� - disponibilit�'),
('9','1','radi� - exclusion'),
('10','1','radi� - autre motif');

delete from type_profession;
INSERT INTO type_profession (TP_CODE,TP_DESCRIPTION) VALUES
('FT','Fonctionnaire territorial');

update pompier set P_PROFESSION='FT';

# ------------------------------------;
# end of specific data
# ------------------------------------;