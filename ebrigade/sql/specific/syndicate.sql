# ------------------------------------;
# specific data for syndicate fonction publiqque
# ------------------------------------;

delete from grade where G_CATEGORY='PATS';
INSERT INTO grade (G_GRADE,G_DESCRIPTION,G_LEVEL,G_TYPE,G_CATEGORY) VALUES
('AA1','adjoint administratif 1ère classe','3','adjoints administratifs','PATS'),
('AA2','adjoint administratif 2ème classe','2','adjoints administratifs','PATS'),
('AA2NT','adjoint administratif 2ème classe non titulaire','1','adjoints administratifs','PATS'),
('AAP1','adjoint administratif principal de 1ère classe','5','adjoints administratifs','PATS'),
('AAP2','adjoint administratif principal de 2ème classe','4','adjoints administratifs','PATS'),
('AM','agent de maîtrise','25','agents de maîtrise','PATS'),
('AMP','agent de maîtrise principal','26','agents de maîtrise','PATS'),
('AT1','adjoint technique de 1ère classe','22','adjoints technique','PATS'),
('AT2','adjoint technique de 2ème classe','21','adjoints technique','PATS'),
('AT2NT','adjoint technique de 2ème classe non titulaire','20','adjoints technique','PATS'),
('ATP','attaché principal','10','adjoints administratifs','PATS'),
('ATP1','adjoint technique principal de 1ère classe','24','adjoints technique','PATS'),
('ATP2','adjoint technique principal de 2ème classe','23','adjoints technique','PATS'),
('ATT','attaché','9','attachés','PATS'),
('COT','contrôleur de travaux','30','adjoints technique','PATS'),
('COTC','contrôleur de travaux en chef','32','adjoints technique','PATS'),
('COTP','contrôleur principal de travaux','31','adjoints technique','PATS'),
('DT','directeur territorial','11','cadres administratifs','PATS'),
('ICCE','ingénieur en chef de classe exceptionnelle','35','cadres technique','PATS'),
('ICCNC','ingénieur en chef de classe normale','36','cadres technique','PATS'),
('IG','ingénieur','33','cadres technique','PATS'),
('IGP','ingénieur principal','34','cadres technique','PATS'),
('RED','rédacteur','6','rédacteurs','PATS'),
('REDC','rédacteur chef','8','rédacteurs','PATS'),
('REDP','rédacteur principal','7','rédacteurs','PATS'),
('TS','technicien supérieur','27','adjoints technique','PATS'),
('TSC','technicien supérieur chef','29','adjoints technique','PATS'),
('TSP','technicien supérieur principal','28','adjoints technique','PATS'),
('ADM','administrateur','12','cadres administratifs','PATS'),
('ADMHC','administrateur hors classe','13','cadres administratifs','PATS'),
('AA','Adjoint Administratif','1','adjoints administratifs','PATS'),
('REDP1','rédacteur principal de 1ère classe','7','rédacteurs','PATS'),
('REDP2','rédacteur principal de 2ème classe','7','rédacteurs','PATS'),
('TEC','technicien','26','adjoints technique','PATS'),
('TECP1','technicien principal de 1ère classe','26','adjoints technique','PATS'),
('TECP2','technicien principal de 2ème classe','26','adjoints technique','PATS');

delete from groupe where GP_ID in (104,105);
INSERT INTO groupe (GP_ID,GP_DESCRIPTION,TR_CONFIG,TR_SUB_POSSIBLE,TR_ALL_POSSIBLE,TR_WIDGET,GP_USAGE,GP_ASTREINTE,GP_ORDER) VALUES
('104','Trésorier','2','1','0','0','internes','0','50'),
('105','Secrétaire général','2','0','0','0','internes','0','50');

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
('ADH','Adhérent','0'),
('EXT','Personnel externe','0'),
('SAL','Personnel salarié','0'),
('FONC','Fonctionnaire','0');

delete from type_document where TD_CODE='DPS';
INSERT INTO type_document (TD_CODE,TD_LIBELLE,TD_SECURITY,TD_SYNDICATE) VALUES
('GADH','Guide de l\'adhérent','0','1'),
('OUAD','Outils adhérents','0','1');

delete from type_membre;
INSERT INTO type_membre (TM_ID,TM_SYNDICAT,TM_CODE) VALUES
('0','1','actif'),
('1','1','radié - à sa demande'),
('2','1','radié - départ retraite'),
('3','1','radié - impayés'),
('4','1','radié - démission'),
('5','1','radié - décédé'),
('6','1','radié - mutation'),
('7','1','radié - président'),
('8','1','radié - disponibilité'),
('9','1','radié - exclusion'),
('10','1','radié - autre motif');

delete from type_profession;
INSERT INTO type_profession (TP_CODE,TP_DESCRIPTION) VALUES
('FT','Fonctionnaire territorial');

update pompier set P_PROFESSION='FT';

# ------------------------------------;
# end of specific data
# ------------------------------------;