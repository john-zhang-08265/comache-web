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

INSERT INTO DeviceValue(deviceMac, timestamp, value, rawValue, metricID)
	VALUES ('test', '2018-10-23 10:00', 25, 5, 1);

INSERT INTO DeviceValue(deviceMac, timestamp, value, rawValue, metricID)
	VALUES ('test', '2018-10-23 11:00', 26, 5.2, 1);

INSERT INTO DeviceValue(deviceMac, timestamp, value, rawValue, metricID)
	VALUES ('test', '2018-10-23 12:00', 24, 4.8, 1);