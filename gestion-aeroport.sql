--creation table avion
create table avion (
na int PRIMARY KEY,
nom varchar(12),
capacite integer,
localite varchar(10));

--creation taable pilote
create table pilote(
np integer primary key ,
nom varchar(25),
adresse varchar(40));

--creation table vol
create table vol (
nv varchar(6),
np integer,
na integer,
vd varchar(10),
va varchar(10),
HD integer,
HA integer,
foreign key (na) REFERENCES avion(na),
foreign key (np) References pilote(np)
);



--insertion dans table avion
insert into avion values (100,'Airbus',300,'Paris');
insert into avion values (101,'B737',250,'CASA');
insert into avion values (102,'B737',220,'Montreal');

--insertion dans table pilote
insert into pilote values (2,'Jean','Rue Paris');
insert into pilote values (3,'Lio','Rue lio');
insert into pilote values (4,'Lalier','Bld Patrir');

--insertion table vol
insert into vol values ('M18',2,100,'Dakar','Paris',10,15);
insert into vol values ('M19',3,101,'Lisbonne','Londre',10,12);
insert into vol values ('M20',4,102,'Abidjan','New-York',10,22);

--afficher tout les avion
select*
from avion;

--Afficher tous les avions par ordre croissant sur le nom 
select nom
from avion 
order by nom asc;

--Afficher les noms et les capacités des avions
select nom,capacite
from avion;

--Afficher les localités des avions sans redondance
select localite
from avion
where localite is null;

--Afficher les avions dans la localité et Montreal ou Casa
select *
from avion
where localite='Montreal' or localite = 'Casa';

--Modifier la capacité de l’avion numéro 101, la nouvelle capacité et 220
alter table avion Modify capacite 220;

--Supprimer les avions dans la capacité et inférieure à 200 
delete from avion
where capacite <200;

--Afficher la capacité maximale, minimale, moyenne des avions
select max (capacite)as capacite_maximal,
Min (capacite) as capacite_min,
avg(capacite) as capacite_moyenne,
from avion;

--Afficher les données des avions dont la capacité et la plus basse 
select*
from avion
where capacite= (select min(capacite)from avion);

--Afficher les données des avions dont la capacité et supérieure à la capacité
--moyenne 
select*
from avion
where capacite>(select avg(capacite) from avion);