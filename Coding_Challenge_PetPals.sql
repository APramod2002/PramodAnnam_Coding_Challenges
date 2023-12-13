--PETPALS CODING CHALLENGE

Create Database PetPals
Use PetPals

Create Table Pets (
    PetID int PRIMARY KEY,
    Name Varchar(50),
    Age int,
    Breed Varchar(50),
    Type Varchar(50),
    AvailableForAdoption int
);

Create Table Shelters (
    ShelterID int PRIMARY KEY,
    Name Varchar(50),
    Location Varchar(50)
);

Create Table Donations (
    DonationID int PRIMARY KEY,
    DonorName Varchar(50),
    DonationType Varchar(50),
    DonationAmount DECIMAL,
    DonationItem Varchar(50),
    DonationDate DATETIME
);

Create Table AdoptionEvents (
    EventID int PRIMARY KEY,
    EventName Varchar(50),
    EventDate DATETIME,
    Location Varchar(50)
);

Create Table Participants (
    ParticipantID int PRIMARY KEY,
    ParticipantName Varchar(50),
    ParticipantType Varchar(50),
    EventID int,
    FOREIGN KEY (EventID) REFERENCES AdoptionEvents(EventID)
);



-- Inserting 10 entries into Pets table
Insert Into Pets (PetID, Name, Age, Breed, Type, AvailableForAdoption) Values
    (1, 'Charlie', 2, 'Bulldog', 'Dog', 1),
    (2, 'Cooper', 1, 'British Shorthair', 'Cat', 1),
    (3, 'Max', 3, 'Poodle', 'Dog', 0),
    (4, 'Milo', 1, 'French Bulldog', 'Dog', 1),
    (5, 'Oliver', 2, 'Persian', 'Cat', 1),
    (6, 'Buddy', 4, 'Dachsund', 'Dog', 1),
    (7, 'Rocky', 1, 'Yorkshire Terrier', 'Dog', 0),
    (8, 'Teddy', 2, 'Siamese', 'Cat', 1),
    (9, 'Luna', 1, 'Boxer', 'Dog', 1),
    (10, 'Bella', 3, 'Ragdoll', 'Cat', 1);


-- Insert 10 entries into Shelters table
Insert Into Shelters (ShelterID, Name, Location) Values
    (1, 'White Paws', 'Mumbai'),
    (2, 'Golden Gate', 'Delhi'),
    (3, 'The Pet Haven', 'Bangalore'),
    (4, 'Blue Cross Center', 'Chennai'),
    (5, 'Bow Wow Rescue', 'Kolkata'),
    (6, 'Furry Friends Shelter', 'Hyderabad'),
    (7, 'Pet Paradise', 'Pune'),
    (8, 'Pet Connect', 'Ahmedabad'),
    (9, 'Caring Souls Shelter', 'Jaipur'),
    (10, 'Pets Perfection', 'Lucknow');

-- Insert 10 entries into Donations table
Insert Into Donations (DonationID, DonorName, DonationType, DonationAmount, DonationItem, DonationDate) Values
    (1, 'Deepik Patel', 'Cash', 100.00, 'Pet Toys', '2023-01-15 10:30:00'),
    (2, 'Raj Kumar', 'Item', 150.00, 'Pet Food', '2023-02-02 15:45:00'),
    (3, 'Adithya Roy', 'Cash', 50.00, 'Pet Food', '2023-03-10 08:20:00'),
    (4, 'Pooja Mehta', 'Item', 85.00, 'Pet Toys', '2023-04-05 12:10:00'),
    (5, 'Ananya Sharma', 'Cash', 75.00, 'Cat Food', '2023-05-20 14:55:00'),
    (6, 'Viraj Shekar', 'Item', 130.00, 'Pet Bed', '2023-06-18 09:30:00'),
    (7, 'Priya Sharma', 'Cash', 120.00, 'Cat Bed', '2023-07-03 11:40:00'),
    (8, 'Arjun Kapoor', 'Item', 90.00, 'Cat Litter', '2023-08-22 16:15:00'),
    (9, 'Neha Singh', 'Cash', 90.00, 'Cat Food', '2023-09-14 13:25:00'),
    (10, 'Amit Sharma', 'Item', 100.00, 'Dog Leash', '2023-10-30 07:50:00');

-- Insert 10 entries into AdoptionEvents table
Insert Into AdoptionEvents (EventID, EventName, EventDate, Location) Values
    (1, 'Paws Haven', '2023-01-25 11:00:00', 'Mumbai'),
    (2, 'Hearts Shelter', '2023-03-15 14:30:00', 'Hyderabad'),
    (3, 'Adopt-a-Pet Carnival', '2023-05-05 12:00:00', 'Kolkata'),
    (4, 'Whisker Haven', '2023-07-10 10:00:00', 'Bangalore'),
    (5, 'Hopeful Paws', '2023-09-02 15:00:00', 'Ahmedabad'),
    (6, 'Rainbow Shelter', '2023-10-18 13:45:00', 'Pune'),
    (7, 'Sunshine Pet Expo', '2023-12-01 09:30:00', 'Lucknow'),
    (8, 'Hearts Shelter Adoption Drive', '2024-02-08 11:20:00', 'Delhi'),
    (9, 'Caring Souls Pet Affair', '2024-04-03 16:00:00', 'Jaipur'),
    (10, 'Rainbow Adoption Event', '2024-06-22 10:45:00', 'Chennai');

-- Insert 10 entries into Participants table
Insert Into Participants (ParticipantID, ParticipantName, ParticipantType, EventID) Values
    (1, 'Paws Haven', 'Shelter', 1),
    (2, 'Deepak Patel', 'Adopter', 1),
    (3, 'Hearts Shelter', 'Shelter', 2),
    (4, 'Neha Singh', 'Adopter', 2),
    (5, 'Whisker Haven', 'Shelter', 3),
    (6, 'Raj Kumar', 'Adopter', 3),
    (7, 'Rainbow Shelter', 'Shelter', 4),
    (8, 'Pooja Mehta', 'Adopter', 4),
    (9, 'Hopeful Paws', 'Shelter', 5),
    (10, 'Amit Sharma', 'Adopter', 5);



--5.Write an SQL query that retrieves a list of available pets (those marked as available for adoption) 
--from the "Pets" table. Include the pet's name, age, breed, and type in the result set. Ensure that 
--the query filters out pets that are not available for adoption.
Select Name, Age, Breed, Type
From Pets
WHERE AvailableForAdoption = 1
Order By Name;


--6.Write an SQL query that retrieves the names of participants (shelters and adopters) registered 
--for a specific adoption event. Use a parameter to specify the event ID. Ensure that the query 
--joins the necessary tables to retrieve the participant names and types
DECLARE @EventID INT 
SET @EventID = 1;
SELECT P.ParticipantName, P.ParticipantType
FROM Participants P JOIN AdoptionEvents A 
ON P.EventID = A.EventID
WHERE A.EventID = @EventID;


--7.Create a stored procedure in SQL that allows a shelter to update its information (name and 
--location) in the "Shelters" table. Use parameters to pass the shelter ID and the new information. 
CREATE PROCEDURE update_info
As
Update Shelters SET Name='Pet Paws Shelter', Location='Andhra Pradesh' 
Where ShelterID = 6;
EXEC update_info;


--8.Write an SQL query that calculates and retrieves the total donation amount for each shelter (by 
--shelter name) from the "Donations" table. The result should include the shelter name and the 
--total donation amount. Ensure that the query handles cases where a shelter has received no donations
SELECT S.ShelterID,S.Name AS ShelterName,SUM(D.DonationAmount) AS TotalDonationAmount
FROM Shelters S LEFT JOIN Donations D ON S.ShelterID = D.DonationID
GROUP BY S.ShelterID, S.Name;


--9.Write an SQL query that retrieves the names of pets from the "Pets" table that do not have an 
--owner (i.e., where "OwnerID" is null). Include the pet's name, age, breed, and type in the result set.

	--First,Altering the table 'Pets' and adding the coluumn 'OwnerID'
	Alter Table Pets
	Add OwnerID int
	--Inserting values into the column 'OwnerID'
	Update Pets SET OwnerID = 1 where PetID = 1;
	Update Pets SET OwnerID = 2 where PetID = 2;
	Update Pets SET OwnerID = 4 where PetID = 4;
	Update Pets SET OwnerID = 5 where PetID = 5;
	Update Pets SET OwnerID = 6 where PetID = 6;
	Update Pets SET OwnerID = 8 where PetID = 8;
	Update Pets SET OwnerID = 9 where PetID = 9;
	Update Pets SET OwnerID = 10 where PetID = 10;
--Continuing with Query
SELECT Name,Age,Breed,Type    
FROM Pets
WHERE OwnerID is NULL;


--10.Write an SQL query that retrieves the total donation amount for each month and year (e.g.,January 2023) from 
--"Donations" table. The result should include the month-year and the corresponding total donation amount.
SELECT FORMAT(DonationDate, 'MMMM yyyy') AS MonthYear,COALESCE(SUM(DonationAmount), 0) AS TotalDonationAmount
FROM Donations
GROUP BY FORMAT(DonationDate, 'MMMM yyyy');


--11.Retrieve a list of distinct breeds for all pets that are either aged between 1 and 3 years or older
--than 5 years.
SELECT DISTINCT Breed
FROM Pets
WHERE (Age BETWEEN 1 AND 3) OR (Age > 5);


--12.Retrieve a list of pets and their respective shelters where the pets are currently available for 
--adoption.
SELECT P.Name AS PetName,S.Name AS ShelterName,P.AvailableForAdoption As [Currently Available For Adoption]
FROM Pets P JOIN Shelters S ON P.PetID = S.ShelterID
WHERE P.AvailableForAdoption = 1;


--13.Find the total number of participants in events organized by shelters located in specific city
SELECT COUNT( P.ParticipantID) AS TotalParticipants
FROM Participants P JOIN AdoptionEvents A ON P.EventID = A.EventID
JOIN Shelters S ON A.Location = S.Location
WHERE P.ParticipantType = 'Shelter' AND S.Location = '%Delhi';


--14.Retrieve a list of unique breeds for pets with ages between 1 and 5 years
SELECT DISTINCT Breed
FROM Pets
WHERE Age BETWEEN 1 AND 5;


--15.Find the pets that have not been adopted by selecting their information from the 'Pet' table
SELECT * FROM Pets
WHERE AvailableForAdoption = 1;

--16.Retrieve the names of all adopted pets along with the adopter's name from the 'Adoption' and 'User' tables.
	--Firstly,Creating tables and inserting values into the tables
	Create Table Users (
		UserID int PRIMARY KEY,
		UserName Varchar(255)
	);

	Insert Into Users Values
		(1,'Jane'),
		(2,'Jack'),
		(3,'Joey');

	Create Table Adoptions (
		AdoptionID int PRIMARY KEY,
		PetID int,
		AdopterID int,
		FOREIGN KEY (PetID) REFERENCES Pets(PetID),
		FOREIGN KEY (AdopterID) REFERENCES Users(UserID)
	);

	Insert Into Adoptions Values
		(1,3,1),
		(2,4,2),
		(3,7,3);
--Continuing with the Query 
SELECT P.Name AS PetName, P.Breed, U.UserName AS AdopterName
FROM Pets P
JOIN Adoptions A ON P.PetID = A.PetID
JOIN Users U ON A.AdopterID = U.UserID;


--17.Retrieve a list of all shelters along with the count of pets currently available for adoption in each 
--shelter.
SELECT S.ShelterID,S.Name AS ShelterName,COUNT(P.PetID) AS AvailablePetsCount
FROM Shelters S LEFT JOIN Pets P ON S.ShelterID = P.PetID
WHERE P.AvailableForAdoption = 1 OR P.AvailableForAdoption IS NULL
GROUP BY S.ShelterID, S.Name;


--18.Find pairs of pets from the same shelter that have the same breed.
	--First, Altering the table 'Pets' and addig a column 'ShelterId' 
	Alter Table Pets
	Add ShelterID int 
	--Inserting Values into the column 'ShelterID'
	Update Pets SET ShelterID = 1 Where PetID = 1;
	Update Pets SET ShelterID = 1 Where PetID = 2;
	Update Pets SET ShelterID = 1 Where PetID = 3;
	Update Pets SET ShelterID = 3 Where PetID = 4;
	Update Pets SET ShelterID = 6 Where PetID = 5;
	Update Pets SET ShelterID = 5 Where PetID = 6;
	Update Pets SET ShelterID = 1 Where PetID = 7;
	Update Pets SET ShelterID = 8 Where PetID = 8;
	Update Pets SET ShelterID = 4 Where PetID = 9;
	Update Pets SET ShelterID = 9 Where PetID = 10;
--Continuing with Query.
SELECT 
P1.PetID AS Pet1ID,P1.Name AS Pet1Name,P1.Breed AS Pet1Breed,
P2.PetID AS Pet2ID,P2.Name AS Pet2Name,P2.Breed AS Pet2Breed,
S.Name AS ShelterName
FROM Pets P1 JOIN Pets P2 ON P1.Breed = P2.Breed AND P1.PetID < P2.PetID AND P1.ShelterID = P2.ShelterID
JOIN Shelters S ON P1.ShelterID = S.ShelterID
WHERE P1.AvailableForAdoption = 1 AND P2.AvailableForAdoption = 1;


--19.List all possible combinations of shelters and adoption events
SELECT
S.ShelterID,S.Name AS ShelterName,
AE.EventID,AE.EventName,AE.EventDate,AE.Location AS EventLocation
FROM Shelters S CROSS JOIN AdoptionEvents AE
Order By ShelterID


--20.Determine the shelter that has the highest number of adopted pets
Select S.ShelterID,COUNT(P.AvailableForAdoption) As [Highest Number Of Adopted Pets]
from Pets P Join Shelters S 
ON P.ShelterID = S.ShelterID
Group By S.ShelterID
Having COUNT(P.AvailableForAdoption)>MAX(P.AvailableForAdoption)