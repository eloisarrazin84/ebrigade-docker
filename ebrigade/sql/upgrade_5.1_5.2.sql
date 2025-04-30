#====================================================;
#  Upgrade v5.2;
#====================================================;

SET sql_mode = '';

# ------------------------------------;
# message sp�cifique
# ------------------------------------;

ALTER TABLE pompier ADD P_ACCEPT_DATE2 DATETIME NULL AFTER P_ACCEPT_DATE;

INSERT INTO configuration (ID,NAME,VALUE,DESCRIPTION,ORDERING,HIDDEN,TAB,YESNO)
VALUES ('69', 'info_connexion', '0', 'Activer l''affichage d''un message sp�cifique � la premi�re connexion, � d�finir dans le fichier specific_info.php', '312', '0', '3', '1');
# ------------------------------------;
# Ajout grades manquants
# ------------------------------------;
INSERT INTO grade (G_GRADE,G_DESCRIPTION,G_LEVEL,G_TYPE,G_CATEGORY) VALUES
('CG1','Contr�leur g�n�ral','117','officiers','SP'),
('LTNHC','lieutenant hors classe','113','officiers','SP');
# ------------------------------------;
# support Whatsapp groups
# ------------------------------------;

ALTER TABLE section ADD S_WHATSAPP VARCHAR(30) NULL AFTER S_AFFILIATION;
ALTER TABLE evenement ADD E_WHATSAPP VARCHAR(30) NULL AFTER E_TEL;

delete from log_type where LT_CODE in ('UPDS33');
INSERT INTO log_type (LT_CODE, LC_CODE, LT_DESCRIPTION)
VALUES ('UPDS33', 'S', 'Modification Groupe Whatsapp');

delete from log_type where LT_CODE in ('UPDS34');
INSERT INTO log_type (LT_CODE, LC_CODE, LT_DESCRIPTION)
VALUES ('UPDS34', 'S', 'Modification Ordre garde');

# ------------------------------------;
# Webex link
# ------------------------------------;
ALTER TABLE evenement
ADD E_WEBEX_URL VARCHAR(500) NULL AFTER E_WHATSAPP,
ADD E_WEBEX_PIN VARCHAR(20) NULL AFTER E_WEBEX_URL;

ALTER TABLE evenement
ADD E_WEBEX_START TIME NULL AFTER E_WEBEX_PIN;

#-------------------------------------;
# Add Widget formations 
#-------------------------------------;
INSERT INTO widget (W_ID, W_TYPE, W_FUNCTION, W_TITLE, W_LINK, W_LINK_COMMENT, W_ICON, W_COLUMN, W_ORDER) VALUES
(26, 'box', 'show_tblo_formation', 'Heures de formation', NULL, 'R�capitulatif des heures de formation', NULL, 3, 5);
UPDATE widget SET W_ORDER = '6' WHERE W_ID = 22;

INSERT INTO widget_condition (W_ID, WC_TYPE, WC_VALUE)
VALUES ('26', 'pompiers', '1'), ('26', 'evenements', '1');

#-------------------------------------;
# Widget responsables op�rationnelle 
#-------------------------------------;
ALTER TABLE groupe ADD TR_WIDGET TINYINT NOT NULL DEFAULT '0' AFTER TR_ALL_POSSIBLE;
update groupe set TR_WIDGET=1 where GP_ID=107;

#-------------------------------------;
# Widget stats manquantes, que pour assoc 
#-------------------------------------;
UPDATE widget_condition SET WC_TYPE = 'assoc', WC_VALUE = '1' WHERE W_ID = 12 AND WC_TYPE = 'syndicate';

#-------------------------------------;
# Expiration mot de passe 
#-------------------------------------;
ALTER TABLE pompier ADD P_MDP_EXPIRY DATE NULL DEFAULT NULL AFTER P_PASSWORD_FAILURE;
ALTER TABLE pompier ADD INDEX (P_MDP_EXPIRY);

# ------------------------------------;
# customisation
# ------------------------------------;

delete from configuration where ID=70;
INSERT INTO configuration (ID, NAME, VALUE, DESCRIPTION, ORDERING, HIDDEN, TAB, YESNO)
VALUES ('70', 'password_expiry_days', '0', 'Expiration des mots de passes apr�s un certain nombre de jours.', '316', '0', '3', '0');

# ------------------------------------;
# agr�ments
# ------------------------------------;
UPDATE type_agrement SET TA_CODE = 'A', TA_DESCRIPTION = 'Sauvetage aquatique' WHERE TA_CODE = 'A3';
UPDATE agrement set TA_CODE='A' where TA_CODE='A3';

UPDATE type_agrement SET TA_CODE = 'A-Aqua', TA_DESCRIPTION = 'Sauvetage aquatique' WHERE TA_CODE = 'A';
UPDATE agrement set TA_CODE='A-Aqua' where TA_CODE='A';

# ------------------------------------;
# documents sur fiches victimes
# ------------------------------------;
ALTER TABLE document ADD VI_ID INT NOT NULL DEFAULT '0' AFTER NF_ID;

# ------------------------------------;
# widgets
# ------------------------------------;
delete from widget where W_ID in (27,28);
INSERT INTO widget (W_ID,W_TYPE,W_FUNCTION,W_TITLE,W_LINK,W_LINK_COMMENT,W_ICON,W_COLUMN,W_ORDER)
VALUES ('27', 'box', 'show_attestation_fiscale', 'attestations fiscales', 'upd_personnel.php?tab=6&self=1', 'Voir toutes mes attestation fiscale', NULL, '1', '2'),
('28', 'box', 'show_documentation', 'documentation', 'documents.php?filter=1&td=ALL&dossier=0&status=documents&yeardoc=all', 'Voir toute la documentation', NULL, '1', '2');


delete from widget_condition where W_ID in (9,27,28);
INSERT INTO widget_condition (W_ID, WC_TYPE, WC_VALUE)
VALUES ('9', 'permission', '40'),
('27', 'syndicate', '1'),
('28', 'syndicate', '1');

# ------------------------------------;
# consignes
# ------------------------------------;
ALTER TABLE evenement CHANGE E_CONSIGNES E_CONSIGNES VARCHAR(500) NULL;

# ------------------------------------;
# report
# ------------------------------------;
drop table if exists log_report;
CREATE TABLE log_report (
LR_ID INT NOT NULL AUTO_INCREMENT,
LR_DATE DATETIME NOT NULL,
R_CODE VARCHAR(30) NOT NULL,
P_ID INT NOT NULL,
S_ID INT NOT NULL,
LR_ROWS INT NOT NULL,
LR_PARAMS VARCHAR(100) NOT NULL,
LR_TIME SMALLINT NOT NULL,
PRIMARY KEY (LR_ID));
ALTER TABLE log_report ADD INDEX (S_ID);

drop table if exists report_list;
CREATE TABLE report_list (
R_CODE VARCHAR(40) NOT NULL,
R_NAME VARCHAR(100) NOT NULL,
PRIMARY KEY (R_CODE));

INSERT INTO report_list (R_CODE,R_NAME) VALUES
('1nbparticipants', 'Nombre de participants'),
('1evenement_annule_liste', 'Ev�nements Annul�s (justificatifs)'),
('1evenement_annule', 'Ev�nements Annul�s par type'),
('1tcd_activite_annee', 'Ev�nements par type et par section'),
('1renforts', 'Ev�nements Renforts'),
('1conventions', 'Etat des Conventions - COA'),
('1conventionsmanquantes', 'Conventions manquantes - COA'),
('1statsmanquantes', 'Statistiques manquantes'),
('1dps', 'DPS r�alis�s'),
('1dpsre', 'DPS r�alis�s (renforts exclus)'),
('1maraudes', 'Maraudes r�alis�es'),
('1heb', 'H�bergements d''urgence r�alis�s'),
('1asigcs', 'Actions de Sensibilisation Initiation aux Gestes et Comportements qui Sauvent'),
('1accueilRefugies', 'Accueils des r�fugi�s'),
('1vacci', 'Vaccinations'),
('1horairesdouteux', 'Horaires douteux � corriger'),
('1datecre', 'Dates de cr�ation des �v�nements'),
('1promocom', 'Ev�nements Promotion - Communication'),
('1horsdep', 'Ev�nements hors d�partement'),
('1Tevtpardep', 'Nombre �v�nements par d�partement - type au choix'),
('1alsan', 'Alertes sanitaires'),
('1alsanre', 'Alertes sanitaires (hors renforts)'),
('1kmalsan', 'Alertes sanitaires - Kilom�trage r�alis�'),
('1alsanpardep', 'Statistiques Alertes sanitaires par d�partement'),
('1mkalsanpardep', 'Kilom�trage Alertes sanitaires par d�partement'),
('formations', 'Formations r�alis�es'),
('1formations_sd', 'Formations: nombres de stagiaires et de valid�s'),
('1formationsnontraitees', 'Formations non trait�es'),
('1sst', 'Formations SST r�alis�es'),
('1gqs', 'Formations GQS r�alis�es'),
('1formationsCE', 'Formations chef d''�quipe ou chef de poste r�alis�es'),
('sstexpiration', 'Expiration des Dipl�mes SST'),
('2Cforpardep', 'Nombre de formations par d�partement et par an pour une comp�tence'),
('1facturation', 'Suivi commercial'),
('1facturationRecap', 'D�tail du suivi commercial'),
('fafacturer', 'Ev�nements termin�s a facturer'),
('1tnonpaye', 'Evenements termin�s non pay�s'),
('1fnonpaye', 'Ev�nements factur�s non pay�s'),
('1paye', 'Ev�nements pay�s'),
('1facturestoutes', 'Listes des factures'),
('1cadps', 'Chiffre d''affaire DPS'),
('1cadps_sansR', 'Chiffre d''affaire DPS hors renforts'),
('1cafor', 'Chiffre d''affaire Formations'),
('1facturepayeedps', 'Factures de DPS pay�es'),
('1facturepayeefor', 'Factures de Formations pay�es'),
('1evenement_annule_liste2', 'Ev�nements annul�s'),
('code_conducteur', 'Codes conducteurs'),
('vehicule', 'Liste des v�hicules'),
('1vehicule_km', 'Kilom�trage r�alis� par v�hicule (bilan)'),
('1associat_km', 'Kilom�trage r�alis�s par les v�hicules (d�tail)'),
('1perso_km', 'Kilom�trage d�taill� en v�hicule personnel'),
('1perso_km_total', 'Kilom�trage total en avec v�hicule personnel'),
('1missing_km', 'Kilom�trage non renseign�s'),
('1evenement_km', 'Kilom�trage par type d''�v�nement'),
('vehicule_a_dispo', 'V�hicules mis � disposition'),
('materiel_a_dispo', 'Mat�riel mis � disposition'),
('1consommation_produits', 'Consommation de produits'),
('stock_consommables', 'Stock de produits consommables'),
('tenues_personnel', 'Tenues du personnel'),
('nbadherentspardep', 'Nombre de personnel b�n�voles et salari�s par d�partement'),
('effectif', 'Liste du personnel'),
('salarie', 'Liste du personnel salari�'),
('1civique', 'Liste du personnel en service civique par date'),
('1snu', 'Liste du personnel en service national universel par date'),
('chiens', 'Chiens de recherche avec comp�tences valides'),
('creationfiches', 'Cr�ation des fiches personnel'),
('provenantautres', 'Personnel ayant chang� de section'),
('adresses', 'Liste des adresses du personnel'),
('adresses2', 'Liste des adresses des adh�rents'),
('1anniversaires', 'Anniversaires des membres'),
('1heuressections', 'Heures r�alis�es / section'),
('1absences', 'Absences sur les �v�nements '),
('1nombreabsences', 'Nombre d''absences / personne'),
('1anciens', 'Anciens membres avec date de sortie'),
('engagement', 'Ann�es d''engagement du personnel '),
('1inactif2', 'Personnel inactif'),
('skype', 'Identifiants de contact Skype '),
('zello', 'Identifiants de contact Zello '),
('whatsapp', 'Identifiants de contact Whatsapp '),
('typeemail', 'R�partition par type d''email'),
('sans2emeprenom', 'Personnel actif sans deuxi�me pr�nom renseign�'),
('sansdatenaissance', 'Personnel actif sans date de naissance renseign�e'),
('sanslieunaissance', 'Personnel actif sans lieu de naissance renseign�'),
('sansphoto', 'Personnel actif sans photo d''identit�'),
('sansemail', 'Personnel sans email valide'),
('sansadresse', 'Personnel sans adresse valide'),
('sanstel', 'Personnel sans num�ro de t�l�phone valide'),
('homonymes', 'Liste des homonymes (nom, pr�nom)'),
('doublons', 'Liste des fiches personnel en double (nom,pr�nom,date de naissance)'),
('doubleaffect', 'Liste personnes avec plusieurs affectations'),
('doublonlicence', 'Liste des num�ros de licences affect�s � plusieurs fiches actives'),
('infolue', 'Suivi lecture note d''information importante'),
('effectif2', 'Liste des utilisateurs d�partementaux (acc�s admin seul)'),
('effectif3', 'Liste des administrateurs d�partementaux (acc�s admin seul)');

INSERT INTO report_list (R_CODE,R_NAME) VALUES
('1heurespersonne', 'Participations / personne'),
('1heurespersonnetous', 'Participations / personne (avec les externes)'),
('1participations', 'Nombre de participations sur la p�riode'),
('1participationsformateurs', 'Participations des formateurs'),
('1participationsadresses', 'Adresses du personnel ayant particip�'),
('1participationssalaries', 'Participations des salari�s'),
('1participationsprompcom', 'Participations aux Ev�nements Promotion - Communication'),
('1participationsnautique', 'Participations aux Ev�nements Activit� nautique'),
('tempsconnexion', 'Temps de connexion par personne'),
('tempconnexionparsection', 'Temps de connexion par d�partement'),
('1participationsannules', 'Participations aux Ev�nements Annul�s'),
('1participationsparjour', 'Nombre de participations par jour des b�n�voles'),
('1heurespersonneSNU', 'Participations du personnel Service National Universel'),
('1heurespersonneMineur', 'Participations du personnel mineur'),
('adressesext', 'Liste des adresses des externes'),
('telext', 'Liste des externes ayant un num�ro de t�l�phone renseign�'),
('mailext', 'Liste des externes ayant un email renseign�'),
('1participationsext', 'Participations des externes par dates'),
('1heurespersonneexternes', 'Participations / personne externe'),
('1participationsadressesext', 'Adresses des externes ayant particip� entre deux dates'),
('groupes', 'Permissions du personnel'),
('roles', 'R�les dans l''organigramme du personnel'),
('secouristesPSE', 'Liste des secouristes PSE1 ou PSE2'),
('secouristesparsection', 'Nombre de secouristes PSE2 ou PSE1 seulement'),
('secouristesPSE1', 'Liste des secouristes seulement PSE1'),
('moniteurs', 'Liste des moniteurs de secourisme'),
('moniteursPSC', 'Liste des moniteurs seulement PSC'),
('moniteursparsection', 'Nombre de moniteurs de secourisme'),
('formateurs', 'Liste des formateurs'),
('personnelsante', 'Liste du personnel de sant�'),
('competence_expire', 'Comp�tences expir�es'),
('diplomesPSC1', 'Liste des dipl�mes PSC1'),
('1diplomesPSC1', 'Liste des dipl�mes PSC1 par dates'),
('diplomesPSE1', 'Liste des dipl�mes PSE1'),
('diplomesPSE2', 'Liste des dipl�mes PSE2'),
('sectionannuaire', 'Annuaire des sections'),
('departementannuaire', 'Annuaire des d�partements'),
('sectionannuaire2', 'Annuaire des d�partements et antennes'),
('sectionannuaire3', 'Adresses des lieux de formation'),
('IDRadio', 'Codes ID Radio des d�partements et antennes'),
('agrements', 'Liste des agr�ments'),
('agrements_dps', 'Liste des agr�ments DPS'),
('SMSsections', 'Comptes SMS'),
('1updateorganigramme', 'Nouveaux �lus d�partementaux'),
('1interdictions', 'Interdictions de cr�er certains �v�nements'),
('entreprisesannuaire', 'Annuaire des entreprises'),
('medecinsreferents', 'M�decins r�f�rents'),
('1entreprisesDPS', 'Entreprises b�n�ficiant de DPS'),
('1entreprisesFOR', 'Entreprises b�n�ficiant de Formations'),
('1garde', 'Gardes r�alis�es'),
('1gardere', 'Gardes r�alis�es (hors renforts)'),
('1ah', 'Bilan actions humanitaires'),
('1soutienpopulations', 'Bilan aide aux populations'),
('1heuresparticipations', 'Bilan participations tous �v�nements'),
('1heuresparticipationspartype', 'Bilan heures participations par type d''�v�nement'),
('2cotisationsPayees', 'Cotisations pay�es pour une ann�e'),
('montantactuel', 'Montant actuel des cotisations'),
('cotisationspayees', 'Cotisations pay�es par d�partement pour l''ann�e en cours'),
('cotisationspayeesparpers', 'Cotisations pay�es par personne pour l''ann�e en cours'),
('1cotisationspayees', 'Cotisations pay�es entre deux dates'),
('2cotisationsimpayees', 'Cotisations non pay�es pour l''ann�e');
INSERT INTO report_list (R_CODE,R_NAME) VALUES
('1intervictime', 'Nombre d''interventions par jour'),
('1intervictimeparevt', 'Nombre d''interventions par �v�nement'),
('1victimenationalite', 'Nombre de personnes prises en charge par nationalit�'),
('1victimeage', 'Nombre de personnes prises en charge par �ge'),
('1victimesexe', 'Nombre de personnes prises en charge par sexe'),
('1statdetailvictime', 'Statistiques personnes prises en charge et actions r�alis�es par jour'),
('1statdetailvictimeparevt', 'Statistiques personnes prises en charge et actions r�alis�es par �v�nement'),
('1transportdest', 'Nombre de Transports de victimes selon destination'),
('1transportpar', 'Nombre de Transports de victimes selon transporteur'),
('1listevictime', 'Liste des personnes prises en charge'),
('1listevictimeCAV', 'Liste des Victimes au Centre d''Accueil'),
('pointdujour', 'Point de situation du jour'),
('1activite', 'Point de situation par date'),
('maincourantejour', 'Rapports d''interventions renseign�s ce jour'),
('maincourantehier', 'Rapports d''interventions renseign�s hier'),
('compterendujour', 'Rapports de comptes rendus renseign�s ce jour'),
('compterenduhier', 'Rapports de comptes rendus renseign�s hier'),
('personneldisponiblea', 'Personnel disponible aujourd''hui'),
('personneldisponibled', 'Personnel disponible demain'),
('veille', 'Personnel de veille op�rationnelle '),
('presidents', 'Pr�sidents d�partementaux '),
('responsablesformations', 'Directeur des Formations d�partementaux '),
('responsablesoperationnels', 'Directeur des Op�rations d�partementaux '),
('1note_ATTV', 'Notes de frais en attente de validation'),
('1note_ANN', 'Notes de frais annul�es'),
('1note_REF', 'Notes de frais refus�es'),
('1note_VAL', 'Notes de frais valid�es'),
('1note_VAL2', 'Notes de frais valid�es deux fois'),
('1note_REMB', 'Notes de frais rembours�es (ou dons � l''association)'),
('1note_toutes', 'Notes de frais (toutes)'),
('1notN_ATTV', 'Notes de frais nationales en attente de validation'),
('1notN_ANN', 'Notes de frais nationales annul�es'),
('1notN_REF', 'Notes de frais nationales refus�es'),
('1notN_VAL', 'Notes de frais nationales valid�es'),
('1notN_VAL2', 'Notes de frais nationales valid�es deux fois'),
('1notN_REMB', 'Notes de frais nationales rembours�es'),
('1notN_toutes', 'Notes de frais nationales (toutes)'),
('horairesavalider', 'Horaires � valider'),
('1horaires', 'Horaires entre 2 dates (tous)'),
('competencesope', 'Comp�tences op�rationnelles du personnel'),
('competencesfor', 'Comp�tences formation du personnel'),
('1soapcallsj', 'Nombre appels Webservice par jour'),
('1soaperrorsj', 'Nombre erreurs appels Webservice par jour'),
('1soapcalls', 'Acc�s Webservice'),
('1soaperrors', 'Erreurs Webservice');

INSERT INTO report_list (R_CODE,R_NAME) VALUES
('1heurespersonneforco', 'Maintien des acquis / personne (tous)'),
('adhmodepaiement', 'FA - Liste des adh�rents actifs avec le mode de paiement'),
('adhpayantparcheque', 'FA - Liste des adh�rents payant par ch�que'),
('adhpayantparvirement', 'FA - Liste des adh�rents payant par virement'),
('adhpayantparprelevement', 'FA - Liste des adh�rents payant par pr�l�vement'),
('adhsuspendus', 'FA - Liste des adh�rents suspendus'),
('adhretraites', 'FA - Liste des adh�rents retrait�s'),
('adhactifsretraites', 'FA - Liste des adh�rents non retrait�s dans les sections Retraite'),
('1radiations', 'FA - Liste des radiations d''adh�rents pour suppression identifiants site internet'),
('1nouveauxadherents', 'FA - Liste des nouveaux adh�rents pour cr�ation identifiants site internet'),
('nbadherentspardepS', 'FA - Nombre d''adh�rents par d�partement'),
('0nbadherentspardep', 'FA - Nombre d''adh�rents par d�partement actifs � une date donn�e'),
('nbtotaladhparprof', 'FA - Nombre total d''adh�rents SPP et PATS'),
('0nbtotaladhparprof', 'FA - Nombre total d''adh�rents SPP et PATS actifs � une date donn�e'),
('nbadherents', 'FA - Nombre d''adh�rents par centre et par profession'),
('adhNPAI', 'FA - Liste des adh�rents en NPAI'),
('cordonneesAdherents', 'FA - Coordonn�es des adh�rents non suspendus'),
('adhdistribution', 'FA - Liste des adh�rents pour distribution agendas - stylos'),
('adhcarte', 'FA - Liste des adh�rents pour imprimeurs pour cartes adh�rents'),
('1changementmail', 'FA - Liste des changements d''adresses email'),
('1changementtel', 'FA - Liste des changements de num�ro de t�l�phone'),
('1ribmodifie', 'FA - Liste des changements de coordonn�es bancaires pour adh�rents existants'),
('1changementcentre', 'FA - Liste des changements d''affectation ou de SDIS'),
('1changementgrade', 'FA - Liste des changements de grades'),
('adherentsajourcotisation', 'FA - Liste des adh�rents actifs � jour de leurs cotisations'),
('1cotisationCheque', 'FA - Liste des cotisations pay�es par ch�que entre deux dates'),
('1cotisationVirPrev', 'FA - Liste des cotisations pay�es par virement ou pr�l�vement entre deux dates'),
('adressesEnvoiColis', 'FA - Liste des adresses pour envoi colis'),
('nombrePrelevementParDep', 'FA REVERSEMENT - NOMBRE D�ADHERENTS EN DATE D�AUJOURD�HUI EN PRELEVEMENT OU VIREMENT'),
('1nombrePrelevementParDep', 'FA REVERSEMENT - NOMBRE D�ADHERENTS EN PRELEVEMENT OU VIREMENT ENTRE DEUX DATES'),
('nombrePrelevementParDeptt', 'FA REVERSEMENT - NOMBRE D�ADHERENTS EN DATE D�AUJOURD�HUI TOUS TYPES DE PAIEMENT'),
('1rejetsetregul', 'FA REVERSEMENT � REJETS ET REGUL PAR DATE'),
('rejetsencours', 'FA REVERSEMENT � REJETS EN COURS DE REGULARISATION'),
('nbsuspendupardep', 'FA REVERSEMENT � NB DE SUSPENDU EN PRELEVEMENT PAR DEPARTEMENT'),
('nomssuspendupardep', 'FA REVERSEMENT � NOM DES ADHERENTS SUSPENDUS EN PRELEVEMENT PAR DEPARTEMENT'),
('adhtournee', 'SA - Liste des adh�rents pour tourn�es syndicales'),
('nbadherentsparcentre', 'SA - Nombre d''adh�rents par centre'),
('cordonneesAdherentsparcentre', 'SA - Coordonn�es des adh�rents par centre'),
('cordonneesAdherentsparGTetService', 'SA � Coordonn�es des adh�rents par GT et Service (pour AG, Formation�)'),
('cordonneesAdherentsparGTetServicesansNPAI', 'SA � Coordonn�es des adh�rents par GT et Service (pour AG, Formation�) pour les courriers sans les NPAI'),
('adhtournee_off', 'SA 06 � Liste des adh�rents Officiers pour tourn�es syndicales'),
('adhtournee_non_off', 'SA 06 � Liste des adh�rents non Officiers pour tourn�es syndicales'),
('adhtournee_pats', 'SA 06 � Liste des adh�rents PATS pour tourn�es syndicales'),
('1majchgtadresse', 'FAFPT - Pour MAJ changement d''adresse'),
('1majradiation', 'FAFPT - Pour MAJ radiations'),
('nbadherentspardep2', 'POUR ANDRE - Nombre d''adh�rents par d�partement'),
('1adherentsradies06', 'POUR ANDRE - D�tail des radiations du SA 06'),
('1nouveauxadherents2', 'POUR ANDRE - Nombre de nouveaux adh�rents par d�partement'),
('1adherentsradies2', 'POUR ANDRE - Nombre de radiations par d�partement'),
('adherentsradies3', 'POUR ANDRE - Nombre de radiations au 31/12 ann�e derni�re'),
('adherentsradies4', 'POUR ANDRE - Nombre de radiations au 31/12 ann�e en cours'),
('1nbNouveauxAdherentsParDep', 'POUR LES PRESIDENTS - Nombre de nouveaux adh�rents par d�partement'),
('1nouveauxadherentsPres', 'POUR LES PRESIDENTS - Nouveaux adh�rents'),
('1nbRadiationsAdherentsParDep', 'POUR LES PRESIDENTS - Nombre de radiations par d�partement et par motif'),
('1radiationsmotifPres', 'POUR LES PRESIDENTS - Radiations'),
('1verifmontants', 'ATTESTATION - v�rification montant en fonction date adh�sion'),
('2attestationsImpots', 'ATTESTATION  - Cotisations pay�es pour une ann�e'),
('2attestationsImpotsRejets', 'ATTESTATION � Cotisations avec rejets pay�es pour une ann�e'),
('impayesN-1', 'ATTESTATION � Rejets de l''ann�e derni�re non r�gularis�s ou pr�lev�s cette ann�e.'),
('president_syndicate', 'r�sidents d�partementaux '),
('effectifadherents', 'Liste des adh�rents'),
('1abonnejournal', 'B�n�ficiaires Echos FA-FPT'),
('1demandejournal', 'Souhaitent recevoir Echos FA-FPT'),
('droitBureauDE', 'Droits d�acc�s Bureau D�partemental par D�partement'),
('2sommecotisations', 'Somme des cotisations par d�partement et profession pour l''ann�e'),
('rejets', 'Liste des rejets des pr�l�vement'),
('fichierExtractionSG', 'Fichier d�extraction pour Soci�t� G�n�rale '),
('1fichierExtractionSG', 'Fichier d�extraction pour Soci�t� G�n�rale selon date adh�sion'),
('SEPAcourrierRUM', 'SEPA � Liste des adh�rents pour courrier RUM');

INSERT INTO report_list (R_CODE,R_NAME) VALUES
('1reports', 'Reportings extraits, audit'),
('1topreports', 'Reportings les plus utilis�s');

INSERT INTO report_list (R_CODE,R_NAME) VALUES
('2sommecotisationsprevues', 'Cotisations pr�vues par d�partement et profession pour l''ann�e');

INSERT INTO report_list (R_CODE,R_NAME) VALUES
('1fonctionsparpers', 'Fonctions attribu�es pour chaque personne sur les gardes');


# ------------------------------------;
# en pr�t
# ------------------------------------;
UPDATE vehicule_position SET VP_OPERATIONNEL = '2' WHERE VP_ID = 'PRE';

# ------------------------------------;
# personnalisation appli
# ------------------------------------;
UPDATE configuration SET TAB = '4' WHERE ID in(6,7,8,27,38,39,40);
UPDATE configuration SET ORDERING = '5' WHERE ID = 27;

ALTER TABLE configuration ADD IS_FILE TINYINT NOT NULL DEFAULT '0' AFTER YESNO;

delete from configuration where ID in (71,72,73,74,75);
INSERT INTO configuration (ID, NAME, VALUE, DESCRIPTION, ORDERING, HIDDEN, TAB, YESNO, IS_FILE) VALUES
('71', 'logo', '', 'logo de l\'organisation, visible sur les PDFs g�n�r�s (taille recommand�e environ 100 px de large et 120 px de hauteur recommand�s) ', '501', '0', '4', '0','1'),
('72', 'banniere', '', 'banni�re de la page d\'accueil (taille recommand�e environ 120px de hauteur et 600 px de largeur)', '500', '0', '4', '0','1'),
('73', 'favicon', '', 'icone de l\'onglet web (taille recommand�e environ 60 px de large et 60 px de hauteur recommand�s) ', '503', '0', '4', '0','1'),
('74', 'apple_icon', '', 'icone pour �cran d\'accueil iOS (taille recommand�e environ 100px de hauteur et 100 px de largeur)', '502', '0', '4', '0','1'),
('75', 'splash_screen', '', 'fond d\'�cran pour la page de login (taille recommand�e environ 800px de hauteur et 1400 px de largeur)', '504', '0', '4', '0','1');

# ------------------------------------;
# comp�tences
# ------------------------------------;
delete from report_list where R_CODE='1ajoutscompetences';
INSERT INTO report_list (R_CODE,R_NAME) VALUES
('1ajoutscompetences', 'Comp�tences du personnel ajout�es par date');

# ------------------------------------;
# date ajout du mat�riel
# ------------------------------------;
ALTER TABLE materiel ADD MA_ADDED DATETIME NULL AFTER TV_ID;

# ------------------------------------;
# Activit� divers en Activit� diverse
# ------------------------------------;
UPDATE type_evenement SET TE_LIBELLE = 'Activit� diverse' Where TE_CODE = 'DIV';

# ------------------------------------;
# change version
# ------------------------------------;
update configuration set VALUE='5.2' where ID=1;

# ------------------------------------;
# end
# ------------------------------------;