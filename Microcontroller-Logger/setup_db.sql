CREATE DATABASE SmartHome_DEV;

CREATE TABLE Metric(
	metricID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20),
	unit VARCHAR(5)
);

CREATE TABLE UserDevice(
	userID INTEGER NOT NULL,
	deviceMac CHAR(17) NOT NULL,
	registeredAt TIMESTAMP NOT NULL,
	PRIMARY KEY (deviceMac)
	/*Add userID as foreign key*/
);

CREATE TABLE DeviceValue(
	deviceMac CHAR(17) NOT NULL,
	measureID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	timestamp TIMESTAMP NOT NULL,
	value FLOAT NOT NULL,
	rawValue FLOAT,
	metricID INTEGER,
	FOREIGN KEY (metricID) REFERENCES Metric(metricID),
	FOREIGN KEY (deviceMac) REFERENCES UserDevice(deviceMac)
);

/*
SAMPLE DATA FOR Metric
*/
INSERT INTO Metric(name, unit) VALUES ('Temperature', '°C');
INSERT INTO Metric(name, unit) VALUES ('Humidity', '%');

/*
SAMPLE DATA FOR UserDevice
*/
INSERT INTO UserDevice(userID, deviceMac, registeredAt)
	VALUES (1,'FF:FF:FF:FF:FF:FF', '2018-10-23 09:00');

/*
SAMPLE DATA FOR DeviceValue
*/
INSERT INTO DeviceValue(deviceMac, timestamp, value, rawValue, metricID)
	VALUES ('FF:FF:FF:FF:FF:FF', '2018-10-23 10:00', 25, 5, 1);

INSERT INTO DeviceValue(deviceMac, timestamp, value, rawValue, metricID)
	VALUES ('FF:FF:FF:FF:FF:FF', '2018-10-23 11:00', 26, 5.2, 1);

INSERT INTO DeviceValue(deviceMac, timestamp, value, rawValue, metricID)
	VALUES ('FF:FF:FF:FF:FF:FF', '2018-10-23 12:00', 24, 4.8, 1);

INSERT INTO DeviceValue(deviceMac, timestamp, value, rawValue, metricID)
	VALUES ('FF:FF:FF:FF:FF:FF', '2018-10-23 13:00', 25, 5, 1);

INSERT INTO DeviceValue(deviceMac, timestamp, value, rawValue, metricID)
	VALUES ('FF:FF:FF:FF:FF:FF', '2018-10-23 14:00', 24, 4.8, 1);

INSERT INTO DeviceValue(deviceMac, timestamp, value, rawValue, metricID)
	VALUES ('FF:FF:FF:FF:FF:FF', '2018-10-23 15:00', 24, 4.8, 1);

INSERT INTO DeviceValue(deviceMac, timestamp, value, rawValue, metricID)
	VALUES ('FF:FF:FF:FF:FF:FF', '2018-10-23 16:00', 26, 5.2, 1);

INSERT INTO DeviceValue(deviceMac, timestamp, value, rawValue, metricID)
	VALUES ('FF:FF:FF:FF:FF:FF', '2018-10-23 17:00', 25, 5, 1);

INSERT INTO DeviceValue(deviceMac, timestamp, value, rawValue, metricID)
	VALUES ('FF:FF:FF:FF:FF:FF', '2018-10-23 18:00', 25, 5, 1);




/*
Undeployed database tables and operations
*/
