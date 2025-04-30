# ------------------------------------;
# specific data for sdis
# first insert data from pompiers.sql
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

# ------------------------------------;
# end of specific data
# ------------------------------------;