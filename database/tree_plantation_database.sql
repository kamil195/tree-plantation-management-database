/*
Project: Tree Plantation Management Database
Author: Muhammad Kamil Shah
Database: MySQL

Description:
Manages trees, volunteers, and plantation activities while demonstrating
relational design, joins, views, aggregate functions, subqueries, triggers,
transactions, indexing, and access-control examples.
*/

CREATE DATABASE IF NOT EXISTS TreePlantation;
USE TreePlantation;

CREATE TABLE IF NOT EXISTS Trees (
    TreeID INT AUTO_INCREMENT PRIMARY KEY,
    TreeName VARCHAR(50) NOT NULL,
    ScientificName VARCHAR(100),
    Category VARCHAR(50),
    DatePlanted DATE,
    Height DECIMAL(5,2),
    Location VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Volunteers (
    VolunteerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Contact VARCHAR(15),
    Address VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS PlantationActivities (
    ActivityID INT AUTO_INCREMENT PRIMARY KEY,
    VolunteerID INT,
    TreeID INT,
    ActivityDate DATE,
    Description VARCHAR(255),
    CONSTRAINT fk_activity_volunteer
        FOREIGN KEY (VolunteerID) REFERENCES Volunteers(VolunteerID),
    CONSTRAINT fk_activity_tree
        FOREIGN KEY (TreeID) REFERENCES Trees(TreeID)
);

INSERT INTO Trees (TreeName, ScientificName, Category, DatePlanted, Height, Location)
VALUES
('Mango', 'Mangifera indica', 'Fruit', '2023-01-15', 12.50, 'North Park'),
('Neem', 'Azadirachta indica', 'Medicinal', '2023-02-10', 8.30, 'East Avenue'),
('Banyan', 'Ficus benghalensis', 'Shade', '2023-03-20', 15.70, 'Central Square'),
('Peepal', 'Ficus religiosa', 'Sacred', '2023-04-05', 10.40, 'West Greenway'),
('Gulmohar', 'Delonix regia', 'Ornamental', '2023-05-12', 6.80, 'South Gardens');

INSERT INTO Volunteers (Name, Contact, Address)
VALUES
('Alice', '1234567890', '123 Green St'),
('Bob', '9876543210', '456 Blue Ave'),
('Charlie', '1122334455', '789 Red Blvd'),
('Diana', '5566778899', '101 Yellow Ln'),
('Eve', '2233445566', '202 Pink Rd');

INSERT INTO PlantationActivities (VolunteerID, TreeID, ActivityDate, Description)
VALUES
(1, 1, '2023-01-16', 'Watered the Mango tree'),
(2, 2, '2023-02-11', 'Pruned the Neem tree'),
(3, 3, '2023-03-21', 'Fertilized the Banyan tree'),
(4, 4, '2023-04-06', 'Cleaned the area around Peepal tree'),
(5, 5, '2023-05-13', 'Planted a Gulmohar sapling');

-- Basic queries
SELECT * FROM Trees;
SELECT TreeName AS `Tree Name`, ScientificName AS `Scientific Name` FROM Trees;
SELECT TreeName, Height * 3.28084 AS HeightInFeet FROM Trees;

-- Joins
SELECT t.TreeName, v.Name AS VolunteerName, pa.Description
FROM PlantationActivities pa
INNER JOIN Trees t ON pa.TreeID = t.TreeID
INNER JOIN Volunteers v ON pa.VolunteerID = v.VolunteerID;

SELECT t.TreeName, pa.Description
FROM Trees t
LEFT JOIN PlantationActivities pa ON t.TreeID = pa.TreeID;

-- View
CREATE OR REPLACE VIEW VolunteerActivities AS
SELECT
    v.Name AS VolunteerName,
    t.TreeName,
    pa.Description,
    pa.ActivityDate
FROM PlantationActivities pa
JOIN Volunteers v ON pa.VolunteerID = v.VolunteerID
JOIN Trees t ON pa.TreeID = t.TreeID;

-- Aggregation and subquery
SELECT COUNT(*) AS TotalTrees, AVG(Height) AS AverageHeight FROM Trees;
SELECT TreeName, Height
FROM Trees
WHERE Height > (SELECT AVG(Height) FROM Trees);

-- Trigger validation
DROP TRIGGER IF EXISTS BeforeTreeInsert;
DELIMITER //
CREATE TRIGGER BeforeTreeInsert
BEFORE INSERT ON Trees
FOR EACH ROW
BEGIN
    IF NEW.Height IS NOT NULL AND NEW.Height <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Height must be greater than 0';
    END IF;
END//
DELIMITER ;

-- Transaction example
START TRANSACTION;
UPDATE Trees SET Height = Height + 1 WHERE TreeName = 'Neem';
SAVEPOINT BeforeRollback;
UPDATE Trees SET Height = Height - 2 WHERE TreeName = 'Mango';
ROLLBACK TO BeforeRollback;
COMMIT;

-- Indexing
CREATE INDEX idx_tree_category ON Trees (Category);

-- Insights
SELECT COUNT(*) AS TotalTrees FROM Trees;
SELECT AVG(Height) AS AverageHeight FROM Trees;
SELECT * FROM Trees WHERE Category = 'Medicinal';
SELECT v.Name, t.TreeName
FROM Volunteers v
JOIN PlantationActivities pa ON v.VolunteerID = pa.VolunteerID
JOIN Trees t ON pa.TreeID = t.TreeID;
SELECT TreeName FROM Trees ORDER BY DatePlanted DESC LIMIT 1;

-- Optional administrative examples (run only with suitable privileges and user setup)
-- GRANT SELECT, INSERT ON TreePlantation.* TO 'readonlyuser'@'localhost';
-- REVOKE INSERT ON TreePlantation.* FROM 'readonlyuser'@'localhost';
