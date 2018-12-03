1)   SELECT * FROM tbl_habitat;

2)   SELECT species_name FROM tbl_species WHERE species_order = 3; 

3)   SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost < 600;

4)   SELECT species_name FROM tbl_species WHERE species_nutrition > 2201 AND species_nutrition < 2207; \

5)   SELECT 
		a1.species_name AS 'Species Name:',
		a3.nutrition_type AS 'Nutrition Type:'
		FROM tbl_species a1
		INNER JOIN tbl_habitat a2 ON a2.habitat_id = a1.species_habitat
		INNER JOIN tbl_nutrition a3 ON a3.nutrition_id = a1.species_nutrition 
	;

6)   SELECT specialist_fname, specialist_lname, specialist_contact FROM tbl_specialist WHERE specialist_id = 1;

7)   CREATE TABLE tbl_persons (
		persons_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		persons_fname VARCHAR(50) NOT NULL,
		persons_lname VARCHAR(50) NOT NULL,
		persons_age INT NOT NULL
	);

	 CREATE TABLE tbl_orders (
		order_id INT PRIMARY KEY IDENTITY (1,1),
		order_number INT NOT NULL,
		persons_id INT NOT NULL CONSTRAINT fk_persons_id FOREIGN KEY REFERENCES tbl_persons(persons_id) ON UPDATE CASCADE ON DELETE CASCADE
	);

	 INSERT INTO tbl_persons
		(persons_fname, persons_lname, persons_age)
		VALUES
		('Bob','Smith', 35),
		('Mary','Ann', 30),
		('Bryce','Burns', 23),
		('Gina','Ladke', 21),
		('Dana','Base', 26)
	;

	 INSERT INTO tbl_orders
		(order_number, persons_id)
		VALUES 
		(77895, 1),
		(44567, 2),
		(22456, 3),
		(24548, 4),
		(86864, 5)
	;

	 SELECT 
		a1.persons_fname as 'First Name:', a1.persons_lname as 'Last Name:', a2.order_number as 'Order Number:', a2.persons_id as 'ID:'
		FROM tbl_persons a1
		INNER JOIN tbl_orders a2 ON a1.persons_id = a2.persons_id
	;
