-- Database: TP4_Livraison

-- DROP DATABASE IF EXISTS "TP4_Livraison";

-- Database: TP4_Livraison

-- DROP DATABASE IF EXISTS "TP4_Livraison";

create table if not exists Client (
    numeroclient SERIAL not NULL,
    nomclient VARCHAR(20) not NULL, 
    prenomclient varchar(20) not NULL, 
    adressecourrielclient VARCHAR(30) not null,
	rueclient VARCHAR(30) not null,
	villeclient VARCHAR(20) not null,
	codepostalclient CHAR(6) not null,
	PRIMARY KEY (numeroclient)
);

create table if not exists Telephone (
    numerotelephone VARCHAR(15) not null CHECK (numerotelephone not like '%[^0-9]%'),
    numeroclient integer not null,
	PRIMARY KEY (numerotelephone, numeroclient),
	FOREIGN KEY (numeroclient) REFERENCES Client(numeroclient) on update cascade on delete cascade
);

create table if not exists Fournisseur (
    numerofournisseur SERIAL not null,
    nomfournisseur VARCHAR(20),
    adressefournisseur VARCHAR(30) not null,
	PRIMARY KEY (numerofournisseur)
);

create table if not exists Planrepas (
	numeroplan SERIAL not null,
	numerofournisseur integer not null,
    categorie VARCHAR(20) not null,
    frequence integer not null check (frequence > 0),
    nbrpersonnes integer not null check (nbrpersonnes > 0),
    nbrcalories integer not null check (nbrcalories > 0),
    prix NUMERIC(9, 2) not null check (prix > 0),
	PRIMARY KEY (numeroplan),
	FOREIGN KEY (numerofournisseur) REFERENCES Fournisseur(numerofournisseur) on update cascade on delete cascade
);

create table if not exists Abonner (
	duree integer not null,
	numeroplan integer not NULL,
	numeroclient integer not null,
	PRIMARY KEY (numeroplan, numeroclient),
	FOREIGN KEY (numeroclient) REFERENCES Client(numeroclient) on update cascade on delete cascade,
	FOREIGN KEY (numeroplan) REFERENCES Planrepas(numeroplan) on update cascade on delete cascade
);

create table if not exists Famille (
	numeroplan integer not NULL,
	PRIMARY kEY (numeroplan),
    FOREIGN KEY (numeroplan) REFERENCES Planrepas(numeroplan) on update cascade on delete cascade
);

create table if not exists Vegetarien (
    typederepas VARCHAR(20) not null,
	numeroplan integer not NULL,
	PRIMARY KEY (numeroplan),
    FOREIGN KEY (numeroplan) REFERENCES Planrepas(numeroplan) on update cascade on delete cascade
);

create table if not exists Pescaterien (
    numeroplan integer not NULL, 
    typepoisson VARCHAR(20) not null,
	PRIMARY KEY (numeroplan),
	FOREIGN KEY (numeroplan) REFERENCES Planrepas(numeroplan) on update cascade on delete cascade
);

create table if not exists Rapide (
	numeroplan integer not NULL,
    tempsdepreparation TIME(0) not null,
	PRIMARY KEY (numeroplan),
	FOREIGN KEY (numeroplan) REFERENCES Famille(numeroplan) on update cascade on delete cascade
);

create table if not exists Facile (
	numeroplan integer not NULL,
    nbringredients integer not null,
	PRIMARY KEY (numeroplan),
	FOREIGN KEY (numeroplan) REFERENCES Famille(numeroplan) on update cascade on delete cascade
);

create table if not exists Kitrepas (
	numeroplan integer not NULL,
    numerokitrepas SERIAL not null, 
    description VARCHAR(300) not null,
	PRIMARY KEY (numerokitrepas),
	FOREIGN KEY (numeroplan) REFERENCES Planrepas(numeroplan) on update cascade on delete cascade
);

create table if not exists Image (
    numeroimage SERIAL not null,
    donnees VARCHAR(1250) not null, 
	numerokitrepas integer not null,
	PRIMARY KEY (numeroimage),
	FOREIGN KEY (numerokitrepas) REFERENCES Kitrepas(numerokitrepas) on update cascade on delete cascade
);

create table if not exists Ingredient (
    numeroingredient SERIAL not null,
    nomingredient VARCHAR(20) not null,
    paysingredient VARCHAR(20) not null,
	PRIMARY KEY (numeroingredient)
);

create table if not exists Contenir (
	numeroingredient integer not null,
	numerokitrepas integer not null,
	PRIMARY KEY (numerokitrepas, numeroingredient),
	FOREIGN KEY (numerokitrepas) REFERENCES Kitrepas(numerokitrepas) on update cascade on delete cascade,
	FOREIGN KEY (numeroingredient) REFERENCES Ingredient(numeroingredient) on update cascade on delete cascade
);

create table if not exists etape (
	numeroetape integer not null check (numeroetape > 0),
	numerosousetape integer not null check (numerosousetape > 0),
	numerokitrepas integer not null check (numerokitrepas > 0),
	descriptionetape VARCHAR(750) not null,
    dureeetape TIME(0) not null,
	PRIMARY KEY (numerokitrepas, numeroetape, numerosousetape),
	FOREIGN KEY (numerokitrepas) REFERENCES Kitrepas(numerokitrepas) ON UPDATE CASCADE ON DELETE CASCADE
);

	
insert into client (prenomclient, nomclient, adressecourrielclient, rueclient, villeclient, codepostalclient)
VALUES ('soufiane', 'amrabat', 'soufiane.amrabat@gmail.com', 'rue koko', 'laval', 'h1h5hf');

insert into client (prenomclient, nomclient, adressecourrielclient, rueclient, villeclient, codepostalclient)
VALUES ('Youusef', 'ennesyri', 'youusef.ennesyri@gmail.com', 'rue seville', 'sevilla', 'h5h5h5');

insert into client (prenomclient, nomclient, adressecourrielclient, rueclient, villeclient, codepostalclient)
VALUES ('yassine', 'bono', 'yassine.bono@gmail.com', 'boulevard seville', 'seville', 'h5h5h4');

insert into client (prenomclient, nomclient, adressecourrielclient, rueclient, villeclient, codepostalclient)
VALUES ('hakim', 'ziyech', 'hakim.ziyech@gmail.com', 'avenue chealsea', 'londres', 'h5k8m7');

insert into client (prenomclient, nomclient, adressecourrielclient, rueclient, villeclient, codepostalclient)
VALUES ('achraf', 'hakimi', 'achraf.hakimi@gmail.com', 'boulevard lafayette', 'paris', 'k0k0k1');

insert into client (prenomclient, nomclient, adressecourrielclient, rueclient, villeclient, codepostalclient)
VALUES ('messi', 'ronaldo', 'achraf.hakimi@gmail.com', 'boulevard lafayette', 'californie', 'k0k0k1');

insert into telephone (numeroclient, numerotelephone)
VALUES ((select numeroclient from client where (prenomclient = 'soufiane' and nomclient = 'amrabat')), '55555555555');

insert into telephone (numeroclient, numerotelephone)
VALUES ((select numeroclient from client where (prenomclient = 'Youusef' and nomclient = 'ennesyri')), '22222222222');

insert into telephone (numeroclient, numerotelephone)
VALUES ((select numeroclient from client where (prenomclient = 'hakim' and nomclient = 'ziyech')), '22222222221');

insert into telephone (numeroclient, numerotelephone)
VALUES ((select numeroclient from client where (prenomclient = 'achraf' and nomclient = 'hakimi')), '22222222223');

insert into telephone (numeroclient, numerotelephone)
VALUES ((select numeroclient from client where (prenomclient = 'yassine' and nomclient = 'bono')), '22222222229');


insert into fournisseur (nomfournisseur, adressefournisseur) 
VALUES ('QC Transport', 'londres');

insert into fournisseur (nomfournisseur, adressefournisseur) 
VALUES ('AB Transport', 'berlin');

insert into fournisseur (nomfournisseur, adressefournisseur) 
VALUES ('Benjamin', 'californie');

insert into fournisseur (adressefournisseur) 
VALUES ('tanger');

insert into planrepas (categorie, frequence, nbrcalories, nbrpersonnes, prix, numerofournisseur)
VALUES ('cétogène', 4, 100, 4, 20, (select numerofournisseur from fournisseur where (nomfournisseur = 'Benjamin')));

insert into planrepas (categorie, frequence, nbrcalories, nbrpersonnes, prix, numerofournisseur)
VALUES ('cétogène', 2, 500, 1, 15, (select numerofournisseur from fournisseur where (nomfournisseur = 'AB Transport')));

insert into planrepas (categorie, frequence, nbrcalories, nbrpersonnes, prix, numerofournisseur)
VALUES ('cétogène', 3, 500, 1, 28, (select numerofournisseur from fournisseur where (nomfournisseur = 'AB Transport')));

insert into planrepas (categorie, frequence, nbrcalories, nbrpersonnes, prix, numerofournisseur)
VALUES ('mediterannean', 2, 200, 5, 45, (select numerofournisseur from fournisseur where (nomfournisseur = 'AB Transport')));

insert into planrepas (categorie, frequence, nbrcalories, nbrpersonnes, prix, numerofournisseur)
VALUES ('mediterannean', 5, 1000, 2, 11, (select numerofournisseur from fournisseur where (nomfournisseur = 'QC Transport')));

insert into planrepas (categorie, frequence, nbrcalories, nbrpersonnes, prix, numerofournisseur)
VALUES ('mediterannean', 1, 2000, 5, 70, (select numerofournisseur from fournisseur where (nomfournisseur = 'Benjamin')));

insert into planrepas (categorie, frequence, nbrcalories, nbrpersonnes, prix, numerofournisseur)
VALUES ('italien', 2, 1000, 3, 40, (select numerofournisseur from fournisseur where (nomfournisseur = 'Benjamin')));

insert into planrepas (categorie, frequence, nbrcalories, nbrpersonnes, prix, numerofournisseur)
VALUES ('italien', 2, 600, 3, 35, (select numerofournisseur from fournisseur where (nomfournisseur = 'QC Transport')));

insert into planrepas (categorie, frequence, nbrcalories, nbrpersonnes, prix, numerofournisseur)
VALUES ('japonais', 2, 1100, 4, 58, (select numerofournisseur from fournisseur where (adressefournisseur = 'tanger' and nomfournisseur is null)));

insert into planrepas (categorie, frequence, nbrcalories, nbrpersonnes, prix, numerofournisseur)
VALUES ('japonais', 3, 1150, 5, 40, (select numerofournisseur from fournisseur where (nomfournisseur = 'QC Transport')));

insert into planrepas (categorie, frequence, nbrcalories, nbrpersonnes, prix, numerofournisseur)
VALUES ('tangerois', 3, 1150, 5, 12600, (select numerofournisseur from fournisseur where (nomfournisseur = 'QC Transport')));

insert into Famille (numeroplan)
VALUES ((select numeroplan from planrepas where (categorie = 'cétogène' and nbrcalories = 500 and prix = 15)));

insert into Famille (numeroplan)
VALUES ((select numeroplan from planrepas where (categorie = 'mediterannean' and nbrcalories = 1000 and prix = 11)));

insert into Famille (numeroplan)
VALUES ((select numeroplan from planrepas where (categorie = 'japonais' and nbrcalories = 1150 and prix = 40)));

insert into Famille (numeroplan)
VALUES ((select numeroplan from planrepas where (categorie = 'japonais' and nbrcalories = 1100 and prix = 58)));


insert into Vegetarien (numeroplan, typederepas)
VALUES ((select numeroplan from planrepas where (categorie = 'italien'and prix = 35)), 'vegetarien');

insert into Vegetarien (numeroplan, typederepas)
VALUES ((select numeroplan from planrepas where (categorie = 'italien' and prix = 40)), 'pattes');


insert into Pescaterien (numeroplan, typepoisson)
VALUES ((select numeroplan from planrepas where (categorie = 'cétogène'and prix = 20)), 'sardine');

insert into Pescaterien (numeroplan, typepoisson)
VALUES ((select numeroplan from planrepas where (categorie = 'cétogène' and prix = 15)), 'thon');


insert into rapide (numeroplan, tempsdepreparation)
VALUES ((select numeroplan from famille where numeroplan in 
(select numeroplan from planrepas where (categorie = 'japonais' and nbrcalories = 1150 and prix = 40))), '00:10:00');

insert into rapide (numeroplan, tempsdepreparation)
VALUES ((select numeroplan from famille where numeroplan in 
(select numeroplan from planrepas where (categorie = 'mediterannean' and nbrcalories = 1000 and prix = 11))), '00:15:00');


insert into facile (numeroplan, nbringredients)
VALUES ((select numeroplan from famille where numeroplan in 
(select numeroplan from planrepas where (categorie = 'japonais' and nbrcalories = 1150 and prix = 40))), 7);

insert into facile (numeroplan, nbringredients)
VALUES ((select numeroplan from famille where numeroplan in 
(select numeroplan from planrepas where (categorie = 'mediterannean' and nbrcalories = 1000 and prix = 11))), 5);


insert into Kitrepas (numeroplan, description)
VALUES ((select numeroplan from planrepas where (categorie = 'italien' and prix = 35)), 'Pattes delicieuses');

insert into Kitrepas (numeroplan, description)
VALUES ((select numeroplan from planrepas where (categorie = 'italien' and prix = 40)), 'Pizza Croustillante');


insert into Image (donnees, numerokitrepas)
VALUES ('okokokokokokoko kokokokokokokokok okokokokokok okokokokokokokokokokokokok.',
(select numerokitrepas from Kitrepas where description = 'Pattes delicieuses'));

insert into Image (donnees, numerokitrepas)
VALUES ('ouiouiouoouiouoiuouioui nonononononononono oinononononono nonononoo uo i oh.',
(select numerokitrepas from Kitrepas where description = 'Pizza Croustillante'));


insert into ingredient (nomingredient, paysingredient) 
VALUES ('tomate', 'usa');

insert into ingredient (nomingredient, paysingredient) 
VALUES ('boeuf', 'canada');

insert into ingredient (nomingredient, paysingredient) 
VALUES ('ail', 'mexique');

insert into ingredient (nomingredient, paysingredient) 
VALUES ('oignon', 'canada');

insert into ingredient (nomingredient, paysingredient) 
VALUES ('poivron', 'italie');

INSERT into ingredient (nomingredient, paysingredient) 
VALUES ('pepperonni', 'italie');

insert into ingredient (nomingredient, paysingredient) 
VALUES ('courgette', 'canada');

insert into ingredient (nomingredient, paysingredient) 
VALUES ('carotte', 'canada');

insert into ingredient (nomingredient, paysingredient) 
VALUES ('haricots verts', 'japon');
INSERT into ingredient VALUES (15,'epinards', 'japon');
INSERT into ingredient VALUES (14,'chou-fleurs', 'japon');

insert into ingredient (nomingredient, paysingredient) 
VALUES ('aubergine', 'espagne');


insert into Contenir (numeroingredient, numerokitrepas)
VALUES ((select numeroingredient from ingredient where (nomingredient = 'tomate' and paysingredient = 'usa')), 
(select numerokitrepas from Kitrepas where description = 'Pattes delicieuses'));

insert into Contenir (numeroingredient, numerokitrepas)
VALUES ((select numeroingredient from ingredient where (nomingredient = 'boeuf' and paysingredient = 'canada')), 
(select numerokitrepas from Kitrepas where description = 'Pattes delicieuses'));

insert into Contenir (numeroingredient, numerokitrepas)
VALUES ((select numeroingredient from ingredient where (nomingredient = 'ail' and paysingredient = 'mexique')), 
(select numerokitrepas from Kitrepas where description = 'Pattes delicieuses'));

insert into Contenir (numeroingredient, numerokitrepas)
VALUES ((select numeroingredient from ingredient where (nomingredient = 'oignon' and paysingredient = 'canada')), 
(select numerokitrepas from Kitrepas where description = 'Pattes delicieuses'));

insert into Contenir (numeroingredient, numerokitrepas)
VALUES ((select numeroingredient from ingredient where (nomingredient = 'haricots verts' and paysingredient = 'japon')), 
(select numerokitrepas from Kitrepas where description = 'Pattes delicieuses'));

insert into Contenir (numeroingredient, numerokitrepas)
VALUES ((select numeroingredient from ingredient where (nomingredient = 'poivron' and paysingredient = 'italie')), 
(select numerokitrepas from Kitrepas where description = 'Pattes delicieuses'));

insert into Contenir (numeroingredient, numerokitrepas)
VALUES ((select numeroingredient from ingredient where (nomingredient = 'tomate' and paysingredient = 'usa')), 
(select numerokitrepas from Kitrepas where description = 'Pizza Croustillante'));

insert into Contenir (numeroingredient, numerokitrepas)
VALUES ((select numeroingredient from ingredient where (nomingredient = 'oignon' and paysingredient = 'canada')), 
(select numerokitrepas from Kitrepas where description = 'Pizza Croustillante'));

insert into Contenir (numeroingredient, numerokitrepas)
VALUES ((select numeroingredient from ingredient where (nomingredient = 'aubergine' and paysingredient = 'espagne')), 
(select numerokitrepas from Kitrepas where description = 'Pizza Croustillante'));

insert into Contenir (numeroingredient, numerokitrepas)
VALUES ((select numeroingredient from ingredient where (nomingredient = 'carotte' and paysingredient = 'canada')), 
(select numerokitrepas from Kitrepas where description = 'Pizza Croustillante'));

insert into Contenir (numeroingredient, numerokitrepas)
VALUES ((select numeroingredient from ingredient where (nomingredient = 'courgette' and paysingredient = 'canada')), 
(select numerokitrepas from Kitrepas where description = 'Pizza Croustillante'));


insert into etape (numeroetape, numerosousetape, numerokitrepas, descriptionetape, dureeetape)
VALUES (1, 1, (select numerokitrepas from Kitrepas where description = 'Pattes delicieuses'), 'Bouillir les pattes et les manger.', '00:5:45');

insert into etape (numeroetape, numerosousetape, numerokitrepas, descriptionetape, dureeetape)
VALUES (2, 1, (select numerokitrepas from Kitrepas where description = 'Pattes delicieuses'), 'Boire la sauce.', '00:15:30');


insert into Abonner (duree, numeroplan, numeroclient)
VALUES (200, 
(select numeroplan from planrepas where (categorie = 'mediterannean' and nbrcalories = 200 and prix = 45)), 
(select numeroclient from client where (prenomclient = 'yassine' and nomclient = 'bono')));

insert into Abonner (duree, numeroplan, numeroclient)
VALUES (100, 
(select numeroplan from planrepas where (categorie = 'mediterannean' and nbrcalories = 200 and prix = 45)), 
(select numeroclient from client where (prenomclient = 'hakim' and nomclient = 'ziyech')));

insert into Abonner (duree, numeroplan, numeroclient)
VALUES (300, 
(select numeroplan from planrepas where (categorie = 'italien' and prix = 35)), 
(select numeroclient from client where (prenomclient = 'achraf' and nomclient = 'hakimi')));