-- prolonger des compétences 
-- 6 PSE2
-- 7 PSE1
-- 10 PAE PSC
-- 11 PAE PS
-- 236 PAE FAEP


select p.P_ID, p.P_NOM, p.P_PRENOM, c.TYPE , q.Q_EXPIRATION
from pompier p, poste c, qualification q
where c.PS_ID in (6,7,10,11)
and p.P_ID = q.P_ID
and c.PS_ID = q.PS_ID


-- supprimer l'expiration pour PAE FAEP
update qualification set Q_EXPIRATION=null where PS_ID=236;

-- prolonger des compétences 
-- PSE1, PSE2, F PAE PSC, F PAE PS valides jusqu'au 31 décembre 2021 conformément au mail de la DGSCGC pour toute personne à jour qui a suivi une formation en 2019 ou 2020.


select p.P_ID, p.P_NOM, p.P_PRENOM, c.TYPE , q.Q_EXPIRATION
from pompier p, poste c, qualification q
where c.PS_ID in (6,7,10,11)
and p.P_ID = q.P_ID
and c.PS_ID = q.PS_ID
and q.Q_EXPIRATION > NOW()
and q.Q_EXPIRATION < '20211231'
and exists (select 1 from personnel_formation pf
where pf.P_ID = p.P_ID
and pf.PS_ID in (6,7,10,11)
and pf.PF_DATE >= '20190101'
and pf.PF_ADMIS=1)

-- 7 = PSE1
-- 6 = PSE2
-- 11 = PAE PS


-- 7 = PSE1
update qualification set Q_EXPIRATION='20211231', Q_UPDATED_BY=4825, Q_UPDATE_DATE=NOW()
where PS_ID = 7
and P_ID in (
select p.P_ID
from pompier p, poste c, (select * from qualification) q
where c.PS_ID = 7
and p.P_ID = q.P_ID
and c.PS_ID = q.PS_ID
and q.Q_EXPIRATION > NOW()
and q.Q_EXPIRATION < '20211231'
and exists (select 1 from personnel_formation pf
where pf.P_ID = p.P_ID
and pf.PS_ID in (6,7,11)
and pf.PF_DATE >= '20190101'
and pf.PF_ADMIS=1)
)

-- 6 = PSE2 - 3125 lignes
update qualification set Q_EXPIRATION='20211231', Q_UPDATED_BY=4825, Q_UPDATE_DATE=NOW()
where PS_ID = 6
and P_ID in (
select p.P_ID
from pompier p, poste c, (select * from qualification) q
where c.PS_ID = 6
and p.P_ID = q.P_ID
and c.PS_ID = q.PS_ID
and q.Q_EXPIRATION > NOW()
and q.Q_EXPIRATION < '20211231'
and exists (select 1 from personnel_formation pf
where pf.P_ID = p.P_ID
and pf.PS_ID in (6,11)
and pf.PF_DATE >= '20190101'
and pf.PF_ADMIS=1)
)

-- 11 = PAE PS - 276 lignes
update qualification set Q_EXPIRATION='20211231', Q_UPDATED_BY=4825, Q_UPDATE_DATE=NOW()
where PS_ID = 11
and P_ID in (
select p.P_ID
from pompier p, poste c, (select * from qualification) q
where c.PS_ID = 11
and p.P_ID = q.P_ID
and c.PS_ID = q.PS_ID
and q.Q_EXPIRATION > NOW()
and q.Q_EXPIRATION < '20211231'
and exists (select 1 from personnel_formation pf
where pf.P_ID = p.P_ID
and pf.PS_ID in (11)
and pf.PF_DATE >= '20190101'
and pf.PF_ADMIS=1)
)

-- 10 = PAE PSC - 306 lignes
update qualification set Q_EXPIRATION='20211231', Q_UPDATED_BY=4825, Q_UPDATE_DATE=NOW()
where PS_ID = 10
and P_ID in (
select p.P_ID
from pompier p, poste c, (select * from qualification) q
where c.PS_ID = 10
and p.P_ID = q.P_ID
and c.PS_ID = q.PS_ID
and q.Q_EXPIRATION > NOW()
and q.Q_EXPIRATION < '20211231'
and exists (select 1 from personnel_formation pf
where pf.P_ID = p.P_ID
and pf.PS_ID in (10)
and pf.PF_DATE >= '20190101'
and pf.PF_ADMIS=1)
)


-- prolonger sans conditions de formations
select PS_ID, count(1) from qualification where Q_EXPIRATION='20201231'
and PS_ID in (6,7,10,11)
group by PS_ID;

update qualification set Q_EXPIRATION='20211231', Q_UPDATED_BY=4825, Q_UPDATE_DATE=NOW()
where Q_EXPIRATION='20201231'
and PS_ID in (6,7,10,11);

622 PSE2
424 PSE1
219 PAE PSC
116 PAE PS


