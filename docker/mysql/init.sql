CREATE DATABASE hospital;
USE hospital;

CREATE TABLE Doctor (
	  id INT NOT NULL,
	  name VARCHAR(191) NOT NULL,
	  specialty VARCHAR(191) NOT NULL,
	  phone_number VARCHAR(191) NOT NULL,
	  salary DECIMAL(10,2),
	  PRIMARY KEY(id)
);

CREATE TABLE patients (
    ID_P INT AUTO_INCREMENT,
    name VARCHAR(191) NOT NULL,
    age INT NOT NULL,
    ADDRESS VARCHAR(191) NOT NULL,
    phoneNumber CHAR(10) NOT NULL,
    gender ENUM('MALE', 'FEMALE') NOT NULL,
    PRIMARY KEY(ID_P)
);

CREATE TABLE appointment (
    id INT NOT NULL,
    reason VARCHAR(191) NOT NULL,
    appointmentTime DATETIME NOT NULL,
    status ENUM('SCHEDULED', 'STARTED', 'ENDED') NOT NULL,
    patient_id INT NOT NULL,
    FOREIGN KEY(patient_id) REFERENCES patients(ID_P),
    doctorId INT NOT NULL,
    FOREIGN KEY(doctorId) REFERENCES Doctor(id),
    PRIMARY KEY(id)
);

CREATE UNIQUE INDEX reason_index ON appointment (reason);
CREATE INDEX specialty_index ON Doctor (specialty);

CREATE DATABASE hospital_unsupported;
USE hospital_unsupported;

CREATE TABLE Doctor (
	  id INT NOT NULL,
	  name VARCHAR(191) NOT NULL,
	  specialty VARCHAR(191) NOT NULL,
	  phone_number VARCHAR(191) NOT NULL,
	  salary DECIMAL(10,2),
    preferredDrinks SET ('COFFEE', 'TEA', 'WATER'),
	  PRIMARY KEY(id)
);

CREATE TABLE patients (
    ID_P INT AUTO_INCREMENT,
    name VARCHAR(191) NOT NULL,
    age INT NOT NULL,
    ADDRESS VARCHAR(191) NOT NULL,
    phoneNumber CHAR(10) NOT NULL,
    gender ENUM('MALE', 'FEMALE') NOT NULL,
    PRIMARY KEY(ID_P)
);

CREATE TABLE appointment (
    id INT NOT NULL,
    reason VARCHAR(191) NOT NULL,
    appointmentTime DATETIME NOT NULL,
    status ENUM('SCHEDULED', 'STARTED', 'ENDED') NOT NULL,
    patient_id INT NOT NULL,
    FOREIGN KEY(patient_id) REFERENCES patients(ID_P),
    doctorId INT NOT NULL,
    FOREIGN KEY(doctorId) REFERENCES Doctor(id),
    PRIMARY KEY(id)
);

INSERT INTO Doctor (id, name, specialty, phone_number, salary, preferredDrinks) VALUES (1, 'Doctor Mouse', 'Physician', '0771690000', 100000.00, 'COFFEE,TEA');

CREATE UNIQUE INDEX reason_index ON appointment (reason);
CREATE INDEX specialty_index ON Doctor (specialty);
