# ------------------------------------;
# specific data for sdis
# first insert data from pompiers.sql
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

# ------------------------------------;
# end of specific data
# ------------------------------------;