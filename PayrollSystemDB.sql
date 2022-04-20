drop table Employee;
drop table HourlyEmployee;
drop table SalaryEmployee;
drop table Timecard;
drop table Payroll;

CREATE TABLE Employee (
  Employee_ID INT NOT NULL,
  Employee_Type INT,
  First_Name VARCHAR(50),
  Last_Name VARCHAR(50),
  SSN BIGINT,
  User_ID VARCHAR(20),
  Password VARCHAR(20),
  
  
  PRIMARY KEY(Employee_ID)
);

INSERT INTO Employee 
  (Employee_ID, Employee_Type, First_Name, Last_Name, SSN, User_ID, Password)
VALUES 
  (1001,1, 'Bob', 'Smith', 555121234, 'x', 'x'),
  (1002,1,'Billy','Bob',489213943,'User2','user2'),
  (1003,2,'John','Smith',3819312384,'User3','user3'),
  (1004,2,'Jane','Doe',31287343,'User4','user4');

Create Table HourlyEmployee(
    Employee_ID INT NOT NULL,
    Hourly_Rate DOUBLE,
    Overtime_Rate DOUBLE
    );
INSERT INTO HourlyEmployee 
  (Employee_ID, Hourly_Rate, Overtime_Rate)
VALUES 
  (1001,12.75,1.5),
  (1002,12.75,1.5);


Create Table SalaryEmployee(
    Employee_ID INT NOT NULL,
    Salary DOUBLE
);

INSERT INTO SalaryEmployee
(Employee_ID, Salary)
VALUES
    (1003,1000),
    (1004,850);



Create Table Timecard(
    Timecard_ID INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    Employee_ID INT,
    Timecard_Date Date,
    Hours_Worked DOUBLE,
    Overtime_Hours DOUBLE,
    
    PRIMARY KEY(Timecard_ID)

);

INSERT INTO Timecard 
  (Employee_ID, Timecard_Date, Hours_Worked, Overtime_Hours)
VALUES 
  (1001,'3/25/2022',8.0,2.5),
  (1001,'3/25/2022',8.0,3.5),
  (1002,'3/25/2022',8.0,1.5),
  (1002,'3/25/2022',8.0,0.0);

/*NEED TO MAKE PAYROLL TABLE AND WITHHOLDING TABLE AND JUST DO THE SAME STUFF YOU DID FOR EMPLOYEE 
TO TIMECARD */

Create Table Payroll(
    Employee_ID INT,
    grossPay DOUBLE,
    totalDeductions DOUBLE,
    netPay DOUBLE
);

INSERT INTO Payroll 
  (Employee_ID,grossPay,totalDeductions,netPay)
VALUES 
  (1001,860,980,1200),
  (1001,860,980,1200),
  (1002,860,980,1200),
  (1002,860,980,1200);

Create Table WithholdingType(
    ID INT,
    description VARCHAR(50),
    amount DOUBLE,
    rate DOUBLE
);

INSERT INTO WithholdingType 
  (ID,description,amount,rate)
VALUES 
  (1,'401k',250,0.2),
  (2,'tax',250,0.2);