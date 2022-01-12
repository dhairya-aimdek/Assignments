CREATE DATABASE Persons;


USE Persons;


CREATE TABLE Persons (
    PersonID int PRIMARY KEY,
    LastName VARCHAR(255),
    FirstName VARCHAR(255),
    Address VARCHAR(255)
);


ALTER TABLE Persons ADD City VARCHAR(255) ;


INSERT INTO Persons VALUES (1,'Bakhai','Dhairya','Gujarat','Ahmedabad');
INSERT INTO Persons VALUES (2,'Savaraiya','Jay','Gujarat','Rajkot');
INSERT INTO Persons VALUES (3,'Trivedi','Shrey','Uttar Pradesh','Lucknow');
INSERT INTO Persons VALUES (4,'Vora','Kabir','Uttarakhand','Dehradun');
INSERT INTO Persons VALUES (5,'Roy','Sam','West Bengal','Kolkata');
INSERT INTO Persons VALUES (6,'Patel','Natasha','Madhya Pradesh','Bhopal');
INSERT INTO Persons VALUES (7,'KV','Hansh','Maharashtra','Mumbai');


SELECT * FROM Persons;


SELECT * FROM Persons WHERE Address = 'Gujarat';


UPDATE Persons
SET FirstName = 'Hanshraj'
WHERE PersonID = 7;


SELECT DISTINCT(Address) FROM Persons ; 


SELECT COUNT(Address) FROM Persons;


SELECT COUNT(DISTINCT Address) FROM Persons;


SELECT * FROM Persons WHERE City like '%u%';


SELECT Address , COUNT(Address) AS COUNT FROM Persons GROUP BY Address;


SELECT * FROM Persons ORDER BY City;


SELECT * FROM Persons ORDER BY Address DESC;
