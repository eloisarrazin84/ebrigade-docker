#====================================================
#  REFERENCE DATABASE
#===================================================
# project: eBrigade
# homepage: http://sourceforge.net/projects/ebrigade/
# version: 5.3
# Copyright (C) 2004, 2020 Nicolas MARCHE
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# ----------------------------------------------------------
# MYSQL Database dump
# Server : localhost:3308
# Database : scratch
# Db version : 5.3
# Date : 12 Apr 2021 at 21:33
# Dump Host : DESKTOP-43AVM4R
# ----------------------------------------------------------

SET sql_mode = '';

# ------------------------------------
# structure for table 'agrement'
# ------------------------------------
DROP TABLE IF EXISTS agrement ;
CREATE TABLE agrement (
TA_CODE varchar(7) NOT NULL,
S_ID smallint(6) DEFAULT '0' NOT NULL,
A_DEBUT date,
A_FIN date,
TAV_ID smallint(6),
A_COMMENT varchar(100),
PRIMARY KEY (S_ID, TA_CODE),
KEY TA_CODE (TA_CODE)
);
# ------------------------------------
# data for table 'agrement'
# ------------------------------------

# ------------------------------------
# structure for table 'astreinte'
# ------------------------------------
DROP TABLE IF EXISTS astreinte ;
CREATE TABLE astreinte (
AS_ID int(11) NOT NULL auto_increment,
S_ID int(11) NOT NULL,
GP_ID smallint(6) NOT NULL,
P_ID int(11) NOT NULL,
AS_DEBUT datetime NOT NULL,
AS_FIN datetime NOT NULL,
AS_UPDATED_BY int(11) NOT NULL,
AS_UPDATE_DATE datetime NOT NULL,
PRIMARY KEY (AS_ID),
KEY S_ID (S_ID),
KEY GP_ID (GP_ID),
KEY P_ID (P_ID),
KEY AS_DEBUT (AS_DEBUT),
KEY AS_FIN (AS_FIN)
);
# ------------------------------------
# data for table 'astreinte'
# ------------------------------------

# ------------------------------------
# structure for table 'audit'
# ------------------------------------
DROP TABLE IF EXISTS audit ;
CREATE TABLE audit (
P_ID int(11) DEFAULT '0' NOT NULL,
A_DEBUT datetime NOT NULL,
A_FIN datetime,
A_OS varchar(50),
A_BROWSER varchar(50),
A_IP varchar(20),
A_LAST_PAGE varchar(30),
PRIMARY KEY (P_ID, A_DEBUT),
KEY A_DEBUT (A_DEBUT),
KEY A_FIN (A_FIN)
);
# ------------------------------------
# data for table 'audit'
# ------------------------------------

# ------------------------------------
# structure for table 'badge_list'
# ------------------------------------
DROP TABLE IF EXISTS badge_list ;
CREATE TABLE badge_list (
P_ID int(11) NOT NULL,
DATE date NOT NULL,
S_ID smallint(6) NOT NULL,
P_PHOTO varchar(50),
PRIMARY KEY (P_ID, DATE)
);
# ------------------------------------
# data for table 'badge_list'
# ------------------------------------

# ------------------------------------
# structure for table 'bilan_evenement'
# ------------------------------------
DROP TABLE IF EXISTS bilan_evenement ;
CREATE TABLE bilan_evenement (
E_CODE int(11) NOT NULL,
TB_NUM smallint(6) NOT NULL,
BE_VALUE smallint(6) NOT NULL,
PRIMARY KEY (E_CODE, TB_NUM)
);
# ------------------------------------
# data for table 'bilan_evenement'
# ------------------------------------

# ------------------------------------
# structure for table 'bilan_victime'
# ------------------------------------
DROP TABLE IF EXISTS bilan_victime ;
CREATE TABLE bilan_victime (
V_ID int(11) NOT NULL,
BVP_ID smallint(6) NOT NULL,
BVP_VALUE varchar(250) NOT NULL,
PRIMARY KEY (V_ID, BVP_ID)
);
# ------------------------------------
# data for table 'bilan_victime'
# ------------------------------------

# ------------------------------------
# structure for table 'bilan_victime_category'
# ------------------------------------
DROP TABLE IF EXISTS bilan_victime_category ;
CREATE TABLE bilan_victime_category (
BVC_CODE varchar(8) NOT NULL,
BVC_TITLE varchar(60) NOT NULL,
BVC_PAGE varchar(5) DEFAULT 'PSE' NOT NULL,
BVC_ORDER tinyint(4) NOT NULL,
PRIMARY KEY (BVC_CODE),
KEY BVC_PAGE (BVC_PAGE)
);
# ------------------------------------
# data for table 'bilan_victime_category'
# ------------------------------------
INSERT INTO bilan_victime_category (BVC_CODE,BVC_TITLE,BVC_PAGE,BVC_ORDER) VALUES
('BILAN','Bilan pass�','PSE','9'),
('CIRCO','Circonstanciel','PSE','1'),
('CIRCU','Circulatoire','PSE','5'),
('DEVENIR','Pr�sences sur les lieux et Devenir de la victime','PSE','8'),
('GESTES','Gestes effectu�s','PSE','7'),
('LESIO','Bilan compl�mentaire','PSE','6'),
('NEURO','Neurologique','PSE','3'),
('NEUROG','Glasgow','PSE','3'),
('RENFOR','Demande renforts','PSE','2'),
('RESPI','Respiratoire','PSE','4'),
('CONTACT','Contacter','PSSP','1'),
('SIGREP','Signes Rep�res','PSSP','2'),
('EVOLUT','Evolution','PSSP','3'),
('SUITE','Suite donn�e','PSSP','4'),
('BILAN2','Bilan','PSSP','5');
# ------------------------------------
# structure for table 'bilan_victime_param'
# ------------------------------------
DROP TABLE IF EXISTS bilan_victime_param ;
CREATE TABLE bilan_victime_param (
BVP_ID smallint(6) NOT NULL,
BVC_CODE varchar(8) NOT NULL,
BVP_TITLE varchar(35) NOT NULL,
BVP_COMMENT varchar(120),
BVP_TYPE varchar(15) NOT NULL,
DOC_ONLY tinyint(4) DEFAULT '0' NOT NULL,
PRIMARY KEY (BVP_ID)
);
# ------------------------------------
# data for table 'bilan_victime_param'
# ------------------------------------
INSERT INTO bilan_victime_param (BVP_ID,BVC_CODE,BVP_TITLE,BVP_COMMENT,BVP_TYPE,DOC_ONLY) VALUES
('10','CIRCO','Lieu de l\'intervention','pr�ciser ici dans quel type de lieu se d�roule l\'intervention','dropdown','0'),
('20','CIRCO','Nature de l\'intervention','pr�ciser ici la nature de l\'intervention','dropdown','0'),
('30','CIRCO','Commentaire','commentaire libre concernant le lieu ou la nature de l\'intervention','text','0'),
('40','CIRCO','Type d\'intoxication','pr�ciser ici la nature de l\'intoxication','dropdown','0'),
('50','CIRCO','D�tail intoxication','pr�ciser ici la nature exacte et la quantit� absorb�e','text','0'),
('60','CIRCO','Commentaire','commentaire libre concernant le bilan circonstanciel','textarea','0'),
('100','RENFOR','Renforts demand�s','pr�ciser ici le type de renforts demand�s','text','0'),
('110','RENFOR','Risques','pr�ciser ici les risques rencontr�s','text','0'),
('120','RENFOR','Commentaire','pr�ciser ici les commentaires particuliers','textarea','0'),
('130','NEURO','Consciente','La victime est elle actuellement consciente?','radio','0'),
('140','NEURO','Perte de connaissance PCI','Perte de connaissance initiale, dur�e?','dropdown','0'),
('150','NEURO','D�sorient�e','Cliquez si la victime est d�sorient�e','checkbox','0'),
('160','NEURO','Agit�e','Cliquez si la victime est agit�e','checkbox','0'),
('170','NEURO','Vomissements','Cliquez si la victime vomit','checkbox','0'),
('180','NEURO','Convulsions','Cliquez si la victime convulse','checkbox','0'),
('190','NEURO','Pupilles r�actives','Cliquez si les yeux de la victime r�agissent � la lumi�re','radio','1'),
('200','NEURO','Pupilles sym�triques','Indiquez si les pupilles de la victime sont sym�triques, sinon pr�cisez','dropdown','0'),
('220','NEURO','Troubles motricit�','Cliquez si la victime souffre de troubles moteurs','dropdown','0'),
('230','NEUROG','Ouverture des yeux','Glasgow test ouverture des yeux','dropdown','1'),
('240','NEUROG','R�ponse verbale','Glasgow test r�ponse verbale','dropdown','1'),
('250','NEUROG','R�ponse motrice','Glasgow test r�ponse motrice','dropdown','1'),
('260','NEUROG','Score glasgow','Score glasgow entre 3 (coma profond ou mort) et 15 (tout va bien)','readonlytext','1'),
('300','RESPI','Ventilation','Ventilation active','radio','0'),
('310','RESPI','Fr�quence /mn','Mouvements respiratoires par minute','numeric','0'),
('320','RESPI','Facile','Respiration facile','radio','0'),
('330','RESPI','Ample','Respiration ample','radio','0'),
('340','RESPI','R�guli�re','Respiration r�guli�re','radio','0'),
('350','RESPI','Bruyante','Respiration bruyante','radio','0'),
('360','RESPI','Pauses','Respiration avec pauses','radio','0'),
('370','RESPI','Sueurs','Cochez si sueurs','checkbox','0'),
('380','RESPI','Cyanoses','Cochez si Cyanoses','checkbox','0'),
('390','RESPI','Sp O2 %','Saturation du sang en Oxyg�ne','numeric','0'),
('400','CIRCU','Pouls carotidien','Pr�sence de pouls au niveau carotidien','radio','0'),
('410','CIRCU','Fr�quence /mn','Fr�quence cardiaque par minute','numeric','0'),
('420','CIRCU','Pouls radial','Pr�sence de pouls au niveau des membres','radio','0'),
('430','CIRCU','Pouls r�gulier','Pouls r�gulier','radio','0'),
('440','CIRCU','Pouls bien frapp�','Pouls bien frapp�','radio','0'),
('450','CIRCU','Pression art�rielle','pression systolique / diastolique','text','0'),
('460','CIRCU','T.R.C','tension r�guli�rement constat�e','text','0'),
('470','CIRCU','P�leur muqueuses','Cochez si vous constatez une p�leur des muqueuses','checkbox','0'),
('480','CIRCU','Etat de la peau','Indiquez ici l\'�tat de la peau de la victime','dropdown','0'),
('500','LESIO','Traumatisme principal','Type de traumatisme','dropdown','0'),
('510','LESIO','Localisation','partie du corps affect�e par le traumatisme','dropdown','0'),
('520','LESIO','C�t�','c�t� du corps affect�e par le traumatisme','dropdown','0'),
('530','LESIO','Douleur','Echelle de la douleur','dropdown','0'),
('531','LESIO','Traumatisme secondaire','Type de traumatisme','dropdown','0'),
('532','LESIO','Localisation','partie du corps affect�e par le traumatisme','dropdown','0'),
('533','LESIO','C�t�','c�t� du corps affect�e par le traumatisme','dropdown','0'),
('534','LESIO','Douleur','Echelle de la douleur','dropdown','0'),
('535','LESIO','Traumatisme additionnel','Type de traumatisme','dropdown','0'),
('536','LESIO','Localisation','partie du corps affect�e par le traumatisme','dropdown','0'),
('537','LESIO','C�t�','c�t� du corps affect�e par le traumatisme','dropdown','0'),
('538','LESIO','Douleur','Echelle de la douleur','dropdown','0'),
('540','LESIO','Maladies ou Plaintes','M.H.T.A (maladies, hospitalisations, traitements, allergies) ou P.Q.R.S.T','textarea','0'),
('610','GESTES','Collier cervical','Pose d\'un collier','checkbox','0'),
('620','GESTES','Attelle','pose d\'une attelle','checkbox','0'),
('630','GESTES','M.I.D.','Utilisation matelas � d�pression','checkbox','0'),
('635','GESTES','Autres moyens','Autres moyens utilis�s','text','0'),
('640','GESTES','P.L.S.','position lat�rale de s�curit�','checkbox','0'),
('650','GESTES','Allong�','mise en position allong�','checkbox','0'),
('660','GESTES','Assis','mise en position assis','checkbox','0'),
('670','GESTES','1/2 assis','mise en position demi-assis','checkbox','0'),
('680','GESTES','Retrait du casque','Le casque a �t� retir�','checkbox','0'),
('685','GESTES','Autres gestes','Autres gestes utilis�s','text','0'),
('687','GESTES','D�sinfection','d�sinfection d\'une plaie','checkbox','0'),
('688','GESTES','Poche de froid','pose d\'une poche de froid','checkbox','0'),
('690','GESTES','Pansement compressif/CHU','pose d\'un pansement compressif','checkbox','0'),
('700','GESTES','Garrot','pose d\'un garrot, pr�ciser � quelle heure','checkbox','0'),
('705','GESTES','Heure Garrot','heure pr�cise','time','0'),
('710','GESTES','Aspiration','utilisation aspirateur � mucosit�s','checkbox','0'),
('720','GESTES','Inhalation O2','utilisation masque � oxyg�ne','checkbox','0'),
('722','GESTES','Insufflateur BAVU','utilisation BAVU','checkbox','0'),
('725','GESTES','O2 L/mn','d�bit oxyg�ne en litres par minute','numeric','0'),
('730','GESTES','Canule O.P','utilisation d\'une canule','checkbox','0'),
('740','GESTES','RCP (MCE)','r�animation cardio pulmonaire','checkbox','0'),
('750','GESTES','DAE','utilisation du d�fibrillateur automatique externe','checkbox','0'),
('760','GESTES','Heure DAE','heure d�but utilisation du d�fibrillateur automatique externe','time','0'),
('770','GESTES','Chocs d�livr�s','Nombre de chocs d�livr�s avec le DAE','numeric','0'),
('780','GESTES','Aide prise m�dicaments','Aide prise m�dicaments','checkbox','0'),
('790','GESTES','Nature m�dicaments','liste des m�dicaments et quantit�','text','0'),
('800','GESTES','Temp�rature','Temp�rature en �C','float','0'),
('810','GESTES','Glyc�mie','Mesure de glyc�mie','float','1'),
('1000','DEVENIR','M�decin','Cochez si un m�decin est pr�sent','checkbox','1'),
('1010','DEVENIR','Infirmier','Cochez si un infirmier est pr�sent','checkbox','1'),
('1020','DEVENIR','SAMU','Cochez si le SAMU est pr�sent','checkbox','1'),
('1030','DEVENIR','Sapeurs-Pompiers','Cochez si les sapeurs pompiers sont pr�sents','checkbox','0'),
('1040','DEVENIR','Police','Cochez si la police ou Gendarmerie sont pr�sents','checkbox','0'),
('1050','DEVENIR','Transport','Pr�cisez si la victime a �t� transport�e, �vacu�e','checkbox','0'),
('1060','DEVENIR','Evacuation par','Pr�cisez qui a transport� la victime','dropdown','0'),
('1070','DEVENIR','Destination','Pr�cisez o� la victime a �t� transport�e, �vacu�e','dropdown','0'),
('1075','DEVENIR','Pr�cision destination','d�tail sur la destination de la victime','text','0'),
('1080','DEVENIR','Laiss� sur place','Pr�cisez si la victime a �t� transport�e, �vacu�e','checkbox','0'),
('1090','DEVENIR','Refus de prise en charge','Si coch�, faire signer l\'attestation de refus','checkbox','0'),
('1110','DEVENIR','DCD','Victime d�c�d�e','checkbox','1'),
('1200','BILAN','Heure Bilan pass� au PC','Indiquer � quelle heure le bilan a �t� pass� au PC','time','0'),
('1210','BILAN','Heure Contact SAMU 15','Indiquer � quelle heure le SAMU 15 a �t� contact�','time','0'),
('1220','BILAN','Observations','Indiquer ici les ant�c�dents, traitements, allergies','textarea','0'),
('1100','DEVENIR','Repartie par ses propres moyens','La victime est partie seule ou accompagn�e par ses proches.','checkbox','0'),
('1072','DEVENIR','Heure arriv�e','Heure arriv�e � l\'h�pital','time','0'),
('1900','CONTACT','T�l�phone',NULL,'text','0'),
('1910','CONTACT','Personne � pr�venir',NULL,'text','0'),
('2000','SIGREP','Agitation',NULL,'checkbox','0'),
('2001','SIGREP','Confusion',NULL,'checkbox','0'),
('2002','SIGREP','Euphorie',NULL,'checkbox','0'),
('2003','SIGREP','M�fiance',NULL,'checkbox','0'),
('2004','SIGREP','Prostration',NULL,'checkbox','0'),
('2005','SIGREP','Fuite Panique',NULL,'checkbox','1'),
('2006','SIGREP','Col�re',NULL,'checkbox','0'),
('2010','SIGREP','Culpabilit�',NULL,'checkbox','0'),
('2008','SIGREP','Sid�ration',NULL,'checkbox','1'),
('2011','SIGREP','Gestes Automatiques',NULL,'checkbox','1'),
('2012','SIGREP','Tristesse',NULL,'checkbox','0'),
('2013','SIGREP','D�r�alisation',NULL,'checkbox','1'),
('2014','SIGREP','Agressivit�',NULL,'checkbox','0'),
('2015','SIGREP','Angoisse',NULL,'checkbox','0'),
('2016','SIGREP','Pleurs',NULL,'checkbox','0'),
('2030','SIGREP','Contact Relationnel','indiquer ici le niveau du contact relationnel','dropdown','0'),
('2035','SIGREP','Verbalisation','indiquer la verbalisation','dropdown','0'),
('2040','SIGREP','R�cit de l\'�venement','indiquer comment la personne rqconte l\'�venement','dropdown','0'),
('2100','EVOLUT','Evolution',NULL,'dropdown','0'),
('2103','EVOLUT','Observation',NULL,'textarea','0'),
('2120','SUITE','Avis m�dical',NULL,'checkbox','0'),
('2121','SUITE','Avis CUMP',NULL,'checkbox','0'),
('2125','SUITE','Evacuation',NULL,'checkbox','0'),
('2126','SUITE','Heure','heure �vacuation','time','0'),
('2128','SUITE','H�pital',NULL,'checkbox','0'),
('2129','SUITE','Domicile seul',NULL,'checkbox','0'),
('2130','SUITE','Accompagn�',NULL,'checkbox','0'),
('2200','BILAN2','Pouls++',NULL,'numeric','0');
# ------------------------------------
# structure for table 'bilan_victime_values'
# ------------------------------------
DROP TABLE IF EXISTS bilan_victime_values ;
CREATE TABLE bilan_victime_values (
BVP_ID smallint(6) NOT NULL,
BVP_INDEX smallint(6) NOT NULL,
BVP_TEXT varchar(60),
BVP_SPECIAL varchar(10),
PRIMARY KEY (BVP_ID, BVP_INDEX)
);
# ------------------------------------
# data for table 'bilan_victime_values'
# ------------------------------------
INSERT INTO bilan_victime_values (BVP_ID,BVP_INDEX,BVP_TEXT,BVP_SPECIAL) VALUES
('10','1','Public',NULL),
('10','2','Priv�',NULL),
('10','3','Travail',NULL),
('10','4','DPS',NULL),
('10','5','Autre',NULL),
('20','1','Accident',NULL),
('20','2','Maladie',NULL),
('20','3','Malaise',NULL),
('20','4','Intoxication',NULL),
('20','5','Noyade',NULL),
('20','6','Autre',NULL),
('40','1','Alcool',NULL),
('40','2','CO',NULL),
('40','3','M�dicament',NULL),
('40','4','Drogue',NULL),
('140','1','Pas de PCI',NULL),
('140','2','1 minute ou moins',NULL),
('140','3','2 minutes',NULL),
('140','4','3 minutes',NULL),
('140','5','4 minutes',NULL),
('140','6','5 minutes',NULL),
('140','7','10 minutes',NULL),
('140','8','15 minutes',NULL),
('140','9','20 minutes',NULL),
('140','10','30 minutes',NULL),
('140','11','45 minutes',NULL),
('140','12','1 heure',NULL),
('140','13','Plusieurs heures',NULL),
('200','1','Bien Sym�triques',NULL),
('200','2','In�gales D < G',NULL),
('200','3','In�gales D > G',NULL),
('220','1','Aucun trouble',NULL),
('220','2','Membre sup�rieur D',NULL),
('220','3','Membre sup�rieur G',NULL),
('220','4','Membre inf�rieur D',NULL),
('220','5','Membre inf�rieur G',NULL),
('220','6','Les 2 membres inf�rieurs',NULL),
('220','7','Les 2 membres sup�rieurs',NULL),
('220','8','Les 4 membres',NULL),
('230','1','1 : Jamais',NULL),
('230','2','2 : A la douleur',NULL),
('230','3','3 : Bruit',NULL),
('230','4','4 : Spontan�e',NULL),
('240','1','1 : Pas de r�ponse',NULL),
('240','2','2 : Incompr�hensible (bruits, grognements)',NULL),
('240','3','3 : Inappropri�e (propos incoh�rents)',NULL),
('240','4','4 : Confusion (d�sorient�e)',NULL),
('240','5','5 : Normale',NULL),
('250','1','1 : Absence',NULL),
('250','2','2 : R�action en extension � la douleur',NULL),
('250','3','3 : R�action de flexion � la douleur',NULL),
('250','4','4 : Evitement r�ponse pincement inadapt�e',NULL),
('250','5','5 : R�ponse adapt�e � la douleur',NULL),
('250','6','6 : Ob�it aux ordres',NULL),
('480','1','Normale',NULL),
('480','2','P�le',NULL),
('480','3','Marbr�e',NULL),
('480','4','Violac�e',NULL),
('500','1','Plaie',NULL),
('500','2','Br�lure',NULL),
('500','3','H�morragie',NULL),
('500','4','D�formation',NULL),
('500','5','Douleur',NULL),
('500','6','Fracture ouverte','doc'),
('500','7','Fracture ferm�e','doc'),
('510','1','T�te',NULL),
('510','2','Crane',NULL),
('510','3','Oeil',NULL),
('510','4','Oreille',NULL),
('510','5','Cou',NULL),
('510','20','Poitrine',NULL),
('510','21','Ventre',NULL),
('510','22','Dos',NULL),
('510','23','Fesses',NULL),
('510','24','Bassin',NULL),
('510','25','Sexe',NULL),
('510','30','Epaule',NULL),
('510','31','Avant-bras',NULL),
('510','32','Bras',NULL),
('510','33','Coude',NULL),
('510','34','Poignet',NULL),
('510','35','Main',NULL),
('510','40','Cuisse',NULL),
('510','41','Jambe',NULL),
('510','42','Genou',NULL),
('510','43','Cheville',NULL),
('510','44','Pied',NULL),
('520','1','Droit',NULL),
('520','2','Gauche',NULL),
('520','3','Les 2 c�t�s',NULL),
('520','4','Avant',NULL),
('520','5','Arri�re',NULL),
('530','1','0 - aucune',NULL),
('530','2','1 sur 4',NULL),
('530','3','2 sur 4',NULL),
('530','4','3 sur 4',NULL),
('530','5','4 - maximum',NULL),
('1060','1','Notre Association','ASS'),
('1060','2','Sapeurs pompiers','SP'),
('1060','3','SAMU ou SMUR','SAMU'),
('1060','4','Ambulance priv�e','AP'),
('1060','5','Autre type de transport','AUTR'),
('1060','6','H�licopt�re','HELI'),
('1060','7','Autre Association','AUTASS'),
('1070','1','Non renseign�','NR'),
('1070','2','Centre hospitalier','HOSP'),
('1070','3','Accueil de jour/nuit','ACC'),
('1070','4','Douche publique','DOUCH'),
('1070','5','Mission locale','MISS'),
('1070','6','Poste M�dical Avanc�','PMA'),
('1070','7','Cabinet M�dical','CM'),
('1070','8','Clinique','CL'),
('40','5','Alimentaire',NULL),
('2030','1','Satisfaisant',NULL),
('2030','2','Peu Satisfaisant',NULL),
('2030','3','Insatisfaisant',NULL),
('2035','1','Spontan�e',NULL),
('2035','2','Provoqu�ee',NULL),
('2035','3','Absente',NULL),
('2040','1','Factuel Exclusif',NULL),
('2040','2','Emotionnel Exclusif',NULL),
('2040','3','Factuel et �motionnel',NULL),
('2040','4','Amn�sie',NULL),
('2100','1','Sans Changement',NULL),
('2100','2','Am�lioration',NULL),
('2100','3','Aggravation',NULL);
# ------------------------------------
# structure for table 'categorie_agrement'
# ------------------------------------
DROP TABLE IF EXISTS categorie_agrement ;
CREATE TABLE categorie_agrement (
CA_CODE varchar(5) NOT NULL,
CA_DESCRIPTION varchar(40) NOT NULL,
CA_FLAG tinyint(4) DEFAULT '0' NOT NULL,
PRIMARY KEY (CA_CODE)
);
# ------------------------------------
# data for table 'categorie_agrement'
# ------------------------------------
INSERT INTO categorie_agrement (CA_CODE,CA_DESCRIPTION,CA_FLAG) VALUES
('ASS','Informations li�es � l\'association','0'),
('CON','Conventions de missions','0'),
('CONSP','Conventions sp�cifiques','1'),
('ENT','Formation Entreprise','0'),
('FOR','Formations au secourisme','0'),
('SEC','Agr�ments de s�curit� civile','0'),
('_MED','M�dailles collectives','1'),
('SPE','Formations sp�cifiques','0');
# ------------------------------------
# structure for table 'categorie_consommable'
# ------------------------------------
DROP TABLE IF EXISTS categorie_consommable ;
CREATE TABLE categorie_consommable (
CC_CODE varchar(12) NOT NULL,
CC_NAME varchar(60) NOT NULL,
CC_DESCRIPTION varchar(120) NOT NULL,
CC_IMAGE varchar(50) NOT NULL,
CC_ORDER tinyint(4) NOT NULL,
PRIMARY KEY (CC_CODE)
);
# ------------------------------------
# data for table 'categorie_consommable'
# ------------------------------------
INSERT INTO categorie_consommable (CC_CODE,CC_NAME,CC_DESCRIPTION,CC_IMAGE,CC_ORDER) VALUES
('ALIMENTATION','Alimentation','aliments, boissons, denr�es p�rissables ou non','utensils','10'),
('BUREAU','Bureautique, administratif, informatique','Papier, encre, ...','mail-bulk','50'),
('ENTRETIEN','Produits d\'entretien','Produits de nettoyage et de d�sinfection','wrench','40'),
('HEBERGEMENT','H�bergement d\'urgence','couvertures ...','bed','60'),
('PHARMACIE','Pharmacie','mat�riel m�dical consommable ou jetable','medkit','20'),
('VEHICULES','Pour les v�hicules','carburants, lubrifiants, liquide de frein, lave glaces','truck','30');
# ------------------------------------
# structure for table 'categorie_evenement'
# ------------------------------------
DROP TABLE IF EXISTS categorie_evenement ;
CREATE TABLE categorie_evenement (
CEV_CODE varchar(5) NOT NULL,
CEV_DESCRIPTION varchar(40) NOT NULL,
PRIMARY KEY (CEV_CODE)
);
# ------------------------------------
# data for table 'categorie_evenement'
# ------------------------------------
INSERT INTO categorie_evenement (CEV_CODE,CEV_DESCRIPTION) VALUES
('C_DIV','divers'),
('C_FOR','activit�s de formation'),
('C_OPE','autres activit�s op�rationnelles'),
('C_SEC','op�rations de secours');
# ------------------------------------
# structure for table 'categorie_evenement_affichage'
# ------------------------------------
DROP TABLE IF EXISTS categorie_evenement_affichage ;
CREATE TABLE categorie_evenement_affichage (
CEV_CODE varchar(5) NOT NULL,
EQ_ID smallint(6) NOT NULL,
FLAG1 tinyint(4) DEFAULT '1' NOT NULL,
PRIMARY KEY (CEV_CODE, EQ_ID)
);
# ------------------------------------
# data for table 'categorie_evenement_affichage'
# ------------------------------------
INSERT INTO categorie_evenement_affichage (CEV_CODE,EQ_ID,FLAG1) VALUES
('C_DIV','1','1'),
('C_DIV','2','1'),
('C_DIV','3','1'),
('C_DIV','4','1'),
('C_FOR','1','1'),
('C_FOR','2','1'),
('C_FOR','3','1'),
('C_FOR','4','1'),
('C_OPE','1','1'),
('C_OPE','2','1'),
('C_OPE','3','1'),
('C_OPE','4','1'),
('C_SEC','1','1'),
('C_SEC','2','1'),
('C_SEC','3','1'),
('C_SEC','4','1');
# ------------------------------------
# structure for table 'categorie_grade'
# ------------------------------------
DROP TABLE IF EXISTS categorie_grade ;
CREATE TABLE categorie_grade (
CG_CODE varchar(5) NOT NULL,
CG_DESCRIPTION varchar(40) NOT NULL,
PRIMARY KEY (CG_CODE)
);
# ------------------------------------
# data for table 'categorie_grade'
# ------------------------------------
INSERT INTO categorie_grade (CG_CODE,CG_DESCRIPTION) VALUES
('ALL','Sans cat�gorie'),
('PATS','Agents territoriaux'),
('SP','Sapeurs pompiers'),
('SC','S�curit� Civile'),
('ARMY','Arm�e de Terre'),
('SSLIA','Pompiers d\'a�roport'),
('HOSP','Personnel soignant');
# ------------------------------------
# structure for table 'categorie_intervention'
# ------------------------------------
DROP TABLE IF EXISTS categorie_intervention ;
CREATE TABLE categorie_intervention (
CI_CODE varchar(5) NOT NULL,
CI_DESCRIPTION varchar(30) NOT NULL,
PRIMARY KEY (CI_CODE)
);
# ------------------------------------
# data for table 'categorie_intervention'
# ------------------------------------
INSERT INTO categorie_intervention (CI_CODE,CI_DESCRIPTION) VALUES
('MSPS','Mission SPS'),
('PS','Prompt secours');
# ------------------------------------
# structure for table 'categorie_materiel'
# ------------------------------------
DROP TABLE IF EXISTS categorie_materiel ;
CREATE TABLE categorie_materiel (
TM_USAGE varchar(15) NOT NULL,
CM_DESCRIPTION varchar(50) NOT NULL,
PICTURE varchar(30) DEFAULT 'cog' NOT NULL,
PRIMARY KEY (TM_USAGE)
);
# ------------------------------------
# data for table 'categorie_materiel'
# ------------------------------------
INSERT INTO categorie_materiel (TM_USAGE,CM_DESCRIPTION,PICTURE) VALUES
('ALL','toutes cat�gories de mat�riel','cog'),
('Aquatique','mat�riel aquatique','anchor'),
('D�blais','mat�riel de d�blaiement','cube'),
('Divers','mat�riel divers','cubes'),
('Eclairage','mat�riel d\'�clairage','lightbulb'),
('Elagage','mat�riel d\'�lagage','cut'),
('El�ctrique','mat�riel �l�ctrique','plug'),
('Formation','mat�riel de formation','book'),
('Habillement','tenues vestimentaires','male'),
('H�bergement','mat�riel d\'h�bergement','bed'),
('Incendie','mat�riel d\'incendie','fire-extinguisher'),
('Informatique','mat�riel informatique','keyboard'),
('Logistique','mat�riel de logistique','utensils'),
('Pompage','mat�riel de pompage','external-link-square-alt'),
('Promo-Com','Promotion Communication','bullhorn'),
('Sanitaire','mat�riel m�dical','medkit'),
('Sauvetage','Lots de sauvetage','life-ring'),
('S�curit�','Equipement S�curit� - EPI','shield-alt'),
('Transmission','mat�riel d\'�mission/transmission','phone-square');
# ------------------------------------
# structure for table 'centre_accueil_victime'
# ------------------------------------
DROP TABLE IF EXISTS centre_accueil_victime ;
CREATE TABLE centre_accueil_victime (
CAV_ID int(11) NOT NULL auto_increment,
E_CODE int(11) NOT NULL,
CAV_NAME varchar(30) NOT NULL,
CAV_ADDRESS varchar(300),
CAV_COMMENTAIRE varchar(500),
CAV_RESPONSABLE int(11),
CAV_OUVERT tinyint(4) DEFAULT '1' NOT NULL,
PRIMARY KEY (CAV_ID),
KEY E_CODE (E_CODE)
);
# ------------------------------------
# data for table 'centre_accueil_victime'
# ------------------------------------

# ------------------------------------
# structure for table 'chat'
# ------------------------------------
DROP TABLE IF EXISTS chat ;
CREATE TABLE chat (
C_ID int(11) NOT NULL auto_increment,
P_ID int(11) NOT NULL,
C_MSG varchar(500) NOT NULL,
C_DATE datetime NOT NULL,
C_COLOR varchar(20) NOT NULL,
PRIMARY KEY (C_ID)
);
# ------------------------------------
# data for table 'chat'
# ------------------------------------

# ------------------------------------
# structure for table 'company'
# ------------------------------------
DROP TABLE IF EXISTS company ;
CREATE TABLE company (
C_ID int(11) NOT NULL,
TC_CODE varchar(8) NOT NULL,
C_NAME varchar(50) NOT NULL,
S_ID int(11) NOT NULL,
C_DESCRIPTION varchar(80),
C_ADDRESS varchar(150),
C_ZIP_CODE varchar(150),
C_CITY varchar(30),
C_EMAIL varchar(60),
C_PHONE varchar(60),
C_FAX varchar(20),
C_CONTACT_NAME varchar(50),
C_CREATED_BY int(11),
C_CREATE_DATE date,
C_PARENT int(11),
C_SIRET varchar(20),
PRIMARY KEY (C_ID),
   UNIQUE S_ID (S_ID, C_NAME),
KEY TC_CODE (TC_CODE),
KEY C_PARENT (C_PARENT)
);
# ------------------------------------
# data for table 'company'
# ------------------------------------
INSERT INTO company (C_ID,TC_CODE,C_NAME,S_ID,C_DESCRIPTION,C_ADDRESS,C_ZIP_CODE,C_CITY,C_EMAIL,C_PHONE,C_FAX,C_CONTACT_NAME,C_CREATED_BY,C_CREATE_DATE,C_PARENT,C_SIRET) VALUES
('0','PARTIC','Particulier','0','Ne fait pas partie d\'une entreprise',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
# ------------------------------------
# structure for table 'company_role'
# ------------------------------------
DROP TABLE IF EXISTS company_role ;
CREATE TABLE company_role (
C_ID int(11) NOT NULL,
TCR_CODE varchar(5) NOT NULL,
P_ID int(11) NOT NULL,
PRIMARY KEY (C_ID, TCR_CODE),
KEY TC_CODE (P_ID)
);
# ------------------------------------
# data for table 'company_role'
# ------------------------------------

# ------------------------------------
# structure for table 'compte_bancaire'
# ------------------------------------
DROP TABLE IF EXISTS compte_bancaire ;
CREATE TABLE compte_bancaire (
CB_TYPE varchar(1) DEFAULT 'P' NOT NULL,
CB_ID int(11) NOT NULL,
ETABLISSEMENT varchar(5) NOT NULL,
GUICHET varchar(5) NOT NULL,
COMPTE varchar(11) NOT NULL,
CLE_RIB varchar(2),
CODE_BANQUE varchar(30),
BIC varchar(11),
IBAN varchar(34),
UPDATE_DATE datetime NOT NULL,
PRIMARY KEY (CB_TYPE, CB_ID)
);
# ------------------------------------
# data for table 'compte_bancaire'
# ------------------------------------

# ------------------------------------
# structure for table 'configuration'
# ------------------------------------
DROP TABLE IF EXISTS configuration ;
CREATE TABLE configuration (
ID int(11) DEFAULT '0' NOT NULL,
NAME varchar(30) NOT NULL,
VALUE varchar(255),
DESCRIPTION varchar(255),
ORDERING smallint(6) DEFAULT '100' NOT NULL,
HIDDEN tinyint(4) DEFAULT '0' NOT NULL,
TAB tinyint(4) DEFAULT '1' NOT NULL,
YESNO tinyint(4) DEFAULT '0' NOT NULL,
IS_FILE tinyint(4) DEFAULT '0' NOT NULL,
CARD_NAME varchar(60) NOT NULL,
DISPLAY_NAME varchar(500),
PRIMARY KEY (ID)
);
# ------------------------------------
# data for table 'configuration'
# ------------------------------------
INSERT INTO configuration (ID,NAME,VALUE,DESCRIPTION,ORDERING,HIDDEN,TAB,YESNO,IS_FILE,CARD_NAME,DISPLAY_NAME) VALUES
('-1','already_configured','1','Application d�j� configur�e','100','1','1','0','0','',NULL),
('1','version','5.3','version install�e','101','0','1','0','0','',NULL),
('2','nbsections','0','Limiter le nombre de sections possible, si non est choisi, il n\'y a pas de limites','1','0','2','1','0','','Sections limit�es'),
('3','gardes','0','Automatisez la gestion des gardes sur plusieurs jours en 1 clic','601','0','6','1','0','Tableau de garde',NULL),
('4','vehicules','1','activer la gestion des v�hicules','111','0','1','1','0','','V�hicule '),
('5','grades','0','Personnalisez les grades et les comp�tences associ�es','602','0','6','1','0','Grade',NULL),
('6','cisname','CIS','nom court de l\'organisation','103','0','4','0','0','','Nom court de l\'organisation'),
('7','cisurl','http://localhost','adresse du site web','104','0','4','0','0','','Adresse du site web'),
('8','admin_email','admin@ebrigade.org','adresse mail de l\'administrateur','217','0','4','0','0','','Adresse mail'),
('9','sms_provider','','fournisseur SMS','218','0','2','0','0','','Fournisseur '),
('10','sms_user','','utilisateur du compte SMS, email pour smsgateway.me, inutile dans le cas de SMS Gateway Android','219','0','2','0','0','','Utilisateur '),
('11','sms_password','','mot de passe du compte SMS, ou API token pour smsgateway.me','220','0','2','0','0','','Mot de passe'),
('12','sms_api_id','','api_id SMS pour clickatell, ou address:port pour SMS Gateway Android ou SMSEagle, ou Device ID pour smsgateway.me, inutile dans les autres cas.','221','0','2','0','0','','<span title=\"Uniquement pour clickatell, ou address:port pour SMS Gateway Android ou SMSEagle, ou Device ID pour smsgateway.me\">API personnel</span>'),
('13','auto_backup','1','sauvegarde quotidienne (possible pour bases de maximum 3Mo)','211','0','2','1','0','','Sauvegarde auto de la BDD'),
('14','auto_optimize','1','optimisation quotidienne des indexes et donn�es de la base','212','0','2','1','0','','Optimisation auto de la BDD'),
('15','password_quality','1','interdiction des mots de passes trop simples','313','0','3','0','0','','S�curit� du mot de passe'),
('16','password_length','8','longueur minimum des mots de passes','314','0','3','0','0','','Longueur du mot de passe'),
('17','password_failure','5','bloquage temporaire du compte apr�s �checs d\'authentification','315','0','3','0','0','','Bloquage du compte apr�s X tentatives'),
('18','materiel','1','Activer la gestion du mat�riel et des tenues (v�hicules requis)','112','0','1','1','0','','Mat�riel & Tenue'),
('19','chat','1','activer la communication par chat - messagerie instantan�e entre les membres','115','0','1','1','0','','Chat'),
('20','identpage','index.php','URL de la page d\'identification','225','0','2','0','0','','URL page identification'),
('21','filesdir','user-data','r�pertoire secret contenant les documents, peut �tre hors de la racine du site si le chemin est absolu.','324','0','3','0','0','','R�pertoire des fichiers'),
('22','activit�s','1','activer gestion des activit�s et calendrier','114','0','1','1','0','','Activit�'),
('23','competences','1','activer gestion des comp�tences','110','0','1','1','0','','Comp�tence'),
('24','disponibilites','1','activer gestion des disponibilit�s','119','0','1','1','0','','Disponibilit� '),
('25','log_actions','1','Garder un historique des actions r�alis�es','312','0','3','1','0','','Historique des actions'),
('26','cron_allowed','0','permettre les fonctions n�cessitant un t�che cron (rappel inscription: executer reminder.sh chaque jour, changements de responsables - astreintes_updates.sh )','212','0','2','1','0','','<span title=\"reminder.sh et astreintes_updates.sh sont � ex�cuter au quotidien\">Cronjob</span>'),
('28','mail_allowed','1','Permet l\'envoi de tous les mails (parfois utile de d�sactiver pour environnements de test)','212','0','2','1','0','','Mail '),
('29','syndicate','0','association de type syndicat, gestion des adh�rents','1','1','4','1','0','',NULL),
('30','externes','0','Gestion du personnel externe et des entreprises (par exemple les stagiaires des formations)','116','0','1','1','0','','Externe'),
('31','cotisations','0','Suivez le paiement des cotisations de vos adh�rents','605','0','6','1','0','Cotisation',NULL),
('32','bank_accounts','0','Enregistrement des comptes bancaires des adh�rents - RIB','118','0','1','1','0','','Compte bancaire'),
('33','store_confidential_data','0','Permet l\'enregistrement de donn�es confidentielles (dossier m�dical), suppose que toutes les pr�cautions de s�curit� et contraintes CNIL ont �t� prises en compte. Sinon seules les initiales des victimes pourront �tre sauv�es','312','0','3','1','0','','<span title=\"Permet l\'enregistrement de donn�es confidentielles (dossier m�dical), suppose que toutes les pr�cautions de s�curit� et contraintes CNIL ont �t� prises en compt et que l\'application soit h�berg� sur un serveur conforme. Sinon seules les initiales des victimes pourront �tre sauvegard�es\">Donn�es sensibles</span>'),
('34','days_audit','100','Nombre de jours pendant lesquels on conserve les enregistrements de connexion des utilisateurs','315','0','3','0','0','','Nombre de jours de conservation des connexions'),
('35','geolocalize_enabled','0','G�olocalisez vos �quipes sur une carte personnalis�e','603','0','6','1','0','Geolocalisation',NULL),
('36','days_log','100','Nombre de jours pendant lesquels on conserve les historiques utilisateurs','315','0','3','0','0','','Nombre de jours de conservation de l\'historique'),
('37','maintenance_mode','0','Mode maintenance, Seul admin peut se connecter','216','0','2','1','0','','Maintenance '),
('38','application_title','eBrigade','nom personnalis� de l\'application','223','0','4','0','0','','Nom de l\'application'),
('39','organisation_name','CIS','nom long de l\'organisation','222','0','4','0','0','','Nom long de l\'organisation'),
('40','association_dept_name','l\'Association de Secourisme','Nom complet du niveau d�partemental, imprim� sur les conventions','224','0','4','0','0','','Descriptif de l\'organisation'),
('41','maintenance_text','Le serveur est actuellement inaccessible.<br>Une op�ration de maintenance est en cours.','Texte affich� aux utilisateurs si le mode maintenance est activ�','216','0','2','0','0','','Texte de la maintenance'),
('42','document_security','1','Possibilit� de restreindre l\'acc�s � chaque document avec un niveau de s�curit�','312','0','3','1','0','','S�curit� des documents'),
('43','defaultsectionorder','hierarchique','Ordre par d�faut des sections dans les listes d�roulantes','300','0','2','0','0','','Ordre des sections'),
('44','encryption_method','md5','M�thode d\'encryption pour les mots de passes','313','0','3','0','0','','M�thode d\'encryption'),
('45','consommables','0','Gestion du stock de produits consommables','113','0','1','1','0','','Consommable '),
('47','dispo_periodes','2','Nombre de p�riodes de disponibilit�s sur 24h','121','0','1','0','0','','P�riode de disponibilit�'),
('48','charte_active','0','Des conditions d\'utilisations doivent �tre accept�es une fois par chaque utilisateur','312','0','3','1','0','','Condition d\'utilisation'),
('49','session_expiration','30','Les sessions utilisateurs expirent automatiquement apr�s un certain temps d\'inactivit�.','401','0','3','0','0','','Expiration de la session'),
('50','webservice_key','','Cl� secr�te permettant d\'utiliser les webservices. Si la cl� n\'est pas d�finie, les webservices ne peuvent pas �tre utilis�s.','402','0','3','0','0','','Cl� secr�te webservice'),
('51','deconnect_redirect','index.php','URL de la page charg�e apr�s une d�connexion.','226','0','2','0','0','','Page de redirection'),
('52','sdis','0','groupement de casernes (SDIS ou GT)','1','1','4','1','0','',NULL),
('76','timezone','Europe/Paris','Timezone de l\'application, exemples Europe/Paris ou America/St_Barthelemy. Voir la liste <a href=https://www.php.net/manual/fr/timezones.europe.php target=_blank>ici</a>','60','0','5','0','0','','Fuseau horaire'),
('54','error_reporting','0','Affichage des exceptions (aucune, erreurs seules, toutes)','320','0','3','0','0','','Affichage des exceptions'),
('55','snow','0','Des flocons de neige bleue tombent sur la page, un peu kitch mais c\'est pour No�l!','212','0','2','1','0','','Snow'),
('56','assoc','0','Configuration association de secourisme','212','1','1','1','0','',NULL),
('57','api_key','','Google API key pour les cartes Google Maps - <a href=https://developers.google.com/maps/documentation/javascript/get-api-key target=_blank>Voir doc</a>','120','0','6','0','0','',NULL),
('58','remplacements','0','Possibilit� de g�rer les demandes de remplacements sur les activit�s','109','0','1','1','0','','Remplacements sur les activit�s'),
('59','army','0','Configuration organisation militaire','1','1','4','1','0','',NULL),
('60','api_provider','google','Service de g�olocalisation, google ou osm (open street map)','120','0','6','0','0','',NULL),
('61','notes','0','Activer les notes de frais','118','0','1','1','0','','Note de frais'),
('62','licences','0','G�rez les licences de votre club ou association','606','0','6','1','0','Licence',NULL),
('63','block_personnel','0','Bloquer les changements sur les principaux champs de la fiche personnelle. Une API doit �tre utilis�e pour les mises � jour.','212','0','2','1','0','','Bloquer les changements personnels'),
('64','import_api','0','activer une API personalis�e pour importer des donn�es depuis une source externe','214','0','2','1','0','','API personnalis�e'),
('65','import_api_url',NULL,'Facultatif: URL de base de l\'API utilis�e pour les imports de donn�es personnalis�s. Utilis� si import depuis un site externe seulement','215','0','2','0','0','',NULL),
('66','import_api_token',NULL,'token pour se connecter � l\'API d\'import','216','0','2','0','0','',NULL),
('67','lock_mailer','0','Si une crontab de mailing est activ�e, est ce qu\'elle est lock�e car en cours d\'utilisation','213','0','2','1','0','','Crontab de mailing'),
('68','photo_obligatoire','0','Le personnel doit obligatoirement mettre une photo, sinon il ne pourra plus s\'inscrire aux activit�s','212','0','2','1','0','','Photo obligatoire'),
('69','info_connexion','0','Activer l\'affichage d\'un message sp�cifique � la premi�re connexion, � d�finir dans le fichier specific_info.php','312','0','3','1','0','','Information lors de la premi�re connexions'),
('70','password_expiry_days','0','Expiration des mots de passes apr�s un certain nombre de jours.','316','0','3','0','0','','Expiration des mots de passes'),
('71','logo','','logo de l\'organisation, visible sur les PDFs g�n�r�s (taille recommand�e environ 100 px de large et 120 px de hauteur recommand�s) ','501','0','4','0','1','','Logo'),
('73','favicon','','icone de l\'onglet web (taille recommand�e environ 60 px de large et 60 px de hauteur recommand�s) ','503','0','4','0','1','','Favicon'),
('74','apple_icon','','icone pour �cran d\'accueil iOS (taille recommand�e environ 100px de hauteur et 100 px de largeur)','502','0','4','0','1','','Icone iOS'),
('75','splash_screen','','fond d\'�cran pour la page de login (taille recommand�e environ 800px de hauteur et 1400 px de largeur)','504','0','4','0','1','','Image page de connexion'),
('77','sslia','0','Configuration service incendie a�roport','1','1','4','1','0','',NULL),
('78','hospital','0','Configuration H�pital','1','1','4','1','0','',NULL),
('79','type_organisation','0','Choix initial du type d\'organisation','1','0','4','0','0','','Type d\'organisation'),
('80','ameliorations','1','Partager certaines informations de mon installation avec les d�velopeurs de eBrigade en vue d\'am�liorer l\'application','313','0','3','1','0','','<span title=\"Partager certaines informations de mon installation avec eBrigade en vue d\'am�liorer l\'application\">Aider � am�liorer eBrigade</span>'),
('81','animaux','0','Activer la gestion des animaux','117','0','1','1','0','','Animaux '),
('82','main_courante','1','Activer la gestion des mains courantes','118','0','1','1','0','','Main courante'),
('83','bilan','0','Activer le bilan annuel, un PDF montrant les chiffres cl�s relatifs au personnel et aux activit�s','118','0','1','1','0','','Bilan annuel'),
('85','client','0','Activer la gestion des clients, pour les devis et factures','118','0','1','1','0','','Client / Facturation'),
('86','repos ','0','Activer la gestion des repos pour le personnel','118','0','1','1','0','','Repos'),
('87','carte','0','Activer la cartographie, n�cessite d\'avoir la geolocalisation activ�e dans les param�tres avanc�s','604','0','6','1','0','Carte',NULL),
('88','Logo','0','Afficher le logo eBrigade dans le menu horizontal en haut � gauche, sinon une maison','300','0','4','1','0','','Logo eBrigade dans la barre horizontale'),
('89','victime','1','Pour g�rer un centre d\'impliqu�s, inclus les SINUS','606','0','6','1','0','Gestions des victimes',NULL),
('90','renfort','1','Demandez du renfort aux �quipes disponibles','607','0','6','1','0','Renfort',NULL),
('91','multi_site','1','G�rez toutes les antennes locales sur un seul outil','608','0','6','1','0','Multi sites',NULL),
('92','staff_assignment','1','D�finissez les affectations en fonction des comp�tences du personnel','609','0','6','1','0','Affectations du personnel',NULL),
('93','matricule','1','G�n�rez ou renseignez un num�ro de matricule','610','0','6','1','0','Matricule',NULL),
('94','whatsapp','1','Connectez Whatsapp � eBrigade','611','0','6','1','0','Whatsapp',NULL),
('95','notification','1','Recevez des notifications par mail et sur votre navigateur','612','0','6','1','0','Notification',NULL),
('96','default_pays_id','65',NULL,'61','0','5','0','0','','Pays par d�faut des victimes'),
('97','geolocalize_default_country','65',NULL,'62','0','5','0','0','','Pays par d�faut pour la g�olocalisation'),
('98','default_money','Euro',NULL,'63','0','5','0','0','','Devise par d�faut'),
('99','default_money_symbol','�',NULL,'64','0','5','0','0','','Symbole de devise par d�faut'),
('100','phone_prefix','+33',NULL,'65','0','5','0','0','','Pr�fixe des num�ros de t�l�phone'),
('101','min_numbers_in_phone','10',NULL,'66','0','5','0','0','','Nombre minimum de chiffres requis dans le num�ro de t�l�phone'),
('102','levels_0','centre',NULL,'67','0','5','0','0','','Niveau 0'),
('103','levels_1','section',NULL,'68','0','5','0','0','','Niveau 1'),
('104','levels_2','section',NULL,'69','0','5','0','0','','Niveau 2'),
('105','levels_3','section',NULL,'70','0','5','0','0','','Niveau 3'),
('106','levels_4','section',NULL,'71','0','5','0','0','','Niveau 4'),
('107','sous_sections','sous-sections',NULL,'72','0','5','0','0','','Sous-sections');
# ------------------------------------
# structure for table 'consommable'
# ------------------------------------
DROP TABLE IF EXISTS consommable ;
CREATE TABLE consommable (
C_ID int(11) NOT NULL auto_increment,
S_ID int(11) NOT NULL,
TC_ID int(11) NOT NULL,
C_DESCRIPTION varchar(60) NOT NULL,
C_NOMBRE int(11) DEFAULT '0' NOT NULL,
C_MINIMUM int(11) DEFAULT '0',
C_DATE_ACHAT date,
C_DATE_PEREMPTION date,
C_LIEU_STOCKAGE varchar(200),
MA_PARENT int(11),
PRIMARY KEY (C_ID),
KEY TC_ID (TC_ID),
KEY S_ID (S_ID),
KEY C_DATE_ACHAT (C_DATE_ACHAT),
KEY C_DATE_PEREMPTION (C_DATE_PEREMPTION),
KEY MA_PARENT (MA_PARENT)
);
# ------------------------------------
# data for table 'consommable'
# ------------------------------------

# ------------------------------------
# structure for table 'contact_type'
# ------------------------------------
DROP TABLE IF EXISTS contact_type ;
CREATE TABLE contact_type (
CT_ID tinyint(4) NOT NULL,
CONTACT_TYPE varchar(20) NOT NULL,
CT_ICON varchar(40) NOT NULL,
PRIMARY KEY (CT_ID),
   UNIQUE CONTACT_TYPE (CONTACT_TYPE)
);
# ------------------------------------
# data for table 'contact_type'
# ------------------------------------
INSERT INTO contact_type (CT_ID,CONTACT_TYPE,CT_ICON) VALUES
('1','Skype','fab fa-skype'),
('2','Zello','fas fa-broadcast-tower'),
('3','WhatsApp','fab fa-whatsapp');
# ------------------------------------
# structure for table 'custom_field'
# ------------------------------------
DROP TABLE IF EXISTS custom_field ;
CREATE TABLE custom_field (
CF_ID int(11) NOT NULL auto_increment,
CF_TITLE varchar(30) NOT NULL,
CF_COMMENT varchar(60),
CF_USER_VISIBLE tinyint(4) DEFAULT '1' NOT NULL,
CF_USER_MODIFIABLE tinyint(4) DEFAULT '1' NOT NULL,
CF_TYPE varchar(15) NOT NULL,
CF_MAXLENGTH smallint(6) DEFAULT '0',
CF_NUMERIC tinyint(4) DEFAULT '0' NOT NULL,
CF_ORDER smallint(6),
PRIMARY KEY (CF_ID)
);
# ------------------------------------
# data for table 'custom_field'
# ------------------------------------

# ------------------------------------
# structure for table 'custom_field_personnel'
# ------------------------------------
DROP TABLE IF EXISTS custom_field_personnel ;
CREATE TABLE custom_field_personnel (
P_ID int(11) NOT NULL,
CF_ID int(11) NOT NULL,
CFP_VALUE varchar(1000) NOT NULL,
CFP_DATE datetime NOT NULL,
PRIMARY KEY (P_ID, CF_ID)
);
# ------------------------------------
# data for table 'custom_field_personnel'
# ------------------------------------

# ------------------------------------
# structure for table 'defaut_bancaire'
# ------------------------------------
DROP TABLE IF EXISTS defaut_bancaire ;
CREATE TABLE defaut_bancaire (
D_ID tinyint(4) NOT NULL,
D_DESCRIPTION varchar(50) NOT NULL,
PRIMARY KEY (D_ID)
);
# ------------------------------------
# data for table 'defaut_bancaire'
# ------------------------------------
INSERT INTO defaut_bancaire (D_ID,D_DESCRIPTION) VALUES
('0','non renseign�'),
('1','compte sold�'),
('2','provision insuffisante'),
('3','opposition sur compte'),
('4','pas d\'ordre � payer'),
('5','op�ration pr�sum�e erron�e'),
('6','demande de prorogation'),
('7','tirage contest�'),
('8','coordonn�es bancaires inexploitables'),
('9','r�gularisation d\'autorisation de pr�l�vement'),
('10','ch�que rejet�'),
('11','contestation d�biteur'),
('12','sur ordre du b�n�ficiaire'),
('13','op�ration non admise'),
('14','motif r�glementaire'),
('16','compte sold� cl�ture vire'),
('17','destinataire non reconnu'),
('18','emetteur non reconnu'),
('19','titulaire d�c�d�'),
('20','code op�ration incorrect'),
('21','adresse invalide'),
('22','format invalide'),
('23','raison non communiqu�e'),
('24','code banque incorrect'),
('25','doublon'),
('26','re�u � tort / d�j� r�gl�'),
('27','r�clamation tardive'),
('28','banque hors �changes'),
('29','pas d\'autorisation'),
('30','d�cision judiciaire'),
('31','service sp�cifique'),
('32','donn�e mandat incorrecte'),
('33','sur ordre du client');
# ------------------------------------
# structure for table 'demande'
# ------------------------------------
DROP TABLE IF EXISTS demande ;
CREATE TABLE demande (
P_ID int(11) NOT NULL,
P_CODE varchar(20),
D_TYPE varchar(20) NOT NULL,
D_DATE datetime NOT NULL,
D_BY int(11),
D_SECRET varchar(30) NOT NULL,
PRIMARY KEY (P_ID, D_TYPE)
);
# ------------------------------------
# data for table 'demande'
# ------------------------------------

# ------------------------------------
# structure for table 'demande_renfort_materiel'
# ------------------------------------
DROP TABLE IF EXISTS demande_renfort_materiel ;
CREATE TABLE demande_renfort_materiel (
E_CODE int(11) NOT NULL,
TYPE_MATERIEL varchar(15) NOT NULL,
PRIMARY KEY (E_CODE, TYPE_MATERIEL)
);
# ------------------------------------
# data for table 'demande_renfort_materiel'
# ------------------------------------

# ------------------------------------
# structure for table 'demande_renfort_vehicule'
# ------------------------------------
DROP TABLE IF EXISTS demande_renfort_vehicule ;
CREATE TABLE demande_renfort_vehicule (
E_CODE int(11) NOT NULL,
TV_CODE varchar(10) DEFAULT 'ALL' NOT NULL,
NB_VEHICULES int(11) DEFAULT '0' NOT NULL,
POINT_REGROUPEMENT varchar(250),
DEMANDE_SPECIFIQUE varchar(600),
PRIMARY KEY (E_CODE, TV_CODE)
);
# ------------------------------------
# data for table 'demande_renfort_vehicule'
# ------------------------------------

# ------------------------------------
# structure for table 'destination'
# ------------------------------------
DROP TABLE IF EXISTS destination ;
CREATE TABLE destination (
D_CODE varchar(6) NOT NULL,
D_NAME varchar(30) NOT NULL,
PRIMARY KEY (D_CODE)
);
# ------------------------------------
# data for table 'destination'
# ------------------------------------
INSERT INTO destination (D_CODE,D_NAME) VALUES
('CL','Clinique'),
('CM','Cabinet M�dical'),
('HOSP','Centre hospitalier'),
('NR','Non renseign�'),
('PMA','Poste M�dical Avanc�');
# ------------------------------------
# structure for table 'diplome_param'
# ------------------------------------
DROP TABLE IF EXISTS diplome_param ;
CREATE TABLE diplome_param (
PS_ID int(11) NOT NULL,
S_ID int(11) DEFAULT '0' NOT NULL,
FIELD tinyint(4) NOT NULL,
AFFICHAGE tinyint(4) NOT NULL,
ACTIF tinyint(4) DEFAULT '0' NOT NULL,
TAILLE tinyint(4) NOT NULL,
STYLE tinyint(4) NOT NULL,
POLICE tinyint(4) NOT NULL,
POS_X float NOT NULL,
POS_Y float NOT NULL,
ANNEXE varchar(50),
PRIMARY KEY (S_ID, PS_ID, FIELD)
);
# ------------------------------------
# data for table 'diplome_param'
# ------------------------------------
INSERT INTO diplome_param (PS_ID,S_ID,FIELD,AFFICHAGE,ACTIF,TAILLE,STYLE,POLICE,POS_X,POS_Y,ANNEXE) VALUES
('12','0','1','8','1','4','0','1','70','117',''),
('12','0','2','10','1','4','0','1','160','117',''),
('12','0','3','0','1','4','1','1','45','126',''),
('12','0','4','6','1','4','0','1','150','126',''),
('12','0','5','5','1','4','0','1','210','126',''),
('12','0','6','0','1','6','1','1','80','153',''),
('12','0','7','11','1','4','0','1','175','168',''),
('12','0','8','3','1','4','0','1','240','168',''),
('12','0','9','7','1','7','0','0','65','199',''),
('13','0','1','8','1','4','0','1','70','117',''),
('13','0','2','10','1','4','0','1','160','117',''),
('13','0','3','0','1','4','1','1','45','126',''),
('13','0','4','6','1','4','0','1','150','126',''),
('13','0','5','5','1','4','0','1','210','126',''),
('13','0','6','0','1','6','1','1','80','153',''),
('13','0','7','11','1','4','0','1','175','168',''),
('13','0','8','3','1','4','0','1','240','168',''),
('13','0','9','7','1','7','0','0','65','199','');
# ------------------------------------
# structure for table 'diplome_param_field'
# ------------------------------------
DROP TABLE IF EXISTS diplome_param_field ;
CREATE TABLE diplome_param_field (
FIELD tinyint(4) NOT NULL,
FIELD_NAME varchar(40) NOT NULL,
CATEGORY varchar(40) NOT NULL,
DISPLAY_ORDER tinyint(4) NOT NULL,
PRIMARY KEY (FIELD)
);
# ------------------------------------
# data for table 'diplome_param_field'
# ------------------------------------
INSERT INTO diplome_param_field (FIELD,FIELD_NAME,CATEGORY,DISPLAY_ORDER) VALUES
('0','Pr�nom NOM','Stagiaire','1'),
('1','PRENOM NOM','Stagiaire','2'),
('2','Pr�nom Nom','Stagiaire','3'),
('3','Date dipl�me','Dipl�me','1'),
('4','P�riode formation','Formation','3'),
('5','Lieu naissance','Stagiaire','6'),
('6','Date de naissance','Stagiaire','5'),
('7','N� dipl�me','Dipl�me','2'),
('8','Date fin de cours','Formation','2'),
('9','Personnalis�','Divers','2'),
('10','Organisateur formation','Organisation','1'),
('11','Ville organisateur','Organisation','2'),
('12','Signature pr�sident National','Divers','1'),
('13','Date d�but des cours','Formation','1'),
('14','Noms des formateurs','Formation','5'),
('15','Civilit� Pr�nom NOM','Stagiaire','4'),
('16','Lieu de la formation','Formation','4'),
('17','Ann�e et N� Dipl�me','Dipl�me','3'),
('18','Num�ro �v�nement','Divers','3'),
('19','Nom du pr�sident National','Divers','1');
# ------------------------------------
# structure for table 'disponibilite'
# ------------------------------------
DROP TABLE IF EXISTS disponibilite ;
CREATE TABLE disponibilite (
P_ID int(11) DEFAULT '0' NOT NULL,
D_DATE date NOT NULL,
PERIOD_ID tinyint(4) DEFAULT '0' NOT NULL,
PRIMARY KEY (P_ID, D_DATE, PERIOD_ID),
KEY D_DATE (D_DATE),
KEY D_DATE_2 (D_DATE, PERIOD_ID)
);
# ------------------------------------
# data for table 'disponibilite'
# ------------------------------------

# ------------------------------------
# structure for table 'disponibilite_comment'
# ------------------------------------
DROP TABLE IF EXISTS disponibilite_comment ;
CREATE TABLE disponibilite_comment (
P_ID int(11) NOT NULL,
DC_YEAR smallint(6) NOT NULL,
DC_MONTH smallint(6) NOT NULL,
DC_COMMENT varchar(300) NOT NULL,
PRIMARY KEY (P_ID, DC_YEAR, DC_MONTH)
);
# ------------------------------------
# data for table 'disponibilite_comment'
# ------------------------------------

# ------------------------------------
# structure for table 'disponibilite_periode'
# ------------------------------------
DROP TABLE IF EXISTS disponibilite_periode ;
CREATE TABLE disponibilite_periode (
DP_ID tinyint(4) NOT NULL,
DP_CODE varchar(2) NOT NULL,
DP_NAME varchar(20) NOT NULL,
DP_DUREE tinyint(4) NOT NULL,
DP_DEBUT time NOT NULL,
DP_FIN time NOT NULL,
PRIMARY KEY (DP_ID),
   UNIQUE DP_NAME (DP_NAME)
);
# ------------------------------------
# data for table 'disponibilite_periode'
# ------------------------------------
INSERT INTO disponibilite_periode (DP_ID,DP_CODE,DP_NAME,DP_DUREE,DP_DEBUT,DP_FIN) VALUES
('1','M','Matin','6','06:00:00','12:00:00'),
('2','AM','Apr�s-midi','6','12:00:00','18:00:00'),
('3','S','Soir','6','18:00:00','24:00:00'),
('4','N','Nuit','6','00:00:00','06:00:00');
# ------------------------------------
# structure for table 'document'
# ------------------------------------
DROP TABLE IF EXISTS document ;
CREATE TABLE document (
D_ID int(11) NOT NULL auto_increment,
S_ID int(11) NOT NULL,
E_CODE int(11) DEFAULT '0' NOT NULL,
P_ID int(11) DEFAULT '0' NOT NULL,
V_ID int(11) DEFAULT '0' NOT NULL,
M_ID int(11) DEFAULT '0' NOT NULL,
NF_ID int(11) DEFAULT '0' NOT NULL,
VI_ID int(11) DEFAULT '0' NOT NULL,
TD_CODE varchar(5),
D_NAME varchar(120) NOT NULL,
DS_ID tinyint(4) DEFAULT '1' NOT NULL,
D_CREATED_BY int(11) NOT NULL,
D_CREATED_DATE datetime,
DF_ID int(11) DEFAULT '0' NOT NULL,
EL_ID int(11) DEFAULT '0' NOT NULL,
PRIMARY KEY (D_ID),
KEY TD_CODE (TD_CODE),
KEY D_CREATED_DATE (D_CREATED_DATE),
KEY S_ID (S_ID),
KEY E_CODE (E_CODE),
KEY V_ID (V_ID),
KEY M_ID (M_ID),
KEY NF_ID (NF_ID),
KEY DF_ID (DF_ID),
KEY VI_ID (VI_ID),
KEY EL_ID (EL_ID)
);
# ------------------------------------
# data for table 'document'
# ------------------------------------

# ------------------------------------
# structure for table 'document_folder'
# ------------------------------------
DROP TABLE IF EXISTS document_folder ;
CREATE TABLE document_folder (
DF_ID int(11) NOT NULL auto_increment,
S_ID int(11) NOT NULL,
DF_PARENT int(11) DEFAULT '0' NOT NULL,
DF_NAME varchar(50) NOT NULL,
TD_CODE varchar(5),
DF_CREATED_BY int(11) NOT NULL,
DF_CREATED_DATE datetime NOT NULL,
PRIMARY KEY (DF_ID),
   UNIQUE S_ID (S_ID, DF_PARENT, DF_NAME),
KEY DF_PARENT (DF_PARENT)
);
# ------------------------------------
# data for table 'document_folder'
# ------------------------------------

# ------------------------------------
# structure for table 'document_security'
# ------------------------------------
DROP TABLE IF EXISTS document_security ;
CREATE TABLE document_security (
DS_ID tinyint(4) NOT NULL,
DS_LIBELLE varchar(50) NOT NULL,
F_ID tinyint(4) DEFAULT '0' NOT NULL,
PRIMARY KEY (DS_ID)
);
# ------------------------------------
# data for table 'document_security'
# ------------------------------------
INSERT INTO document_security (DS_ID,DS_LIBELLE,F_ID) VALUES
('1','public visible de tous','0'),
('2','acc�s restreint (15 - Gestion des �v�nements)','15'),
('3','acc�s restreint (29 - Comptabilit�)','29'),
('4','acc�s restreint (36 - Gestion des agr�ments)','36'),
('5','acc�s restreint (25 - S�curit�)','25'),
('6','acc�s restreint (2 - personnel)','2'),
('7','visible seulement par le personnel de la section.','52'),
('9','acc�s restreint (70 - Gestion du mat�riel)','70'),
('10','visible seulement par le personnel inscrit','120');
# ------------------------------------
# structure for table 'element_facturable'
# ------------------------------------
DROP TABLE IF EXISTS element_facturable ;
CREATE TABLE element_facturable (
EF_ID int(11) NOT NULL auto_increment,
TEF_CODE varchar(6) NOT NULL,
S_ID smallint(6) NOT NULL,
EF_NAME varchar(60) NOT NULL,
EF_PRICE float DEFAULT '0' NOT NULL,
PRIMARY KEY (EF_ID),
KEY S_ID (S_ID),
KEY EF_NAME (EF_NAME)
);
# ------------------------------------
# data for table 'element_facturable'
# ------------------------------------

# ------------------------------------
# structure for table 'equipage'
# ------------------------------------
DROP TABLE IF EXISTS equipage ;
CREATE TABLE equipage (
V_ID int(11) DEFAULT '0' NOT NULL,
ROLE_ID tinyint(4) DEFAULT '1' NOT NULL,
PS_ID int(11) DEFAULT '0' NOT NULL,
PRIMARY KEY (V_ID, ROLE_ID)
);
# ------------------------------------
# data for table 'equipage'
# ------------------------------------

# ------------------------------------
# structure for table 'equipe'
# ------------------------------------
DROP TABLE IF EXISTS equipe ;
CREATE TABLE equipe (
EQ_ID smallint(6) DEFAULT '0' NOT NULL,
EQ_NOM varchar(30) NOT NULL,
EQ_ORDER tinyint(4) DEFAULT '0' NOT NULL,
PRIMARY KEY (EQ_ID),
KEY EQ_ID (EQ_ID)
);
# ------------------------------------
# data for table 'equipe'
# ------------------------------------
INSERT INTO equipe (EQ_ID,EQ_NOM,EQ_ORDER) VALUES
('4','Permis','4');
# ------------------------------------
# structure for table 'evenement'
# ------------------------------------
DROP TABLE IF EXISTS evenement ;
CREATE TABLE evenement (
E_CODE int(11) DEFAULT '0' NOT NULL,
TE_CODE varchar(5) NOT NULL,
S_ID smallint(6) DEFAULT '0' NOT NULL,
E_CHEF int(11),
E_LIBELLE varchar(60) NOT NULL,
E_LIEU varchar(50) NOT NULL,
E_NB tinyint(4),
E_NB_STAGIAIRES tinyint(4),
E_NB_DPS smallint(6) DEFAULT '0' NOT NULL,
E_COMMENT text,
E_COMMENT2 varchar(800),
E_CONVENTION varchar(30),
E_OPEN_TO_EXT tinyint(4) DEFAULT '0' NOT NULL,
E_CLOSED tinyint(4) DEFAULT '0' NOT NULL,
E_CANCELED tinyint(4) DEFAULT '0' NOT NULL,
E_CANCEL_DETAIL varchar(50),
E_MAIL1 tinyint(4) DEFAULT '0' NOT NULL,
E_MAIL2 tinyint(4) DEFAULT '0' NOT NULL,
E_MAIL3 tinyint(4) DEFAULT '0' NOT NULL,
E_PARENT int(11),
E_CREATED_BY int(11),
E_CREATE_DATE datetime,
E_ALLOW_REINFORCEMENT tinyint(4) DEFAULT '0' NOT NULL,
TF_CODE varchar(1),
PS_ID smallint(6),
F_COMMENT varchar(100),
C_ID int(11),
E_CONTACT_LOCAL varchar(50),
E_CONTACT_TEL varchar(20),
TAV_ID tinyint(4) DEFAULT '1',
E_FLAG1 tinyint(4) DEFAULT '0' NOT NULL,
E_VISIBLE_OUTSIDE tinyint(4) DEFAULT '0' NOT NULL,
E_ADDRESS varchar(255),
E_CONSIGNES varchar(500),
E_MOYENS_INSTALLATION varchar(600),
E_NB_VPSP tinyint(4),
E_NB_AUTRES_VEHICULES tinyint(4),
E_CLAUSES_PARTICULIERES varchar(500),
E_CLAUSES_PARTICULIERES2 varchar(500),
E_REPAS tinyint(4) DEFAULT '0' NOT NULL,
E_TRANSPORT tinyint(4) DEFAULT '0' NOT NULL,
E_PARTIES tinyint(4) DEFAULT '1' NOT NULL,
E_TARIF float,
E_EQUIPE smallint(6) DEFAULT '0' NOT NULL,
E_VISIBLE_INSIDE tinyint(4) DEFAULT '1' NOT NULL,
E_CUSTOM_HORAIRE varchar(400),
E_REPRESENTANT_LEGAL varchar(200),
E_DATE_ENVOI_CONVENTION date,
E_EXTERIEUR tinyint(4) DEFAULT '0' NOT NULL,
E_URL varchar(500),
E_COLONNE_RENFORT tinyint(4) DEFAULT '0' NOT NULL,
E_ANOMALIE tinyint(4) DEFAULT '0' NOT NULL,
E_HEURE_RDV time,
E_LIEU_RDV varchar(150),
E_TEL varchar(15),
E_WHATSAPP varchar(30),
E_WEBEX_URL varchar(500),
E_WEBEX_PIN varchar(20),
E_WEBEX_START time,
E_AUTOCLOSE_BEFORE smallint(6),
PRIMARY KEY (E_CODE),
KEY S_ID (S_ID),
KEY E_PARENT (E_PARENT),
KEY TE_CODE (TE_CODE),
KEY PS_ID (PS_ID),
KEY C_ID (C_ID),
KEY E_CANCELED (E_CANCELED),
KEY E_CLOSED (E_CLOSED),
KEY E_OPEN_TO_EXT (E_OPEN_TO_EXT),
KEY TAV_ID (TAV_ID),
KEY E_TARIF (E_TARIF),
KEY E_EQUIPE (E_EQUIPE),
KEY E_VISIBLE_INSIDE (E_VISIBLE_INSIDE),
KEY E_VISIBLE_OUTSIDE (E_VISIBLE_OUTSIDE),
KEY E_COLONNE_RENFORT (E_COLONNE_RENFORT),
KEY E_CREATE_DATE (E_CREATE_DATE)
);
# ------------------------------------
# data for table 'evenement'
# ------------------------------------

# ------------------------------------
# structure for table 'evenement_chef'
# ------------------------------------
DROP TABLE IF EXISTS evenement_chef ;
CREATE TABLE evenement_chef (
E_CODE int(11) NOT NULL,
E_CHEF int(11) NOT NULL,
PRIMARY KEY (E_CODE, E_CHEF)
);
# ------------------------------------
# data for table 'evenement_chef'
# ------------------------------------

# ------------------------------------
# structure for table 'evenement_competences'
# ------------------------------------
DROP TABLE IF EXISTS evenement_competences ;
CREATE TABLE evenement_competences (
E_CODE int(11) NOT NULL,
EH_ID smallint(6) NOT NULL,
PS_ID int(11) DEFAULT '0' NOT NULL,
NB smallint(6) DEFAULT '1' NOT NULL,
PRIMARY KEY (E_CODE, EH_ID, PS_ID),
KEY PS_ID (PS_ID)
);
# ------------------------------------
# data for table 'evenement_competences'
# ------------------------------------

# ------------------------------------
# structure for table 'evenement_consommable'
# ------------------------------------
DROP TABLE IF EXISTS evenement_consommable ;
CREATE TABLE evenement_consommable (
EC_ID int(11) NOT NULL auto_increment,
E_CODE int(11) NOT NULL,
TC_ID int(11) NOT NULL,
C_ID int(11) DEFAULT '0' NOT NULL,
EC_NOMBRE int(11) DEFAULT '0' NOT NULL,
EC_DATE_CONSO date,
PRIMARY KEY (EC_ID),
KEY E_CODE (E_CODE),
KEY TC_ID (TC_ID),
KEY C_ID (C_ID),
KEY EC_DATE_CONSO (EC_DATE_CONSO)
);
# ------------------------------------
# data for table 'evenement_consommable'
# ------------------------------------

# ------------------------------------
# structure for table 'evenement_equipe'
# ------------------------------------
DROP TABLE IF EXISTS evenement_equipe ;
CREATE TABLE evenement_equipe (
E_CODE int(11) NOT NULL,
EE_ID int(11) NOT NULL,
EE_NAME varchar(30) NOT NULL,
EE_ORDER tinyint(4) DEFAULT '1' NOT NULL,
EE_DESCRIPTION varchar(300),
EE_SIGNATURE tinyint(4) DEFAULT '0' NOT NULL,
EE_ADDRESS varchar(150),
EE_ICON varchar(100),
IS_ID tinyint(4) DEFAULT '1' NOT NULL,
EE_ID_RADIO varchar(12),
PRIMARY KEY (E_CODE, EE_ID)
);
# ------------------------------------
# data for table 'evenement_equipe'
# ------------------------------------

# ------------------------------------
# structure for table 'evenement_facturation'
# ------------------------------------
DROP TABLE IF EXISTS evenement_facturation ;
CREATE TABLE evenement_facturation (
E_ID bigint(11) DEFAULT '0' NOT NULL,
dimP int(5),
dimP1 int(5),
dimP2 float,
dimE1 float,
dimE2 float,
dimNbISActeurs int(5),
dimNbISActeursCom varchar(250),
dimRIS decimal(20,4),
dimRISCalc decimal(20,4),
dimI decimal(20,4),
dimNbIS int(5),
dimTypeDPS varchar(100),
dimTypeDPSComment varchar(250),
dimSecteurs int(5),
dimPostes int(5),
dimEquipes int(5),
dimBinomes int(5),
devis_lieu varchar(50),
devis_date_heure varchar(500),
devis_date date,
devis_numero varchar(20),
devis_montant float,
devis_acompte float,
devis_orga varchar(200),
devis_civilite varchar(20),
devis_contact varchar(200),
devis_adresse varchar(250),
devis_cp varchar(10),
devis_ville varchar(100),
devis_tel1 varchar(20),
devis_tel2 varchar(20),
devis_fax varchar(20),
devis_email varchar(50),
devis_url varchar(250),
devis_comment varchar(250),
devis_accepte int(1),
facture_lieu varchar(50),
facture_date_heure varchar(500),
facture_date date,
facture_numero varchar(20),
facture_montant float,
facture_acompte float,
facture_comment varchar(250),
facture_orga varchar(200),
facture_civilite varchar(20),
facture_contact varchar(200),
facture_adresse varchar(250),
facture_cp varchar(10),
facture_ville varchar(100),
facture_tel1 varchar(20),
facture_tel2 varchar(20),
facture_fax varchar(20),
facture_email varchar(50),
relance_num int(1),
relance_date date,
relance_comment varchar(250),
paiement_date date,
paiement_comment varchar(250),
PRIMARY KEY (E_ID)
);
# ------------------------------------
# data for table 'evenement_facturation'
# ------------------------------------

# ------------------------------------
# structure for table 'evenement_facturation_detail'
# ------------------------------------
DROP TABLE IF EXISTS evenement_facturation_detail ;
CREATE TABLE evenement_facturation_detail (
e_id int(11) NOT NULL,
ef_type varchar(20) NOT NULL,
ef_lig int(11) NOT NULL,
ef_txt varchar(250) NOT NULL,
ef_qte int(11) DEFAULT '0' NOT NULL,
ef_pu float DEFAULT '0' NOT NULL,
ef_rem float DEFAULT '0' NOT NULL,
ef_comment varchar(250),
ef_frais varchar(10) DEFAULT 'PRE' NOT NULL,
PRIMARY KEY (e_id, ef_type, ef_lig)
);
# ------------------------------------
# data for table 'evenement_facturation_detail'
# ------------------------------------

# ------------------------------------
# structure for table 'evenement_horaire'
# ------------------------------------
DROP TABLE IF EXISTS evenement_horaire ;
CREATE TABLE evenement_horaire (
E_CODE int(11) NOT NULL,
EH_ID smallint(6) NOT NULL,
EH_DATE_DEBUT date NOT NULL,
EH_DATE_FIN date NOT NULL,
EH_DEBUT time NOT NULL,
EH_FIN time NOT NULL,
EH_DUREE float NOT NULL,
EH_DESCRIPTION varchar(20),
SECTION_GARDE int(11) DEFAULT '0' NOT NULL,
PRIMARY KEY (E_CODE, EH_ID),
KEY EH_DATE_DEBUT (EH_DATE_DEBUT),
KEY EH_DATE_FIN (EH_DATE_FIN),
KEY E_CODE (E_CODE, EH_DATE_DEBUT)
);
# ------------------------------------
# data for table 'evenement_horaire'
# ------------------------------------

# ------------------------------------
# structure for table 'evenement_log'
# ------------------------------------
DROP TABLE IF EXISTS evenement_log ;
CREATE TABLE evenement_log (
EL_ID int(11) NOT NULL auto_increment,
E_CODE int(11) NOT NULL,
TEL_CODE varchar(2) NOT NULL,
EL_IMPORTANT tinyint(4) DEFAULT '0' NOT NULL,
EL_IMPRIMER tinyint(4) DEFAULT '1' NOT NULL,
EL_DEBUT datetime NOT NULL,
EL_SLL time,
EL_FIN datetime,
EL_ADDRESS varchar(150),
EL_ORIGINE varchar(50),
EL_DESTINATAIRE varchar(50),
EL_TITLE varchar(50),
EL_COMMENTAIRE varchar(3000),
EL_RESPONSABLE int(11),
EL_DATE_ADD datetime NOT NULL,
EL_AUTHOR int(11),
EL_DATE_UPDATE datetime,
EL_UPDATED_BY int(11),
PRIMARY KEY (EL_ID),
KEY E_CODE (E_CODE),
KEY EL_RESPONSABLE (EL_RESPONSABLE),
KEY EL_DEBUT (EL_DEBUT),
KEY TEL_CODE (TEL_CODE)
);
# ------------------------------------
# data for table 'evenement_log'
# ------------------------------------

# ------------------------------------
# structure for table 'evenement_materiel'
# ------------------------------------
DROP TABLE IF EXISTS evenement_materiel ;
CREATE TABLE evenement_materiel (
E_CODE int(11) NOT NULL,
MA_ID int(11) NOT NULL,
EM_NB int(11) DEFAULT '1' NOT NULL,
EE_ID smallint(6),
PRIMARY KEY (E_CODE, MA_ID),
KEY MA_ID (MA_ID)
);
# ------------------------------------
# data for table 'evenement_materiel'
# ------------------------------------

# ------------------------------------
# structure for table 'evenement_option'
# ------------------------------------
DROP TABLE IF EXISTS evenement_option ;
CREATE TABLE evenement_option (
EO_ID int(11) NOT NULL auto_increment,
E_CODE int(11) NOT NULL,
EO_TITLE varchar(40) NOT NULL,
EO_COMMENT varchar(150) NOT NULL,
EO_TYPE varchar(15) DEFAULT 'checkbox' NOT NULL,
EO_ORDER tinyint(4) NOT NULL,
EOG_ID int(11) DEFAULT '0' NOT NULL,
PRIMARY KEY (EO_ID),
KEY E_CODE (E_CODE)
);
# ------------------------------------
# data for table 'evenement_option'
# ------------------------------------

# ------------------------------------
# structure for table 'evenement_option_choix'
# ------------------------------------
DROP TABLE IF EXISTS evenement_option_choix ;
CREATE TABLE evenement_option_choix (
EO_ID int(11) NOT NULL,
P_ID int(11) NOT NULL,
E_CODE int(11) NOT NULL,
EOC_VALUE varchar(100) NOT NULL,
PRIMARY KEY (EO_ID, P_ID),
KEY E_CODE (E_CODE, P_ID)
);
# ------------------------------------
# data for table 'evenement_option_choix'
# ------------------------------------

# ------------------------------------
# structure for table 'evenement_option_dropdown'
# ------------------------------------
DROP TABLE IF EXISTS evenement_option_dropdown ;
CREATE TABLE evenement_option_dropdown (
EOD_ID int(11) NOT NULL auto_increment,
EO_ID int(11) NOT NULL,
EOD_ORDER tinyint(4) NOT NULL,
EOD_TEXTE varchar(50) NOT NULL,
PRIMARY KEY (EOD_ID),
   UNIQUE EO_ID (EO_ID, EOD_TEXTE)
);
# ------------------------------------
# data for table 'evenement_option_dropdown'
# ------------------------------------

# ------------------------------------
# structure for table 'evenement_option_group'
# ------------------------------------
DROP TABLE IF EXISTS evenement_option_group ;
CREATE TABLE evenement_option_group (
EOG_ID int(11) NOT NULL auto_increment,
E_CODE int(11) NOT NULL,
EOG_TITLE varchar(60) NOT NULL,
EOG_ORDER tinyint(4) NOT NULL,
PRIMARY KEY (EOG_ID),
KEY E_CODE (E_CODE)
);
# ------------------------------------
# data for table 'evenement_option_group'
# ------------------------------------

# ------------------------------------
# structure for table 'evenement_participation'
# ------------------------------------
DROP TABLE IF EXISTS evenement_participation ;
CREATE TABLE evenement_participation (
E_CODE int(11) DEFAULT '0' NOT NULL,
EH_ID smallint(6) DEFAULT '1' NOT NULL,
P_ID int(11) DEFAULT '0' NOT NULL,
EP_DATE datetime,
EP_BY int(11),
TP_ID smallint(6) DEFAULT '0' NOT NULL,
EP_COMMENT varchar(150),
EP_DATE_DEBUT date,
EP_DATE_FIN date,
EP_DEBUT time,
EP_FIN time,
EP_DUREE float,
EP_FLAG1 tinyint(4) DEFAULT '0' NOT NULL,
EP_KM smallint(6),
EE_ID smallint(6),
EP_REMINDER tinyint(4) DEFAULT '0' NOT NULL,
EP_ABSENT tinyint(4) DEFAULT '0' NOT NULL,
EP_EXCUSE tinyint(4) DEFAULT '0' NOT NULL,
EP_TARIF float,
EP_PAID tinyint(1),
EP_ASA tinyint(4) DEFAULT '0' NOT NULL,
EP_DAS tinyint(4) DEFAULT '0' NOT NULL,
EP_ASTREINTE tinyint(4) DEFAULT '0' NOT NULL,
TSP_ID tinyint(4) DEFAULT '0' NOT NULL,
MODE_PAIEMENT tinyint(4),
NUM_CHEQUE varchar(20),
NOM_PAYEUR varchar(40),
PRIMARY KEY (E_CODE, EH_ID, P_ID),
   UNIQUE P_ID (P_ID, E_CODE, EH_ID),
KEY TP_ID (TP_ID),
KEY EP_REMINDER (EP_REMINDER),
KEY EP_ABSENT (EP_ABSENT),
KEY EP_TARIF (EP_TARIF),
KEY EP_PAID (EP_PAID),
KEY EP_FLAG1 (EP_FLAG1),
KEY EP_ASTREINTE (EP_ASTREINTE)
);
# ------------------------------------
# data for table 'evenement_participation'
# ------------------------------------

# ------------------------------------
# structure for table 'evenement_piquets_feu'
# ------------------------------------
DROP TABLE IF EXISTS evenement_piquets_feu ;
CREATE TABLE evenement_piquets_feu (
E_CODE int(11) NOT NULL,
EH_ID smallint(6) NOT NULL,
V_ID int(11) NOT NULL,
ROLE_ID tinyint(4) NOT NULL,
P_ID int(11),
PRIMARY KEY (E_CODE, EH_ID, V_ID, ROLE_ID),
KEY P_ID (P_ID)
);
# ------------------------------------
# data for table 'evenement_piquets_feu'
# ------------------------------------

# ------------------------------------
# structure for table 'evenement_vehicule'
# ------------------------------------
DROP TABLE IF EXISTS evenement_vehicule ;
CREATE TABLE evenement_vehicule (
E_CODE int(11) DEFAULT '0' NOT NULL,
EH_ID smallint(6) DEFAULT '1' NOT NULL,
V_ID int(11) DEFAULT '0' NOT NULL,
EV_KM smallint(6),
EV_DATE_DEBUT date,
EV_DATE_FIN date,
EV_DEBUT time,
EV_FIN time,
EV_DUREE float,
EE_ID smallint(6),
TFV_ID smallint(6),
PRIMARY KEY (E_CODE, EH_ID, V_ID),
KEY V_ID (V_ID)
);
# ------------------------------------
# data for table 'evenement_vehicule'
# ------------------------------------

# ------------------------------------
# structure for table 'fonctionnalite'
# ------------------------------------
DROP TABLE IF EXISTS fonctionnalite ;
CREATE TABLE fonctionnalite (
F_ID int(11) DEFAULT '0' NOT NULL,
F_LIBELLE varchar(30) NOT NULL,
F_TYPE tinyint(4) DEFAULT '0' NOT NULL,
TF_ID smallint(6) DEFAULT '0' NOT NULL,
F_FLAG tinyint(4) DEFAULT '0' NOT NULL,
F_DESCRIPTION varchar(500),
PRIMARY KEY (F_ID)
);
# ------------------------------------
# data for table 'fonctionnalite'
# ------------------------------------
INSERT INTO fonctionnalite (F_ID,F_LIBELLE,F_TYPE,TF_ID,F_FLAG,F_DESCRIPTION) VALUES
('0','Se connecter','0','0','0','Se connecter � eBrigade.  Tous les groupes d\'habilitation doivent avoir cette permission, sauf \'acc�s interdit\''),
('1','Ajouter personnel','0','4','0','Ajouter du personnel dans l\'application. Un mot de passe al�atoire est g�n�r� et un mail est envoy� au nouvel utilisateur  pour lui indiquer que son compte a �t� cr��.  Seul le personnel interne est concern� ici. L\'habilitation 37 est requise pour le personnel externe.'),
('2','Modifier le personnel','0','4','0','Modifier les informations du personnel sous sa responsabilit�,  sauf le mot de passe. Seul le personnel interne est concern� ici.  L\'habilitation 37 est requise pour le personnel externe.'),
('3','Supprimer le personnel','0','4','1','Supprimer les fiches personnelles. Attention seuls les administrateurs devraient �tre habilit�s pour utiliser cette fonctionnalit�.'),
('78','Gestion des modules','0','11','0','Acc�s � l\'activation ou d�sactivation des modules et leurs param�trages'),
('4','Comp�tences du personnel','0','5','1','Modifier les comp�tence et dates d\'expiration des comp�tences du personnel  sous sa responsabilit�.'),
('5','Cr�er tableau de garde','1','8','0','Cr�er un nouveau tableau ou le supprimer.'),
('6','Modifier le tableau de garde','1','8','0','Modifier la liste de personnel de garde un jour donn�.'),
('8','Ajout/Suppression consignes','1','8','0','Ajouter ou supprimer des consignes pour la garde op�rationnelle.'),
('9','S�curit�/habilitations','2','2','1','Changer les mots de passes de tout le personnel. Cr�er, modifier et supprimer des groupes de permissions et des r�les dans l\'organigramme. Attention seuls les administrateurs devraient �tre habilit�s pour utiliser cette fonctionnalit�.'),
('10','Modifier les disponibilit�s','0','4','0','Modifier les disponibilit�s du personnel sous sa responsabilit�. Inscrire le personnel sous sa responsabilit� sur des �v�nements.'),
('11','Saisir ses absences','0','0','0','Saisir ses absences personnelles, demandes de cong�s pay�s (pour le personnel professionnel ou salari�), absences pour raisons personnelles ou autres.Dans le cas d\'une demande de cong�s, une demande de validation est envoy�e au responsable du demandeur.'),
('12','Saisie toutes absences','0','4','0','Enregistrer des absences pour les autres personnes.'),
('13','Horaires et Cong�s','0','4','0','Valider les horaires de travail saisis, les demandes de cong�s pay�s et de RTT du personnel professionnel ou salari�. Recevoir un mail de notification si une demande de CP doit �tre valid�e. Recevoir un mail de notification en cas d\'inscription de personnel salari�, pr�cisant  le statut b�n�vole ou salari�.'),
('14','Admin technique','2','1','1','Configuration de l\'application eBrigade, gestion des sauvegardes de la base de donn�es. Supprimer des sections. Supprimer des messages sur la messagerie instantan�e. Attention seuls les administrateurs devraient �tre habilit�s pour utiliser cette fonctionnalit�.'),
('15','Gestion des activit�s','0','6','0','Cr�er de nouvelles activit�s, modifier les activit�s existantes, inscrire du personnel et du mat�riel sur les activit�s.'),
('16','Ajout infos diverses','0','9','0','Ajouter des informations visibles par les autres utilisateurs sur la pages infos diverses. Ces informations sont aussi visibles sur la page d\'accueil.'),
('17','V�hicules','0','7','0','Ajouter ou modifier des v�hicules  Permet d\'engager des v�hicules sur les �v�nements.'),
('70','Mat�riel et tenues','0','7','0','Ajouter ou modifier le mat�riel ou les tenues  Permet d\'engager du mat�riel sur les �v�nements.'),
('18','Param�trage application','0','3','0','Param�trage de l\'application: Comp�tences, Fonctions, Types de mat�riel. Attention seuls les administrateurs devraient �tre habilit�s pour utiliser cette fonctionnalit�.'),
('19','Supprimer donn�es','0','7','1','Supprimer des �v�nements, des v�hicules, du mat�riel ou des entreprises clientes. Modifier des �v�nements dans le pass�. Attention seuls les administrateurs devraient �tre habilit�s pour utiliser cette fonctionnalit�.'),
('20','Audit','0','9','0','Voir l\'historique des connexions � l\'application.'),
('21','Notifications activit�s','0','10','0','Recevoir un email de notification lorsqu\'une activit� est cr��e, ou lorsqu\'il y a une demande de remplacement sur cette activit�e.'),
('22','Gestion des sections','0','3','0','Modifier l\'adresse, les coordonn�es et le param�trage  d\'une section de l\'organigramme. Ne permet pas de renommer ou d�placer.'),
('23','Envoyer des SMS','0','9','0','Envoyer des SMS (c\'est un service qui a un co�t).'),
('24','Permissions globales','0','1','0','Etendre les permissions d\'une personne � toutes les sections ou � toutes les zones g�ographiques.'),
('25','S�curit� locale','0','2','0','Permissions de modifier le statut du personnel (actif, radi�),  les mots de passes ou de modifier les permissions des autres utilisateurs.  Ces droits sont cependant limit�s au personnel sous sa responsabilit�,  et ne permettent pas de donner les permissions les plus �lev�es (9, 14 et 24).'),
('26','Gestion des permanences','0','7','0','Permissions du cadre de permanence. Donne aussi des droits de cr�ation  et de modification sur les �v�nements, d\'inscription du personnel ou d\'engagement  des v�hicule et du mat�riel.  Permet aussi de changer le cadre de permanence.'),
('27','Statistiques et reporting','0','9','0','Voir les graphiques montrant les statistiques op�rationnelles. Utiliser les fonctionnalit�s de reporting. Voir les cartes de France.'),
('76','Cartes Google Maps','0','9','0','Permission de voir les cartes Google Maps. Cette fonctionnalit� �tant payante, on peut restreindre l\'acc�s � certains groupes d\'utilisateurs seulement.'),
('28','Inscriptions ext�rieures','0','6','0','S\'inscrire ou inscrire du personnel sur les �v�nements de toutes les sections  ou de toutes les zones g�ographiques.'),
('29','Comptabilit�','0','7','0','Utiliser la fonctionnalit� de comptabilit� permettant de visualiser,  de cr�er ou de modifier des devis ou des factures pour les DPS, les formations  ou les autres activit�s facturables. Modifier les param�trage des devis et factures sur la page section'),
('30','Gestion des badges','0','7','0','Editer et imprimer des badges pour le personnel. Param�trer le format des badges sur la page section.'),
('31','Gestion des comp�tences �lev�e','0','5','1','Permet d\'attribuer ou de modifier des comp�tences consid�r�es comme �lev�es.  Dans la page de param�trage des comp�tences,  on peut d�finir si une comp�tence requiret cette habilitation pour pouvoir �tre attribu�e  � une personne.'),
('32','Notifications personnel','0','10','0','Recevoir une notification par email lorsque une nouvelle fiche personnelle est cr��e ou lorsque une personne change de statut (actif <-> ancien).'),
('33','Notifications comp�tences','0','10','0','Recevoir une notification par email lorsque certaines comp�tences  (ayant la propri�t� \'Alerter si modification\' sont attribu�es � du personnel.'),
('34','Notifications v�hicules','0','10','0','Recevoir une notification par email lorsque le statut  d\'un v�hicule est modifi� (utilisable <-> r�form�).'),
('35','Notifications comptabilit�','0','10','0','Recevoir une notification par email lorsque un devis a �t� cr��.'),
('36','Gestion des agr�ments','0','7','1','Permettre de modifier les agr�ments des sections.'),
('37','Gestion des externes','0','7','0','Ajouter et modifier le personnel externe.  Ajouter, modifier les entreprises ou associations clientes, li�es � une section.  Attention, la suppression d\'une entreprise requiert en plus l\'habilitation 19'),
('38','Saisir ses disponibilit�s','0','0','0','Permettre de saisir ses propres disponibilit�s,  et de voir les disponibilit�s saisies par le personnel.  Tous les membres peuvent avoir cette permission.'),
('39','S\'inscrire','0','0','0','Permet � une personne de s\'inscrire sur des activit�s lorsque celles ci sont ouverts aux inscriptions pour le personnel de sa section. Tous les membres peuvent avoir cette permission.'),
('40','Acc�s en lecture total','0','0','0','Voir toutes les fiches du personnel interne, les activit�s, les v�hicules et le mat�riel, quel que soit leur niveau dans l\'organigramme, � l\'exclusion �ventuelle des informations prot�g�es. Donner en compl�ment la permission 56 - Voir le personnel local.  Attention, pour voir les fiches du personnel externe, les permissions 37 ou 45 sont requises.'),
('41','Voir les activit�s','0','0','0','Voir tous les activit�s qui ont �t� cr��es. Sans cette permission on ne peut voir que les activit�s o� l\'on est inscrit. Le personnel externe poss�dant cette habilitation a une restriction g�ographique. Tous le personnel interne devrait avoir cette permission.'),
('42','Voir v�hicules/mat�riel','0','0','0','Acc�s en lecture aux menus v�hicules et mat�riel,  permet d\'afficher l\'inventaire et l\'�tat de chaque v�hicule ou pi�ce de mat�riel.'),
('43','Messagerie','0','0','0','Utiliser les outils de messagerie: mails et alertes.   Tous les membres peuvent avoir cette permission.'),
('44','Voir les infos - basique','0','0','0','Voir les infos au niveau de sa section.  Tous les membres peuvent avoir cette permission.'),
('45','Voir mon entreprise','3','0','0','Permet � un utilisateur faisant partie du personnel d\'une entreprise de voir les informations relatives � cette entreprise, le personnel externe attach� � une entreprise et aussi les activit�s organis�es pour le compte de cette entreprise. Cette fonctionnalit� n\'a aucun effet sur les utilisateurs qui ne font pas partie d\'une entreprise.'),
('46','Habilitations des externes','2','2','1','Permettre de donner un acc�s �tendu � l\'application au personnel externe.  Les permissions donnant les droits sur la fonctionnalit� 45 sont concern�es. L\'acc�s � cette fonctionnalit� doit �tre restreint.'),
('47','Gestion des documents','0','7','0','Ajouter des documents sur la page section. D�finir des restrictions d\'acc�s � ces documents.'),
('48','Imprimer les dipl�mes','0','5','0','Imprimer les dipl�mes � l\'issue des formations.'),
('49','Historique','0','2','0','Voir l\'historique des modifications faites sur les fiches personnels les v�hicules ou mat�riels et les activit�s.'),
('50','Notification changement fiche','0','10','0','Recevoir une notification en cas de  changement sur une fiche personnelle'),
('51','Messagerie instantan�e','0','0','0','Utiliser la messagerie instantan�e, chat - aide en ligne.  Tous les membres peuvent avoir cette permission.'),
('52','Voir les infos - avanc�','0','0','0','Permet � une personne de voir tous les messages d\'information et l\'organigramme.  Tous les membres peuvent avoir cette permission, mais pas les externes.'),
('53','Cotisations','0','7','0','D�finir les montants des cotisations au niveau de sa section. Enregistrer les cotisations des membres'),
('73','Valider Notes de frais','0','7','0','Modifier et faire la premi�re validation des notes de frais. Recevoir les notifications par mail si une note est envoy�e pour validation. Attention : on ne peut cependant pas valider compl�tement ses propres notes de frais.'),
('54','Param. impression dipl�mes','0','3','1','Param�trage impression des dipl�mes. Choix des images  pour les dipl�mes pr�imprim�s et choix des champs devant �tre imprim�s,  avec leur emplacement'),
('55','Gestion organigramme','0','3','1','Ajouter, d�placer, renommer des sections Pour supprimer une section il faut la permission 19.'),
('56','Voir le personnel','0','0','0','Voir la liste du personnel et les fiches du personnel de ma section Tous les membres peuvent avoir cette permission. Pour voir tout le personnel, il faut la permission 40.'),
('57','Notifications disponibilit�s','0','10','0','Recevoir une notification par mail quand une personne modifie  ses disponibilit�s ou enregistre une absence.'),
('58','Notifications messages','0','10','0','Recevoir une notification par mail quand une consigne ou un message d\'information est enregistr�.'),
('59','Voir cotisations et notes','0','7','0','Voir les informations relatives aux cotisations et notes de frais.'),
('60','Notification Garde','1','10','0','Recevoir une notification par mail quand une personne est inscrite sur une garde apr�s publication du tableau.'),
('61','Voir le tableau de garde','1','8','0','Permet de voir le tableau de garde, la composition de la garde du jour.'),
('71','Consommables','0','7','0','Ajouter ou modifier des produits consommables. Permet d\'enregistrer les consommations sur les activit�s.'),
('72','Notification participation','0','10','0','Permet de recevoir un rappel la veille de la participation � une activit�.'),
('74','Valider 2 Notes de frais','0','7','0','Modifier et faire la deuxi�me validation notes de frais. Recevoir les notifications par mail si une note est valid�e une premi�re fois. Attention : on ne peut cependant pas valider compl�tement ses propres notes de frais.'),
('75','Rembourser Notes de frais','0','7','0','Modifier et rembourser les notes de frais.  Recevoir les notifications par mail si une note est valid�e.'),
('77','Saisir ses notes de frais','0','0','0','Cr�er des notes de frais pour soi-m�me. Voir ses cotisations et remboursements');
# ------------------------------------
# structure for table 'garde_competences'
# ------------------------------------
DROP TABLE IF EXISTS garde_competences ;
CREATE TABLE garde_competences (
GC_ID int(11) NOT NULL auto_increment,
EQ_ID int(11) NOT NULL,
EH_ID tinyint(4) NOT NULL,
PS_ID int(11) NOT NULL,
NB tinyint(4) NOT NULL,
PRIMARY KEY (GC_ID),
   UNIQUE EQ_ID (EQ_ID, EH_ID, PS_ID)
);
# ------------------------------------
# data for table 'garde_competences'
# ------------------------------------
INSERT INTO garde_competences (GC_ID,EQ_ID,EH_ID,PS_ID,NB) VALUES
('2','1','1','29','1'),
('6','1','1','31','1'),
('4','1','1','28','2'),
('5','1','1','27','2'),
('7','1','2','31','1'),
('8','1','2','29','1'),
('9','1','2','28','2'),
('10','1','2','27','2'),
('11','2','1','31','1'),
('12','2','1','22','1'),
('13','2','1','21','2');
# ------------------------------------
# structure for table 'geolocalisation'
# ------------------------------------
DROP TABLE IF EXISTS geolocalisation ;
CREATE TABLE geolocalisation (
ID int(11) NOT NULL auto_increment,
TYPE char(1) DEFAULT 'E' NOT NULL,
CODE int(11) NOT NULL,
CODE2 int(11) DEFAULT '0' NOT NULL,
LAT float(10,6) NOT NULL,
LNG float(10,6) NOT NULL,
ZOOMLEVEL smallint(6),
MAPTYPEID varchar(25),
COMMENT varchar(300),
PRIMARY KEY (ID),
   UNIQUE TYPE (TYPE, CODE, CODE2)
);
# ------------------------------------
# data for table 'geolocalisation'
# ------------------------------------

# ------------------------------------
# structure for table 'gps'
# ------------------------------------
DROP TABLE IF EXISTS gps ;
CREATE TABLE gps (
P_ID int(11) NOT NULL,
DATE_LOC datetime NOT NULL,
LAT float NOT NULL,
LNG float NOT NULL,
ADDRESS varchar(500) NOT NULL,
PRIMARY KEY (P_ID)
);
# ------------------------------------
# data for table 'gps'
# ------------------------------------

# ------------------------------------
# structure for table 'grade'
# ------------------------------------
DROP TABLE IF EXISTS grade ;
CREATE TABLE grade (
G_GRADE varchar(6) NOT NULL,
G_DESCRIPTION varchar(50) NOT NULL,
G_LEVEL smallint(6) DEFAULT '0' NOT NULL,
G_TYPE varchar(25) NOT NULL,
G_CATEGORY varchar(5) DEFAULT 'SP' NOT NULL,
G_ICON varchar(150),
G_FLAG tinyint(4),
PRIMARY KEY (G_GRADE)
);
# ------------------------------------
# data for table 'grade'
# ------------------------------------
INSERT INTO grade (G_GRADE,G_DESCRIPTION,G_LEVEL,G_TYPE,G_CATEGORY,G_ICON,G_FLAG) VALUES
('-','non renseign�','0','tous','ALL','images/grades_sp/NR.png',1);
# ------------------------------------
# structure for table 'groupe'
# ------------------------------------
DROP TABLE IF EXISTS groupe ;
CREATE TABLE groupe (
GP_ID smallint(6) DEFAULT '0' NOT NULL,
GP_DESCRIPTION varchar(30) NOT NULL,
TR_CONFIG tinyint(4),
TR_SUB_POSSIBLE tinyint(4) DEFAULT '0' NOT NULL,
TR_ALL_POSSIBLE tinyint(4) DEFAULT '0' NOT NULL,
TR_WIDGET tinyint(4) DEFAULT '0' NOT NULL,
GP_USAGE varchar(10) DEFAULT 'internes' NOT NULL,
GP_ASTREINTE tinyint(4) DEFAULT '0' NOT NULL,
GP_ORDER tinyint(4) DEFAULT '50' NOT NULL,
PRIMARY KEY (GP_ID)
);
# ------------------------------------
# data for table 'groupe'
# ------------------------------------
INSERT INTO groupe (GP_ID,GP_DESCRIPTION,TR_CONFIG,TR_SUB_POSSIBLE,TR_ALL_POSSIBLE,TR_WIDGET,GP_USAGE,GP_ASTREINTE,GP_ORDER) VALUES
('-1','acc�s interdit','1','0','0','0','all','0','50'),
('0','public','1','0','0','0','internes','0','5'),
('4','admin','1','0','0','0','internes','0','1'),
('5','Externe','1','0','0','0','externes','0','50'),
('102','Chef','2','0','0','0','internes','0','50'),
('103','Adjoint','2','0','0','0','internes','0','50'),
('110','Secr�taire','3','1','0','0','internes','0','50');
# ------------------------------------
# structure for table 'habilitation'
# ------------------------------------
DROP TABLE IF EXISTS habilitation ;
CREATE TABLE habilitation (
GP_ID smallint(6) DEFAULT '0' NOT NULL,
F_ID int(11) DEFAULT '0' NOT NULL,
PRIMARY KEY (GP_ID, F_ID),
KEY F_ID (F_ID)
);
# ------------------------------------
# data for table 'habilitation'
# ------------------------------------
INSERT INTO habilitation (GP_ID,F_ID) VALUES
('0','0'),
('0','11'),
('0','16'),
('0','38'),
('0','39'),
('0','40'),
('0','41'),
('0','42'),
('0','43'),
('0','44'),
('0','51'),
('0','52'),
('0','56'),
('0','58'),
('0','61'),
('0','77'),
('4','0'),
('4','1'),
('4','2'),
('4','3'),
('4','4'),
('4','5'),
('4','6'),
('4','8'),
('4','9'),
('4','10'),
('4','11'),
('4','12'),
('4','13'),
('4','14'),
('4','15'),
('4','16'),
('4','17'),
('4','18'),
('4','19'),
('4','20'),
('4','21'),
('4','22'),
('4','23'),
('4','24'),
('4','25'),
('4','26'),
('4','27'),
('4','28'),
('4','29'),
('4','30'),
('4','31'),
('4','36'),
('4','37'),
('4','38'),
('4','39'),
('4','40'),
('4','41'),
('4','42'),
('4','43'),
('4','44'),
('4','46'),
('4','47'),
('4','48'),
('4','49'),
('4','51'),
('4','52'),
('4','53'),
('4','54'),
('4','55'),
('4','56'),
('4','58'),
('4','59'),
('4','60'),
('4','61'),
('4','70'),
('4','71'),
('4','73'),
('4','74'),
('4','75'),
('4','76'),
('4','77'),
('4','78'),
('5','0'),
('5','45'),
('102','38'),
('102','39'),
('102','40'),
('102','41'),
('102','42'),
('102','43'),
('102','44'),
('102','51'),
('102','52'),
('102','56'),
('102','58'),
('102','61'),
('103','38'),
('103','39'),
('103','40'),
('103','41'),
('103','42'),
('103','43'),
('103','44'),
('103','51'),
('103','52'),
('103','56'),
('103','58'),
('103','61'),
('110','38'),
('110','39'),
('110','40'),
('110','41'),
('110','42'),
('110','43'),
('110','44'),
('110','51'),
('110','52'),
('110','56'),
('110','58'),
('110','61');
# ------------------------------------
# structure for table 'horaires'
# ------------------------------------
DROP TABLE IF EXISTS horaires ;
CREATE TABLE horaires (
H_ID int(11) NOT NULL auto_increment,
P_ID int(11) NOT NULL,
H_DATE date NOT NULL,
H_DEBUT1 time,
H_FIN1 time,
H_DEBUT2 time,
H_FIN2 time,
H_DUREE_MINUTES smallint(6) NOT NULL,
ASA tinyint(4) DEFAULT '0' NOT NULL,
FORM tinyint(4) DEFAULT '0' NOT NULL,
FORMS tinyint(4) DEFAULT '0' NOT NULL,
H_DUREE_MINUTES2 smallint(6) DEFAULT '0' NOT NULL,
H_COMMENT varchar(1000),
PRIMARY KEY (H_ID),
   UNIQUE ID_DATE (P_ID, H_DATE),
KEY H_DATE (H_DATE)
);
# ------------------------------------
# data for table 'horaires'
# ------------------------------------

# ------------------------------------
# structure for table 'horaires_statut'
# ------------------------------------
DROP TABLE IF EXISTS horaires_statut ;
CREATE TABLE horaires_statut (
HS_CODE varchar(5) NOT NULL,
HS_DESCRIPTION varchar(30) NOT NULL,
HS_CLASS varchar(20) NOT NULL,
HS_ORDER tinyint(4) NOT NULL,
PRIMARY KEY (HS_CODE)
);
# ------------------------------------
# data for table 'horaires_statut'
# ------------------------------------
INSERT INTO horaires_statut (HS_CODE,HS_DESCRIPTION,HS_CLASS,HS_ORDER) VALUES
('ATTV','A valider','orange12','2'),
('REJ','Rejet�s','red12','3'),
('SEC','Saisie en cours','blue12','1'),
('VAL','Valid�s','green12','4');
# ------------------------------------
# structure for table 'horaires_validation'
# ------------------------------------
DROP TABLE IF EXISTS horaires_validation ;
CREATE TABLE horaires_validation (
HV_ID int(11) NOT NULL auto_increment,
P_ID int(11) NOT NULL,
ANNEE year(4) NOT NULL,
SEMAINE int(11) NOT NULL,
HS_CODE varchar(5) NOT NULL,
CREATED_BY int(11),
CREATED_DATE datetime NOT NULL,
STATUS_BY int(11),
STATUS_DATE datetime,
PRIMARY KEY (HV_ID),
   UNIQUE ID_DATE (P_ID, ANNEE, SEMAINE),
KEY H_DATE (ANNEE)
);
# ------------------------------------
# data for table 'horaires_validation'
# ------------------------------------

# ------------------------------------
# structure for table 'indisponibilite'
# ------------------------------------
DROP TABLE IF EXISTS indisponibilite ;
CREATE TABLE indisponibilite (
I_CODE int(11) NOT NULL auto_increment,
P_ID int(11) DEFAULT '0' NOT NULL,
TI_CODE varchar(5) DEFAULT 'CP' NOT NULL,
I_STATUS varchar(5) DEFAULT 'ATT' NOT NULL,
I_DEBUT date NOT NULL,
I_FIN date,
IH_DEBUT time DEFAULT '08:00:00' NOT NULL,
IH_FIN time DEFAULT '19:00:00' NOT NULL,
I_JOUR_COMPLET tinyint(4) DEFAULT '1' NOT NULL,
I_TYPE_PERIODE tinyint(4) DEFAULT '1' NOT NULL,
I_ACCEPT datetime,
I_STATUS_BY int(11),
I_CANCEL datetime,
I_COMMENT varchar(50) NOT NULL,
PRIMARY KEY (I_CODE),
KEY P_ID (P_ID),
KEY TI_CODE (TI_CODE),
KEY I_STATUS (I_STATUS),
KEY I_DEBUT (I_DEBUT),
KEY I_TYPE_PERIODE (I_TYPE_PERIODE)
);
# ------------------------------------
# data for table 'indisponibilite'
# ------------------------------------

# ------------------------------------
# structure for table 'indisponibilite_status'
# ------------------------------------
DROP TABLE IF EXISTS indisponibilite_status ;
CREATE TABLE indisponibilite_status (
I_STATUS varchar(5) NOT NULL,
I_STATUS_LIBELLE varchar(20) NOT NULL,
PRIMARY KEY (I_STATUS)
);
# ------------------------------------
# data for table 'indisponibilite_status'
# ------------------------------------
INSERT INTO indisponibilite_status (I_STATUS,I_STATUS_LIBELLE) VALUES
('ANN','Annul�e'),
('ATT','Attente'),
('PRE','pr�visionnel'),
('REF','Refus�e'),
('VAL','Valid�e');
# ------------------------------------
# structure for table 'intervention_equipe'
# ------------------------------------
DROP TABLE IF EXISTS intervention_equipe ;
CREATE TABLE intervention_equipe (
EL_ID int(11) NOT NULL,
E_CODE int(11) NOT NULL,
EE_ID smallint(6) NOT NULL,
PRIMARY KEY (EL_ID, E_CODE, EE_ID),
KEY E_CODE (E_CODE)
);
# ------------------------------------
# data for table 'intervention_equipe'
# ------------------------------------

# ------------------------------------
# structure for table 'intervention_status'
# ------------------------------------
DROP TABLE IF EXISTS intervention_status ;
CREATE TABLE intervention_status (
IS_ID tinyint(4) NOT NULL,
IS_CODE varchar(6) NOT NULL,
IS_DESCRIPTION varchar(50) NOT NULL,
IS_COLOR varchar(12) NOT NULL,
PRIMARY KEY (IS_ID)
);
# ------------------------------------
# data for table 'intervention_status'
# ------------------------------------
INSERT INTO intervention_status (IS_ID,IS_CODE,IS_DESCRIPTION,IS_COLOR) VALUES
('1','DISPO','Disponible','green'),
('2','INDISP','Indisponible','black'),
('3','INTER','Engag� en intervention','red'),
('4','RETD','Retour disponible','orange'),
('5','SLL','Sur les lieux','yellow'),
('6','TRANS','Transport','blue'),
('7','PATR','En Patrouille','darkgreen');
# ------------------------------------
# structure for table 'licence'
# ------------------------------------
DROP TABLE IF EXISTS licence ;
CREATE TABLE licence (
LICENCE varchar(300) NOT NULL,
MODULE varchar(50) NOT NULL,
ID_SECTION int(11) NOT NULL,
SEATS tinyint(4) NOT NULL,
END_DATETIME datetime NOT NULL,
SUBSCRIBER varchar(400) NOT NULL,
PRIMARY KEY (LICENCE),
KEY MODULE (MODULE),
KEY ID_SECTION (ID_SECTION)
);
# ------------------------------------
# data for table 'licence'
# ------------------------------------

# ------------------------------------
# structure for table 'log_category'
# ------------------------------------
DROP TABLE IF EXISTS log_category ;
CREATE TABLE log_category (
LC_CODE varchar(2) NOT NULL,
LC_DESCRIPTION varchar(30) NOT NULL,
PRIMARY KEY (LC_CODE)
);
# ------------------------------------
# data for table 'log_category'
# ------------------------------------
INSERT INTO log_category (LC_CODE,LC_DESCRIPTION) VALUES
('E','�v�nement'),
('M','mat�riel'),
('P','personnel'),
('V','v�hicule'),
('G','G�olocalisation'),
('S','Section'),
('A','Malveillance');
# ------------------------------------
# structure for table 'log_history'
# ------------------------------------
DROP TABLE IF EXISTS log_history ;
CREATE TABLE log_history (
LH_ID int(11) NOT NULL auto_increment,
P_ID int(11) NOT NULL,
LH_STAMP datetime NOT NULL,
LT_CODE varchar(8) NOT NULL,
LH_WHAT int(11) NOT NULL,
LH_COMPLEMENT varchar(150),
COMPLEMENT_CODE int(11),
PRIMARY KEY (LH_ID),
KEY P_ID (P_ID),
KEY LH_STAMP (LH_STAMP),
KEY LT_CODE (LT_CODE),
KEY LH_WHAT (LH_WHAT),
KEY COMPLEMENT_CODE (COMPLEMENT_CODE)
);
# ------------------------------------
# data for table 'log_history'
# ------------------------------------
INSERT INTO log_history (LH_ID,P_ID,LH_STAMP,LT_CODE,LH_WHAT,LH_COMPLEMENT,COMPLEMENT_CODE) VALUES
('1','1','2021-04-12 21:32:44','UPDMDP','1','','0');
# ------------------------------------
# structure for table 'log_report'
# ------------------------------------
DROP TABLE IF EXISTS log_report ;
CREATE TABLE log_report (
LR_ID int(11) NOT NULL auto_increment,
LR_DATE datetime NOT NULL,
R_CODE varchar(30) NOT NULL,
P_ID int(11) NOT NULL,
S_ID int(11) NOT NULL,
LR_ROWS int(11) NOT NULL,
LR_PARAMS varchar(100) NOT NULL,
LR_TIME smallint(6) NOT NULL,
PRIMARY KEY (LR_ID),
KEY S_ID (S_ID)
);
# ------------------------------------
# data for table 'log_report'
# ------------------------------------

# ------------------------------------
# structure for table 'log_soap'
# ------------------------------------
DROP TABLE IF EXISTS log_soap ;
CREATE TABLE log_soap (
LS_ID int(11) NOT NULL auto_increment,
LS_DATE datetime NOT NULL,
LS_SERVICE varchar(25) NOT NULL,
LS_PARAM varchar(30),
LS_RET tinyint(4) NOT NULL,
LS_MESSAGE varchar(255),
PRIMARY KEY (LS_ID),
KEY LS_DATE (LS_DATE),
KEY LS_SERVICE (LS_SERVICE)
);
# ------------------------------------
# data for table 'log_soap'
# ------------------------------------

# ------------------------------------
# structure for table 'log_type'
# ------------------------------------
DROP TABLE IF EXISTS log_type ;
CREATE TABLE log_type (
LT_CODE varchar(8) NOT NULL,
LC_CODE varchar(2) NOT NULL,
LT_DESCRIPTION varchar(50) NOT NULL,
PRIMARY KEY (LT_CODE),
KEY LC_CODE (LC_CODE)
);
# ------------------------------------
# data for table 'log_type'
# ------------------------------------
INSERT INTO log_type (LT_CODE,LC_CODE,LT_DESCRIPTION) VALUES
('ACCEPT','P','Acceptation des conditions d\'utilisation'),
('ADDOC','P','Ajout d\'un document'),
('ADDROLE','P','Ajout r�le dans organigramme'),
('ADQ','P','Ajout comp�tence'),
('CLOTEVT','E','cloture �v�nement'),
('DELABS','P','Suppression demande absence'),
('DELAST','P','Suppression astreinte'),
('DELCOT','P','Suppression cotisation'),
('DELDOC','P','Suppression de document'),
('DELMSG','P','Suppression d\'un message de'),
('DELPHOTO','P','Suppression de photo'),
('DELQ','P','Suppression comp�tence'),
('DELREJ','P','Suppression rejet'),
('DELREM','P','Suppression remboursement'),
('DELRIB','P','Suppression compte bancaire'),
('DELROLE','P','Suppression r�le dans organigramme'),
('DEMBADGE','P','Demande de nouveau badge'),
('DESINSCP','P','D�sinscription'),
('DETINSCP','P','Commentaire sur inscription'),
('DROPP','P','Suppression d\'une fiche personnelle'),
('DROPV','V','Suppression d\'une fiche v�hicule'),
('EEINSCP','P','Modification Equipe'),
('FNINSCP','P','Modification Fonction'),
('IMPBADGE','P','Impression de badge'),
('INSABS','P','Saisie absence'),
('INSAST','P','Inscription astreinte'),
('INSCOT','P','Ajout cotisation'),
('INSCP','P','Inscription'),
('INSEVT','E','cr�ation �v�nement'),
('INSMAIN','E','ajout main courante'),
('INSP','P','Ajout d\'une fiche personnelle'),
('INSREJ','P','Ajout rejet'),
('INSREM','P','Ajout remboursement'),
('INSV','V','Ajout d\'une fiche v�hicule'),
('OUVEVT','E','ouverture �v�nement'),
('REFABS','P','Refus cong�s ou RTT'),
('REGENMDP','P','Reg�n�ration de mot de passe'),
('SECDOC','P','S�curit� de document'),
('UPDADR','P','Changement d\'adresse'),
('UPDAST','P','Modification astreinte'),
('UPDBIC','P','Modification code banque BIC'),
('UPDCOT','P','Mise � jour cotisation'),
('UPDDISPO','P','Modification des disponibilit�s'),
('UPDEVT','E','modification �v�nement'),
('UPDGRP','P','Changement de permissions'),
('UPDHAB','P','Modification tenues en dotation'),
('UPDHOR','P','Modification horaires'),
('UPDIBAN','P','Modification compte IBAN'),
('UPDMAIL','P','Changement email'),
('UPDMAIN','E','modification main courante'),
('UPDMDP','P','Modification de mot de passe'),
('UPDP','P','Modification de fiche personnelle'),
('UPDP1','P','Modification civilit�'),
('UPDP10','P','Modification date de naissance'),
('UPDP11','P','Modification lieu de naissance'),
('UPDP12','P','Modification contact'),
('UPDP13','P','Modification date npai'),
('UPDP14','P','Modification masquage infos'),
('UPDP15','P','Modification notifications'),
('UPDP16','P','Modification grade'),
('UPDP17','P','Modification profession'),
('UPDP18','P','Modification service'),
('UPDP19','P','Modification statut'),
('UPDP2','P','Modification pr�nom'),
('UPDP20','P','Modification type salari�'),
('UPDP21','P','Modification heures salari�'),
('UPDP22','P','Modification date d�but suspendu'),
('UPDP23','P','Modification date fin suspendu'),
('UPDP24','P','Modification d�tail radiation'),
('UPDP25','P','Modification sexe'),
('UPDP26','P','Modification num�ro abbr�g�'),
('UPDP27','P','Modification contact urgence'),
('UPDP28','P','Modification nombre jours CP par an'),
('UPDP29','P','Modification heures annuelles salari�'),
('UPDP3','P','Modification nom'),
('UPDP30','P','Modification heures � r�cup�rer'),
('UPDP4','P','Modification nom de naissance'),
('UPDP5','P','Modification identifiant'),
('UPDP6','P','Modification entreprise'),
('UPDP7','P','Modification droits d\'acc�s'),
('UPDP8','P','Modification date engagement'),
('UPDP9','P','Modification date fin'),
('UPDPHONE','P','Changement t�l�phone'),
('UPDPHOTO','P','Modification de photo'),
('UPDQ','P','Modification comp�tence'),
('UPDREJ','P','Mise � jour rejet'),
('UPDREM','P','Mise � jour remboursement'),
('UPDRIB','P','Modification de compte bancaire'),
('UPDSEC','P','Changement de section'),
('UPDSTP','P','Changement de position'),
('UPDSTV','V','Changement de position v�hicule'),
('UPDV','V','Modification de fiche v�hicule'),
('VALABS','P','Validation cong�s ou RTT'),
('UPD31','P','Modification heures par jour'),
('DEMGPS','G','Demande de g�olocalisation'),
('GPS','G','G�olocalisation r�ussie'),
('UPDP32','P','Modification du 2�me pr�nom'),
('INSS','S','Ajout section'),
('INSSS','S','Ajout sous-section'),
('DELSS','S','Suppression de sous-section'),
('MOVES','S','D�placement de section'),
('UPDS1','S','Modification nom de section'),
('UPDS2','S','Modification description section'),
('UPDS3','S','Modification adresse section'),
('UPDS4','S','Modification ville section'),
('UPDS5','S','Modification code postal section'),
('UPDS6','S','Modification t�l�phone section'),
('UPDS7','S','Modification t�l�phone 2 section'),
('UPDS8','S','Modification t�l�phone formation'),
('UPDS9','S','Modification fax section'),
('UPDS10','S','Modification email section'),
('UPDS11','S','Modification email 2 section'),
('UPDS12','S','Modification email formation'),
('UPDS13','S','Modification URL site Web'),
('UPDS14','S','Modification agr�ments section'),
('UPDS15','S','Modification cotisation section'),
('UPDS16','S','Modification param�trage section'),
('UPDS17','S','Modification changements dans le pass�'),
('UPDS18','S','Modification masquer �v�nements '),
('UPDS19','S','Modification param�trage SMS section'),
('UPDS20','S','Modification mod�le badge section'),
('UPDS21','S','Modification signature section'),
('UPDS22','S','Modification DPS type maximum section'),
('UPDS23','S','Modification section active/inactive'),
('UPDS24','S','Modification compl�ment adresse section'),
('UPDS25','S','Modification BIC'),
('UPDS26','S','Modification IBAN'),
('UPDP50','P','Changement Nationalit�'),
('UPDS27','S','Modification ID Radio'),
('UPDS28','S','Modification affichage t�l�phone formation'),
('UPDS29','S','Modification affichage email formation'),
('UPDS30','S','Modification affichage Site web formation'),
('UPDP51','P','Changement D�partement de Naissance'),
('UPDABS','P','Modification absence sur �v�nement'),
('ATTACK','A','Essaye d\'acc�der � donn�es du syst�me'),
('DELP','A','Suppression de fiche personnelle'),
('ERRP','A','Erreur de permissions'),
('UPDP33','P','Modification num�ro de licence'),
('UPDP34','P','Modification date de licence'),
('UPDP35','P','Modification date expiration de licence'),
('UPDP36','P','Modification du r�gime de travail'),
('UPDS31','S','Modification Code Siret'),
('UPDS32','S','Modification Num�ro Affiliation'),
('UPDP37','P','Modification ID API'),
('UPDP38','P','Modification Reliquat CP'),
('UPDP39','P','Modification Reliquat RTT'),
('UPDS33','S','Modification Groupe Whatsapp'),
('UPDS34','S','Modification Ordre garde'),
('UPDS35','S','Modification Timezone');
# ------------------------------------
# structure for table 'mailer'
# ------------------------------------
DROP TABLE IF EXISTS mailer ;
CREATE TABLE mailer (
ID int(11) NOT NULL auto_increment,
MAILDATE datetime,
MAILTO varchar(120),
SENDERNAME varchar(120),
SENDERMAIL varchar(120),
SUBJECT varchar(250),
MESSAGE varchar(5000),
ATTACHMENT varchar(250),
PRIMARY KEY (ID),
KEY MAILDATE (MAILDATE)
);
# ------------------------------------
# data for table 'mailer'
# ------------------------------------

# ------------------------------------
# structure for table 'materiel'
# ------------------------------------
DROP TABLE IF EXISTS materiel ;
CREATE TABLE materiel (
MA_ID int(11) NOT NULL auto_increment,
TM_ID int(11) NOT NULL,
MA_NUMERO_SERIE varchar(30),
MA_COMMENT varchar(60),
MA_LIEU_STOCKAGE varchar(60),
MA_MODELE varchar(40),
MA_ANNEE year(4),
MA_NB int(11) DEFAULT '1',
S_ID smallint(6) DEFAULT '0' NOT NULL,
VP_ID varchar(5) DEFAULT 'OP' NOT NULL,
MA_EXTERNE tinyint(4),
MA_INVENTAIRE varchar(40),
MA_UPDATE_DATE date,
MA_UPDATE_BY int(11),
AFFECTED_TO int(11),
MA_REV_DATE date,
V_ID int(11),
MA_PARENT int(11),
TV_ID int(11),
MA_ADDED datetime,
PRIMARY KEY (MA_ID),
KEY TM_ID (TM_ID),
KEY S_ID (S_ID),
KEY AFFECTED_TO (AFFECTED_TO),
KEY V_ID (V_ID),
KEY MA_PARENT (MA_PARENT),
KEY VP_ID (VP_ID)
);
# ------------------------------------
# data for table 'materiel'
# ------------------------------------

# ------------------------------------
# structure for table 'menu_condition'
# ------------------------------------
DROP TABLE IF EXISTS menu_condition ;
CREATE TABLE menu_condition (
MC_CODE varchar(10) NOT NULL,
MC_TYPE varchar(30) NOT NULL,
MC_VALUE smallint(6) NOT NULL,
   UNIQUE MC_CODE (MC_CODE, MC_TYPE, MC_VALUE),
KEY MI_CODE (MC_VALUE)
);
# ------------------------------------
# data for table 'menu_condition'
# ------------------------------------
INSERT INTO menu_condition (MC_CODE,MC_TYPE,MC_VALUE) VALUES
('ABSENCES','permission','11'),
('ABSENCES','permission','13'),
('ADDONS','permission','78'),
('ALERT','permission','43'),
('ASTREINTE','cron_allowed','1'),
('ASTREINTE','permission','52'),
('ASTREINTE','syndicate','0'),
('BACKUP','auto_backup','1'),
('BACKUP','permission','14'),
('BILANS','bilan','1'),
('BILANS','permission','27'),
('CHAT','chat','1'),
('CHAT','permission','51'),
('COMP','competences','1'),
('COMP','permission','56'),
('COMPANY','client','1'),
('COMPANY','permission','29'),
('CONF','permission','14'),
('CONSO','consommables','1'),
('CONSO','permission','42'),
('COTIS','cotisations','1'),
('COTIS','permission','53'),
('DOWNLOAD','permission','44'),
('DOWNLOAD','syndicate','0'),
('EVENT','evenements','1'),
('EVENT','permission','41'),
('GARDE','gardes','1'),
('GARDE','permission','61'),
('GARDEJOUR','gardes','1'),
('GARDEJOUR','permission','61'),
('GEOEVENT','carte','1'),
('GEOEVENT','permission','76'),
('GEOLOC','geolocalize_enabled','1'),
('GEOLOC','permission','76'),
('GRAPHIC','permission','27'),
('INFODIV','permission','44'),
('INTERN','permission','56'),
('LISTE','permission','52'),
('MAINCOUR','main_courante','1'),
('MAINCOUR','permission','52'),
('MAP','carte','1'),
('MAP','nbsections','0'),
('MAP','permission','27'),
('MASECTION','permission','44'),
('MAT','materiel','1'),
('MAT','permission','42'),
('MESSAGE','permission','43'),
('NOTES','notes','1'),
('NOTES','permission','77'),
('ORGANI','permission','52'),
('ORGANI','syndicate','0'),
('PARAM','permission','5'),
('PARAM','permission','18'),
('PERMISSION','permission','9'),
('PERMISSION','permission','25'),
('PHOTO','permission','44'),
('PHOTO','spgm','1'),
('QRCODE','assoc','1'),
('REMPLACE','permission','41'),
('REMPLACE','remplacements','1'),
('REPOCOTI','permission','53'),
('REPOCOTI','syndicate','1'),
('REPORTING2','permission','27'),
('SAIABSTBL','permission','11'),
('SAIABSTBL','repos','1'),
('SAISIEDISP','disponibilites','1'),
('SAISIEDISP','permission','38'),
('SEARCH','permission','56'),
('USER','permission','49'),
('VEHI','permission','42'),
('VEHI','vehicules','1');
# ------------------------------------
# structure for table 'menu_group'
# ------------------------------------
DROP TABLE IF EXISTS menu_group ;
CREATE TABLE menu_group (
MG_CODE varchar(10) NOT NULL,
MG_NAME varchar(50) NOT NULL,
MG_ICON varchar(20),
MG_ORDER int(11) NOT NULL,
MG_TITLE varchar(100),
MG_IS_LEFT tinyint(4),
PRIMARY KEY (MG_CODE)
);
# ------------------------------------
# data for table 'menu_group'
# ------------------------------------
INSERT INTO menu_group (MG_CODE,MG_NAME,MG_ICON,MG_ORDER,MG_TITLE,MG_IS_LEFT) VALUES
('ME','','user','12',NULL,NULL),
('PERSO','Personnel','user','1',NULL,'1'),
('PRES','Pr�sences','','3',NULL,'2'),
('VEH','Logistique','dot-circle','6',NULL,'1'),
('GAR','Garde','clipboard-list','3',NULL,'1'),
('INFO','','','11',NULL,'2'),
('SESSION','','comments','9','Messagerie','2'),
('ADMIN','Configuration','sun','15','','1'),
('HELP','','question-circle','11','Aide et informations sur l\'application','2'),
('PLA','Planning','calendar-check','4',NULL,'1'),
('ACT','Activit�','calendar-alt','2',NULL,'1'),
('MAT','Inventaire','hdd','6',NULL,'1'),
('CLI','Client','user-circle','5',NULL,'1'),
('DOC','Document','file','12',NULL,'1'),
('STAT','Statistique','chart-bar','10',NULL,'1'),
('ORGA','Organisation','building','14',NULL,'1'),
('COMM','Communication','envelope','13',NULL,'1'),
('ADDON','Module','puzzle-piece fa','15',NULL,'1');
# ------------------------------------
# structure for table 'menu_item'
# ------------------------------------
DROP TABLE IF EXISTS menu_item ;
CREATE TABLE menu_item (
MI_CODE varchar(10) NOT NULL,
MI_NAME varchar(50) NOT NULL,
MI_ICON varchar(20),
MG_CODE varchar(10) NOT NULL,
MI_ORDER int(11) NOT NULL,
MI_TITLE varchar(120) NOT NULL,
MI_URL varchar(120) NOT NULL,
PRIMARY KEY (MI_CODE),
KEY MG_CODE (MG_CODE)
);
# ------------------------------------
# data for table 'menu_item'
# ------------------------------------
INSERT INTO menu_item (MI_CODE,MI_NAME,MI_ICON,MG_CODE,MI_ORDER,MI_TITLE,MI_URL) VALUES
('MAFICHE','Ma fiche',NULL,'ME','1','','upd_personnel.php?page=1&self=1'),
('MASECTION',' Ma section',NULL,'ME','8','','upd_section.php'),
('SAISIEDISP','Disponibilit�s',NULL,'PLA','3','','dispo.php'),
('CALENDAR','Calendrier',NULL,'PLA','1','','calendar.php'),
('COMMU','Communaut�',NULL,'HELP','3','Voir la communaut� de l\'application','community.ebrigade.app'),
('PASSWD','Mot de passe',NULL,'ME','2','','change_password.php'),
('LOGOFF','D�connexion','power-off','ME','10','','deconnexion.php'),
('INTERN','Liste',NULL,'PERSO','1','','personnel.php?position=actif&category=INT'),
('COMP','Comp�tences',NULL,'PERSO','4','','qualifications.php?page=1&pompier=0&action_comp=default'),
('COTIS','Cotisations',NULL,'PERSO','5','','cotisations.php'),
('SEARCH','Recherche',NULL,'PERSO','9','','search_personnel.php'),
('ABSENCES','Absences',NULL,'PLA','4','','indispo_choice.php?tab=2&page=1'),
('GEOEVENT','G�olocalisation',NULL,'ACT','5','','gmaps_evenement.php'),
('VEHI','V�hicules',NULL,'VEH','1','','vehicule.php?page=1'),
('MAT','Mat�riels',NULL,'VEH','2','','materiel.php?page=1'),
('GARDE','Tableau Garde',NULL,'GAR','1','','tableau_garde.php'),
('GARDEJOUR','Garde du jour',NULL,'GAR','2','','feuille_garde.php?evenement=0&from=gardes'),
('EVENT','Liste',NULL,'ACT','1','','evenement_choice.php?ec_mode=default&page=1'),
('INFODIV','Actualit�s',NULL,'ACT','2','','message.php?catmessage=amicale'),
('ORGANI','Organigramme',NULL,'ORGA','2','','section.php'),
('ASTREINTE','Astreintes',NULL,'PLA','6','','astreintes.php'),
('MAINCOUR','Main Courante',NULL,'ACT','4','','evenement_choice.php?ec_mode=MC&page=1'),
('DOWNLOAD','Biblioth�que',NULL,'DOC','1','','documents.php?td=ALL&page=1&yeardoc=all&dossier=0'),
('GRAPHIC','Graphiques',NULL,'STAT','1','','repo_events.php'),
('MAP','Cartographie',NULL,'ORGA','6','','jvectormap.php'),
('REPORTING2','Reporting',NULL,'STAT','3','','export.php'),
('CHAT','Chat',NULL,'COMM','0','','chat.php'),
('PHOTO','Album photos','images','SESSION','2','Album photos','spgm/index.php'),
('MESSAGE','Message',NULL,'COMM','2','','mail_create.php'),
('ALERT','Alerte',NULL,'COMM','1','','alerte_create.php'),
('CONF','G�n�ral',NULL,'ADMIN','1','','configuration.php'),
('BACKUP','Sauvegarde',NULL,'ADMIN','5','','restore.php'),
('PARAM','Param�trage',NULL,'ADMIN','2','','parametrage.php'),
('PERMISSION','Habilitations',NULL,'ADMIN','3','','habilitations.php'),
('USER','Monitoring',NULL,'ADMIN','4','','history.php?lccode=U'),
('ABOUT','A propos',NULL,'HELP','1','A propos de cette application','about.php'),
('DOC','Aide et Documentation',NULL,'HELP','2','Documentation sur cette application','doc.php'),
('SAIABSTBL','Repos',NULL,'PLA','5','','repos_saisie.php'),
('COMPANY','Liste',NULL,'CLI','1','','company.php?page=1'),
('QRCODE','Mon QR-Code',NULL,'ME','7','','qrcode.php'),
('BILANS','Bilans annuels',NULL,'STAT','5','','bilans.php'),
('GEOLOC','Geolocalisation',NULL,'PERSO','9','','gps.php'),
('REMPLACE','Remplacements',NULL,'PLA','6','Voir les remplacements','remplacements.php'),
('CONSO','Consommables',NULL,'VEH','3','','consommable.php?page=1'),
('NOTES','Mes notes de frais',NULL,'ME','6','','upd_personnel.php?tab=9&from=menu&self=1'),
('MODULE','Modules',NULL,'SESSION','9','','https://ebrigade.app/V2/addons.php'),
('LISTE','Sections',NULL,'ORGA','1','','departement.php'),
('ADDONS','Liste',NULL,'ADDON','1','','addons.php'),
('REPOCOTI','Reporting Cotisations','receipt','INFO','24','Reporting Cotisations','report_cotisations.php'),
('PREFERENCE','Mes pr�f�rences',NULL,'ME','3','','personnel_preferences.php?tab=2');
# ------------------------------------
# structure for table 'message'
# ------------------------------------
DROP TABLE IF EXISTS message ;
CREATE TABLE message (
M_ID int(11) NOT NULL,
S_ID smallint(6) DEFAULT '0' NOT NULL,
M_DATE datetime NOT NULL,
P_ID int(11) DEFAULT '0' NOT NULL,
M_TEXTE varchar(2000),
M_OBJET varchar(50) NOT NULL,
M_DUREE smallint(6),
M_TYPE varchar(10) DEFAULT 'consigne' NOT NULL,
M_FILE varchar(200),
TM_ID tinyint(4) DEFAULT '0' NOT NULL,
PRIMARY KEY (M_ID),
KEY M_DATE (M_DATE),
KEY P_ID (P_ID),
KEY S_ID (S_ID),
KEY M_TYPE (M_TYPE),
KEY TM_ID (TM_ID)
);

# ------------------------------------
# structure for table 'migration_bic'
# ------------------------------------
DROP TABLE IF EXISTS migration_bic ;
CREATE TABLE migration_bic (
ETABLISSEMENT varchar(5) NOT NULL,
NOM varchar(150) NOT NULL,
BIC varchar(11) NOT NULL,
PRIMARY KEY (ETABLISSEMENT),
KEY BIC (BIC)
);
# ------------------------------------
# data for table 'migration_bic'
# ------------------------------------
INSERT INTO migration_bic (ETABLISSEMENT,NOM,BIC) VALUES
('10011','LA BANQUE POSTALE','PSSTFRPPXXX'),
('10057','Soci�t� bordelaise de cr�dit industriel et commercial � Soci�t� bordelaise de C.I.C.','CMCIFRPPXXX'),
('10096','CIC Lyonnaise de banque','CMCIFRPPXXX'),
('10107','BRED � Banque populaire','BREDFRPPXXX'),
('10178','Banque Chaix','CHAIFR2AXXX'),
('10206','Caisse r�gionale de cr�dit agricole mutuel du Nord Est','AGRIFRPPXXX'),
('10207','Banque populaire Rives de Paris','CCBPFRPPMTG'),
('10228','Banque Laydernier','LAYDFR2WXXX'),
('10268','Banque Courtois � successeurs de l�ancienne maison Courtois et Cie depuis 1760','COURFR2TXXX'),
('10278','Caisse f�d�rale de cr�dit mutuel','CEPAFRPP831'),
('10468','Banque Rh�ne-Alpes � Groupe Cr�dit du Nord','RALPFR2GXXX'),
('10558','Banque Tarneaud','TARNFR2LXXX'),
('10807','Banque populaire Bourgogne Franche-Comt�','CCBPFRPPDJN'),
('10907','Banque populaire du Sud-Ouest','CCBPFRPPBDX'),
('11006','Caisse r�gionale de cr�dit agricole mutuel de Champagne-Bourgogne','AGRIFRPPXXX'),
('11206','Caisse r�gionale de cr�dit agricole mutuel Nord Midi-Pyr�n�es','AGRIFRPPXXX'),
('11306','Caisse r�gionale de cr�dit agricole mutuel d�Alpes-Provence','AGRIFRPPXXX'),
('11315','Caisse d��pargne et de pr�voyance Provence-Alpes-Corse','CEPAFRPP131'),
('11425','Caisse d��pargne et de pr�voyance Normandie','CEPAFRPP142'),
('11706','Caisse r�gionale de cr�dit agricole mutuel Charente-Maritime Deux-S�vres','AGRIFRPPXXX'),
('11907','Banque populaire du Massif central','CCBPFRPPCFD'),
('12006','Caisse r�gionale de cr�dit agricole mutuel de la Corse','AGRIFRPPXXX'),
('12135','Caisse d��pargne et de pr�voyance de Bourgogne Franche-Comt�','CEPAFRPP213'),
('12169','Banque de la R�union','REUBRERXXXX'),
('12206','Caisse r�gionale de cr�dit agricole mutuel des C�tes-d�Armor','AGRIFRPPXXX'),
('12406','Caisse r�gionale de cr�dit agricole mutuel Charente-P�rigord (Cr�dit agricole Charente-P�rigord)','AGRIFRPPXXX'),
('12506','Caisse r�gionale de cr�dit agricole mutuel de Franche-Comt�','AGRIFRPPXXX'),
('12548','Axa banque','AXABFRPPXXX'),
('12906','Caisse r�gionale de cr�dit agricole mutuel du Finist�re','AGRIFRPPXXX'),
('12939','Banque Dupuy de Parseval','BDUPFR2SXXX'),
('13106','Caisse r�gionale de cr�dit agricole mutuel Toulouse 31','AGRIFRPPXXX'),
('13135','Caisse d��pargne et de pr�voyance de Midi-Pyr�n�es','CEPAFRPP313'),
('13259','Banque Kolb','KOLBFR21XXX'),
('13306','Caisse r�gionale de cr�dit agricole mutuel d�Aquitaine','AGRIFRPPXXX'),
('13335','Caisse d��pargne et de pr�voyance Aquitaine Poitou-Charentes','CEPAFRPP864'),
('13485','Caisse d��pargne et de pr�voyance du Languedoc Roussillon','CEPAFRPP348'),
('13506','Caisse r�gionale de cr�dit agricole mutuel du Languedoc','AGRIFRPP835'),
('13507','Banque populaire du Nord','CCBPFRPPLIL'),
('13606','Caisse r�gionale de cr�dit agricole mutuel d�Ille-et-Vilaine','AGRIFRPPXXX'),
('13825','Caisse d��pargne et de pr�voyance de Rh�ne Alpes','CEPAFRPP382'),
('13906','Caisse r�gionale de cr�dit agricole mutuel Sud Rh�ne-Alpes','AGRIFRPPXXX'),
('13907','Banque populaire Loire et Lyonnais','CCBPFRPPLYO'),
('14265','Caisse d��pargne et de pr�voyance Loire Dr�me Ard�che','CEPAFRPP426'),
('14406','Caisse r�gionale de cr�dit agricole mutuel Val de France','AGRIFRPPXXX'),
('14445','Caisse d��pargne et de pr�voyance Bretagne-Pays de Loire','CEPAFRPP444'),
('14505','Caisse d��pargne et de pr�voyance Loire-Centre','CEPAFRPP450'),
('14506','Caisse r�gionale de cr�dit agricole mutuel Loire � Haute-Loire','AGRIFRPPXXX'),
('14518','Fortuneo','FTNOFRP1XXX'),
('14559','ING Direct N.V','IIDFFR21XXX'),
('14607','Banque populaire proven�ale et Corse','CCBPFRPPMAR'),
('14706','Caisse r�gionale de cr�dit agricole mutuel Atlantique Vend�e','AGRIFRPPXXX'),
('14707','Banque populaire Lorraine Champagne','CCBPFRPPMTZ'),
('14806','Caisse r�gionale de cr�dit agricole mutuel Centre Loire','AGRIFRPPXXX'),
('15135','Caisse d��pargne et de pr�voyance de Lorraine Champagne-Ardenne','CEPAFRPP513'),
('15489','Caisse f�d�rale du cr�dit mutuel de Maine-Anjou et Basse-Normandie','CMCIFRPAXXX'),
('15519','Caisse f�d�rale du cr�dit mutuel Oc�an','CMCIFRPAXXX'),
('15589','Cr�dit mutuel Ark�a','CMBRFR2BXXX'),
('15607','Banque populaire C�te d�Azur','CCBPFRPPNCE'),
('15629','Caisse f�d�rale du cr�dit mutuel Nord Europe','CMCIFRPAXXX'),
('16006','Caisse r�gionale de cr�dit agricole mutuel du Morbihan','AGRIFRPPXXX'),
('16106','Caisse r�gionale de cr�dit agricole mutuel de Lorraine','AGRIFRPPXXX'),
('16275','Caisse d��pargne et de pr�voyance Nord France Europe','CEPAFRPP627'),
('16606','Caisse r�gionale de cr�dit agricole mutuel de Normandie','AGRIFRPPXXX'),
('16607','Banque populaire du Sud','CCBPFRPPPPG'),
('16705','Caisse d��pargne et de pr�voyance d�Alsace','CEPAFRPP670'),
('16706','Caisse r�gionale de cr�dit agricole mutuel Nord de France','AGRIFRPPXXX'),
('16707','Banque populaire de l�Ouest','CCBPFRPPREN'),
('16806','Caisse r�gionale de cr�dit agricole mutuel de Centre France � Cr�dit agricole Centre France (3�me du nom)','AGRIFRPPXXX'),
('16807','Banque populaire des Alpes','CCBPFRPPGRE'),
('16906','Caisse r�gionale de cr�dit agricole mutuel Pyr�n�es-Gascogne','AGRIFRPPXXX'),
('17106','Caisse r�gionale de cr�dit agricole mutuel Sud-M�diterran�e (Ari�ge et Pyr�n�es-Orientales)','AGRIFRPPXXX'),
('17150','Caisse de cr�dit municipal de Toulon','CCUTFR21XXX'),
('17179','Caisse r�gionale de cr�dit maritime mutuel de la M�diterran�e','CMCIFRPAXXX'),
('17206','Caisse r�gionale de cr�dit agricole mutuel Alsace Vosges','AGRIFRPPXXX'),
('17510','Cr�atis','CRTAFR21XXX'),
('17515','Caisse d��pargne et de pr�voyance Ile-de-France','CEPAFRPP751'),
('17607','Banque populaire d�Alsace','CCBPFRPPSTR'),
('17806','Caisse r�gionale de cr�dit agricole mutuel Centre-Est','AGRIFRPPXXX'),
('17807','Banque populaire Occitane','CCBPFRPPTLS'),
('17906','Caisse r�gionale de cr�dit agricole mutuel de l�Anjou et du Maine','AGRIFRPPXXX'),
('18025','Caisse d��pargne et de pr�voyance de Picardie','CEPAFRPP802'),
('18106','Caisse r�gionale de cr�dit agricole mutuel des Savoie � Cr�dit agricole des Savoie','AGRIFRPPXXX'),
('18206','Caisse r�gionale de cr�dit agricole mutuel de Paris et d�Ile-de-France','AGRIFRPPXXX'),
('18306','Caisse r�gionale de cr�dit agricole mutuel Normandie-Seine','AGRIFRPPXXX'),
('18315','Caisse d��pargne et de pr�voyance C�te d�Azur','CEPAFRPP831'),
('18370','Groupama banque (2�me du nom)','GPBAFRPPXXX'),
('18706','Caisse r�gionale de cr�dit agricole mutuel Brie Picardie','AGRIFRPP887'),
('18707','Banque populaire Val de France (2�me du nom)','CCBPFRPPVER'),
('18715','Caisse d��pargne et de pr�voyance d�Auvergne et du Limousin','CEPAFRPP871'),
('18719','Banque fran�aise commerciale Oc�an Indien � B.F.C. Oc�an Indien','BFCOFRPPXXX'),
('18950','Caisse de cr�dit municipal d�Avignon','CSCAFR21XXX'),
('19106','Caisse r�gionale de cr�dit agricole mutuel Provence-C�te d�Azur','AGRIFRPP891'),
('19406','Caisse r�gionale de cr�dit agricole mutuel de la Touraine et du Poitou','AGRIFRPPXXX'),
('19506','Caisse r�gionale de cr�dit agricole mutuel du Centre Ouest','AGRIFRPPXXX'),
('19906','Caisse r�gionale de cr�dit agricole mutuel de la R�union','AGRIFRPPXXX'),
('20041','La Banque Postale','PSSTFRPPXXX'),
('28570','Caisse de cr�dit municipal de Dijon','CMDIFR21XXX'),
('30002','Cr�dit lyonnais','CRLYFRPPXXX'),
('30003','Soci�t� g�n�rale','SOGEFRPPXXX'),
('30004','BNP Paribas','BNPAFRPPXXX'),
('30027','Banque CIC Nord Ouest','CMCIFRPPXXX'),
('30047','Banque CIC Ouest','CMCIFRPPXXX'),
('30056','HSBC France','CCFRFRPPXXX'),
('30066','Cr�dit industriel et commercial � CIC','CMCIFRPPXXX'),
('30076','Cr�dit du Nord','NORDFRPPXXX'),
('30077','Soci�t� marseillaise de cr�dit','SMCTFR2AXXX'),
('30087','Banque CIC Est','CMCIFRPPXXX'),
('40618','Boursorama','BOUSFRPPXXX'),
('40978','Banque Palatine','BSPFFRPPXXX'),
('42559','Cr�dit coop�ratif','CCOPFRPPXXX'),
('44319','Banque priv�e europ�enne','PREUFRP1XXX'),
('30588','BARCLAYS BANK','BARCFRPPXXX'),
('13807','BANQUE POPULAIRE ATLANTIQUE','CCBPFRPPNAN'),
('16560','CREDIT MUNICIPAL','CCMOFR21XXX'),
('30438','ING DIRECT','INGBFRPPXXX');
# ------------------------------------
# structure for table 'module'
# ------------------------------------
DROP TABLE IF EXISTS module ;
CREATE TABLE module (
MODULE varchar(50) NOT NULL,
LIBELLE varchar(100) NOT NULL,
VERSION float NOT NULL,
DESCRIPTION varchar(500) NOT NULL,
PRIMARY KEY (MODULE)
);
# ------------------------------------
# data for table 'module'
# ------------------------------------

# ------------------------------------
# structure for table 'note_de_frais'
# ------------------------------------
DROP TABLE IF EXISTS note_de_frais ;
CREATE TABLE note_de_frais (
NF_ID int(11) NOT NULL auto_increment,
NF_CODE1 smallint(4),
NF_CODE2 tinyint(2),
NF_CODE3 int(11),
NF_CREATE_DATE datetime NOT NULL,
NF_CREATE_BY int(11) NOT NULL,
P_ID int(11) NOT NULL,
S_ID int(11) DEFAULT '0' NOT NULL,
E_CODE int(11),
NF_NATIONAL tinyint(4) DEFAULT '0' NOT NULL,
NF_DEPARTEMENTAL tinyint(4) DEFAULT '0' NOT NULL,
TOTAL_AMOUNT float NOT NULL,
FS_CODE varchar(5) NOT NULL,
TM_CODE varchar(5) NOT NULL,
NF_STATUT_DATE datetime,
NF_STATUT_BY int(11),
NF_VALIDATED_DATE datetime,
NF_VALIDATED_BY int(11),
NF_VALIDATED2_DATE datetime,
NF_VALIDATED2_BY int(11),
NF_REMBOURSE_DATE datetime,
NF_REMBOURSE_BY int(11),
COMMENT varchar(255),
NF_DON tinyint(4) DEFAULT '0' NOT NULL,
NF_FRAIS_DEP tinyint(4) DEFAULT '0' NOT NULL,
NF_JUSTIF_RECUS tinyint(4) DEFAULT '0' NOT NULL,
NF_VERIFIED tinyint(4) DEFAULT '0' NOT NULL,
NF_VERIFIED_BY int(11),
NF_VERIFIED_DATE datetime,
PRIMARY KEY (NF_ID),
KEY P_ID (P_ID),
KEY FS_CODE (FS_CODE),
KEY NF_CREATE_DATE (NF_CREATE_DATE),
KEY E_CODE (E_CODE),
KEY NF_DEPARTEMENTAL (NF_DEPARTEMENTAL),
KEY NF_DON (NF_DON),
KEY S_ID (S_ID)
);
# ------------------------------------
# data for table 'note_de_frais'
# ------------------------------------

# ------------------------------------
# structure for table 'note_de_frais_detail'
# ------------------------------------
DROP TABLE IF EXISTS note_de_frais_detail ;
CREATE TABLE note_de_frais_detail (
NFD_ID int(11) NOT NULL auto_increment,
NF_ID int(11) NOT NULL,
QUANTITE smallint(6),
AMOUNT float NOT NULL,
LIEU varchar(100) NOT NULL,
NFD_DATE_FRAIS date,
TF_CODE varchar(5) NOT NULL,
NFD_DESCRIPTION varchar(200) NOT NULL,
NFD_ORDER tinyint(4) DEFAULT '1',
PRIMARY KEY (NFD_ID),
KEY NF_ID (NF_ID),
KEY TF_CODE (TF_CODE)
);
# ------------------------------------
# data for table 'note_de_frais_detail'
# ------------------------------------

# ------------------------------------
# structure for table 'note_de_frais_type_frais'
# ------------------------------------
DROP TABLE IF EXISTS note_de_frais_type_frais ;
CREATE TABLE note_de_frais_type_frais (
TF_CODE varchar(5) NOT NULL,
TF_DESCRIPTION varchar(40) NOT NULL,
TF_CATEGORIE varchar(30) NOT NULL,
TF_PRIX_UNITAIRE float,
TF_UNITE varchar(6),
TF_COMMENT varchar(300),
PRIMARY KEY (TF_CODE)
);
# ------------------------------------
# data for table 'note_de_frais_type_frais'
# ------------------------------------
INSERT INTO note_de_frais_type_frais (TF_CODE,TF_DESCRIPTION,TF_CATEGORIE,TF_PRIX_UNITAIRE,TF_UNITE,TF_COMMENT) VALUES
('ACHAT','Achat divers','Divers',NULL,NULL,NULL),
('AUTRE','Autres types de frais','Divers',NULL,NULL,NULL),
('AVION','Billets d\'avion','D�placement',NULL,NULL,NULL),
('DEP','Autres Frais de d�placement','D�placement',NULL,NULL,NULL),
('HOTEL','Frais d\'h�tel','H�bergement',NULL,NULL,NULL),
('KM','Frais kilom�triques','D�placement','0.32','km',NULL),
('LOCA','Location de v�hicule','D�placement',NULL,NULL,NULL),
('METRO','M�tro','D�placement',NULL,NULL,NULL),
('PARK','Frais de parking','D�placement',NULL,NULL,NULL),
('PEAGE','Frais de p�age','D�placement',NULL,NULL,NULL),
('REPAS','Frais de repas','H�bergement',NULL,NULL,NULL),
('SNCF','Billets de train','D�placement',NULL,NULL,NULL),
('KM2','Frais kilom�triques (prix libre)','D�placement',NULL,NULL,NULL);
# ------------------------------------
# structure for table 'note_de_frais_type_motif'
# ------------------------------------
DROP TABLE IF EXISTS note_de_frais_type_motif ;
CREATE TABLE note_de_frais_type_motif (
TM_CODE varchar(5) NOT NULL,
TM_DESCRIPTION varchar(50) NOT NULL,
TM_SYNDICATE tinyint(4) DEFAULT '0' NOT NULL,
MOTIF_LEVEL varchar(1),
PRIMARY KEY (TM_CODE),
KEY TM_SYNDICATE (TM_SYNDICATE)
);
# ------------------------------------
# data for table 'note_de_frais_type_motif'
# ------------------------------------
INSERT INTO note_de_frais_type_motif (TM_CODE,TM_DESCRIPTION,TM_SYNDICATE,MOTIF_LEVEL) VALUES
('AUT','Autre','0',NULL),
('DG','Direction g�n�rale','0',NULL),
('FE','Formation entreprises','0',NULL),
('FG','Formation g�n�rale','0',NULL),
('OP','Op�rationnel','0',NULL),
('FOS','Formation Syndicale','1','A'),
('S04','Congr�s F�d�ral','1','A'),
('GTS','Gestion Tr�sorerie','1','A'),
('MLAS','Mission Logistique et Administrative','1','A'),
('MA','Manifestations','1','A'),
('ELE','Elections','1','A'),
('ND','Non D�fini','1','A'),
('S03','Assembl�e G�n�rale ','1','A'),
('S05','Bureau D�partemental','1','D'),
('S15','R�union Instance','1','D'),
('S24','R�union Information','1','D'),
('S08','D�placement Pr�sident','1','D'),
('S23','Assembl�e G�n�rale d�partement','1','D'),
('S01','Bureau National','1','N'),
('S02','Bureau Ex�cutif','1','N'),
('S06','R�unions Diverses','1','N'),
('S07','D�placement Pr�sident F�d�ral','1','N'),
('S09','Gestion Si�ge','1','N'),
('GJS','Gestion Juridique','1','N'),
('S13','R�union Info pour les D�partements','1','N'),
('S14','R�union Minist�re','1','N'),
('S20','R�union S�nat','1','N'),
('INFS','Information syndicale','1','A'),
('REUT','R�union de travail','1','D'),
('REUD','R�union technique dossiers','1','D'),
('CORE','Commission de r�forme','1','D'),
('COAS','Commission action sociale','1','D'),
('COAD','Commission adhoc','1','D'),
('RENPF','Rencontre Pr�fet','1','D'),
('REASN','R�union Assembl�e Nationale','1','N'),
('RESET','R�union services de l\'Etat','1','N'),
('REVC','R�viseurs aux comptes','1','N');
# ------------------------------------
# structure for table 'note_de_frais_type_statut'
# ------------------------------------
DROP TABLE IF EXISTS note_de_frais_type_statut ;
CREATE TABLE note_de_frais_type_statut (
FS_CODE varchar(5) NOT NULL,
FS_DESCRIPTION varchar(30) NOT NULL,
FS_CLASS varchar(20) NOT NULL,
FS_ORDER tinyint(4) NOT NULL,
PRIMARY KEY (FS_CODE)
);
# ------------------------------------
# data for table 'note_de_frais_type_statut'
# ------------------------------------
INSERT INTO note_de_frais_type_statut (FS_CODE,FS_DESCRIPTION,FS_CLASS,FS_ORDER) VALUES
('ANN','Annul�e','black12','1'),
('ATTV','En attente','orange12','2'),
('REJ','Rejet�e','red12','3'),
('REMB','Rembours�e','purple12','7'),
('VAL','Valid�e','green12','4'),
('CRE','En cours','blue12','0'),
('VAL2','Valid�e deux fois','darkcyan12','6'),
('VAL1','Valid�e','green12','5');
# ------------------------------------
# structure for table 'notification_block'
# ------------------------------------
DROP TABLE IF EXISTS notification_block ;
CREATE TABLE notification_block (
P_ID int(6) NOT NULL,
F_ID int(6) NOT NULL,
PRIMARY KEY (P_ID, F_ID)
);
# ------------------------------------
# data for table 'notification_block'
# ------------------------------------

# ------------------------------------
# structure for table 'pays'
# ------------------------------------
DROP TABLE IF EXISTS pays ;
CREATE TABLE pays (
ID smallint(6) NOT NULL,
NAME varchar(50) NOT NULL,
PRIMARY KEY (ID)
);
# ------------------------------------
# data for table 'pays'
# ------------------------------------
INSERT INTO pays (ID,NAME) VALUES
('1','Afghanistan'),
('2','Afrique du Sud'),
('3','Albanie'),
('4','Alg�rie'),
('5','Allemagne'),
('6','Andorre'),
('7','Angola'),
('8','Antigua-et-Barbuda'),
('9','Arabie saoudite'),
('10','Argentine'),
('11','Arm�nie'),
('12','Australie'),
('13','Autriche'),
('14','Azerba�djan'),
('15','Bahamas'),
('16','Bahre�n'),
('17','Bangladesh'),
('18','Barbade'),
('19','Belau'),
('20','Belgique'),
('21','Belize'),
('22','B�nin'),
('23','Bhoutan'),
('24','Bi�lorussie'),
('25','Birmanie'),
('26','Bolivie'),
('27','Bosnie-Herz�govine'),
('28','Botswana'),
('29','Br�sil'),
('30','Brunei'),
('31','Bulgarie'),
('32','Burkina'),
('33','Burundi'),
('34','Cambodge'),
('35','Cameroun'),
('36','Canada'),
('37','Cap-Vert'),
('38','Chili'),
('39','Chine'),
('40','Chypre'),
('41','Colombie'),
('42','Comores'),
('43','Congo'),
('44','Congo'),
('45','Cook'),
('46','Cor�e du Nord'),
('47','Cor�e du Sud'),
('48','Costa Rica'),
('49','C�te d\'Ivoire'),
('50','Croatie'),
('51','Cuba'),
('52','Danemark'),
('53','Djibouti'),
('54','Dominique'),
('55','�gypte'),
('56','�mirats arabes unis'),
('57','�quateur'),
('58','�rythr�e'),
('59','Espagne'),
('60','Estonie'),
('61','�tats-Unis'),
('62','�thiopie'),
('63','Fidji'),
('64','Finlande'),
('65','France'),
('66','Gabon'),
('67','Gambie'),
('68','G�orgie'),
('69','Ghana'),
('70','Gr�ce'),
('71','Grenade'),
('72','Guatemala'),
('73','Guin�e'),
('74','Guin�e-Bissao'),
('75','Guin�e �quatoriale'),
('76','Guyana'),
('77','Ha�ti'),
('78','Honduras'),
('79','Hongrie'),
('80','Inde'),
('81','Indon�sie'),
('82','Iran'),
('83','Iraq'),
('84','Irlande'),
('85','Islande'),
('86','Isra�l'),
('87','Italie'),
('88','Jama�que'),
('89','Japon'),
('90','Jordanie'),
('91','Kazakhstan'),
('92','Kenya'),
('93','Kirghizistan'),
('94','Kiribati'),
('95','Kowe�t'),
('96','Laos'),
('97','Lesotho'),
('98','Lettonie'),
('99','Liban'),
('100','Liberia'),
('101','Libye'),
('102','Liechtenstein'),
('103','Lituanie'),
('104','Luxembourg'),
('105','Mac�doine'),
('106','Madagascar'),
('107','Malaisie'),
('108','Malawi'),
('109','Maldives'),
('110','Mali'),
('111','Malte'),
('112','Maroc'),
('113','Marshall'),
('114','Maurice'),
('115','Mauritanie'),
('116','Mexique'),
('117','Micron�sie'),
('118','Moldavie'),
('119','Monaco'),
('120','Mongolie'),
('121','Mozambique'),
('122','Namibie'),
('123','Nauru'),
('124','N�pal'),
('125','Nicaragua'),
('126','Niger'),
('127','Nigeria'),
('128','Niue'),
('129','Norv�ge'),
('130','Nouvelle-Z�lande'),
('131','Oman'),
('132','Ouganda'),
('133','Ouzb�kistan'),
('134','Pakistan'),
('135','Panama'),
('136','Papouasie - Nouvelle Guin�e'),
('137','Paraguay'),
('138','Pays-Bas'),
('139','P�rou'),
('140','Philippines'),
('141','Pologne'),
('142','Portugal'),
('143','Qatar'),
('144','R�publique centrafricaine'),
('145','R�publique dominicaine'),
('146','R�publique tch�que'),
('147','Roumanie'),
('148','Royaume-Uni'),
('149','Russie'),
('150','Rwanda'),
('151','Saint-Christophe-et-Ni�v�s'),
('152','Sainte-Lucie'),
('153','Saint-Marin'),
('154','Saint-Si�ge'),
('155','Saint-Vincent-et-les Grenadine'),
('156','Salomon'),
('157','Salvador'),
('158','Samoa occidentales'),
('159','Sao Tom�-et-Principe'),
('160','S�n�gal'),
('161','Seychelles'),
('162','Sierra Leone'),
('163','Singapour'),
('164','Slovaquie'),
('165','Slov�nie'),
('166','Somalie'),
('167','Soudan'),
('168','Sri Lanka'),
('169','Su�de'),
('170','Suisse'),
('171','Suriname'),
('172','Swaziland'),
('173','Syrie'),
('174','Tadjikistan'),
('175','Tanzanie'),
('176','Tchad'),
('177','Tha�lande'),
('178','Togo'),
('179','Tonga'),
('180','Trinit�-et-Tobago'),
('181','Tunisie'),
('182','Turkm�nistan'),
('183','Turquie'),
('184','Tuvalu'),
('185','Ukraine'),
('186','Uruguay'),
('187','Vanuatu'),
('188','Venezuela'),
('189','Vi�t Nam'),
('190','Y�men'),
('191','Yougoslavie'),
('192','Za�re'),
('193','Zambie'),
('194','Zimbabwe');
# ------------------------------------
# structure for table 'periode'
# ------------------------------------
DROP TABLE IF EXISTS periode ;
CREATE TABLE periode (
P_CODE varchar(4) NOT NULL,
P_DESCRIPTION varchar(30) NOT NULL,
P_ORDER tinyint(4) DEFAULT '1' NOT NULL,
P_DATE varchar(7),
P_FRACTION smallint(6) NOT NULL,
PRIMARY KEY (P_CODE)
);
# ------------------------------------
# data for table 'periode'
# ------------------------------------
INSERT INTO periode (P_CODE,P_DESCRIPTION,P_ORDER,P_DATE,P_FRACTION) VALUES
('A','ann�e compl�te','1',NULL,'1'),
('APR','avril','11','04','12'),
('AUG','ao�t','15','08','12'),
('DEC','d�cembre','19','12','12'),
('FEV','f�vrier','9','02','12'),
('JAN','janvier','8','01','12'),
('JUL','juillet','14','07','12'),
('JUN','juin','13','06','12'),
('MAI','mai','12','05','12'),
('MAR','mars','10','03','12'),
('NOV','novembre','18','11','12'),
('OCT','octobre','17','10','12'),
('S1','premier semestre','2',NULL,'2'),
('S2','deuxi�me semestre','3',NULL,'2'),
('SEP','septembre','16','09','12'),
('T1','premier trimestre','4',NULL,'4'),
('T2','deuxi�me trimestre','5',NULL,'4'),
('T3','troisi�me trimestre','6',NULL,'4'),
('T4','quatri�me trimestre','7',NULL,'4'),
('COMP','Compl�ment','30',NULL,'1');
# ------------------------------------
# structure for table 'personnel_contact'
# ------------------------------------
DROP TABLE IF EXISTS personnel_contact ;
CREATE TABLE personnel_contact (
P_ID int(11) NOT NULL,
CT_ID tinyint(4) NOT NULL,
CONTACT_VALUE varchar(60) NOT NULL,
CONTACT_DATE datetime NOT NULL,
PRIMARY KEY (P_ID, CT_ID)
);
# ------------------------------------
# data for table 'personnel_contact'
# ------------------------------------

# ------------------------------------
# structure for table 'personnel_cotisation'
# ------------------------------------
DROP TABLE IF EXISTS personnel_cotisation ;
CREATE TABLE personnel_cotisation (
PC_ID int(11) NOT NULL auto_increment,
P_ID int(11) NOT NULL,
ANNEE year(4) NOT NULL,
PERIODE_CODE varchar(4),
PC_DATE date NOT NULL,
MONTANT float NOT NULL,
TP_ID tinyint(1) DEFAULT '0' NOT NULL,
REMBOURSEMENT tinyint(1) DEFAULT '0' NOT NULL,
COMMENTAIRE varchar(100),
NUM_CHEQUE varchar(50),
ETABLISSEMENT varchar(5),
GUICHET varchar(5),
COMPTE varchar(11),
CODE_BANQUE varchar(30),
COMPTE_DEBITE int(11),
IBAN varchar(34),
BIC varchar(11),
PRIMARY KEY (PC_ID),
KEY NUM_CHEQUE (NUM_CHEQUE),
KEY ANNEE (ANNEE, PERIODE_CODE),
KEY TP_ID (TP_ID),
KEY P_ID (P_ID, ANNEE, PERIODE_CODE),
KEY REMBOURSEMENT (REMBOURSEMENT),
KEY COMPTE_DEBITE (COMPTE_DEBITE),
KEY PC_DATE (PC_DATE)
);
# ------------------------------------
# data for table 'personnel_cotisation'
# ------------------------------------

# ------------------------------------
# structure for table 'personnel_formation'
# ------------------------------------
DROP TABLE IF EXISTS personnel_formation ;
CREATE TABLE personnel_formation (
PF_ID int(11) NOT NULL auto_increment,
P_ID int(11) NOT NULL,
PS_ID smallint(6) NOT NULL,
TF_CODE varchar(1) NOT NULL,
PF_DIPLOME varchar(25),
PF_COMMENT varchar(100),
PF_ADMIS tinyint(4) DEFAULT '1' NOT NULL,
PF_DATE date,
PF_RESPONSABLE varchar(60),
PF_LIEU varchar(40),
E_CODE int(11),
PF_UPDATE_BY int(11),
PF_UPDATE_DATE datetime,
PF_PRINT_BY int(11),
PF_PRINT_DATE datetime,
PF_EXPIRATION date,
PRIMARY KEY (PF_ID),
KEY P_ID (P_ID, PS_ID),
KEY E_CODE (E_CODE)
);
# ------------------------------------
# data for table 'personnel_formation'
# ------------------------------------

# ------------------------------------
# structure for table 'personnel_preferences'
# ------------------------------------
DROP TABLE IF EXISTS personnel_preferences ;
CREATE TABLE personnel_preferences (
ID_AUTO int(11) NOT NULL auto_increment,
PP_ID int(11) NOT NULL,
P_ID int(11) NOT NULL,
PP_VALUE varchar(30) NOT NULL,
PP_DATE datetime,
PRIMARY KEY (ID_AUTO),
KEY P_ID (P_ID)
);
# ------------------------------------
# data for table 'personnel_preferences'
# ------------------------------------

# ------------------------------------
# structure for table 'planning_garde_status'
# ------------------------------------
DROP TABLE IF EXISTS planning_garde_status ;
CREATE TABLE planning_garde_status (
S_ID smallint(6) DEFAULT '2' NOT NULL,
PGS_YEAR smallint(6) DEFAULT '0' NOT NULL,
PGS_MONTH tinyint(4) DEFAULT '0' NOT NULL,
EQ_ID tinyint(4) DEFAULT '1' NOT NULL,
PGS_STATUS varchar(5) NOT NULL,
PRIMARY KEY (S_ID, PGS_YEAR, PGS_MONTH, EQ_ID)
);
# ------------------------------------
# data for table 'planning_garde_status'
# ------------------------------------

# ------------------------------------
# structure for table 'pompier'
# ------------------------------------
DROP TABLE IF EXISTS pompier ;
CREATE TABLE pompier (
P_ID int(11) NOT NULL auto_increment,
P_CODE varchar(20) NOT NULL,
P_PRENOM varchar(25) NOT NULL,
P_PRENOM2 varchar(25),
P_NOM varchar(30) NOT NULL,
P_NOM_NAISSANCE varchar(30),
P_SEXE varchar(1) DEFAULT 'M' NOT NULL,
P_CIVILITE tinyint(1) DEFAULT '1' NOT NULL,
P_OLD_MEMBER tinyint(1) DEFAULT '0' NOT NULL,
P_GRADE varchar(6) NOT NULL,
P_PROFESSION varchar(6) DEFAULT 'SPP' NOT NULL,
P_STATUT varchar(5) DEFAULT 'SPV' NOT NULL,
P_REGIME varchar(5),
P_MDP varchar(255) NOT NULL,
P_PASSWORD_FAILURE tinyint(4),
P_MDP_EXPIRY date,
P_DATE_ENGAGEMENT date,
P_FIN date,
P_SECTION smallint(6),
C_ID int(11) DEFAULT '0' NOT NULL,
GP_ID smallint(6) DEFAULT '0' NOT NULL,
GP_ID2 smallint(6) DEFAULT '0' NOT NULL,
P_BIRTHDATE date,
P_BIRTHPLACE varchar(40),
P_BIRTH_DEP varchar(3),
P_EMAIL varchar(60),
P_HORAIRE smallint(6),
P_PHONE varchar(20),
P_PHONE2 varchar(20),
P_ABBREGE varchar(5),
P_ADDRESS varchar(150),
P_ZIP_CODE varchar(6),
P_CITY varchar(30),
P_RELATION_PRENOM varchar(20),
P_RELATION_NOM varchar(30),
P_RELATION_PHONE varchar(20),
P_RELATION_MAIL varchar(60),
P_HIDE tinyint(4) DEFAULT '1' NOT NULL,
P_PHOTO varchar(50),
P_LAST_CONNECT datetime,
P_NB_CONNECT int(11) DEFAULT '0' NOT NULL,
GP_FLAG1 tinyint(4) DEFAULT '0' NOT NULL,
GP_FLAG2 tinyint(4) DEFAULT '0' NOT NULL,
TS_CODE varchar(5),
TS_HEURES float,
TS_JOURS_CP_PAR_AN float,
TS_HEURES_PAR_AN float,
TS_HEURES_A_RECUPERER float,
TS_RELIQUAT_CP float,
TS_RELIQUAT_RTT float,
P_NOSPAM tinyint(4) DEFAULT '0' NOT NULL,
P_CREATE_DATE date,
SERVICE varchar(60),
TP_ID tinyint(1) DEFAULT '0' NOT NULL,
MOTIF_RADIATION varchar(100),
NPAI tinyint(1) DEFAULT '0' NOT NULL,
DATE_NPAI date,
OBSERVATION varchar(255),
SUSPENDU tinyint(1) DEFAULT '0' NOT NULL,
DATE_SUSPENDU date,
DATE_FIN_SUSPENDU date,
MONTANT_REGUL float DEFAULT '0',
P_CALENDAR varchar(100),
P_ACCEPT_DATE datetime,
P_ACCEPT_DATE2 datetime,
TS_HEURES_PAR_JOUR float,
P_MAITRE int(11) DEFAULT '0' NOT NULL,
P_PAYS smallint(6),
P_LICENCE varchar(25),
P_LICENCE_DATE date,
P_LICENCE_EXPIRY date,
ID_API int(11),
P_FAVORITE_SECTION int(11),
PRIMARY KEY (P_ID),
   UNIQUE P_CODE (P_CODE),
   UNIQUE ID_API (ID_API),
KEY GP_ID (GP_ID),
KEY P_OLD_MEMBER (P_OLD_MEMBER),
KEY P_STATUT (P_STATUT),
KEY C_ID (C_ID),
KEY GP_ID2 (GP_ID2),
KEY P_ZIP_CODE (P_ZIP_CODE),
KEY P_NOM (P_NOM),
KEY P_CITY (P_CITY),
KEY P_BIRTHDATE (P_BIRTHDATE),
KEY P_LAST_CONNECT (P_LAST_CONNECT),
KEY P_DATE_ENGAGEMENT (P_DATE_ENGAGEMENT),
KEY P_FIN (P_FIN),
KEY P_NOM_NAISSANCE (P_NOM_NAISSANCE),
KEY TP_ID (TP_ID),
KEY NPAI (NPAI),
KEY SUSPENDU (SUSPENDU),
KEY P_HOMONYM (P_SECTION, P_NOM, P_PRENOM, P_BIRTHDATE),
KEY P_MDP_EXPIRY (P_MDP_EXPIRY),
KEY P_MAITRE (P_MAITRE),
KEY P_PHONE (P_PHONE),
KEY P_PHONE2 (P_PHONE2)
);
# ------------------------------------
# data for table 'pompier'
# ------------------------------------
INSERT INTO pompier (P_ID,P_CODE,P_PRENOM,P_PRENOM2,P_NOM,P_NOM_NAISSANCE,P_SEXE,P_CIVILITE,P_OLD_MEMBER,P_GRADE,P_PROFESSION,P_STATUT,P_REGIME,P_MDP,P_PASSWORD_FAILURE,P_MDP_EXPIRY,P_DATE_ENGAGEMENT,P_FIN,P_SECTION,C_ID,GP_ID,GP_ID2,P_BIRTHDATE,P_BIRTHPLACE,P_BIRTH_DEP,P_EMAIL,P_HORAIRE,P_PHONE,P_PHONE2,P_ABBREGE,P_ADDRESS,P_ZIP_CODE,P_CITY,P_RELATION_PRENOM,P_RELATION_NOM,P_RELATION_PHONE,P_RELATION_MAIL,P_HIDE,P_PHOTO,P_LAST_CONNECT,P_NB_CONNECT,GP_FLAG1,GP_FLAG2,TS_CODE,TS_HEURES,TS_JOURS_CP_PAR_AN,TS_HEURES_PAR_AN,TS_HEURES_A_RECUPERER,TS_RELIQUAT_CP,TS_RELIQUAT_RTT,P_NOSPAM,P_CREATE_DATE,SERVICE,TP_ID,MOTIF_RADIATION,NPAI,DATE_NPAI,OBSERVATION,SUSPENDU,DATE_SUSPENDU,DATE_FIN_SUSPENDU,MONTANT_REGUL,P_CALENDAR,P_ACCEPT_DATE,P_ACCEPT_DATE2,TS_HEURES_PAR_JOUR,P_MAITRE,P_PAYS,P_LICENCE,P_LICENCE_DATE,P_LICENCE_EXPIRY,ID_API,P_FAVORITE_SECTION) VALUES
('1','admin','admin',NULL,'admin',NULL,'M','1','0','-','SPP','PRES','24h','7cf3589be4e9b55acc7c829076bd80a6',NULL,NULL,'2020-01-01',NULL,'0','0','4','0',NULL,NULL,NULL,'admin@mybrigade.org',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,'2021-04-12 21:32:34','1','0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2020-01-01',NULL,'4',NULL,'0',NULL,NULL,'0',NULL,NULL,'0',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,'0');
# ------------------------------------
# structure for table 'poste'
# ------------------------------------
DROP TABLE IF EXISTS poste ;
CREATE TABLE poste (
PS_ID int(11) NOT NULL auto_increment,
PS_ORDER int(11),
EQ_ID smallint(6) DEFAULT '1' NOT NULL,
TYPE varchar(8) NOT NULL,
DESCRIPTION varchar(80) NOT NULL,
PS_FORMATION tinyint(4) DEFAULT '1' NOT NULL,
PS_EXPIRABLE tinyint(4) DEFAULT '0' NOT NULL,
DAYS_WARNING smallint(6) DEFAULT '0' NOT NULL,
PS_AUDIT tinyint(4) DEFAULT '0' NOT NULL,
PS_DIPLOMA tinyint(4) DEFAULT '0' NOT NULL,
PS_NUMERO tinyint(4) DEFAULT '0' NOT NULL,
PS_RECYCLE tinyint(4) DEFAULT '0' NOT NULL,
PS_USER_MODIFIABLE tinyint(4) DEFAULT '0' NOT NULL,
PS_PRINTABLE tinyint(4) DEFAULT '0' NOT NULL,
PS_PRINT_IMAGE tinyint(4) DEFAULT '0' NOT NULL,
PS_NATIONAL tinyint(4) DEFAULT '0' NOT NULL,
PS_SECOURISME tinyint(4) DEFAULT '0' NOT NULL,
F_ID int(11) DEFAULT '4' NOT NULL,
PH_CODE varchar(15),
PH_LEVEL tinyint(4),
PRIMARY KEY (PS_ID),
KEY EQ_ID (EQ_ID),
KEY PH_CODE (PH_CODE)
);
# ------------------------------------
# data for table 'poste'
# ------------------------------------
INSERT INTO poste (PS_ID,PS_ORDER,EQ_ID,TYPE,DESCRIPTION,PS_FORMATION,PS_EXPIRABLE,DAYS_WARNING,PS_AUDIT,PS_DIPLOMA,PS_NUMERO,PS_RECYCLE,PS_USER_MODIFIABLE,PS_PRINTABLE,PS_PRINT_IMAGE,PS_NATIONAL,PS_SECOURISME,F_ID,PH_CODE,PH_LEVEL) VALUES
('17','17','4','VL','Permis voiture','0','0','0','0','1','1','0','0','0','0','0','0','4',NULL,NULL),
('19','19','4','PL','Permis poids lourd','0','0','0','0','1','1','0','0','0','0','0','0','4',NULL,NULL);
# ------------------------------------
# structure for table 'poste_hierarchie'
# ------------------------------------
DROP TABLE IF EXISTS poste_hierarchie ;
CREATE TABLE poste_hierarchie (
PH_CODE varchar(15) NOT NULL,
PH_NAME varchar(30) NOT NULL,
PH_HIDE_LOWER tinyint(4) NOT NULL,
PH_UPDATE_LOWER_EXPIRY tinyint(4) NOT NULL,
PH_UPDATE_MANDATORY tinyint(4) DEFAULT '0' NOT NULL,
PRIMARY KEY (PH_CODE)
);
# ------------------------------------
# data for table 'poste_hierarchie'
# ------------------------------------

# ------------------------------------
# structure for table 'preferences'
# ------------------------------------
DROP TABLE IF EXISTS preferences ;
CREATE TABLE preferences (
PP_ID int(11) NOT NULL auto_increment,
PP_TYPE varchar(30) NOT NULL,
PP_DESCRIPTION varchar(100) NOT NULL,
PRIMARY KEY (PP_ID)
);
# ------------------------------------
# data for table 'preferences'
# ------------------------------------
INSERT INTO preferences (PP_ID,PP_TYPE,PP_DESCRIPTION) VALUES
('1','info-bulle','Activer/D�sactiver les grosses info-bulles (tooltips)'),
('2','langue','D�finit la langue de l\'application'),
('4','order_list','Ordre d\'affichage des sections dans les listes d�roulantes'),
('3','favorite_section','Section favorite'),
('10','button_disp','Affichage du bouton disponibilit�'),
('11','button_calend','Affichage du bouton calendrier'),
('12','button_even','Affichage du bouton activit�'),
('13','button_garde','Affichage du bouton garde'),
('14','button_search','Affichage du bouton recherche'),
('15','widget_activites','Nombre maximum d\'�l�ments � afficher dans le widget activit�s');
# ------------------------------------
# structure for table 'qualification'
# ------------------------------------
DROP TABLE IF EXISTS qualification ;
CREATE TABLE qualification (
P_ID int(11) DEFAULT '0' NOT NULL,
PS_ID int(11) DEFAULT '0' NOT NULL,
Q_VAL tinyint(4) DEFAULT '1' NOT NULL,
Q_EXPIRATION date,
Q_UPDATED_BY int(11),
Q_UPDATE_DATE datetime,
PRIMARY KEY (P_ID, PS_ID),
KEY PS_ID (PS_ID),
KEY Q_EXPIRATION (Q_EXPIRATION)
);
# ------------------------------------
# data for table 'qualification'
# ------------------------------------

# ------------------------------------
# structure for table 'rejet'
# ------------------------------------
DROP TABLE IF EXISTS rejet ;
CREATE TABLE rejet (
R_ID int(11) NOT NULL auto_increment,
P_ID int(11) NOT NULL,
ANNEE varchar(4) NOT NULL,
PERIODE_CODE varchar(4) NOT NULL,
DATE_REJET date,
DEFAUT_ID tinyint(4) NOT NULL,
MONTANT_REJET float,
REPRESENTER tinyint(4) DEFAULT '0' NOT NULL,
REGULARISE tinyint(4) DEFAULT '0' NOT NULL,
DATE_REGUL date,
MONTANT_REGUL float,
OBSERVATION varchar(150),
REGUL_ID tinyint(4) DEFAULT '0' NOT NULL,
PRIMARY KEY (R_ID),
KEY P_ID (P_ID),
KEY DEFAUT_ID (DEFAUT_ID),
KEY ANNEE (ANNEE, PERIODE_CODE),
KEY REGUL_ID (REGUL_ID)
);
# ------------------------------------
# data for table 'rejet'
# ------------------------------------

# ------------------------------------
# structure for table 'remplacement'
# ------------------------------------
DROP TABLE IF EXISTS remplacement ;
CREATE TABLE remplacement (
R_ID int(11) NOT NULL auto_increment,
E_CODE int(11) NOT NULL,
EH_ID tinyint(4) DEFAULT '1' NOT NULL,
REPLACED int(11) NOT NULL,
SUBSTITUTE int(11) DEFAULT '0',
REQUEST_DATE datetime NOT NULL,
REQUEST_BY int(11) NOT NULL,
ACCEPTED tinyint(4) DEFAULT '0' NOT NULL,
ACCEPT_DATE datetime,
ACCEPT_BY int(11),
APPROVED tinyint(4) DEFAULT '0' NOT NULL,
APPROVED_DATE datetime,
APPROVED_BY int(11),
REJECTED tinyint(4) DEFAULT '0' NOT NULL,
REJECT_DATE datetime,
REJECT_BY int(11),
PRIMARY KEY (R_ID),
KEY REPLACED (REPLACED),
KEY APPROVED (APPROVED),
KEY E_CODE (E_CODE),
KEY SUBSTITUTE (SUBSTITUTE)
);
# ------------------------------------
# data for table 'remplacement'
# ------------------------------------

# ------------------------------------
# structure for table 'report_list'
# ------------------------------------
DROP TABLE IF EXISTS report_list ;
CREATE TABLE report_list (
R_CODE varchar(40) NOT NULL,
R_NAME varchar(100) NOT NULL,
PRIMARY KEY (R_CODE)
);
# ------------------------------------
# data for table 'report_list'
# ------------------------------------
INSERT INTO report_list (R_CODE,R_NAME) VALUES
('1nbparticipants','Nombre de participants'),
('1evenement_annule_liste','Activit�s Annul�es (justificatifs)'),
('1evenement_annule','Activit�s Annul�es par type'),
('1tcd_activite_annee','Activit�s par type et par section'),
('1renforts','Activit�s Renforts'),
('1conventions','Etat des Conventions - COA'),
('1conventionsmanquantes','Conventions manquantes - COA'),
('1statsmanquantes','Statistiques manquantes'),
('1dps','DPS r�alis�s'),
('1dpsre','DPS r�alis�s (renforts exclus)'),
('1maraudes','Maraudes r�alis�es'),
('1heb','H�bergements d\'urgence r�alis�s'),
('1asigcs','Actions de Sensibilisation Initiation aux Gestes et Comportements qui Sauvent'),
('1accueilRefugies','Accueils des r�fugi�s'),
('1vacci','Vaccinations'),
('1horairesdouteux','Horaires douteux � corriger'),
('1datecre','Dates de cr�ation des activit�s'),
('1promocom','Activit�s Promotion - Communication'),
('1horsdep','Activit�s hors d�partement'),
('1Tevtpardep','Nombre activit�s par d�partement - type au choix'),
('1alsan','Alertes sanitaires'),
('1alsanre','Alertes sanitaires (hors renforts)'),
('1kmalsan','Alertes sanitaires - Kilom�trage r�alis�'),
('1alsanpardep','Statistiques Alertes sanitaires par d�partement'),
('1mkalsanpardep','Kilom�trage Alertes sanitaires par d�partement'),
('formations','Formations r�alis�es'),
('1formations_sd','Formations: nombres de stagiaires et de valid�s'),
('1formationsnontraitees','Formations non trait�es'),
('1sst','Formations SST r�alis�es'),
('1gqs','Formations GQS r�alis�es'),
('1formationsCE','Formations chef d\'�quipe ou chef de poste r�alis�es'),
('sstexpiration','Expiration des Dipl�mes SST'),
('2Cforpardep','Nombre de formations par d�partement et par an pour une comp�tence'),
('1facturation','Suivi commercial'),
('1facturationRecap','D�tail du suivi commercial'),
('fafacturer','Activit�s termin�es a facturer'),
('1tnonpaye','Activit�s termin�es non pay�es'),
('1fnonpaye','Activit�s factur�es non pay�es'),
('1paye','Activit�s pay�es'),
('1facturestoutes','Listes des factures'),
('1cadps','Chiffre d\'affaire DPS'),
('1cadps_sansR','Chiffre d\'affaire DPS hors renforts'),
('1cafor','Chiffre d\'affaire Formations'),
('1facturepayeedps','Factures de DPS pay�es'),
('1facturepayeefor','Factures de Formations pay�es'),
('1evenement_annule_liste2','Activit�s annul�es'),
('code_conducteur','Codes conducteurs'),
('vehicule','Liste des v�hicules'),
('1vehicule_km','Kilom�trage r�alis� par v�hicule (bilan)'),
('1associat_km','Kilom�trage r�alis�s par les v�hicules (d�tail)'),
('1perso_km','Kilom�trage d�taill� en v�hicule personnel'),
('1perso_km_total','Kilom�trage total en avec v�hicule personnel'),
('1missing_km','Kilom�trage non renseign�s'),
('1evenement_km','Kilom�trage par type d\'activit�'),
('vehicule_a_dispo','V�hicules mis � disposition'),
('materiel_a_dispo','Mat�riel mis � disposition'),
('1consommation_produits','Consommation de produits'),
('stock_consommables','Stock de produits consommables'),
('tenues_personnel','Tenues du personnel'),
('nbadherentspardep','Nombre de personnel b�n�voles et salari�s par d�partement'),
('effectif','Liste du personnel'),
('salarie','Liste du personnel salari�'),
('1civique','Liste du personnel en service civique par date'),
('1snu','Liste du personnel en service national universel par date'),
('chiens','Chiens de recherche avec comp�tences valides'),
('creationfiches','Cr�ation des fiches personnel'),
('provenantautres','Personnel ayant chang� de section'),
('adresses','Liste des adresses du personnel'),
('adresses2','Liste des adresses des adh�rents'),
('1anniversaires','Anniversaires des membres'),
('1heuressections','Heures r�alis�es / section'),
('1absences','Absences sur les activit�s'),
('1nombreabsences','Nombre d\'absences / personne'),
('1anciens','Anciens membres avec date de sortie'),
('engagement','Ann�es d\'engagement du personnel '),
('1inactif2','Personnel inactif'),
('skype','Identifiants de contact Skype '),
('zello','Identifiants de contact Zello '),
('whatsapp','Identifiants de contact Whatsapp '),
('typeemail','R�partition par type d\'email'),
('sans2emeprenom','Personnel actif sans deuxi�me pr�nom renseign�'),
('sansdatenaissance','Personnel actif sans date de naissance renseign�e'),
('sanslieunaissance','Personnel actif sans lieu de naissance renseign�'),
('sansphoto','Personnel actif sans photo d\'identit�'),
('sansemail','Personnel sans email valide'),
('sansadresse','Personnel sans adresse valide'),
('sanstel','Personnel sans num�ro de t�l�phone valide'),
('homonymes','Liste des homonymes (nom, pr�nom)'),
('doublons','Liste des fiches personnel en double (nom,pr�nom,date de naissance)'),
('doubleaffect','Liste personnes avec plusieurs affectations'),
('doublonlicence','Liste des num�ros de licences affect�s � plusieurs fiches actives'),
('infolue','Suivi lecture note d\'information importante'),
('effectif2','Liste des utilisateurs d�partementaux (acc�s admin seul)'),
('effectif3','Liste des administrateurs d�partementaux (acc�s admin seul)'),
('1heurespersonne','Participations / personne'),
('1heurespersonnetous','Participations / personne (avec les externes)'),
('1participations','Nombre de participations sur la p�riode'),
('1participationsformateurs','Participations des formateurs'),
('1participationsadresses','Adresses du personnel ayant particip�'),
('1participationssalaries','Participations des salari�s'),
('1participationsprompcom','Participations aux Activit�s Promotion - Communication'),
('1participationsnautique','Participations aux Activit�s Activit� nautique'),
('tempsconnexion','Temps de connexion par personne'),
('tempconnexionparsection','Temps de connexion par d�partement'),
('1participationsannules','Participations aux Activit�s Annul�s'),
('1participationsparjour','Nombre de participations par jour des b�n�voles'),
('1heurespersonneSNU','Participations du personnel Service National Universel'),
('1heurespersonneMineur','Participations du personnel mineur'),
('adressesext','Liste des adresses des externes'),
('telext','Liste des externes ayant un num�ro de t�l�phone renseign�'),
('mailext','Liste des externes ayant un email renseign�'),
('1participationsext','Participations des externes par dates'),
('1heurespersonneexternes','Participations / personne externe'),
('1participationsadressesext','Adresses des externes ayant particip� entre deux dates'),
('groupes','Permissions du personnel'),
('roles','R�les dans l\'organigramme du personnel'),
('secouristesPSE','Liste des secouristes PSE1 ou PSE2'),
('secouristesparsection','Nombre de secouristes PSE2 ou PSE1 seulement'),
('secouristesPSE1','Liste des secouristes seulement PSE1'),
('moniteurs','Liste des moniteurs de secourisme'),
('moniteursPSC','Liste des moniteurs seulement PSC'),
('moniteursparsection','Nombre de moniteurs de secourisme'),
('formateurs','Liste des formateurs'),
('personnelsante','Liste du personnel de sant�'),
('competence_expire','Comp�tences expir�es'),
('diplomesPSC1','Liste des dipl�mes PSC1'),
('1diplomesPSC1','Liste des dipl�mes PSC1 par dates'),
('diplomesPSE1','Liste des dipl�mes PSE1'),
('diplomesPSE2','Liste des dipl�mes PSE2'),
('sectionannuaire','Annuaire des sections'),
('departementannuaire','Annuaire des d�partements'),
('sectionannuaire2','Annuaire des d�partements et antennes'),
('sectionannuaire3','Adresses des lieux de formation'),
('IDRadio','Codes ID Radio des d�partements et antennes'),
('agrements','Liste des agr�ments'),
('agrements_dps','Liste des agr�ments DPS'),
('SMSsections','Comptes SMS'),
('1updateorganigramme','Nouveaux �lus d�partementaux'),
('1interdictions','Interdictions de cr�er certains activit�s'),
('entreprisesannuaire','Annuaire des entreprises'),
('medecinsreferents','M�decins r�f�rents'),
('1entreprisesDPS','Entreprises b�n�ficiant de DPS'),
('1entreprisesFOR','Entreprises b�n�ficiant de Formations'),
('1garde','Gardes r�alis�es'),
('1gardere','Gardes r�alis�es (hors renforts)'),
('1ah','Bilan actions humanitaires'),
('1soutienpopulations','Bilan aide aux populations'),
('1heuresparticipations','Bilan participations toutes activit�s'),
('1heuresparticipationspartype','Bilan heures participations par type d\'activit�'),
('2cotisationsPayees','Cotisations pay�es pour une ann�e'),
('montantactuel','Montant actuel des cotisations'),
('cotisationspayees','Cotisations pay�es par d�partement pour l\'ann�e en cours'),
('cotisationspayeesparpers','Cotisations pay�es par personne pour l\'ann�e en cours'),
('1cotisationspayees','Cotisations pay�es entre deux dates'),
('2cotisationsimpayees','Cotisations non pay�es pour l\'ann�e'),
('1intervictime','Nombre d\'interventions par jour'),
('1intervictimeparevt','Nombre d\'interventions par activit�'),
('1victimenationalite','Nombre de personnes prises en charge par nationalit�'),
('1victimeage','Nombre de personnes prises en charge par �ge'),
('1victimesexe','Nombre de personnes prises en charge par sexe'),
('1statdetailvictime','Statistiques personnes prises en charge et actions r�alis�es par jour'),
('1statdetailvictimeparevt','Statistiques personnes prises en charge et actions r�alis�es par �v�nement'),
('1transportdest','Nombre de Transports de victimes selon destination'),
('1transportpar','Nombre de Transports de victimes selon transporteur'),
('1listevictime','Liste des personnes prises en charge'),
('1listevictimeCAV','Liste des Victimes au Centre d\'Accueil'),
('pointdujour','Point de situation du jour'),
('1activite','Point de situation par date'),
('maincourantejour','Rapports d\'interventions renseign�s ce jour'),
('maincourantehier','Rapports d\'interventions renseign�s hier'),
('compterendujour','Rapports de comptes rendus renseign�s ce jour'),
('compterenduhier','Rapports de comptes rendus renseign�s hier'),
('personneldisponiblea','Personnel disponible aujourd\'hui'),
('personneldisponibled','Personnel disponible demain'),
('veille','Personnel de veille op�rationnelle '),
('presidents','Pr�sidents d�partementaux '),
('responsablesformations','Directeur des Formations d�partementaux '),
('responsablesoperationnels','Directeur des Op�rations d�partementaux '),
('1note_ATTV','Notes de frais en attente de validation'),
('1note_ANN','Notes de frais annul�es'),
('1note_REF','Notes de frais refus�es'),
('1note_VAL','Notes de frais valid�es'),
('1note_VAL2','Notes de frais valid�es deux fois'),
('1note_REMB','Notes de frais rembours�es (ou dons � l\'association)'),
('1note_toutes','Notes de frais (toutes)'),
('1notN_ATTV','Notes de frais nationales en attente de validation'),
('1notN_ANN','Notes de frais nationales annul�es'),
('1notN_REF','Notes de frais nationales refus�es'),
('1notN_VAL','Notes de frais nationales valid�es'),
('1notN_VAL2','Notes de frais nationales valid�es deux fois'),
('1notN_REMB','Notes de frais nationales rembours�es'),
('1notN_toutes','Notes de frais nationales (toutes)'),
('horairesavalider','Horaires � valider'),
('1horaires','Horaires entre 2 dates (tous)'),
('competencesope','Comp�tences op�rationnelles du personnel'),
('competencesfor','Comp�tences formation du personnel'),
('1soapcallsj','Nombre appels Webservice par jour'),
('1soaperrorsj','Nombre erreurs appels Webservice par jour'),
('1soapcalls','Acc�s Webservice'),
('1soaperrors','Erreurs Webservice');
INSERT INTO report_list (R_CODE,R_NAME) VALUES
('1heurespersonneforco','Maintien des acquis / personne (tous)'),
('adhmodepaiement','Liste des adh�rents actifs avec le mode de paiement'),
('adhpayantparcheque','Liste des adh�rents payant par ch�que'),
('adhpayantparvirement','Liste des adh�rents payant par virement'),
('adhpayantparprelevement','Liste des adh�rents payant par pr�l�vement'),
('adhsuspendus','Liste des adh�rents suspendus'),
('adhretraites','Liste des adh�rents retrait�s'),
('adhactifsretraites','Liste des adh�rents non retrait�s dans les sections Retraite'),
('1radiations','Liste des radiations d\'adh�rents pour suppression identifiants site internet'),
('1nouveauxadherents','Liste des nouveaux adh�rents pour cr�ation identifiants site internet'),
('nbadherentspardepS','Nombre d\'adh�rents par d�partement'),
('0nbadherentspardep','Nombre d\'adh�rents par d�partement actifs � une date donn�e'),
('nbtotaladhparprof','Nombre total d\'adh�rents'),
('0nbtotaladhparprof','Nombre total d\'adh�rents actifs � une date donn�e'),
('nbadherents','Nombre d\'adh�rents par centre et par profession'),
('adhNPAI','Liste des adh�rents en NPAI'),
('cordonneesAdherents','Coordonn�es des adh�rents non suspendus'),
('adhdistribution','Liste des adh�rents pour distribution agendas - stylos'),
('adhcarte','Liste des adh�rents pour imprimeurs pour cartes adh�rents'),
('1changementmail','Liste des changements d\'adresses email'),
('1changementtel','Liste des changements de num�ro de t�l�phone'),
('1ribmodifie','Liste des changements de coordonn�es bancaires pour adh�rents existants'),
('1changementcentre','Liste des changements d\'affectation ou de SDIS'),
('1changementgrade','Liste des changements de grades'),
('adherentsajourcotisation','Liste des adh�rents actifs � jour de leurs cotisations'),
('1cotisationCheque','Liste des cotisations pay�es par ch�que entre deux dates'),
('1cotisationVirPrev','Liste des cotisations pay�es par virement ou pr�l�vement entre deux dates'),
('adressesEnvoiColis','Liste des adresses pour envoi colis'),
('nombrePrelevementParDep','NOMBRE D�ADHERENTS EN DATE D�AUJOURD�HUI EN PRELEVEMENT OU VIREMENT'),
('1nombrePrelevementParDep','NOMBRE D�ADHERENTS EN PRELEVEMENT OU VIREMENT ENTRE DEUX DATES'),
('nombrePrelevementParDeptt','NOMBRE D�ADHERENTS EN DATE D�AUJOURD�HUI TOUS TYPES DE PAIEMENT'),
('1rejetsetregul','REJETS ET REGUL PAR DATE'),
('rejetsencours','REJETS EN COURS DE REGULARISATION'),
('nbsuspendupardep','NB DE SUSPENDU EN PRELEVEMENT PAR DEPARTEMENT'),
('nomssuspendupardep','NOM DES ADHERENTS SUSPENDUS EN PRELEVEMENT PAR DEPARTEMENT'),
('adhtournee','Liste des adh�rents pour tourn�es syndicales'),
('nbadherentsparcentre','Nombre d\'adh�rents par centre'),
('cordonneesAdherentsparcentre','Coordonn�es des adh�rents par centre'),
('cordonneesAdherentsparGTetService','Coordonn�es des adh�rents par GT et Service (pour AG, Formation�)'),
('cordonneesAdherentsparGTetServicesansNPA','Coordonn�es des adh�rents par GT et Service (pour AG, Formation�) pour les courriers sans les N'),
('adhtournee_off','Liste des adh�rents Officiers pour tourn�es syndicales'),
('adhtournee_non_off','Liste des adh�rents non Officiers pour tourn�es syndicales'),
('adhtournee_pats','Liste des adh�rents PATS pour tourn�es syndicales'),
('1majchgtadresse','Pour MAJ changement d\'adresse'),
('1majradiation','Pour MAJ radiations'),
('nbadherentspardep2','Nombre d\'adh�rents par d�partement'),
('1adherentsradies06','D�tail des radiations du Syndicat 06'),
('1nouveauxadherents2','Nombre de nouveaux adh�rents par d�partement'),
('1adherentsradies2','Nombre de radiations par d�partement'),
('adherentsradies3','Nombre de radiations au 31/12 ann�e derni�re'),
('adherentsradies4','Nombre de radiations au 31/12 ann�e en cours'),
('1nbNouveauxAdherentsParDep','Nombre de nouveaux adh�rents par d�partement'),
('1nouveauxadherentsPres','Nouveaux adh�rents'),
('1nbRadiationsAdherentsParDep','Nombre de radiations par d�partement et par motif'),
('1radiationsmotifPres','Radiations'),
('1verifmontants','ATTESTATION - v�rification montant en fonction date adh�sion'),
('2attestationsImpots','ATTESTATION  - Cotisations pay�es pour une ann�e'),
('2attestationsImpotsRejets','ATTESTATION � Cotisations avec rejets pay�es pour une ann�e'),
('impayesN-1','ATTESTATION � Rejets de l\'ann�e derni�re non r�gularis�s ou pr�lev�s cette ann�e.'),
('president_syndicate','r�sidents d�partementaux '),
('effectifadherents','Liste des adh�rents'),
('1abonnejournal','B�n�ficiaires Echos Syndicat'),
('1demandejournal','Souhaitent recevoir Echos Syndicat'),
('droitBureauDE','Droits d�acc�s Bureau D�partemental par D�partement'),
('2sommecotisations','Somme des cotisations par d�partement et profession pour l\'ann�e'),
('2sommecotisationsprevues','Somme des cotisations par d�partement et profession pour l\'ann�e'),
('rejets','Liste des rejets des pr�l�vement'),
('fichierExtractionSG','Fichier d�extraction pour Soci�t� G�n�rale '),
('1fichierExtractionSG','Fichier d�extraction pour Soci�t� G�n�rale selon date adh�sion'),
('SEPAcourrierRUM','SEPA � Liste des adh�rents pour courrier RUM'),
('1reports','Reportings extraits, audit'),
('1topreports','Reportings les plus utilis�s'),
('1fonctionsparpers','Fonctions attribu�es pour chaque personne sur les gardes'),
('1ajoutscompetences','Comp�tences du personnel ajout�es par date'),
('1stats_salsan','Alertes sanitaires - statistiques par jour'),
('0nbadherentspardepparprof','Nombre d\'adh�rents actifs par d�partement par profession'),
('1heurespersonneFORFacture','Heures de formateurs sur activit�s factur�s'),
('1heurespersonneDPSFacture','Heures de participations sur DPS factur�s'),
('1heurespersonneHorsDPSFacture','Heures de participations op�rationnelles hors DPS factur�s'),
('0mineur','Liste du personnel actif mineur � une date donn�e'),
('extmailvalide','Liste adresses mail des particuliers form�s'),
('extnomailvalide','Liste des particuliers form�s sans adresse email'),
('effectif50','Liste du personnel ag� de 50 ans et plus'),
('1mar','Maraudes statistiques');
# ------------------------------------
# structure for table 'section'
# ------------------------------------
DROP TABLE IF EXISTS section ;
CREATE TABLE section (
S_ID smallint(6) DEFAULT '0' NOT NULL,
S_PARENT smallint(6) DEFAULT '0' NOT NULL,
S_CODE varchar(25) DEFAULT 'MON CODE' NOT NULL,
S_DESCRIPTION varchar(80),
S_URL varchar(60),
S_PHONE varchar(20),
S_PHONE2 varchar(20),
S_PHONE3 varchar(20),
S_FAX varchar(20),
S_ADDRESS varchar(150),
S_ADDRESS_COMPLEMENT varchar(150),
S_ZIP_CODE varchar(6),
S_CITY varchar(30),
S_EMAIL varchar(60),
S_EMAIL2 varchar(60),
S_EMAIL3 varchar(60),
S_PDF_PAGE varchar(250),
S_PDF_MARGE_TOP float DEFAULT '15',
S_PDF_MARGE_LEFT float DEFAULT '15',
S_PDF_TEXTE_TOP float DEFAULT '40',
S_PDF_TEXTE_BOTTOM float DEFAULT '25',
S_PDF_BADGE varchar(250),
S_PDF_SIGNATURE varchar(250),
S_IMAGE_SIGNATURE varchar(250),
s_devis_debut tinytext,
s_devis_fin tinytext,
s_facture_debut text,
s_facture_fin text,
DPS_MAX_TYPE tinyint(4),
NB_DAYS_BEFORE_BLOCK smallint(6) DEFAULT '0' NOT NULL,
SMS_LOCAL_PROVIDER tinyint(4) DEFAULT '0' NOT NULL,
SMS_LOCAL_USER varchar(40),
SMS_LOCAL_PASSWORD varchar(255),
SMS_LOCAL_API_ID varchar(40),
S_HIDE tinyint(4) DEFAULT '0' NOT NULL,
S_INACTIVE tinyint(4) DEFAULT '0' NOT NULL,
WEBSERVICE_KEY varchar(40),
S_ORDER int(11) DEFAULT '0' NOT NULL,
S_ID_RADIO varchar(5),
SHOW_PHONE3 tinyint(4) DEFAULT '1' NOT NULL,
SHOW_EMAIL3 tinyint(4) DEFAULT '1' NOT NULL,
SHOW_URL tinyint(4) DEFAULT '1' NOT NULL,
S_TIMEZONE varchar(70) DEFAULT 'Europe/Paris' NOT NULL,
S_SIRET varchar(20),
S_AFFILIATION varchar(20),
S_WHATSAPP varchar(30),
PRIMARY KEY (S_ID),
   UNIQUE S_CODE (S_CODE),
   UNIQUE WEBSERVICE_KEY (WEBSERVICE_KEY),
   UNIQUE S_ID_RADIO (S_ID_RADIO),
KEY S_PARENT (S_PARENT)
);
# ------------------------------------
# data for table 'section'
# ------------------------------------
INSERT INTO section (S_ID,S_PARENT,S_CODE,S_DESCRIPTION,S_URL,S_PHONE,S_PHONE2,S_PHONE3,S_FAX,S_ADDRESS,S_ADDRESS_COMPLEMENT,S_ZIP_CODE,S_CITY,S_EMAIL,S_EMAIL2,S_EMAIL3,S_PDF_PAGE,S_PDF_MARGE_TOP,S_PDF_MARGE_LEFT,S_PDF_TEXTE_TOP,S_PDF_TEXTE_BOTTOM,S_PDF_BADGE,S_PDF_SIGNATURE,S_IMAGE_SIGNATURE,s_devis_debut,s_devis_fin,s_facture_debut,s_facture_fin,DPS_MAX_TYPE,NB_DAYS_BEFORE_BLOCK,SMS_LOCAL_PROVIDER,SMS_LOCAL_USER,SMS_LOCAL_PASSWORD,SMS_LOCAL_API_ID,S_HIDE,S_INACTIVE,WEBSERVICE_KEY,S_ORDER,S_ID_RADIO,SHOW_PHONE3,SHOW_EMAIL3,SHOW_URL,S_TIMEZONE,S_SIRET,S_AFFILIATION,S_WHATSAPP) VALUES
('0','-1','CIS','CIS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'15','15','40','25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0',NULL,NULL,NULL,'0','0',NULL,'0',NULL,'0','0','0','Europe/Paris',NULL,NULL,NULL),
('1','0','section 1','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'15','15','40','25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0',NULL,NULL,NULL,'0','0',NULL,'1',NULL,'0','0','0','Europe/Paris',NULL,NULL,NULL),
('2','0','section 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'15','15','40','25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0',NULL,NULL,NULL,'0','0',NULL,'2',NULL,'0','0','0','Europe/Paris',NULL,NULL,NULL),
('3','0','section 3','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'15','15','40','25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0',NULL,NULL,NULL,'0','0',NULL,'3',NULL,'0','0','0','Europe/Paris',NULL,NULL,NULL),
('4','0','section 4','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'15','15','40','25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0',NULL,NULL,NULL,'0','0',NULL,'4',NULL,'0','0','0','Europe/Paris',NULL,NULL,NULL);
# ------------------------------------
# structure for table 'section_cotisation'
# ------------------------------------
DROP TABLE IF EXISTS section_cotisation ;
CREATE TABLE section_cotisation (
S_ID int(11) NOT NULL,
TP_CODE varchar(6) NOT NULL,
MONTANT float NOT NULL,
IDEM tinyint(4) DEFAULT '0' NOT NULL,
COMMENTAIRE varchar(150),
PRIMARY KEY (S_ID, TP_CODE),
KEY TP_CODE (TP_CODE, IDEM)
);
# ------------------------------------
# data for table 'section_cotisation'
# ------------------------------------

# ------------------------------------
# structure for table 'section_flat'
# ------------------------------------
DROP TABLE IF EXISTS section_flat ;
CREATE TABLE section_flat (
LIG int(11) NOT NULL auto_increment,
NIV tinyint(4) NOT NULL,
S_ID int(11) NOT NULL,
S_PARENT int(11) NOT NULL,
S_CODE varchar(25) NOT NULL,
S_DESCRIPTION varchar(80),
PRIMARY KEY (LIG),
   UNIQUE S_ID (S_ID),
KEY NIV (NIV),
KEY S_CODE (S_CODE),
KEY S_DESCRIPTION (S_DESCRIPTION)
);
# ------------------------------------
# data for table 'section_flat'
# ------------------------------------
INSERT INTO section_flat (LIG,NIV,S_ID,S_PARENT,S_CODE,S_DESCRIPTION) VALUES
('1','0','0','-1','CIS','CIS'),
('2','1','1','0','section 1',''),
('3','1','2','0','section 2',''),
('4','1','3','0','section 3',''),
('5','1','4','0','section 4','');
# ------------------------------------
# structure for table 'section_role'
# ------------------------------------
DROP TABLE IF EXISTS section_role ;
CREATE TABLE section_role (
S_ID int(11) NOT NULL,
GP_ID smallint(6) DEFAULT '0' NOT NULL,
P_ID int(11) NOT NULL,
UPDATE_DATE date,
PRIMARY KEY (S_ID, GP_ID, P_ID),
KEY P_ID (P_ID),
KEY GP_ID (GP_ID)
);
# ------------------------------------
# data for table 'section_role'
# ------------------------------------

# ------------------------------------
# structure for table 'section_stop_evenement'
# ------------------------------------
DROP TABLE IF EXISTS section_stop_evenement ;
CREATE TABLE section_stop_evenement (
SSE_ID int(11) NOT NULL auto_increment,
S_ID int(11) NOT NULL,
TE_CODE varchar(6) NOT NULL,
START_DATE date NOT NULL,
END_DATE date NOT NULL,
SSE_COMMENT varchar(300),
SSE_ACTIVE tinyint(4) DEFAULT '1' NOT NULL,
SSE_BY int(11),
SSE_WHEN datetime,
PRIMARY KEY (SSE_ID)
);
# ------------------------------------
# data for table 'section_stop_evenement'
# ------------------------------------

# ------------------------------------
# structure for table 'smslog'
# ------------------------------------
DROP TABLE IF EXISTS smslog ;
CREATE TABLE smslog (
P_ID int(11) DEFAULT '0' NOT NULL,
S_DATE datetime NOT NULL,
S_TEXTE varchar(200) NOT NULL,
S_NB int(11) DEFAULT '0' NOT NULL,
S_ID int(11) DEFAULT '0' NOT NULL,
S_PROVIDER varchar(100) NOT NULL,
PRIMARY KEY (P_ID, S_DATE)
);
# ------------------------------------
# data for table 'smslog'
# ------------------------------------

# ------------------------------------
# structure for table 'statut'
# ------------------------------------
DROP TABLE IF EXISTS statut ;
CREATE TABLE statut (
S_STATUT varchar(5) NOT NULL,
S_DESCRIPTION varchar(50) NOT NULL,
S_CONTEXT tinyint(4) NOT NULL,
PRIMARY KEY (S_CONTEXT, S_STATUT)
);
# ------------------------------------
# data for table 'statut'
# ------------------------------------
INSERT INTO statut (S_STATUT,S_DESCRIPTION,S_CONTEXT) VALUES
('PRES','Prestataire','0'),
('BEN','B�n�vole','0'),
('EXT','Personnel externe','0'),
('SAL','Personnel salari�','0');
# ------------------------------------
# structure for table 'taille_vetement'
# ------------------------------------
DROP TABLE IF EXISTS taille_vetement ;
CREATE TABLE taille_vetement (
TV_ID int(11) NOT NULL auto_increment,
TT_CODE varchar(6) NOT NULL,
TV_NAME varchar(10) NOT NULL,
TV_ORDER smallint(6),
   UNIQUE TV_ID (TV_ID),
KEY TT_CODE (TT_CODE, TV_NAME)
);
# ------------------------------------
# data for table 'taille_vetement'
# ------------------------------------
INSERT INTO taille_vetement (TV_ID,TT_CODE,TV_NAME,TV_ORDER) VALUES
('1','US','XS','10'),
('2','US','S','20'),
('3','US','M','30'),
('4','US','L','40'),
('5','US','XL','50'),
('6','US','XXL','60'),
('7','US','XXXL','70'),
('8','VESTE','36','10'),
('9','VESTE','38','20'),
('10','VESTE','40','30'),
('11','VESTE','42','40'),
('12','VESTE','44','50'),
('13','VESTE','46','60'),
('14','VESTE','48','70'),
('15','VESTE','50','80'),
('16','VESTE','52','90'),
('17','VESTE','54','100'),
('18','VESTE','56','110'),
('19','VESTE','58','120'),
('20','VESTE','60','130'),
('21','VESTE','62','140'),
('22','VESTE','64','150'),
('23','VESTE','66','160'),
('24','VESTE','68','170'),
('25','VESTE','70','180'),
('26','VESTE','72','190'),
('27','VESTE','74','200'),
('28','PT','36','10'),
('29','PT','38','20'),
('30','PT','40','30'),
('31','PT','42','40'),
('32','PT','44','50'),
('33','PT','46','60'),
('34','PT','48','70'),
('35','PT','50','80'),
('36','PT','52','90'),
('37','PT','54','100'),
('38','PT','56','110'),
('39','PT','58','120'),
('40','PT','60','130'),
('41','PT','62','140'),
('42','PT','64','150'),
('43','PT','66','160'),
('44','SPT','T1M','10'),
('45','SPT','T1L','20'),
('46','SPT','T2M','30'),
('47','SPT','T2L','40'),
('48','SPT','T3M','50'),
('49','SPT','T3L','60'),
('50','TTL','72M','10'),
('51','TTL','72L','20'),
('52','TTL','76M','30'),
('53','TTL','76L','40'),
('54','TTL','80M','50'),
('55','TTL','80L','60'),
('56','TTL','84M','70'),
('57','TTL','84L','80'),
('58','TTL','88M','90'),
('59','TTL','88L','100'),
('60','TTL','92M','110'),
('61','TTL','92L','120'),
('62','TTL','96M','130'),
('63','TTL','96L','140'),
('64','TTL','100M','150'),
('65','TTL','100L','160'),
('66','TTL','104M','170'),
('67','TTL','104L','180'),
('68','TTL','108M','190'),
('69','TTL','108L','200'),
('70','TTL','112M','210'),
('71','TTL','112L','220'),
('72','TTL','116M','230'),
('73','TTL','126L','240'),
('74','PIED','30','10'),
('75','PIED','31','20'),
('76','PIED','32','30'),
('77','PIED','33','40'),
('78','PIED','34','50'),
('79','PIED','35','60'),
('80','PIED','36','70'),
('81','PIED','37','80'),
('82','PIED','38','90'),
('83','PIED','39','100'),
('84','PIED','40','110'),
('85','PIED','41','120'),
('86','PIED','42','130'),
('87','PIED','43','140'),
('88','PIED','44','150'),
('89','PIED','45','160'),
('90','PIED','46','170'),
('91','PIED','47','180'),
('92','PIED','48','190'),
('93','TETE','52','10'),
('94','TETE','53','20'),
('95','TETE','54','30'),
('96','TETE','55','40'),
('97','TETE','56','50'),
('98','TETE','57','60'),
('99','TETE','58','70'),
('100','TETE','59','80'),
('101','TETE','60','90'),
('102','TETE','61','100'),
('103','TETE','62','110'),
('104','TETE','63','120'),
('105','TETE','63','130'),
('106','GANT','5.5','10'),
('107','GANT','6','20'),
('108','GANT','6.5','30'),
('109','GANT','7','40'),
('110','GANT','7.5','50'),
('111','GANT','8','60'),
('112','GANT','8.5','70'),
('113','GANT','9','80'),
('114','GANT','9.5','90'),
('115','GANT','10','100'),
('116','GANT','10.5','110');
# ------------------------------------
# structure for table 'theme'
# ------------------------------------
DROP TABLE IF EXISTS theme ;
CREATE TABLE theme (
NAME varchar(12) NOT NULL,
COLOR varchar(6) NOT NULL,
COLOR2 varchar(6) NOT NULL,
COLOR3 varchar(6) NOT NULL,
PRIMARY KEY (NAME)
);
# ------------------------------------
# data for table 'theme'
# ------------------------------------
INSERT INTO theme (NAME,COLOR,COLOR2,COLOR3) VALUES
('azure','AFEEEE','BDBDBD','AAAAAA'),
('blue','B7D8FB','5CB8E6','4486A7'),
('cofee','DEB887','BDBDBD','AAAAAA'),
('cream','FFFACD','BDBDBD','AAAAAA'),
('gold','FFCC66','BDBDBD','AAAAAA'),
('green','D4FFAA','BFE699','ACCF8A'),
('kaki','F0E68C','BDBDBD','AAAAAA'),
('lavande','E6E6FA','BDBDBD','AAAAAA'),
('marine','99D6D6','BDBDBD','AAAAAA'),
('olive','B2E673','BDBDBD','AAAAAA'),
('orange','FF9933','FFBC79','FFA347'),
('peach','FF9966','BDBDBD','AAAAAA'),
('pink','FFCCFF','BDBDBD','AAAAAA'),
('plum','CC66FF','BDBDBD','AAAAAA'),
('purple','D4AAFF','BF99E6','AC8ACF'),
('red','FF6666','EEADAD','D69C9C'),
('salmon','FFCC99','BDBDBD','AAAAAA'),
('sand','F5DEB3','BDBDBD','AAAAAA'),
('silver','C8C8C8','BDBDBD','AAAAAA'),
('smoke','E6E6B8','BDBDBD','AAAAAA'),
('steel','B0C4DE','BDBDBD','AAAAAA'),
('yellow','FFFF66','E6E68A','CFCF7C'),
('army','cccc99','bbbb77','aaaa55');
# ------------------------------------
# structure for table 'timezone'
# ------------------------------------
DROP TABLE IF EXISTS timezone ;
CREATE TABLE timezone (
TZ_ID int(11) NOT NULL auto_increment,
TZ_UTC varchar(9) NOT NULL,
TZ_VALUE varchar(100) NOT NULL,
TZ_DESCRIPTION varchar(300) NOT NULL,
PRIMARY KEY (TZ_ID)
);
# ------------------------------------
# data for table 'timezone'
# ------------------------------------
INSERT INTO timezone (TZ_ID,TZ_UTC,TZ_VALUE,TZ_DESCRIPTION) VALUES
('1','UTC+12:00','Asia/Kamchatka','Kamchatka'),
('2','UTC+12:00','Pacific/Kwajalein','International Date Line West'),
('3','UTC+12:00','Pacific/Fiji','Fiji'),
('4','UTC+12:00','Pacific/Auckland','Auckland'),
('5','UTC+11:00','Asia/Vladivostok','Vladivostok'),
('6','UTC+10:00','Asia/Yakutsk','Yakutsk'),
('7','UTC+10:00','Australia/Sydney','Sydney'),
('8','UTC+10:00','Australia/Hobart','Hobart'),
('9','UTC+10:00','Australia/Melbourne','Melbourne'),
('10','UTC+10:00','Pacific/Port_Moresby','Port Moresby'),
('11','UTC+10:00','Pacific/Guam','Guam'),
('12','UTC+10:00','Australia/Canberra','Canberra'),
('13','UTC+10:00','Australia/Brisbane','Brisbane'),
('14','UTC+09:30','Australia/Darwin','Darwin'),
('15','UTC+09:30','Australia/Adelaide','Adelaide'),
('16','UTC+09:00','Asia/Tokyo','Tokyo'),
('17','UTC+09:00','Asia/Seoul','Seoul'),
('18','UTC+09:00','Asia/Tokyo','Sapporo'),
('19','UTC+09:00','Asia/Tokyo','Osaka'),
('20','UTC+09:00','Asia/Irkutsk','Irkutsk'),
('21','UTC+08:00','Asia/Urumqi','Urumqi'),
('22','UTC-05:00','America/Bogota','Quito'),
('23','UTC-04:00','Canada/Atlantic','Atlantic Time (Canada)'),
('24','UTC-04:30','America/Caracas','Caracas'),
('25','UTC-04:00','America/La_Paz','La Paz'),
('26','UTC-04:00','America/Santiago','Santiago'),
('27','UTC-03:30','Canada/Newfoundland','Newfoundland'),
('28','UTC-03:00','America/Sao_Paulo','Brasilia'),
('29','UTC-03:00','America/Argentina/Buenos_Aires','Buenos Aires'),
('30','UTC-03:00','America/Argentina/Buenos_Aires','Georgetown'),
('31','UTC-03:00','America/Godthab','Greenland'),
('32','UTC-02:00','America/Noronha','Mid-Atlantic'),
('33','UTC-01:00','Atlantic/Azores','Azores'),
('34','UTC-01:00','Atlantic/Cape_Verde','Cape Verde Is.'),
('35','UTC+00:00','Africa/Casablanca','Casablanca'),
('36','UTC+00:00','Europe/London','Edinburgh'),
('37','UTC+00:00','Etc/Greenwich','Greenwich Mean Time : Dublin'),
('38','UTC+00:00','Europe/Lisbon','Lisbon'),
('39','UTC+00:00','Europe/London','London'),
('40','UTC+00:00','Africa/Monrovia','Monrovia'),
('41','UTC+00:00','UTC','UTC'),
('42','UTC+01:00','Europe/Amsterdam','Amsterdam'),
('43','UTC+01:00','Europe/Belgrade','Belgrade'),
('44','UTC+01:00','Europe/Berlin','Berlin'),
('45','UTC+01:00','Europe/Berlin','Bern'),
('46','UTC+01:00','Europe/Bratislava','Bratislava'),
('47','UTC+01:00','Europe/Brussels','Brussels'),
('48','UTC+01:00','Europe/Budapest','Budapest'),
('49','UTC+01:00','Europe/Copenhagen','Copenhagen'),
('50','UTC+01:00','Europe/Ljubljana','Ljubljana'),
('51','UTC+01:00','Europe/Madrid','Madrid'),
('52','UTC+01:00','Europe/Paris','Paris'),
('53','UTC+01:00','Europe/Prague','Prague'),
('54','UTC+01:00','Europe/Rome','Rome'),
('55','UTC+01:00','Europe/Sarajevo','Sarajevo'),
('56','UTC+01:00','Europe/Skopje','Skopje'),
('57','UTC+01:00','Europe/Stockholm','Stockholm'),
('58','UTC+01:00','Europe/Vienna','Vienna'),
('59','UTC+01:00','Europe/Warsaw','Warsaw'),
('60','UTC+01:00','Africa/Lagos','West Central Africa'),
('61','UTC+01:00','Europe/Zagreb','Zagreb'),
('62','UTC+02:00','Europe/Athens','Athens'),
('63','UTC+02:00','Europe/Bucharest','Bucharest'),
('64','UTC+02:00','Africa/Cairo','Cairo'),
('65','UTC+02:00','Africa/Harare','Harare'),
('66','UTC+02:00','Europe/Helsinki','Helsinki'),
('67','UTC+02:00','Europe/Istanbul','Istanbul'),
('68','UTC+02:00','Asia/Jerusalem','Jerusalem'),
('69','UTC+02:00','Europe/Helsinki','Kyiv'),
('70','UTC+02:00','Africa/Johannesburg','Pretoria'),
('71','UTC+02:00','Europe/Riga','Riga'),
('72','UTC+02:00','Europe/Sofia','Sofia'),
('73','UTC+02:00','Europe/Tallinn','Tallinn'),
('74','UTC+02:00','Europe/Vilnius','Vilnius'),
('75','UTC+03:00','Asia/Baghdad','Baghdad'),
('76','UTC+03:00','Asia/Kuwait','Kuwait'),
('77','UTC+03:00','Europe/Minsk','Minsk'),
('78','UTC+03:00','Africa/Nairobi','Nairobi'),
('79','UTC+03:00','Asia/Riyadh','Riyadh'),
('80','UTC+03:00','Europe/Volgograd','Volgograd'),
('81','UTC+03:30','Asia/Tehran','Tehran'),
('82','UTC+04:00','Asia/Muscat','Abu Dhabi'),
('83','UTC+04:00','Asia/Baku','Baku'),
('84','UTC+04:00','Europe/Moscow','Moscow'),
('85','UTC+04:00','Asia/Muscat','Muscat'),
('86','UTC+04:00','Europe/Moscow','St. Petersburg'),
('87','UTC+04:00','Asia/Tbilisi','Tbilisi'),
('88','UTC+04:00','Asia/Yerevan','Yerevan'),
('89','UTC+04:30','Asia/Kabul','Kabul'),
('90','UTC+05:00','Asia/Karachi','Islamabad'),
('91','UTC+05:00','Asia/Karachi','Karachi'),
('92','UTC+05:00','Asia/Tashkent','Tashkent'),
('93','UTC+05:30','Asia/Calcutta','Chennai'),
('94','UTC+05:30','Asia/Kolkata','Kolkata'),
('95','UTC+05:30','Asia/Calcutta','Mumbai'),
('96','UTC+05:30','Asia/Calcutta','New Delhi'),
('97','UTC+05:30','Asia/Calcutta','Sri Jayawardenepura'),
('98','UTC+05:45','Asia/Katmandu','Kathmandu'),
('99','UTC+06:00','Asia/Almaty','Almaty'),
('100','UTC+06:00','Asia/Dhaka','Astana'),
('101','UTC+06:00','Asia/Dhaka','Dhaka'),
('102','UTC+06:00','Asia/Yekaterinburg','Ekaterinburg'),
('103','UTC+06:30','Asia/Rangoon','Rangoon'),
('104','UTC+07:00','Asia/Bangkok','Bangkok'),
('105','UTC+07:00','Asia/Bangkok','Hanoi'),
('106','UTC+07:00','Asia/Jakarta','Jakarta'),
('107','UTC+07:00','Asia/Novosibirsk','Novosibirsk'),
('108','UTC+08:00','Asia/Hong_Kong','Beijing'),
('109','UTC+08:00','Asia/Chongqing','Chongqing'),
('110','UTC+08:00','Asia/Hong_Kong','Hong Kong'),
('111','UTC+08:00','Asia/Krasnoyarsk','Krasnoyarsk'),
('112','UTC+08:00','Asia/Kuala_Lumpur','Kuala Lumpur'),
('113','UTC+08:00','Australia/Perth','Perth'),
('114','UTC+08:00','Asia/Singapore','Singapore'),
('115','UTC+08:00','Asia/Taipei','Taipei'),
('116','UTC+08:00','Asia/Ulan_Bator','Ulaan Bataar'),
('117','UTC-05:00','America/Lima','Lima'),
('118','UTC-05:00','US/East-Indiana','Indiana (East)'),
('119','UTC-05:00','US/Eastern','Eastern Time (US & Canada)'),
('120','UTC-05:00','America/Bogota','Bogota'),
('121','UTC-06:00','Canada/Saskatchewan','Saskatchewan'),
('122','UTC-06:00','America/Monterrey','Monterrey'),
('123','UTC-06:00','America/Mexico_City','Mexico City'),
('124','UTC-06:00','America/Mexico_City','Guadalajara'),
('125','UTC-06:00','US/Central','Central Time (US & Canada)'),
('126','UTC-06:00','America/Managua','Central America'),
('127','UTC-07:00','US/Mountain','Mountain Time (US & Canada)'),
('128','UTC-07:00','America/Mazatlan','Mazatlan'),
('129','UTC-07:00','America/Chihuahua','La Paz'),
('130','UTC-07:00','America/Chihuahua','Chihuahua'),
('131','UTC-07:00','US/Arizona','Arizona'),
('132','UTC-08:00','America/Tijuana','Tijuana'),
('133','UTC-08:00','America/Los_Angeles','Pacific Time (US & Canada)'),
('134','UTC-09:00','US/Alaska','Alaska'),
('135','UTC-10:00','Pacific/Honolulu','Hawaii'),
('136','UTC-11:00','Pacific/Samoa','Samoa'),
('137','UTC-11:00','Pacific/Midway','Midway Island'),
('138','UTC+12:00','Asia/Magadan','Magadan'),
('139','UTC+12:00','Pacific/Fiji','Marshall Is.'),
('140','UTC+12:00','Asia/Magadan','New Caledonia'),
('141','UTC+12:00','Asia/Magadan','Solomon Is.'),
('142','UTC+12:00','Pacific/Auckland','Wellington'),
('143','UTC+13:00','Pacific/Tongatapu','Nuku\'alofa');
# ------------------------------------
# structure for table 'transporteur'
# ------------------------------------
DROP TABLE IF EXISTS transporteur ;
CREATE TABLE transporteur (
T_CODE varchar(6) NOT NULL,
T_NAME varchar(30) NOT NULL,
PRIMARY KEY (T_CODE)
);
# ------------------------------------
# data for table 'transporteur'
# ------------------------------------
INSERT INTO transporteur (T_CODE,T_NAME) VALUES
('AP','Ambulance priv�e'),
('AUTR','Autre type de transport'),
('HELI','H�licopt�re'),
('SAMU','SAMU ou SMUR'),
('SP','Sapeurs pompiers');
# ------------------------------------
# structure for table 'type_agrement'
# ------------------------------------
DROP TABLE IF EXISTS type_agrement ;
CREATE TABLE type_agrement (
TA_CODE varchar(7) NOT NULL,
CA_CODE varchar(5) NOT NULL,
TA_DESCRIPTION varchar(75) NOT NULL,
TA_FLAG tinyint(4) DEFAULT '0' NOT NULL,
PRIMARY KEY (TA_CODE)
);
# ------------------------------------
# data for table 'type_agrement'
# ------------------------------------
INSERT INTO type_agrement (TA_CODE,CA_CODE,TA_DESCRIPTION,TA_FLAG) VALUES
('37','CON','Missions de secours d�urgence aux personnes','0'),
('38','CON','Actions de soutien aux populations et de formation','0'),
('A1','SEC','Op�rations de secours � personnes et sauvetage','0'),
('A2','SEC','Recherche cynophile','0'),
('A-Aqua','SEC','Sauvetage aquatique','0'),
('AUT','ASS','Autorisation d\'exercice','0'),
('AUTRE','CONSP','Convention Sp�cifique autre','1'),
('B','SEC','Actions de soutien aux populations sinistr�es','0'),
('BNSSA','FOR','Formations au B.N.S.S.A','0'),
('C','SEC','Encadrement des b�n�voles lors des actions de soutien','0'),
('CONTR','ASS','Contribution f�d�rale','0'),
('COTIS','ASS','Cotisation f�d�rale','0'),
('APS-ASD','ENT','Acteur Pr�vention Secours / Aide et soins � domicile','0'),
('CUMP','CONSP','Convention CUMP','1'),
('D','SEC','Dispositif pr�visionnel de secours','0'),
('ERDF','CONSP','Convention avec ERDF','1'),
('PCS','CONSP','Convention Plans Communaux de Sauvegarde','1'),
('PRAP','ENT','Formation Pr�vention des Risques li�s � l\'Activit� Physique','0'),
('PREF','CONSP','Convention avec la Pr�fecture','1'),
('GQS','FOR','Sensibilisation aux Gestes Qui Sauvent','0'),
('SNCF','CONSP','Convention avec la SNCF','1'),
('SST','ENT','Formation Sauveteur Secouriste du Travail','0'),
('TRIP','CONSP','Convention tripartite','1'),
('CD','_MED','Acte de Courage et de D�vouement','2'),
('GO','_MED','M�daille Grand Or de la S�curit� Civile','2'),
('SC','SPE','Secourisme canin','0'),
('PSSP','SPE','Premiers Secours Socio-psychologiques','0'),
('CE','SPE','Chef d\'�quipe','0'),
('CP','SPE','Chef de poste','0'),
('PSC1','FOR','Formation Pr�vention et Secours Civiques de niveau 1','0'),
('PAE-PSC','FOR','Formation de formateur en Pr�vention et Secours Civiques de niveau 1','0'),
('PAE-PS','FOR','Formation de formateur aux Premiers Secours','0'),
('PS','FOR','Formation de formateur aux Premiers Secours','0'),
('D-Aqua','SEC','S�curit� de la pratique des activit�s aquatiques','0');
# ------------------------------------
# structure for table 'type_agrement_valeur'
# ------------------------------------
DROP TABLE IF EXISTS type_agrement_valeur ;
CREATE TABLE type_agrement_valeur (
TAV_ID smallint(6) NOT NULL,
TA_CODE varchar(5) NOT NULL,
TA_SHORT varchar(8),
TA_VALEUR varchar(40) NOT NULL,
TA_FLAG smallint(6) NOT NULL,
PRIMARY KEY (TAV_ID),
KEY TA_CODE (TA_CODE)
);
# ------------------------------------
# data for table 'type_agrement_valeur'
# ------------------------------------
INSERT INTO type_agrement_valeur (TAV_ID,TA_CODE,TA_SHORT,TA_VALEUR,TA_FLAG) VALUES
('1','D','-','Aucun DPS possible','0'),
('2','D','PAPS','Point alerte et premiers secours (max 2)','2'),
('3','D','DPS-PE','Petite envergure (max 12)','12'),
('4','D','DPS-ME','Moyenne envergure (max 36)','36'),
('5','D','DPS-GE','Grande envergure (plus de 36)','999');
# ------------------------------------
# structure for table 'type_bilan'
# ------------------------------------
DROP TABLE IF EXISTS type_bilan ;
CREATE TABLE type_bilan (
TB_ID smallint(6) NOT NULL auto_increment,
TE_CODE varchar(5) NOT NULL,
TB_NUM tinyint(4) NOT NULL,
TB_LIBELLE varchar(40) NOT NULL,
VICTIME_DETAIL varchar(50),
VICTIME_DETAIL2 varchar(50),
PRIMARY KEY (TB_ID),
KEY TE_CODE (TE_CODE)
);
# ------------------------------------
# data for table 'type_bilan'
# ------------------------------------
INSERT INTO type_bilan (TB_ID,TE_CODE,TB_NUM,TB_LIBELLE,VICTIME_DETAIL,VICTIME_DETAIL2) VALUES
('1','DPS','1','secours � personnes','VI_SOINS','VI_MALAISE'),
('2','DPS','2','�vacuations r�alis�es','VI_TRANSPORT',NULL),
('3','GAR','1','interventions','INTERVENTIONS',NULL),
('4','GAR','2','�vacuations r�alis�es','VI_TRANSPORT',NULL),
('5','MAR','1','personnes rencontr�es','VICTIMES',NULL),
('6','MAR','2','transports','VI_TRANSPORT',NULL),
('7','DPS','3','personnes assist�es','VI_INFORMATION',NULL),
('8','VACCI','1','secours � personnes','VI_SOINS','VI_MALAISE'),
('9','VACCI','2','�vacuations r�alis�es','VI_TRANSPORT',NULL),
('14','NAUT','1','secours � personnes','VI_SOINS','VI_MALAISE'),
('15','NAUT','2','�vacuations r�alis�es','VI_TRANSPORT',NULL),
('16','NAUT','3','personnes assist�es','VI_INFORMATION',NULL),
('17','COOP','1','personnes transport�es','VI_TRANSPORT',NULL),
('18','AIP','1','secours � personnes','VI_SOINS','VI_MALAISE'),
('19','AIP','2','�vacuations r�alis�es','VI_TRANSPORT',NULL),
('20','AIP','3','personnes assist�es','VI_INFORMATION',NULL),
('21','DPS','4','personnes d�c�d�es','VI_DECEDE',NULL),
('22','AH','1','Personnes assist�es','VI_INFORMATION','VI_SOINS');
# ------------------------------------
# structure for table 'type_civilite'
# ------------------------------------
DROP TABLE IF EXISTS type_civilite ;
CREATE TABLE type_civilite (
TC_ID tinyint(1) NOT NULL,
TC_LIBELLE varchar(25) NOT NULL,
TC_SHORT varchar(5),
PRIMARY KEY (TC_ID),
   UNIQUE TC_LIBELLE (TC_LIBELLE)
);
# ------------------------------------
# data for table 'type_civilite'
# ------------------------------------
INSERT INTO type_civilite (TC_ID,TC_LIBELLE,TC_SHORT) VALUES
('5','Femelle',NULL),
('4','M�le',NULL),
('2','Madame','Mme.'),
('3','Autre','Au.'),
('1','Monsieur','M.');
# ------------------------------------
# structure for table 'type_company'
# ------------------------------------
DROP TABLE IF EXISTS type_company ;
CREATE TABLE type_company (
TC_CODE varchar(8) NOT NULL,
TC_LIBELLE varchar(30) NOT NULL,
PRIMARY KEY (TC_CODE)
);
# ------------------------------------
# data for table 'type_company'
# ------------------------------------
INSERT INTO type_company (TC_CODE,TC_LIBELLE) VALUES
('ASSOC','Association'),
('COLLEGE','Coll�ge'),
('ECOLE','Ecole'),
('ENTPRIV','Entreprise priv�e'),
('ENTPUB','Entreprise publique'),
('LYCEE','Lyc�e'),
('MAIRIE','Mairie');
# ------------------------------------
# structure for table 'type_company_role'
# ------------------------------------
DROP TABLE IF EXISTS type_company_role ;
CREATE TABLE type_company_role (
TCR_CODE varchar(5) NOT NULL,
TCR_DESCRIPTION varchar(40) NOT NULL,
TCR_FLAG tinyint(4),
PRIMARY KEY (TCR_CODE)
);
# ------------------------------------
# data for table 'type_company_role'
# ------------------------------------
INSERT INTO type_company_role (TCR_CODE,TCR_DESCRIPTION,TCR_FLAG) VALUES
('MED','M�decin r�f�rent',NULL),
('MED2','M�decin suppl�mentaire','0'),
('MED3','M�decin suppl�mentaire','0'),
('RF','Responsable formations',NULL),
('RO','Responsable op�rationnel',NULL);
# ------------------------------------
# structure for table 'type_conditionnement'
# ------------------------------------
DROP TABLE IF EXISTS type_conditionnement ;
CREATE TABLE type_conditionnement (
TCO_CODE char(2) NOT NULL,
TCO_DESCRIPTION varchar(60) NOT NULL,
TCO_ORDER tinyint(4) NOT NULL,
PRIMARY KEY (TCO_CODE)
);
# ------------------------------------
# data for table 'type_conditionnement'
# ------------------------------------
INSERT INTO type_conditionnement (TCO_CODE,TCO_DESCRIPTION,TCO_ORDER) VALUES
('BI','Bidon','60'),
('BN','Bonbonne','70'),
('BO','Bouteille','60'),
('BR','Brique','46'),
('BT','Bo�te','10'),
('CA','Caisse','20'),
('CG','Cageot','30'),
('DO','Dosette','40'),
('EI','Emballage individuel','90'),
('FL','Flacon','50'),
('JC','Jerrican','80'),
('PE','Pas emball�','100'),
('RL','Rouleau','44'),
('SA','Sachet','45');
# ------------------------------------
# structure for table 'type_consommable'
# ------------------------------------
DROP TABLE IF EXISTS type_consommable ;
CREATE TABLE type_consommable (
TC_ID int(11) NOT NULL auto_increment,
CC_CODE varchar(12) NOT NULL,
TC_DESCRIPTION varchar(60) NOT NULL,
TC_CONDITIONNEMENT char(2) NOT NULL,
TC_UNITE_MESURE char(2) NOT NULL,
TC_QUANTITE_PAR_UNITE float NOT NULL,
TC_PEREMPTION tinyint(4) DEFAULT '0' NOT NULL,
PRIMARY KEY (TC_ID),
KEY CC_CODE (CC_CODE)
);
# ------------------------------------
# data for table 'type_consommable'
# ------------------------------------
INSERT INTO type_consommable (TC_ID,CC_CODE,TC_DESCRIPTION,TC_CONDITIONNEMENT,TC_UNITE_MESURE,TC_QUANTITE_PAR_UNITE,TC_PEREMPTION) VALUES
('1','ALIMENTATION','Eau','BO','cl','150','0'),
('2','ALIMENTATION','Eau','BN','li','10','0'),
('3','ALIMENTATION','Soupe','BR','li','1','1'),
('4','ALIMENTATION','Sucre en morceaux','BT','kg','1','1'),
('5','ALIMENTATION','dosette caf� soluble','EI','un','1','1'),
('6','ALIMENTATION','dosette boisson chocolat�e','EI','un','1','1'),
('7','ALIMENTATION','gobelet','PE','un','1','0'),
('8','ALIMENTATION','cuill�re en plastique / touillette','PE','un','1','0'),
('9','PHARMACIE','Dosiseptine','DO','ml','10','0'),
('10','PHARMACIE','Chlorure de sodium / s�rum physiologique','DO','ml','10','0'),
('11','PHARMACIE','Dakin stabilis�','DO','ml','10','0'),
('12','PHARMACIE','Compresses st�riles','EI','un','1','0'),
('13','PHARMACIE','Collier cervical adulte','EI','un','1','0'),
('14','PHARMACIE','Collier cervical enfant','EI','un','1','0'),
('15','PHARMACIE','Masque haute concentration adulte','EI','un','1','0'),
('16','PHARMACIE','Masque haute concentration enfant','EI','un','1','0'),
('17','PHARMACIE','gants � usage unique S','BT','un','100','0'),
('18','PHARMACIE','gants � usage unique M','BT','un','100','0'),
('19','PHARMACIE','gants � usage unique L','BT','un','100','0'),
('20','PHARMACIE','gants � usage unique XL','BT','un','100','0'),
('21','PHARMACIE','solution hydro-alcoolique','FL','cl','1','0'),
('22','VEHICULES','Essence groupe �lectrog�ne','JC','li','10','0'),
('23','VEHICULES','Essence groupe �lectrog�ne','JC','li','20','0'),
('24','VEHICULES','Gasoil groupe �lectrog�ne','JC','li','20','0'),
('25','VEHICULES','Huile moteur','BI','li','5','0'),
('26','VEHICULES','Liquide lave glace','BI','li','5','0'),
('27','VEHICULES','Liquide de freins','BI','li','5','0'),
('28','ENTRETIEN','D�sinfectant surface','FL','cl','50','0'),
('29','ENTRETIEN','Alkidiol','FL','cl','50','0'),
('30','ENTRETIEN','Solution hydro-alcoolique','FL','cl','50','0'),
('31','ENTRETIEN','Spray d�sinfectant de surface','FL','cl','50','0'),
('32','ENTRETIEN','Liquide vaisselle','FL','cl','100','0'),
('33','ENTRETIEN','Papier toilette rouleau','PE','un','1','0'),
('34','BUREAU','Ramette Papier A4','EI','un','500','1'),
('35','BUREAU','Cartouche encre pour imprimante','EI','un','1','0'),
('36','BUREAU','main courante','EI','un','1','0'),
('37','BUREAU','fiche d\'intervention','EI','un','1','0'),
('38','BUREAU','bracelet d\'identification adulte','EI','un','1','0'),
('39','BUREAU','bracelet d\'identification enfant','EI','un','1','0'),
('40','PHARMACIE','protection de sonde pour thermom�tre tympanique','EI','un','1','0'),
('41','PHARMACIE','coussin H�mostatique d\'urgence','EI','un','1','0'),
('42','PHARMACIE','antiseptique','DO','ml','5','0'),
('43','PHARMACIE','champs st�rile','EI','un','1','0'),
('44','PHARMACIE','bande extensible','EI','un','1','0'),
('45','PHARMACIE','pansements pr�-d�coup�s','EI','un','1','0'),
('46','PHARMACIE','sparadrap rouleau','EI','un','1','0'),
('47','PHARMACIE','pansement absorbant, am�ricain','EI','un','1','0'),
('48','PHARMACIE','gants st�riles','EI','un','1','0'),
('49','PHARMACIE','compresses brulure','EI','un','1','0'),
('50','PHARMACIE','couverture de survie','EI','un','1','0'),
('51','PHARMACIE','couverture de survie st�rile','EI','un','1','0'),
('52','PHARMACIE','�charpe triangulaire','EI','un','1','0'),
('53','PHARMACIE','poche de froid','EI','un','1','0'),
('54','PHARMACIE','tuyau patient pour aspirateur de mucosit�s','EI','un','1','0'),
('55','PHARMACIE','masque insufflateur adulte','EI','un','1','0'),
('56','PHARMACIE','masque insufflateur enfant','EI','un','1','0'),
('57','PHARMACIE','masque insufflateur nourisson','EI','un','1','0'),
('58','PHARMACIE','tubulure � oxyg�ne','EI','un','1','0'),
('59','PHARMACIE','raccord biconique','EI','un','1','0'),
('60','PHARMACIE','sonde d\'aspiration adulte','EI','un','1','0'),
('61','PHARMACIE','sonde d\'aspiration p�diatrique','EI','un','1','0'),
('62','PHARMACIE','stop vide','EI','un','1','0'),
('63','PHARMACIE','canule de Gu�del taille 00','EI','un','1','0'),
('64','PHARMACIE','canule de Gu�del taille 0','EI','un','1','0'),
('65','PHARMACIE','canule de Gu�del taille 1','EI','un','1','0'),
('66','PHARMACIE','canule de Gu�del taille 2','EI','un','1','0'),
('67','PHARMACIE','canule de Gu�del taille 3','EI','un','1','0'),
('68','PHARMACIE','canule de Gu�del taille 4','EI','un','1','0'),
('69','PHARMACIE','canule de Gu�del taille 5','EI','un','1','0'),
('70','PHARMACIE','masque FFP2','EI','un','1','0'),
('71','PHARMACIE','masque chirurgical','EI','un','1','0'),
('72','PHARMACIE','drap d\'h�pital','PE','un','1','0'),
('73','VEHICULES','Gasoil','PE','li','1','0'),
('74','VEHICULES','Essence SP','PE','li','1','0');
# ------------------------------------
# structure for table 'type_document'
# ------------------------------------
DROP TABLE IF EXISTS type_document ;
CREATE TABLE type_document (
TD_CODE varchar(5) NOT NULL,
TD_LIBELLE varchar(50) NOT NULL,
TD_SECURITY tinyint(4) DEFAULT '0' NOT NULL,
TD_SYNDICATE tinyint(4) DEFAULT '0' NOT NULL,
PRIMARY KEY (TD_CODE)
);
# ------------------------------------
# data for table 'type_document'
# ------------------------------------
INSERT INTO type_document (TD_CODE,TD_LIBELLE,TD_SECURITY,TD_SYNDICATE) VALUES
('AC','Aucune cat�gorie','0','0'),
('CACH','Centrale d\'achat','0','0'),
('COMM','Communication','0','1'),
('CRAG','Compte rendu assembl�e g�n�rale','0','0'),
('CRR','Compte rendu de r�union','0','0'),
('CRSS','Compte Rendus R�unions Statutaires','52','1'),
('DIV','Documents divers','0','0'),
('DOCAD','Documentation administrative','0','0'),
('DOCOP','Proc�dures op�rationnelles','0','0'),
('FOR','Formation','0','0'),
('MAT','Mat�riel','0','0'),
('MODEL','Mod�le de document','0','0'),
('NS','Note de service','0','0'),
('REVP','Revue de Presse','0','1'),
('TRANS','Transmission','0','0'),
('VEHI','V�hicules','0','0');
# ------------------------------------
# structure for table 'type_element_facturable'
# ------------------------------------
DROP TABLE IF EXISTS type_element_facturable ;
CREATE TABLE type_element_facturable (
TEF_CODE varchar(6) NOT NULL,
TEF_NAME varchar(60) NOT NULL,
PRIMARY KEY (TEF_CODE)
);
# ------------------------------------
# data for table 'type_element_facturable'
# ------------------------------------
INSERT INTO type_element_facturable (TEF_CODE,TEF_NAME) VALUES
('PRE','Prestation'),
('KM','Frais Km'),
('DIV','Frais Divers'),
('PREF','Prestation Formation'),
('PREO','Prestation Op�rationnelle'),
('PRED','Prestation Divers');
# ------------------------------------
# structure for table 'type_evenement'
# ------------------------------------
DROP TABLE IF EXISTS type_evenement ;
CREATE TABLE type_evenement (
TE_CODE varchar(5) NOT NULL,
TE_LIBELLE varchar(40) NOT NULL,
CEV_CODE varchar(5) DEFAULT 'C_DIV' NOT NULL,
TE_MAIN_COURANTE tinyint(4) DEFAULT '0' NOT NULL,
TE_VICTIMES tinyint(4) DEFAULT '0' NOT NULL,
TE_MULTI_DUPLI tinyint(4) DEFAULT '0' NOT NULL,
TE_ICON varchar(60),
EVAL_PAR_STAGIAIRES tinyint(4) DEFAULT '0' NOT NULL,
PROCES_VERBAL tinyint(4) DEFAULT '0' NOT NULL,
FICHE_PRESENCE tinyint(4) DEFAULT '0' NOT NULL,
ORDRE_MISSION tinyint(4) DEFAULT '1' NOT NULL,
CONVENTION tinyint(4) DEFAULT '0' NOT NULL,
EVAL_RISQUE tinyint(4) DEFAULT '0' NOT NULL,
CONVOCATIONS tinyint(4) DEFAULT '1' NOT NULL,
FACTURE_INDIV tinyint(4) DEFAULT '0' NOT NULL,
ACCES_RESTREINT tinyint(4) DEFAULT '0' NOT NULL,
TE_PERSONNEL tinyint(4) DEFAULT '1' NOT NULL,
TE_VEHICULES tinyint(4) DEFAULT '1' NOT NULL,
TE_MATERIEL tinyint(4) DEFAULT '1' NOT NULL,
TE_CONSOMMABLES tinyint(4) DEFAULT '1' NOT NULL,
COLONNE_RENFORT tinyint(4) DEFAULT '0' NOT NULL,
REMPLACEMENT tinyint(4) DEFAULT '0' NOT NULL,
PIQUET tinyint(4) DEFAULT '0' NOT NULL,
TE_MAP tinyint(4) DEFAULT '0' NOT NULL,
CLIENT tinyint(4) DEFAULT '0' NOT NULL,
TE_DPS tinyint(4) DEFAULT '0' NOT NULL,
TE_DOCUMENT tinyint(4) DEFAULT '0' NOT NULL,
TE_BILAN tinyint(4) DEFAULT '0' NOT NULL,
PRIMARY KEY (TE_CODE)
);
# ------------------------------------
# data for table 'type_evenement'
# ------------------------------------
INSERT INTO type_evenement (TE_CODE,TE_LIBELLE,CEV_CODE,TE_MAIN_COURANTE,TE_VICTIMES,TE_MULTI_DUPLI,TE_ICON,EVAL_PAR_STAGIAIRES,PROCES_VERBAL,FICHE_PRESENCE,ORDRE_MISSION,CONVENTION,EVAL_RISQUE,CONVOCATIONS,FACTURE_INDIV,ACCES_RESTREINT,TE_PERSONNEL,TE_VEHICULES,TE_MATERIEL,TE_CONSOMMABLES,COLONNE_RENFORT,REMPLACEMENT,PIQUET,TE_MAP,CLIENT,TE_DPS,TE_DOCUMENT,TE_BILAN) VALUES
('CER','C�r�monie','C_DIV','0','0','0','CER.png','0','0','1','1','0','0','1','0','0','1','1','1','1','0','1','1','1','1','0','1','0'),
('COM','Communication - Promotion','C_DIV','0','0','0','COM.png','0','0','0','1','0','0','1','0','0','1','1','1','1','0','0','0','1','0','0','1','0'),
('DIV','Activit� diverse','C_DIV','0','0','1','DIV.png','0','0','0','1','0','0','1','0','0','1','1','1','1','0','0','0','1','0','0','1','0'),
('FOR','Formation','C_FOR','0','0','0','FOR.png','1','1','1','1','1','0','1','1','0','1','1','1','1','0','0','0','1','1','0','1','0'),
('MC','Main courante','C_DIV','1','0','0','MC.png','0','0','0','1','0','0','1','0','1','1','0','0','0','0','1','1','1','1','0','1','0'),
('GAR','Garde','C_SEC','1','1','1','GAR.png','0','0','0','1','0','0','1','0','0','1','1','1','1','0','1','1','1','0','0','1','1'),
('MLA','Mission Logistique et Administrative','C_DIV','0','0','0','MLA.png','0','0','0','1','0','0','1','0','0','1','1','1','1','0','0','0','1','0','0','1','1'),
('REU','R�union','C_DIV','1','0','0','REU.png','0','0','1','1','0','0','1','0','0','1','1','1','1','0','1','1','1','1','0','1','0'),
('SPO','Comp�tition sportive','C_DIV','0','0','0','SPO.png','0','0','0','1','0','0','1','0','0','1','1','1','1','0','1','1','1','1','0','1','0'),
('TEC','Entretien, op�rations techniques','C_DIV','0','0','0','TEC.png','0','0','0','1','0','0','1','0','0','1','1','1','1','0','0','0','1','0','0','1','1'),
('WEB','Visio conf�rence','C_DIV','1','0','0','WEB.png','0','0','0','1','0','0','1','0','0','1','1','1','1','0','1','1','1','1','0','1','0');
# ------------------------------------
# structure for table 'type_evenement_log'
# ------------------------------------
DROP TABLE IF EXISTS type_evenement_log ;
CREATE TABLE type_evenement_log (
TEL_CODE varchar(2) NOT NULL,
TEL_DESCRIPTION varchar(30) NOT NULL,
PRIMARY KEY (TEL_CODE)
);
# ------------------------------------
# data for table 'type_evenement_log'
# ------------------------------------
INSERT INTO type_evenement_log (TEL_CODE,TEL_DESCRIPTION) VALUES
('I','Intervention'),
('M','Message');
# ------------------------------------
# structure for table 'type_fonction_vehicule'
# ------------------------------------
DROP TABLE IF EXISTS type_fonction_vehicule ;
CREATE TABLE type_fonction_vehicule (
TFV_ID smallint(6) NOT NULL auto_increment,
TFV_NAME varchar(40) NOT NULL,
TFV_ORDER smallint(6) NOT NULL,
TFV_DESCRIPTION varchar(200),
PRIMARY KEY (TFV_ID)
);
# ------------------------------------
# data for table 'type_fonction_vehicule'
# ------------------------------------
INSERT INTO type_fonction_vehicule (TFV_ID,TFV_NAME,TFV_ORDER,TFV_DESCRIPTION) VALUES
('1','Groupe �lectrog�ne','1',NULL),
('2','Reconnaissance','2',NULL),
('3','PC','3',NULL),
('4','Soutien Sanitaire','4',NULL),
('5','Commandement','5',NULL),
('6','Pompage','6',NULL),
('7','Nettoyage','7',NULL),
('8','Cyno','8',NULL),
('9','Communication','9',NULL),
('10','Logistique','10',NULL),
('11','Transport de personnels','11',NULL);
# ------------------------------------
# structure for table 'type_fonctionnalite'
# ------------------------------------
DROP TABLE IF EXISTS type_fonctionnalite ;
CREATE TABLE type_fonctionnalite (
TF_ID tinyint(4) NOT NULL,
TF_DESCRIPTION varchar(40) NOT NULL,
PRIMARY KEY (TF_ID)
);
# ------------------------------------
# data for table 'type_fonctionnalite'
# ------------------------------------
INSERT INTO type_fonctionnalite (TF_ID,TF_DESCRIPTION) VALUES
('0','g�n�ral'),
('1','configuration'),
('2','s�curit�'),
('3','param�trage'),
('4','personnel'),
('5','comp�tences'),
('6','activit�s'),
('7','administratif'),
('8','gardes'),
('9','information'),
('10','notifications'),
('11','module');
# ------------------------------------
# structure for table 'type_formation'
# ------------------------------------
DROP TABLE IF EXISTS type_formation ;
CREATE TABLE type_formation (
TF_CODE varchar(1) NOT NULL,
TF_LIBELLE varchar(45) NOT NULL,
PRIMARY KEY (TF_CODE)
);
# ------------------------------------
# data for table 'type_formation'
# ------------------------------------
INSERT INTO type_formation (TF_CODE,TF_LIBELLE) VALUES
('C','formation compl�mentaire'),
('I','formation initiale/dipl�me'),
('P','pr�requis � une formation'),
('R','formation continue'),
('S','S�minaire'),
('T','initiation'),
('M','Maintien et Actualisation des Comp�tences');
# ------------------------------------
# structure for table 'type_garde'
# ------------------------------------
DROP TABLE IF EXISTS type_garde ;
CREATE TABLE type_garde (
EQ_ID smallint(6) NOT NULL,
EQ_NOM varchar(30) NOT NULL,
EQ_JOUR tinyint(4) DEFAULT '0' NOT NULL,
EQ_NUIT tinyint(4) DEFAULT '0' NOT NULL,
S_ID smallint(6) DEFAULT '0' NOT NULL,
EQ_PERSONNEL1 smallint(6) DEFAULT '0' NOT NULL,
EQ_PERSONNEL2 smallint(6) DEFAULT '0' NOT NULL,
EQ_VEHICULES tinyint(4) DEFAULT '0' NOT NULL,
EQ_SPP tinyint(4) DEFAULT '0' NOT NULL,
EQ_DEBUT1 time,
EQ_FIN1 time,
EQ_DUREE1 float,
EQ_DEBUT2 time,
EQ_FIN2 time,
EQ_DUREE2 float,
EQ_ICON varchar(150),
ASSURE_PAR1 smallint(6) DEFAULT '0' NOT NULL,
ASSURE_PAR2 smallint(6) DEFAULT '0' NOT NULL,
ASSURE_PAR_DATE datetime,
EQ_REGIME_TRAVAIL tinyint(4) DEFAULT '0' NOT NULL,
EQ_ADDRESS varchar(200),
EQ_LIEU varchar(60),
EQ_ORDER tinyint(4) DEFAULT '0' NOT NULL,
EQ_DEFAULT tinyint(1) DEFAULT '0' NOT NULL,
PRIMARY KEY (EQ_ID),
KEY S_ID (S_ID)
);
# ------------------------------------
# data for table 'type_garde'
# ------------------------------------

# ------------------------------------
# structure for table 'type_indisponibilite'
# ------------------------------------
DROP TABLE IF EXISTS type_indisponibilite ;
CREATE TABLE type_indisponibilite (
TI_CODE varchar(5) NOT NULL,
TI_LIBELLE varchar(40) NOT NULL,
TI_FLAG tinyint(4) DEFAULT '0' NOT NULL,
PRIMARY KEY (TI_CODE)
);
# ------------------------------------
# data for table 'type_indisponibilite'
# ------------------------------------
INSERT INTO type_indisponibilite (TI_CODE,TI_LIBELLE,TI_FLAG) VALUES
('PRO','raison professionnelle','0'),
('MAL','maladie / blessure','0'),
('FOR','formation','0'),
('FAM','raison familiale','0'),
('DIV','Autre Raison','0'),
('CA','Cong� Annuel','1'),
('CP','Cong�s pay�s','1'),
('RTT','R�duction du temps de travail','1'),
('RT','Repos r�gime de travail mixte','1'),
('REC','R�cup�ration','1'),
('RECFO','R�cup�ration li�e � une formation','1'),
('CET','Compte �pargne Temps','1'),
('ASA','Autorisation sp�ciale absence','1'),
('NAI','Cong� Naissance','1'),
('PAT','Cong� Paternit�','1'),
('ENFM','Enfant Malade','1'),
('ENFH','Enfant Hospitalis�','1'),
('AT','Accident en service command�','1'),
('MAT','Cong� Maternit�','1'),
('ASYND','Activit� Syndicale','1'),
('ELEC','Elections','1'),
('DISPO','Disponibilit�','1'),
('SUSP','Suspension activit�','0');
# ------------------------------------
# structure for table 'type_intervention'
# ------------------------------------
DROP TABLE IF EXISTS type_intervention ;
CREATE TABLE type_intervention (
TI_CODE varchar(5) NOT NULL,
TI_DESCRIPTION varchar(50) NOT NULL,
CI_CODE varchar(5) NOT NULL,
PRIMARY KEY (TI_CODE),
KEY CI_CODE (CI_CODE)
);
# ------------------------------------
# data for table 'type_intervention'
# ------------------------------------
INSERT INTO type_intervention (TI_CODE,TI_DESCRIPTION,CI_CODE) VALUES
('AP','alerte aux populations','MSPS'),
('ASSB','ass�chement / �puisement dans un autre b�timent','MSPS'),
('ASSH','ass�chement / �puisement dans une habitation','MSPS'),
('AVP2R','AVP 2 roues seul','PS'),
('AVPPV','AVP pi�ton / v�hicule','PS'),
('BACH','bachage de toiture','MSPS'),
('BLDOM','bl�ss� � domicile avec / sans d�gagement','PS'),
('BLESR','bless� suite � une rixe','PS'),
('BLLP','bless� lieu public avec / sans d�gagement','PS'),
('BRULG','br�lure grave','PS'),
('BRULS','br�lure simple','PS'),
('CHUT','chute','PS'),
('CHUTA','chute / menace de chute d\'arbre','MSPS'),
('CHUTO','chute / menace de chute autres objets','MSPS'),
('CONVU','convulsions sur LP/NP ou VP','PS'),
('DETRR','d�tresse respiratoire sur LP/NP ou VP','PS'),
('DOULT','douleur thoracique sur LP / NP ou VP','PS'),
('ERDF','d�clenchement ERDF','MSPS'),
('FNPC','d�clenchement FNPC','MSPS'),
('GLISS','glissement de terrain / coul�e de boue','MSPS'),
('INCO','inconscient ou PCI sur LP/NP ou VP','PS'),
('INNO1','inondations / crues sauvetage ou mise en s�curit�','MSPS'),
('INNO2','inondations / crues reconnaissance','MSPS'),
('INNO3','inondations / crues rondes','MSPS'),
('INTOX','Intoxication CO ou alimentaire','PS'),
('IVRED','personne en �tat d\'�bri�t� � domicile','PS'),
('IVREL','personne en �tat d\'�bri�t� sur LP / NP ou VP','PS'),
('MAL','malaise sur LP/NP ou VP','PS'),
('MALC','malaise cardiaque sur LP / NP ou VP','PS'),
('MALDO','malaise � domicile - bilan secouriste','PS'),
('MALLP','malaise sur lieu public - bilan secouriste','PS'),
('MALSP','malaise li� � une activit� sportive LP/NP ou VP','PS'),
('MANOE','manoeuvre ( formation de maintien des acquis)','MSPS'),
('MEP','mise en place CAI / CEHU / PRI','MSPS'),
('NETTO','nettoyage de chaus�e urgente','MSPS'),
('ORSEC','d�clenchement ORSEC','PS'),
('PNRPA','personne ne r�pondant pas aux appels','PS'),
('PREF','d�clenchement pr�fecture - activation COD','MSPS'),
('PROTB','protection de biens','MSPS'),
('RECHP','recherche de personne','MSPS'),
('REQUI','r�quisition','MSPS'),
('RUPTB','rupture de barrage ou digue','MSPS'),
('SDIS','d�clenchement SDIS','MSPS'),
('SNCF','d�clenchement SNCF','MSPS'),
('TS','tentative de suicide','PS');
# ------------------------------------
# structure for table 'type_materiel'
# ------------------------------------
DROP TABLE IF EXISTS type_materiel ;
CREATE TABLE type_materiel (
TM_ID int(11) NOT NULL auto_increment,
TM_CODE varchar(25) NOT NULL,
TM_DESCRIPTION varchar(60) NOT NULL,
TM_USAGE varchar(15) DEFAULT 'DIVERS' NOT NULL,
TM_LOT tinyint(4) DEFAULT '0' NOT NULL,
TT_CODE varchar(6),
PRIMARY KEY (TM_ID),
   UNIQUE TM_CODE (TM_USAGE, TM_CODE)
);
# ------------------------------------
# data for table 'type_materiel'
# ------------------------------------
INSERT INTO type_materiel (TM_ID,TM_CODE,TM_DESCRIPTION,TM_USAGE,TM_LOT,TT_CODE) VALUES
('2','LOT A','Sac de secours avec �quipement lot A','Sanitaire','0',NULL),
('3','LOT B','Sac de secours avec �quipement lot B','Sanitaire','0',NULL),
('4','LOT C','Sac de secours avec �quipement lot C (Hors VPS)','Sanitaire','0',NULL),
('5','Lits Picots','','H�bergement','0',NULL),
('6','DAE','D�fibrillateur automatique externe','Sanitaire','0',NULL),
('7','Oxyg�ne','','Sanitaire','0',NULL),
('8','Radios 450 Mhz','','Transmission','0',NULL),
('10','Radios 150 MHz','','Transmission','0',NULL),
('13','Valise P.C.','150 MHz','Transmission','0',NULL),
('14','Pantalons','','Habillement','0','PT'),
('15','Mannequins','','Formation','0',NULL),
('16','Groupes �lectog�nes','','El�ctrique','0',NULL),
('17','D.A.E.','','Formation','0',NULL),
('18','Portables','','Informatique','0',NULL),
('19','Fixes','','Informatique','0',NULL),
('20','Tentes','','H�bergement','0',NULL),
('21','Immobilisateurs de t�te','','Sanitaire','0',NULL),
('24','Vestes','','Habillement','0','US'),
('25','Parkas','','Habillement','0','US'),
('26','Polos','','Habillement','0','US'),
('27','Polaires','','Habillement','0','US'),
('28','Eclairages','','El�ctrique','0',NULL),
('29','Rallonges','','El�ctrique','0',NULL),
('30','Classeurs','','Formation','0',NULL),
('31','CD ROM','','Formation','0',NULL),
('32','Couvertures','','H�bergement','0',NULL),
('33','Sacs de Couchage','','H�bergement','0',NULL),
('34','Vid�os Projecteurs','','Informatique','0',NULL),
('35','Imprimantes','','Informatique','0',NULL),
('36','tee-shirts','','Habillement','0','US'),
('37','Valise P.C','450 MHz','Transmission','0',NULL),
('38','Antennes','','Transmission','0',NULL),
('39','Tron�onneuses','','Elagage','0',NULL),
('40','Thermos','','Logistique','0',NULL),
('41','Jerricanes Alimentaires','','Logistique','0',NULL),
('42','Claies de Portage','','Logistique','0',NULL),
('43','N�ons','','Eclairage','0',NULL),
('44','Tr�pieds Hallog�nes','','Eclairage','0',NULL),
('45','Brancards','','H�bergement','0',NULL),
('46','Jerricanes','','Divers','0',NULL),
('47','Brancards Pliants','','Sanitaire','0',NULL),
('48','Chaises Porteurs','','Sanitaire','0',NULL),
('49','Brancards Cuill�res','','Sanitaire','0',NULL),
('50','Chauffages Electriques','','H�bergement','0',NULL),
('51','Aspirateurs � eau','','Pompage','0',NULL),
('52','Motos Pompes','','Pompage','0',NULL),
('53','Seaux','','Pompage','0',NULL),
('54','Raclettes','','Pompage','0',NULL),
('55','Serpilli�res','','Pompage','0',NULL),
('56','Vides Caves','','Pompage','0',NULL),
('57','T�l�phones Portables','','Transmission','0',NULL),
('58','Extincteur � poudre','','Incendie','0',NULL),
('59','Extincteur � eau','','Incendie','0',NULL);
# ------------------------------------
# structure for table 'type_membre'
# ------------------------------------
DROP TABLE IF EXISTS type_membre ;
CREATE TABLE type_membre (
TM_ID tinyint(4) NOT NULL,
TM_SYNDICAT tinyint(4) DEFAULT '0' NOT NULL,
TM_CODE varchar(30) NOT NULL,
PRIMARY KEY (TM_ID, TM_SYNDICAT)
);
# ------------------------------------
# data for table 'type_membre'
# ------------------------------------
INSERT INTO type_membre (TM_ID,TM_SYNDICAT,TM_CODE) VALUES
('0','0','actif'),
('1','0','ancien - n\'a plus d\'activit�'),
('2','0','ancien - a d�missionn�'),
('3','0','ancien - d�c�d�'),
('4','0','ancien - radi�'),
('5','0','ancien - suspendu(e)');
# ------------------------------------
# structure for table 'type_message'
# ------------------------------------
DROP TABLE IF EXISTS type_message ;
CREATE TABLE type_message (
TM_ID tinyint(4) NOT NULL,
TM_LIBELLE varchar(30) NOT NULL,
TM_COLOR varchar(20) NOT NULL,
TM_ICON varchar(20),
PRIMARY KEY (TM_ID)
);
# ------------------------------------
# data for table 'type_message'
# ------------------------------------
INSERT INTO type_message (TM_ID,TM_LIBELLE,TM_COLOR,TM_ICON) VALUES
('0','information','#1bc5bd','sticky-note'),
('1','informatique','#3699ff','laptop'),
('2','urgent','#f64e60','exclamation-triangle');
# ------------------------------------
# structure for table 'type_paiement'
# ------------------------------------
DROP TABLE IF EXISTS type_paiement ;
CREATE TABLE type_paiement (
TP_ID tinyint(1) NOT NULL,
TP_DESCRIPTION varchar(25) NOT NULL,
PRIMARY KEY (TP_ID)
);
# ------------------------------------
# data for table 'type_paiement'
# ------------------------------------
INSERT INTO type_paiement (TP_ID,TP_DESCRIPTION) VALUES
('0','non renseign�'),
('1','pr�l�vement'),
('2','virement'),
('3','carte bancaire'),
('4','ch�que'),
('5','esp�ces');
# ------------------------------------
# structure for table 'type_participation'
# ------------------------------------
DROP TABLE IF EXISTS type_participation ;
CREATE TABLE type_participation (
TP_ID smallint(6) NOT NULL auto_increment,
TE_CODE varchar(5) NOT NULL,
TP_NUM smallint(6) NOT NULL,
TP_LIBELLE varchar(40) NOT NULL,
PS_ID int(11) DEFAULT '0' NOT NULL,
PS_ID2 int(11) DEFAULT '0' NOT NULL,
INSTRUCTOR tinyint(4) DEFAULT '0' NOT NULL,
EQ_ID smallint(6) DEFAULT '0' NOT NULL,
PRIMARY KEY (TP_ID),
KEY TE_CODE (TE_CODE),
KEY EQ_ID (EQ_ID)
);
# ------------------------------------
# data for table 'type_participation'
# ------------------------------------
INSERT INTO type_participation (TP_ID,TE_CODE,TP_NUM,TP_LIBELLE,PS_ID,PS_ID2,INSTRUCTOR,EQ_ID) VALUES
('1','FOR','1','Responsable p�dagogique','0','0','1','0'),
('2','FOR','2','Instructeur','0','0','1','0'),
('3','FOR','3','Aide moniteur','0','0','1','0'),
('4','FOR','4','Plastron','0','0','0','0');
# ------------------------------------
# structure for table 'type_profession'
# ------------------------------------
DROP TABLE IF EXISTS type_profession ;
CREATE TABLE type_profession (
TP_CODE varchar(6) NOT NULL,
TP_DESCRIPTION varchar(50) NOT NULL,
PRIMARY KEY (TP_CODE)
);
# ------------------------------------
# data for table 'type_profession'
# ------------------------------------
INSERT INTO type_profession (TP_CODE,TP_DESCRIPTION) VALUES
('PATS','Personnel Administratif Technique et Sp�cialis�'),
('SPP','Sapeur-Pompier Professionnel');
# ------------------------------------
# structure for table 'type_regime_travail'
# ------------------------------------
DROP TABLE IF EXISTS type_regime_travail ;
CREATE TABLE type_regime_travail (
TRT_CODE varchar(5) NOT NULL,
TRT_DESC varchar(80) NOT NULL,
TRT_ORDER tinyint(4) NOT NULL,
PRIMARY KEY (TRT_CODE)
);
# ------------------------------------
# data for table 'type_regime_travail'
# ------------------------------------
INSERT INTO type_regime_travail (TRT_CODE,TRT_DESC,TRT_ORDER) VALUES
('24h','Service op�rationnel en gardes de 24h','1'),
('12h','Service op�rationnel en gardes de 12h, principalement le jour','2'),
('SHR','Service hors rangs','3');
# ------------------------------------
# structure for table 'type_regularisation'
# ------------------------------------
DROP TABLE IF EXISTS type_regularisation ;
CREATE TABLE type_regularisation (
TR_ID tinyint(4) NOT NULL,
TR_DESCRIPTION varchar(40) NOT NULL,
PRIMARY KEY (TR_ID)
);
# ------------------------------------
# data for table 'type_regularisation'
# ------------------------------------
INSERT INTO type_regularisation (TR_ID,TR_DESCRIPTION) VALUES
('0','non renseign�'),
('1','ch�que'),
('2','virement'),
('3','ajout� sur le pr�l�vement suivant');
# ------------------------------------
# structure for table 'type_salarie'
# ------------------------------------
DROP TABLE IF EXISTS type_salarie ;
CREATE TABLE type_salarie (
TS_CODE varchar(5) NOT NULL,
TS_LIBELLE varchar(40) NOT NULL,
PRIMARY KEY (TS_CODE)
);
# ------------------------------------
# data for table 'type_salarie'
# ------------------------------------
INSERT INTO type_salarie (TS_CODE,TS_LIBELLE) VALUES
('SC','service civique'),
('TC','temps complet'),
('TP','temps partiel'),
('VNP','vacataire non permanent'),
('CAD','cadre'),
('SNU','service national universel');
# ------------------------------------
# structure for table 'type_statut_participation'
# ------------------------------------
DROP TABLE IF EXISTS type_statut_participation ;
CREATE TABLE type_statut_participation (
TSP_ID tinyint(4) NOT NULL,
TSP_CODE varchar(20) NOT NULL,
TSP_COLOR varchar(20) NOT NULL,
PRIMARY KEY (TSP_ID)
);
# ------------------------------------
# data for table 'type_statut_participation'
# ------------------------------------
INSERT INTO type_statut_participation (TSP_ID,TSP_CODE,TSP_COLOR) VALUES
('0','Engag�','red'),
('1','Dispo Base','green'),
('2','Dispo Domicile','blue'),
('3','En repos','white');
# ------------------------------------
# structure for table 'type_taille'
# ------------------------------------
DROP TABLE IF EXISTS type_taille ;
CREATE TABLE type_taille (
TT_CODE varchar(6) NOT NULL,
TT_NAME varchar(30) NOT NULL,
TT_DESCRIPTION varchar(60) NOT NULL,
TT_ORDER tinyint(4),
PRIMARY KEY (TT_CODE)
);
# ------------------------------------
# data for table 'type_taille'
# ------------------------------------
INSERT INTO type_taille (TT_CODE,TT_NAME,TT_DESCRIPTION,TT_ORDER) VALUES
('GANT','Taille des gants','4, 5, 6, ... 12','80'),
('NONE','Pas de mesure possible','sans taille ou taille unique','0'),
('PIED','Pointure','Pointure de chaussures ex: 41, 42','60'),
('PT','Taille pantalon','taille de pantalon 38, 40, 42, ','30'),
('SPT','Taille Surpantalon','Taille et longueur ex T3L, T2M','50'),
('TETE','Tour de tete','Tour de tete en cm ex: 56, 60 ...','70'),
('TTL','Tour de taille et longueur','Taille pantalon F1 ex: 88L, 92M','40'),
('US','Taille US','Taille t-shirt S, M, L, XL ...','10'),
('VESTE','Taille veste','Taille de veste 50, 52 ...','20');
# ------------------------------------
# structure for table 'type_unite_mesure'
# ------------------------------------
DROP TABLE IF EXISTS type_unite_mesure ;
CREATE TABLE type_unite_mesure (
TUM_CODE char(2) NOT NULL,
TUM_DESCRIPTION varchar(60) NOT NULL,
TUM_ORDER tinyint(4) NOT NULL,
PRIMARY KEY (TUM_CODE)
);
# ------------------------------------
# data for table 'type_unite_mesure'
# ------------------------------------
INSERT INTO type_unite_mesure (TUM_CODE,TUM_DESCRIPTION,TUM_ORDER) VALUES
('cl','Centilitre','30'),
('g','Gramme','60'),
('kg','Kilogramme','50'),
('li','Litre','20'),
('mg','Milligramme','70'),
('ml','Millilitre','40'),
('un','Unit�','10');
# ------------------------------------
# structure for table 'type_vehicule'
# ------------------------------------
DROP TABLE IF EXISTS type_vehicule ;
CREATE TABLE type_vehicule (
TV_CODE varchar(10) NOT NULL,
TV_LIBELLE varchar(60) NOT NULL,
TV_NB tinyint(4) DEFAULT '3' NOT NULL,
TV_USAGE varchar(12) DEFAULT 'SECOURS' NOT NULL,
TV_ICON varchar(150),
PRIMARY KEY (TV_CODE)
);
# ------------------------------------
# data for table 'type_vehicule'
# ------------------------------------
INSERT INTO type_vehicule (TV_CODE,TV_LIBELLE,TV_NB,TV_USAGE,TV_ICON) VALUES
('MOTO','Motocyclette','1','DIVERS','images/vehicules/icones/MOTO.png'),
('REM','Remorque','0','DIVERS','images/vehicules/icones/REM.png'),
('VELO','V�lo tout terrain','1','DIVERS','images/vehicules/icones/VELO.png'),
('VL','V�hicule l�ger','3','DIVERS','images/vehicules/icones/VL.png'),
('VTP','V�hicule de transport de personnel','9','DIVERS','images/vehicules/icones/BUS.png'),
('VLHR','V�hicule l�ger hors route','2','DIVERS','images/vehicules/icones/VLHR.png');
# ------------------------------------
# structure for table 'type_vehicule_role'
# ------------------------------------
DROP TABLE IF EXISTS type_vehicule_role ;
CREATE TABLE type_vehicule_role (
TV_CODE varchar(10) NOT NULL,
ROLE_ID tinyint(4) DEFAULT '0' NOT NULL,
ROLE_NAME varchar(25) NOT NULL,
PS_ID int(11) DEFAULT '0' NOT NULL,
PRIMARY KEY (TV_CODE, ROLE_ID)
);
# ------------------------------------
# data for table 'type_vehicule_role'
# ------------------------------------
INSERT INTO type_vehicule_role (TV_CODE,ROLE_ID,ROLE_NAME,PS_ID) VALUES
('VL','1','chef','0'),
('VL','2','conducteur','0'),
('VLHR','1','chef','0'),
('VLHR','2','conducteur','0');
# ------------------------------------
# structure for table 'vehicule'
# ------------------------------------
DROP TABLE IF EXISTS vehicule ;
CREATE TABLE vehicule (
V_ID int(11) DEFAULT '0' NOT NULL,
TV_CODE varchar(10) NOT NULL,
V_IMMATRICULATION varchar(15),
V_COMMENT varchar(600),
VP_ID varchar(5) DEFAULT 'OP' NOT NULL,
V_MODELE varchar(20),
V_KM int(11),
V_KM_REVISION int(11),
EQ_ID tinyint(4) DEFAULT '1' NOT NULL,
V_ANNEE year(4),
S_ID smallint(6) DEFAULT '4' NOT NULL,
V_ASS_DATE date,
V_CT_DATE date,
V_REV_DATE date,
V_TITRE_DATE date,
V_EXTERNE tinyint(4),
V_INVENTAIRE varchar(40),
V_UPDATE_DATE date,
V_UPDATE_BY int(11),
V_INDICATIF varchar(20),
V_FLAG1 tinyint(4) DEFAULT '0' NOT NULL,
V_FLAG2 tinyint(4) DEFAULT '0' NOT NULL,
V_FLAG3 tinyint(4) DEFAULT '0' NOT NULL,
V_FLAG4 tinyint(4) DEFAULT '0' NOT NULL,
AFFECTED_TO int(11),
PRIMARY KEY (V_ID),
KEY S_ID (S_ID),
KEY AFFECTED_TO (AFFECTED_TO),
KEY VP_ID (VP_ID),
KEY V_ANNEE (V_ANNEE)
);
# ------------------------------------
# data for table 'vehicule'
# ------------------------------------

# ------------------------------------
# structure for table 'vehicule_position'
# ------------------------------------
DROP TABLE IF EXISTS vehicule_position ;
CREATE TABLE vehicule_position (
VP_ID varchar(5) NOT NULL,
VP_LIBELLE varchar(40) NOT NULL,
VP_OPERATIONNEL tinyint(4) DEFAULT '0' NOT NULL,
PRIMARY KEY (VP_ID)
);
# ------------------------------------
# data for table 'vehicule_position'
# ------------------------------------
INSERT INTO vehicule_position (VP_ID,VP_LIBELLE,VP_OPERATIONNEL) VALUES
('ARM','armement � compl�ter','0'),
('CAR','plein de carburant','0'),
('DET','d�truit','-1'),
('EAU','remplissage tonne','0'),
('HUI','niveau d\'huile','0'),
('IND','autre indisponibilit�','1'),
('LIM','usage limit�','2'),
('OP','op�rationnel','3'),
('PAN','en panne','1'),
('PNE','pression des pneumatiques','0'),
('PRE','en pr�t','2'),
('REF','r�form�','-1'),
('REP','en r�paration','1'),
('REV','en r�vision','1'),
('VEN','vendu','-1'),
('VOL','vol�','-1'),
('PER','perdu','-1'),
('RENDU','rendu','-1');
# ------------------------------------
# structure for table 'version_history'
# ------------------------------------
DROP TABLE IF EXISTS version_history ;
CREATE TABLE version_history (
VH_ID smallint(6) NOT NULL auto_increment,
PATCH_VERSION varchar(10) NOT NULL,
VH_DATE datetime NOT NULL,
VH_BY int(11) NOT NULL,
PRIMARY KEY (VH_ID),
KEY PATCH_VERSION (PATCH_VERSION)
);
# ------------------------------------
# data for table 'version_history'
# ------------------------------------
INSERT INTO version_history (VH_ID,PATCH_VERSION,VH_DATE,VH_BY) VALUES
('1','5.3.0','2021-04-12 21:32:22','1'),
('2','5.3.0','2021-04-12 21:32:22','1');
# ------------------------------------
# structure for table 'victime'
# ------------------------------------
DROP TABLE IF EXISTS victime ;
CREATE TABLE victime (
VI_ID int(11) NOT NULL auto_increment,
EL_ID int(11) DEFAULT '0' NOT NULL,
CAV_ID int(11) DEFAULT '0' NOT NULL,
VI_NUMEROTATION smallint(6),
VI_NOM varchar(30),
VI_PRENOM varchar(20),
VI_ADDRESS varchar(150),
VI_BIRTHDATE date,
VI_AGE tinyint(4),
VI_SEXE char(1) DEFAULT 'M' NOT NULL,
VI_PAYS smallint(6) DEFAULT '65' NOT NULL,
VI_DETRESSE_VITALE tinyint(4) DEFAULT '0' NOT NULL,
VI_DECEDE tinyint(4) DEFAULT '0' NOT NULL,
VI_MALAISE tinyint(4) DEFAULT '0' NOT NULL,
VI_INFORMATION tinyint(4) DEFAULT '0' NOT NULL,
VI_SOINS tinyint(4) DEFAULT '0' NOT NULL,
VI_MEDICALISE tinyint(4) DEFAULT '0' NOT NULL,
VI_REFUS tinyint(4) DEFAULT '0' NOT NULL,
VI_IMPLIQUE tinyint(4) DEFAULT '0' NOT NULL,
VI_TRANSPORT tinyint(4) DEFAULT '0' NOT NULL,
VI_VETEMENT tinyint(4) DEFAULT '0' NOT NULL,
VI_ALIMENTATION tinyint(4) DEFAULT '0' NOT NULL,
VI_REPOS tinyint(4) DEFAULT '0' NOT NULL,
VI_REPARTI tinyint(4) DEFAULT '0' NOT NULL,
VI_TRAUMATISME tinyint(4) DEFAULT '0' NOT NULL,
D_CODE varchar(6) DEFAULT 'NR' NOT NULL,
T_CODE varchar(6) DEFAULT 'ASS' NOT NULL,
VI_COMMENTAIRE varchar(1000),
CAV_ENTREE datetime,
CAV_SORTIE datetime,
CAV_RAISON varchar(50),
CAV_REGULATED tinyint(4) DEFAULT '0' NOT NULL,
IDENTIFICATION varchar(40),
HEURE_HOPITAL time,
PRIMARY KEY (VI_ID),
KEY EL_ID (EL_ID),
KEY VI_DETRESSE_VITALE (VI_DETRESSE_VITALE),
KEY VI_DECEDE (VI_DECEDE),
KEY VI_INFORMATION (VI_INFORMATION),
KEY VI_MALAISE (VI_MALAISE),
KEY VI_TRANSPORT (VI_TRANSPORT),
KEY VI_SOINS (VI_SOINS),
KEY VI_VETEMENT (VI_VETEMENT),
KEY VI_ALIMENTATION (VI_ALIMENTATION),
KEY VI_REFUS (VI_REFUS),
KEY D_CODE (D_CODE),
KEY T_CODE (T_CODE),
KEY VI_PAYS (VI_PAYS),
KEY VI_MEDICALISE (VI_MEDICALISE),
KEY CAV_ID (CAV_ID),
KEY CAV_REGULATED (CAV_REGULATED),
KEY CAV_ENTREE (CAV_ENTREE),
KEY VI_REPOS (VI_REPOS),
KEY VI_IMPLIQUE (VI_IMPLIQUE)
);
# ------------------------------------
# data for table 'victime'
# ------------------------------------

# ------------------------------------
# structure for table 'widget'
# ------------------------------------
DROP TABLE IF EXISTS widget ;
CREATE TABLE widget (
W_ID smallint(6) NOT NULL,
W_TYPE varchar(40) DEFAULT 'box' NOT NULL,
W_FUNCTION varchar(50),
W_TITLE varchar(60) NOT NULL,
W_LINK varchar(200),
W_LINK_COMMENT varchar(200),
W_ICON varchar(25),
W_COLUMN tinyint(4) DEFAULT '1' NOT NULL,
W_ORDER tinyint(4) DEFAULT '1' NOT NULL,
PRIMARY KEY (W_ID)
);
# ------------------------------------
# data for table 'widget'
# ------------------------------------
INSERT INTO widget (W_ID,W_TYPE,W_FUNCTION,W_TITLE,W_LINK,W_LINK_COMMENT,W_ICON,W_COLUMN,W_ORDER) VALUES
('1','button',NULL,'Recherche','search_personnel.php','Rechercher personne','fa-search','1','1'),
('2','button',NULL,'Evenements','evenement_choice.php?ec_mode=default','Voir les �v�nements','fa-info-circle','1','2'),
('3','button',NULL,'Disponibilit�s','dispo.php','Saisir ses disponibilit�s','fa-calendar-check','1','3'),
('4','button',NULL,'Calendrier','calendar.php','Voir mon calendrier','fa-calendar','1','4'),
('5','button',NULL,'Tableau de garde','tableau_garde.php','Voir le tableau de garde','fa-table','1','5'),
('6','button',NULL,'Garde du jour','feuille_garde.php?evenement=0&from=gardes','Voir la garde du jour','fa-sun','1','6'),
('7','box','welcome','Ma fiche',NULL,NULL,NULL,'1','1'),
('8','box','show_duty','Astreinte',NULL,NULL,NULL,'1','2'),
('9','box','my_sections','Ma section',NULL,NULL,NULL,'1','3'),
('10','box','show_alerts_horaires','Horaire des salari�s',NULL,NULL,NULL,'1','4'),
('11','box','show_factures','Activit� non r�gl�e','factures','Voir les �v�nements termin�s non pay�s',NULL,'1','5'),
('12','box','show_stats_manquantes','Statistique',NULL,NULL,NULL,'1','6'),
('13','box','show_participations','Mes activit�s','upd_personnel.php?self=1&from=default&tab=4&type_evenement=ALL','Voir mon calendrier',NULL,'2','1'),
('14','box','show_alerts_cp','Demande de cong�s',NULL,NULL,NULL,'2','2'),
('15','box','show_alerts_vehicules','V�hicule','vehicule.php?page=1','Voir les v�hicules',NULL,'2','3'),
('16','box','show_alerts_consommables','Consommable','consommable.php?page=1','Voir les produits consommables',NULL,'2','4'),
('17','box','show_alerts_remplacements','Remplacement','remplacements.php','Voir tous les remplacements',NULL,'2','5'),
('23','box','show_alerts_remplacements','Remplacements de personnel','remplacements.php','Voir tous les remplacements',NULL,'2','5'),
('24','box','show_proposed_remplacements','Demande de rempla�ant',NULL,NULL,NULL,'2','5'),
('25','box','show_proposed_remplacements','Demande de rempla�ant',NULL,NULL,NULL,'2','5'),
('18','box','show_infos','Informations','message.php?catmessage=amicale','Voir la page informations',NULL,'2','6'),
('19','box','show_participations_mc','Mains courantes',NULL,NULL,NULL,'3','1'),
('20','box','show_notes','Note de frais',NULL,NULL,NULL,'3','2'),
('21','box','show_events','Calendrier des activit�s','evenement_choice.php?ec_mode=default','Voir tous les �v�nements',NULL,'3','3'),
('22','box','show_about','A propos de eBrigade','about.php','Voir les informations relatives � cette application',NULL,'3','6'),
('26','box','show_tblo_formation','Heures de formation',NULL,'R�capitulatif des heures de formation',NULL,'3','5'),
('27','box','show_attestation_fiscale','attestations fiscales','upd_personnel.php?tab=6&self=1','Voir toutes mes attestation fiscale',NULL,'1','2'),
('28','box','show_documentation','documentation','documents.php?filter=1&td=ALL&dossier=0&status=documents&yeardoc=all','Voir toute la documentation',NULL,'1','2'),
('29','box','show_stats','Statistiques',NULL,NULL,NULL,'3','8');
# ------------------------------------
# structure for table 'widget_condition'
# ------------------------------------
DROP TABLE IF EXISTS widget_condition ;
CREATE TABLE widget_condition (
W_ID smallint(6) NOT NULL,
WC_TYPE varchar(40) DEFAULT 'permission' NOT NULL,
WC_VALUE varchar(50) DEFAULT '1' NOT NULL,
PRIMARY KEY (W_ID, WC_TYPE)
);
# ------------------------------------
# data for table 'widget_condition'
# ------------------------------------
INSERT INTO widget_condition (W_ID,WC_TYPE,WC_VALUE) VALUES
('1','permission','56'),
('2','evenements','1'),
('2','pompiers','0'),
('2','permission','41'),
('3','disponibilites','1'),
('5','gardes','1'),
('5','permission','61'),
('6','gardes','1'),
('6','permission','61'),
('8','assoc','1'),
('8','permission','41'),
('10','permission','13'),
('11','assoc','1'),
('11','evenements','1'),
('11','permission','29'),
('12','evenements','1'),
('12','assoc','1'),
('12','permission','15'),
('13','evenements','1'),
('14','permission','13'),
('15','vehicules','1'),
('15','permission','17'),
('16','consommables','1'),
('16','permission','71'),
('17','remplacements','1'),
('17','gardes','1'),
('17','permission','61'),
('20','multi_check_rights_notes','1'),
('21','evenements','1'),
('21','permission','41'),
('23','remplacements','1'),
('23','gardes','0'),
('23','permission','41'),
('24','remplacements','1'),
('24','gardes','1'),
('24','permission','61'),
('25','remplacements','1'),
('25','gardes','0'),
('25','permission','41'),
('10','army','0'),
('26','evenements','1'),
('9','permission','40'),
('27','syndicate','1'),
('28','syndicate','1'),
('20','notes','1'),
('5','pompiers','1'),
('6','pompiers','1'),
('19','main_courante','1');
# ------------------------------------
# structure for table 'widget_user'
# ------------------------------------
DROP TABLE IF EXISTS widget_user ;
CREATE TABLE widget_user (
P_ID int(11) NOT NULL,
W_ID smallint(6) NOT NULL,
WU_VISIBLE tinyint(4) DEFAULT '1' NOT NULL,
WU_COLUMN tinyint(4) DEFAULT '1' NOT NULL,
WU_ORDER tinyint(4) DEFAULT '1' NOT NULL,
PRIMARY KEY (P_ID, W_ID)
);
# ------------------------------------
# data for table 'widget_user'
# ------------------------------------

# ------------------------------------
# structure for table 'zipcode'
# ------------------------------------
DROP TABLE IF EXISTS zipcode ;
CREATE TABLE zipcode (
CODE int(11) NOT NULL,
CITY varchar(100) NOT NULL,
DEP varchar(60) NOT NULL,
PRIMARY KEY (CITY, CODE),
KEY CODE (CODE),
KEY DEP (DEP)
);


