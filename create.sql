drop table if exists comet;
drop table if exists moon;
drop table if exists planet;
drop table if exists star;
drop table if exists galaxy;

create table  galaxy(
	galaxy_id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(255) UNIQUE,
	number_of_stars INT NOT NULL,
	age_in_millions_of_years INT NOT NULL,
	radius_in_thousands_km NUMERIC(30, 3),
	description TEXT,
	is_far BOOL NOT NULL,
	PRIMARY KEY(galaxy_id)
);


create table  star(
	star_id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	galaxy_id INT NOT NULL,
	name VARCHAR(255) UNIQUE,
	description TEXT,
	is_dying BOOL NOT NULL,
	PRIMARY KEY(star_id),
	CONSTRAINT fk_galaxy
		FOREIGN KEY(galaxy_id)
			REFERENCES galaxy(galaxy_id)
);

create table  planet(
	planet_id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	star_id INT NOT NULL,
	name VARCHAR(255) UNIQUE,
	description TEXT,
	radius_in_km INT NOT NULL,
	PRIMARY KEY(planet_id),
	CONSTRAINT fk_star
		FOREIGN KEY(star_id)
			REFERENCES star(star_id)
);

create table  moon(
	moon_id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	planet_id INT NOT NULL,
	name VARCHAR(255) UNIQUE,
	radius_in_km INT NOT NULL,
	is_single BOOL NOT NULL,
	PRIMARY KEY(moon_id),
	CONSTRAINT fk_planet
		FOREIGN KEY(planet_id)
			REFERENCES planet(planet_id)
);

create table comet(
	comet_id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(255) NOT NULL UNIQUE,
	age_in_thousand_years INT NOT NULL,
	PRIMARY KEY (comet_id)
);

insert into galaxy(name, number_of_stars, age_in_millions_of_years, radius_in_thousands_km, description, is_far)
values
	('Galaxy 1', 1, 1234, 1111, 'Description 1', false)
, ('Galaxy 2', 1, 2222, 2211, 'Description 2', true)
, ('Galaxy 3', 2, 3333, 3322, 'Description 2', true)	
, ('Galaxy 4', 1, 4444, 4433, 'Description 2', true)	
, ('Galaxy 5', 1, 5555, 5544, 'Description 2', true)	
, ('Galaxy 6', 1, 6666, 6655, 'Description 2', false)
;

insert into star(galaxy_id, name, is_dying)
select galaxy_id, concat(name, ' - star 1'), false
from galaxy;

insert into planet(star_id, name, radius_in_km)
select star_id, concat(name, ' - planet 1'), star_id * 1000
from star 
union all 
select star_id, concat(name, ' - planet 2'), star_id * 2000
from star;

insert into moon(planet_id, name, radius_in_km, is_single)
select planet_id, concat(name, ' - moon 1'), planet_id * 456, false
from planet
union all
select planet_id, concat(name, ' - moon 2'), planet_id * 555, false
from planet
;

insert into comet(name, age_in_thousand_years)
values
	('Comet 1', 12345)
, ('Comet 2', 22222)
, ('Comet 3', 54322)	
;