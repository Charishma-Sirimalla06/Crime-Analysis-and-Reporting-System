create database project;
use project;

CREATE TABLE Victims ( victimid INT PRIMARY KEY, 
firstname VARCHAR(55), 
lastname VARCHAR(55), 
vdob DATE,  
gender VARCHAR(10), 
address VARCHAR(255), 
vphno VARCHAR(11));

CREATE TABLE Suspects (
    suspectid INT PRIMARY KEY,
    firstname VARCHAR(55),
    lastname VARCHAR(55),
    sdob DATE,
    gender VARCHAR(10),
    scontactinfo VARCHAR(255)
);

CREATE TABLE LawEnforcementAgencies (
    agencyid INT PRIMARY KEY,
    agencyname VARCHAR(255),
    jurisdiction VARCHAR(255),
    contactinfo VARCHAR(255)
);

CREATE TABLE Officers (
    officerid INT PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    badgeno VARCHAR(20),
    officerRank VARCHAR(50),
    contactinfo VARCHAR(255),
    agencyid INT,
    FOREIGN KEY (agencyid) REFERENCES LawEnforcementAgencies(agencyid) ON DELETE CASCADE
);

CREATE TABLE Incidents (
    incidentid INT PRIMARY KEY,
    incidenttype VARCHAR(255),
    incidentdate DATE,
    location VARCHAR(255),
    incidentdesc VARCHAR(1000),
    status VARCHAR(50),
    victimid INT,
    suspectid INT,
    FOREIGN KEY (victimid) REFERENCES Victims(victimid),
    FOREIGN KEY (suspectid) REFERENCES Suspects(suspectid) ON DELETE CASCADE
);

CREATE TABLE Reports (
    reportid INT PRIMARY KEY,
    incidentid INT,
    reportingofficer INT,
    reportdate DATE,
    reportdetails VARCHAR(1000),
    reportstatus VARCHAR(50),
    FOREIGN KEY (incidentid) REFERENCES Incidents(incidentid),
    FOREIGN KEY (reportingofficer) REFERENCES Officers(officerid) ON DELETE CASCADE
);

CREATE TABLE Evidence(evidenceid int primary key,
descr varchar(220),
locationfound varchar(100),
incidentid int,
FOREIGN KEY (incidentid) references Incidents(incidentid) 
);

create table Cases(caseId int primary key,
incidentId int,
caseDescription varchar(225),
foreign key (incidentId) references Incidents(incidentId)
);

INSERT INTO Victims (victimid, firstname, lastname, vdob, gender, address, vphno) 
VALUES (1, 'John', 'Doe', '1990-01-15', 'Male', '123 Main St, Cityville', '5551234'),
       (2, 'Ali', 'Naba', '1999-01-15', 'Male', '456 Park St, Townville', '5556789'),
       (3, 'Sara', 'Lee', '1985-03-22', 'Female', '789 Oak St, Villageburg', '5552345'),
       (4, 'Rahul', 'Mehta', '1970-06-10', 'Male', '101 Pine St, Cityville', '5559876'),
       (5, 'Sophia', 'Gomez', '2002-12-25', 'Female', '654 Elm St, Townville', '5554321');

-- Inserting values into Suspects table
INSERT INTO Suspects (suspectid, firstname, lastname, sdob, gender, scontactinfo) 
VALUES (1, 'Jane', 'Smith', '1995-05-20', 'Female', '456 Oak St, Townsville'),
       (2, 'Jada', 'Smith', '2000-05-20', 'Female', 'United Kingdom'),
       (3, 'Mark', 'Jones', '1980-07-15', 'Male', '123 Cedar St, Cityville'),
       (4, 'Luke', 'Brown', '1992-11-12', 'Male', '456 Maple St, Suburbtown'),
       (5, 'Emily', 'Davis', '1985-03-05', 'Female', '789 Birch St, Villageburg');

-- Inserting values into LawEnforcementAgencies table
INSERT INTO LawEnforcementAgencies (agencyid, agencyname, jurisdiction, contactinfo) 
VALUES (1, 'City Police Department', 'Citywide', '123 Pine St, Retropolis'),
       (2, 'State Troopers', 'Statewide', '789 Broad St, Capitalville'),
       (3, 'Federal Bureau of Investigation', 'Nationwide', '101 Federal St, Capitalville'),
       (4, 'County Sheriff’s Office', 'Countywide', '456 Hill St, Countyseat'),
       (5, 'Metropolitan Police', 'Metro Area', '321 Park Ave, Metropolis');

-- Inserting values into Officers table
INSERT INTO Officers (officerid, firstname, lastname, badgeno, officerRank, contactinfo, agencyid) 
VALUES (1, 'Sam', 'Williams', '12345', 'Sergeant', '555-1111', 1),
       (2, 'Alex', 'Johnson', '23456', 'Lieutenant', '555-2222', 2),
       (3, 'Chris', 'Evans', '34567', 'Captain', '555-3333', 3),
       (4, 'Morgan', 'Lewis', '45678', 'Detective', '555-4444', 4),
       (5, 'Taylor', 'Garcia', '56789', 'Officer', '555-5555', 5);

-- Inserting values into Incidents table
INSERT INTO Incidents (incidentid, incidenttype, incidentdate, location, incidentdesc, status, victimid, suspectid) 
VALUES (1, 'Murder', '2023-01-18', 'Chennai', 'Mysterious man killed a person', 'Under Investigation', 1, 1),
       (2, 'Theft', '2023-02-10', 'Cityville', 'Jewelry stolen from house', 'Closed', 2, 2),
       (3, 'Assault', '2023-03-15', 'Townville', 'Physical assault at park', 'Under Investigation', 3, 3),
       (4, 'Fraud', '2023-04-20', 'Metropolis', 'Financial scam by online syndicate', 'Pending', 4, 4),
       (5, 'Burglary', '2023-05-25', 'Villageburg', 'House burglary during the night', 'Solved', 5, 5);

-- Inserting values into Evidence table
INSERT INTO Evidence (evidenceid, descr, locationfound, incidentid) 
VALUES (1, 'Knife with blood', 'Chennai', 1),
       (2, 'Stolen necklace', 'Cityville', 2),
       (3, 'DNA sample from park', 'Townville', 3),
       (4, 'Emails detailing fraud', 'Metropolis', 4),
       (5, 'Broken window glass', 'Villageburg', 5);

-- Inserting values into Cases table
INSERT INTO Cases (caseid, incidentid, caseDescription) 
VALUES (1, 1, 'Murder case with prime suspect in custody'),
       (2, 2, 'Theft case closed after recovery of stolen items'),
       (3, 3, 'Ongoing investigation into physical assault'),
       (4, 4, 'Fraud case pending trial'),
       (5, 5, 'Burglary case solved with suspect arrested');

select * from LawEnforcementAgencies;
select * from incidents;
select * from Cases;
select * from reports;
select * from Suspects;