# ------------------------------------;
# specific data for sans preconfiguration
# ------------------------------------;

UPDATE configuration set value='0' where NAME in ('grades','grades','remplacements');

delete from statut;
INSERT INTO statut (S_STATUT,S_DESCRIPTION,S_CONTEXT) VALUES
('PRES', 'Prestataire', '0'),
('BEN','B�n�vole','0'),
('EXT','Personnel externe','0'),
('SAL','Personnel salari�','0');

# ------------------------------------;
# end of specific data
# ------------------------------------;