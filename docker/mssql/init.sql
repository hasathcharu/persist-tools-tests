CREATE DATABASE [hospital];
GO
USE [hospital];
GO

CREATE TABLE [Doctor] (
	[id] INT NOT NULL,
	[name] VARCHAR(191) NOT NULL,
	[specialty] VARCHAR(191) NOT NULL,
	[phone_number] VARCHAR(191) NOT NULL,
	[salary] DECIMAL(10,2),
	PRIMARY KEY([id])
);
GO

CREATE TABLE [patients] (
	[ID_P] INT IDENTITY(1,1),
	[name] VARCHAR(191) NOT NULL,
	[age] INT NOT NULL,
	[ADDRESS] VARCHAR(191) NOT NULL,
	[phoneNumber] CHAR(10) NOT NULL,
	[gender] VARCHAR(6) CHECK ([gender] IN ('MALE', 'FEMALE')) NOT NULL,
	PRIMARY KEY([ID_P])
);
GO

CREATE TABLE [appointment] (
	[id] INT NOT NULL,
	[reason] VARCHAR(191) NOT NULL,
	[appointmentTime] DATETIME2 NOT NULL,
	[status] VARCHAR(9) CHECK ([status] IN ('SCHEDULED', 'STARTED', 'ENDED')) NOT NULL,
	[patient_id] INT NOT NULL,
	FOREIGN KEY([patient_id]) REFERENCES [patients]([ID_P]),
	[doctorId] INT NOT NULL,
	FOREIGN KEY([doctorId]) REFERENCES [Doctor]([id]),
	PRIMARY KEY([id])
);
GO

CREATE UNIQUE INDEX [reason_index] ON [appointment] ([reason]);
GO

CREATE INDEX [specialty_index] ON [Doctor] ([specialty]);
GO

CREATE DATABASE [hospital_unsupported];
GO
USE [hospital_unsupported];
GO

CREATE TABLE [Doctor] (
	[id] INT NOT NULL,
	[name] VARCHAR(191) NOT NULL,
	[specialty] VARCHAR(20) NOT NULL,
	[phone_number] VARCHAR(191) NOT NULL,
	[salary] MONEY,
	PRIMARY KEY([id])
);
GO

CREATE TABLE [patients] (
	[ID_P] INT IDENTITY(1,1),
	[name] VARCHAR(191) NOT NULL,
	[age] INT NOT NULL,
	[ADDRESS] VARCHAR(191) NOT NULL,
	[phoneNumber] CHAR(10) NOT NULL,
	[gender] VARCHAR(6) CHECK ([gender] IN ('MALE', 'FEMALE')) NOT NULL,
	PRIMARY KEY([ID_P])
);
GO

CREATE TABLE [appointment] (
	[id] INT NOT NULL,
	[reason] VARCHAR(191) NOT NULL,
	[appointmentTime] DATETIME2 NOT NULL,
	[status] VARCHAR(9) CHECK ([status] IN ('SCHEDULED', 'STARTED', 'ENDED')) NOT NULL,
	[patient_id] INT NOT NULL,
	FOREIGN KEY([patient_id]) REFERENCES [patients]([ID_P]),
	[doctorId] INT NOT NULL,
	FOREIGN KEY([doctorId]) REFERENCES [Doctor]([id]),
	PRIMARY KEY([id])
);
GO

INSERT INTO [Doctor] (id, name, specialty, phone_number, salary) VALUES (1, 'Doctor Mouse', 'Physician', '0771690000', 100000.00);
GO

CREATE UNIQUE INDEX [reason_index] ON [appointment] ([reason]);
GO

CREATE INDEX [specialty_index] ON [Doctor] ([specialty]);
GO
