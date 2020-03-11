CREATE TABLE Airlines (
Id int(11) NOT NULL,
Name varchar(30) DEFAULT NULL,
Abbr varchar(15) DEFAULT NULL,
Country varchar(30) DEFAULT NULL,
PRIMARY KEY (Id)
);

CREATE TABLE Airports (
City varchar(50) DEFAULT NULL,
Code char(3) NOT NULL,
Name varchar(60) DEFAULT NULL,
Country varchar(30) DEFAULT NULL,
CAbbr varchar(15) DEFAULT NULL,
PRIMARY KEY (Code)
);

CREATE TABLE Passengers (
Id INT NOT NULL AUTO_INCREMENT,
Name varchar(60) NOT NULL,
PRIMARY KEY (Id)
);

CREATE TABLE Flights (
Airline INT NOT NULL,
Id INT NOT NULL,
Source char(3) NOT NULL,
Destination char(3) NOT NULL,
Takeoff DATETIME NOT NULL,
Arrival DATETIME NOT NULL,
planeId INT NOT NULL,
full TINYINT NOT NULL DEFAULT 0,
Capacity INT NOT NULL,
PRIMARY KEY(Id),
FOREIGN KEY (Airline) REFERENCES Airlines (Id),
FOREIGN KEY (Source) REFERENCES Airports (Code),
FOREIGN KEY (Destination) REFERENCES Airports (Code)
);


CREATE TABLE Seats (
flightId INT NOT NULL,
seatNo INT NOT NULL,
type varchar(6) NOT NULL,
class varchar(6) NOT NULL,
PRIMARY KEY (seatNo, flightId ),
FOREIGN KEY (flightId ) REFERENCES Flights (Id)
);

CREATE TABLE Reservations (
Id INT NOT NULL AUTO_INCREMENT,
Passenger_id INT NOT NULL,
Seat_no INT NOT NULL,
Cost FLOAT NOT NULL,
Credit_no BIGINT NOT NULL,
Flight_no INT NOT NULL,
Has_paid BOOLEAN NOT NULL, 
Cancelled BOOLEAN NOT NULL,
FOREIGN KEY (Passenger_id ) REFERENCES Passengers (Id),
FOREIGN KEY (Flight_no, Seat_no) REFERENCES Seats (flightId, seatNo),
FOREIGN KEY (Flight_no) REFERENCES Flights (id),
PRIMARY KEY (Id)
);
