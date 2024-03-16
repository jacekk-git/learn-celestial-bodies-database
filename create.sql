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
	PRIMARY KEY(star_id),
	CONSTRAINT fk_galaxy
		FOREIGN KEY(galaxy_id)
			REFERENCES galaxy(galaxy_id)
);

--create table  planet(
--);

--create table  moon(
--);
