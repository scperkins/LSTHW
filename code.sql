DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS pet;
DROP TABLE IF EXISTS person_pet;

CREATE TABLE person (
	id INTEGER PRIMARY KEY,
	first_name TEXT, 
	last_name TEXT,
	age INTEGER
);

CREATE TABLE pet (
	id INTEGER PRIMARY KEY,
	name TEXT,
	breed TEXT,
	age INTEGER,
	dead INTEGER
);

CREATE TABLE person_pet (
	person_id INTEGER,
	pet_id	INTEGER
);

INSERT INTO person (id, first_name, last_name, age)
	VALUES (0, "Zed", "Shaw", 37);

INSERT INTO pet (id, name, breed, age, dead)
	VALUES (0, "Fluffy", "Unicorn", 1000, 0);

INSERT INTO pet VALUES (1, "Gigantor", "Robot", 1, 1);

INSERT INTO person VALUES (1, "Sean", "Perkins", 23);

INSERT INTO pet VALUES (2, "Tiger Lily", "Cat", 16, 0);

insert into person_pet (person_id, pet_id) values (1, 2);
insert into person_pet values (0,1);
SELECT * FROM person;

SELECT name, age FROM pet;

SELECT NAME, AGE FROM PET WHERE DEAD = 0;

SELECT * FROM PERSON WHERE FIRST_NAME != "Zed";
select pet.id, pet.name, pet.age, pet.dead
	from pet, person_pet, person
	where 
	pet.id = person_pet.pet_id and
	person_pet.person_id = person.id and
	person.first_name = "Zed";

select pet.id, pet.name, pet.age, pet.dead
	from pet, person_pet, person
	where 
	pet.id = person_pet.pet_id and
	person_pet.person_id = person.id and
	person.first_name = "Sean";

/*make sure there's no dead pets */
select name, age from pet where dead = 1;

/*aww poor robot */
delete from pet where dead = 1;

/*Make sure the robot is gone*/
select * from pet;

/*let's resurrect the robot */
insert into pet values (1, "Gigantor", "Robot",1, 0);

/*the robot lives */
select * from pet;
delete from pet where id in (
	select pet.id
	from pet, person_pet, person
	where
	person.id = person_pet.person_id and
	pet.id = person_pet.pet_id and 
	person.first_name = "Zed"
);

select * from pet;
select * from person_pet;

delete from person_pet
	where pet_id not in (
		select id from pet
	);

select * from person_pet; 
