--CAR RENTAL SYSTEM CODING CHALLENGE

--Creating database CarRentalSystem
Create database CarRentalSystem

--Using Database 
use  CarRentalSystem

--Creating Table Vehicle
Create table Vehicle (
    vehicleID int Primary Key,
    Make varchar(20),
    Model varchar(20),
    Year int,
    DailyRate decimal(20,2),
    Status varchar(20),
    PassengerCapacity int,
    EngineCapacity int
);

--Creating Customer Table
Create table Customer (
    customerID int Primary Key,
    firstName varchar(100),
    lastName varchar(100),
    email varchar(100),
    phoneNumber varchar(15) 
);

--Creating Lease Table
Create table Lease (
    leaseID int Primary Key,
    carID int,
    customerID int,
    startDate date,
    endDate date,
    type varchar(10),
    Foreign Key(vehicleID) References Vehicle(vehicleID),
    Foreign Key(customerID) References Customer(customerID)
);

--Creating Payment Table
Create table Payment (
    paymentID int Primary Key,
    leaseID int,
    paymentDate date,
    amount decimal(20,2),
    Foreign Key(leaseID) References Lease(leaseID)
);


--Inserting Data into Vehicle Table 
Insert into Vehicle (vehicleID, Make, Model, Year, DailyRate, Status, PassengerCapacity, EngineCapacity) Values 
(1, 'Toyota','Camry', 2022, 50.00, 1, 4, 1450),
(2, 'Honda','Civic', 2023, 45.00, 1, 7, 1500),
(3, 'Ford','Focus', 2022, 48.00, 0, 4, 1400),
(4, 'Nissan','Altima', 2023, 52.00, 1, 7, 1200),
(5, 'Chevrolet','Malibu', 2022, 47.00, 1, 4, 1800),
(6, 'Hyundai', 'Sonata', 2023, 49.00, 0, 7, 1400),
(7, 'BMW','3 Series', 2023, 60.00, 1, 7, 2499),
(8,'Mercedes','C-Class',2022,58.00,1,8,2599),
(9,'Audi','A4',2022 ,55.00, 0, 4, 2500),
(10,'Lexus','ES',2023, 54.00, 1, 4, 2500)


--Inserting Data into Customer Table 
Insert into Customer (customerID,firstName,lastName,email,phoneNumber) Values
(1,'John','Doe', 'johndoe@example.com', '555-555-5555'),
(2,'Jane', 'Smith', 'janesmith@example.com', '555-123-4567'),
(3,'Robert', 'Johnson', 'robert@example.com', '555-789-1234'),
(4,'Sarah', 'Brown', 'sarah@example.com', '555-456-7890'),
(5,'David', 'Lee', 'david@example.com', '555-987-6543'),
(6,'Laura', 'Hall', 'laura@example.com', '555-234-5678'),   
(7,'Michael', 'Davis', 'michael@example.com', '555-876-5432'),
(8,'Emma', 'Wilson', 'emma@example.com', '555-432-1098'),
(9,'William', 'Taylor', 'william@example.com', '555-321-6547'),
(10,'Olivia', 'Adams', 'olivia@example.com', '555-765-4321')  


--Inserting Data into Lease Table 
Insert into Lease (leaseID,vehicleID,customerID,startDate,endDate,type) Values
(1, 1, 1, '2023-01-01', '2023-01-05','Daily'),
(2, 2, 2, '2023-02-15', '2023-02-28','Monthly'),
(3, 3, 3, '2023-03-10', '2023-03-15','Daily'),
(4, 4, 4, '2023-04-20', '2023-04-30','Monthly'),
(5, 5, 5, '2023-05-05', '2023-05-10','Daily'),
(6, 4, 3, '2023-06-15', '2023-06-30','Monthly'),
(7, 7, 7, '2023-07-01', '2023-07-10','Daily'),
(8, 8, 8, '2023-08-12', '2023-08-15','Monthly'),
(9, 3, 3, '2023-09-07', '2023-09-10','Daily'),
(10, 10, 10, '2023-10-10', '2023-10-31','Monthly');


--Inserting Data into Payment Table
Insert into Payment (paymentID,leaseID,paymentDate,amount) values 
(1, 1,'2023-01-03',200.00),
(2, 2,'2023-02-20',1000.00),
(3, 3,'2023-03-12',75.00),
(4, 4,'2023-04-25',900.00),
(5, 5,'2023-05-07',60.00),
(6,6,'2023-06-18',1200.00),
(7, 7,'2023-07-03',40.00),
(8, 8,'2023-08-14',1100.00),
(9, 9,'2023-09-09',80.00),
(10, 10,'2023-10-25',1500.00)


--1.Update the daily rate for a Mercedes car to 68.
Update  Vehicle  set DailyRate=68 where Make='Mercedes'


--2. Delete a specific customer and all associated leases and payments.
Alter Table Lease Add Constraint FK_CID Foreign Key(customerID) REFERENCES Customer(customerID) ON DELETE CASCADE
Alter Table Payment Add Constraint FK_LID Foreign Key(leaseID) REFERENCES Lease(leaseID) ON DELETE CASCADE

Delete Customer Where customerID = 10  

--3. Rename the "paymentDate" column in the Payment table to "transactionDate".
EXEC sp_rename 'Payment.paymentDate', 'transactionDate', 'COLUMN'; --Using Stored Procedure 


--4. Find a specific customer by email.
Select * from Customer where email='olivia@example.com'

--5. Get active leases for a specific customer.
Select L.* from 
Lease L Join Vehicle V ON L.vehicleID = V.vehicleID
Join Customer C ON L.customerID = C.customerID 
Where C.customerID = 1 and V.Status = 1

--6. Find all payments made by a customer with a specific phone number.
Select C.customerID,C.firstName,C.lastName,P.* from 
Payment P Join Lease L ON P.leaseID = L.leaseID
Join Customer C ON C.customerID = L.customerID
Where phoneNumber =  '555-765-4321'

--7. Calculate the average daily rate of all available cars.
Select Avg(dailyRate) As [AverageDailyRate]
from Vehicle Where status = 1


--8. Find the car with the highest daily rate.
Select top 1 vehicleID,make,model from Vehicle 
order by DailyRate DESC

--9. Retrieve all cars leased by a specific customer.
Select C.firstName,C.lastName,V.vehicleID,V.make From 
Vehicle V Join Lease L ON V.vehicleID = L.vehicleID
Join Customer C ON L.customerID = C.customerID
Where C.phoneNumber = '555-765-4321'

--10. Find the details of the most recent lease.
Select Top 1 * From Lease 
Order by endDate DESC


--11. List all payments made in the year 2023.
Select*from Payment
Where year(transactionDate)= 2023; --The Column paymentDate is renamed to transactionDate in QUERY 3


--12. Retrieve customers who have not made any payments.
Select C.* From 
Customer C Left Join Lease L ON C.customerID = L.customerID
Left Join Payment P ON L.leaseID = P.leaseID
where P.paymentID is NULL;

--13. Retrieve Car Details and Their Total Payments.
Select V.vehicleID,V.make,Sum(P.amount) As TotalPayments From 
Vehicle V Left Join Lease L ON V.vehicleID = L.vehicleID
Left Join Payment P ON L.leaseID = P.leaseID
group by V.vehicleID;


--14. Calculate Total Payments for Each Customer.
Select C.*, Sum(P.amount) As TotalPayments From 
Customer C Left Join Lease L ON C.customerID = L.customerID
left join Payment P ON L.leaseID = P.leaseID
Group By C.customerID, C.firstName, C.lastName, C.email, C.phoneNumber;

--15. List Car Details for Each Lease.
Select L.leaseID,V.* From 
Lease L Join Vehicle V ON L.vehicleID= V.vehicleID


--16. Retrieve Details of Active Leases with Customer and Car Information.
Select L.*,V.*,C.* From 
Lease L Join Vehicle V on L.vehicleID = V.vehicleID
Join Customer C on L.customerID = C.customerID
Where L.startDate <= GETDATE() and L.endDate >= GETDATE()  

--17. Find the Customer Who Has Spent the Most on Leases.
Select top 1 C.*,Sum(P.amount) As [TotalSpentOnLeases] From 
Customer C Left Join Lease L ON C.customerID = L.customerID
Left Join Payment P on L.leaseID = P.leaseID
Group By C.customerID,C.firstName,C.lastName,C.email,C.phoneNumber
Order By TotalSpentOnLeases DESC

--18. List All Cars with Their Current Lease Information
Select V.*,L.* From 
Vehicle V Left Join Lease L on V.vehicleID = L.vehicleID