-- 4.1
select c.numeroclient, c.nomclient from client c, abonner a, planrepas p
where c.numeroclient = a.numeroclient and a.numeroplan = p.numeroplan and p.prix between 20.00 and 40.00;

-- 4.2
select numeroplan from planrepas
where planrepas.numerofournisseur not in 
(select numerofournisseur from fournisseur where fournisseur.nomfournisseur = 'QC Transport' );


-- 4.3

select F.numeroplan from famille F, planrepas P 
where P.categorie = 'cétogène' and P.numeroplan = F.numeroplan;


-- 4.4
select count(*) as "nombre de fournisseurs sans nom" from fournisseur 
where nomfournisseur is null;



-- -- 4.5
select DISTINCT f.nomfournisseur from fournisseur f, planrepas p
where p.numerofournisseur = f.numerofournisseur
and p.prix > ALL(select prix from fournisseur f1, planrepas p1
				where p1.numerofournisseur = f1.numerofournisseur
				and f1.nomfournisseur = 'AB Transport');


-- -- 4.6
select f.nomfournisseur, f.adressefournisseur, SUM(p.prix)
from fournisseur f, planrepas p
where p.numerofournisseur = f.numerofournisseur
and p.numerofournisseur in 
(select f1.numerofournisseur from fournisseur f1, planrepas p1
where p1.numerofournisseur = f1.numerofournisseur
order by prix DESC limit 2)
group by f.nomfournisseur, f.adressefournisseur;


-- -- 4.7
	
SELECT COUNT(*) FROM kitrepas
WHERE numerokitrepas in (select numeroplan from kitrepas)
and numeroplan in (select numeroplan from planrepas where numerofournisseur is NULL);


-- -- 4.8

SELECT numeroclient, nomclient, prenomclient from client 
where left(prenomclient, 1) not in ('a', 'A', 'e', 'E', 'i', 'I', 'o', 'O', 'u', 'U', 'y', 'Y')
and villeclient = (select adressefournisseur from fournisseur 
				   	where nomfournisseur = 'Benjamin')
order by nomclient;

-- -- 4.9

select paysingredient, count(*) as "nombre d’ingrédients par pays" from ingredient
where paysingredient not like '%g__'
group by paysingredient
order by paysingredient desc;

-- -- 4.10

CREATE VIEW V_fournisseur(V_categorie, V_adresse, V_tot) as
SELEct p.categorie, f.adressefournisseur, SUM(p.prix) from planrepas p, fournisseur f
where p.categorie LIKE '%e%' and p.categorie LIKE '%o__'
and p.numerofournisseur = f.numerofournisseur
and p.numerofournisseur in (select numerofournisseur from planrepas
						 group by numerofournisseur
						 having SUM(prix) > 12500)
group by  p.categorie, f.adressefournisseur
order by p.categorie, SUM(p.prix) DESC;
