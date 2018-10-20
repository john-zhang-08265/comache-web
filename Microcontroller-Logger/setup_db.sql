CREATE DATABASE SmartHome_DEV;

CREATE TABLE Metric(
	metricID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20),
	unit VARCHAR(5)
);

CREATE TABLE DeviceValue(
	deviceMac CHAR(17) NOT NULL,
	measureID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	timestamp TIMESTAMP NOT NULL,
	value FLOAT NOT NULL,
	rawValue FLOAT,
	metricID INTEGER,
	FOREIGN KEY (metricID) REFERENCES Metric(metricID)
);

INSERT INTO Metric(name, unit) VALUES ('Temperature', '°C');
INSERT INTO Metric(name, unit) VALUES ('Humidity', '%');
