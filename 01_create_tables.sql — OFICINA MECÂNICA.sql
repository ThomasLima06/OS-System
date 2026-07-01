-- =====================================================
-- CRIAÇÃO DO BANCO DE DADOS - OFICINA MECÂNICA
-- =====================================================

CREATE DATABASE OficinaMecanica;

USE OficinaMecanica;
USE OficinaMecanica;

-- =====================================================
-- CLIENTE
-- =====================================================

CREATE TABLE Client (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

-- =====================================================
-- VEÍCULO
-- =====================================================

CREATE TABLE Vehicle (
    idVehicle INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT NOT NULL,
    Plate VARCHAR(10) NOT NULL UNIQUE,
    Model VARCHAR(50),
    Brand VARCHAR(50),
    Year INT,

    CONSTRAINT fk_vehicle_client
    FOREIGN KEY (idClient)
    REFERENCES Client(idClient)
);

-- =====================================================
-- MECÂNICO
-- =====================================================

CREATE TABLE Mechanic (
    idMechanic INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Specialty VARCHAR(100),
    Phone VARCHAR(15)
);

-- =====================================================
-- EQUIPE
-- =====================================================

CREATE TABLE Team (
    idTeam INT AUTO_INCREMENT PRIMARY KEY,
    TeamName VARCHAR(100) NOT NULL
);

-- =====================================================
-- EQUIPE X MECÂNICO
-- =====================================================

CREATE TABLE TeamMechanic (
    idTeam INT,
    idMechanic INT,

    PRIMARY KEY (idTeam, idMechanic),

    CONSTRAINT fk_teammechanic_team
    FOREIGN KEY (idTeam)
    REFERENCES Team(idTeam),

    CONSTRAINT fk_teammechanic_mechanic
    FOREIGN KEY (idMechanic)
    REFERENCES Mechanic(idMechanic)
);

-- =====================================================
-- ORDEM DE SERVIÇO (OS)
-- =====================================================

CREATE TABLE ServiceOrder (
    idOS INT AUTO_INCREMENT PRIMARY KEY,
    idVehicle INT NOT NULL,
    idTeam INT NOT NULL,

    OSDate DATE,
    
    Status ENUM('Aberta', 'Em Andamento', 'Concluída', 'Cancelada') DEFAULT 'Aberta',

    LaborCost DECIMAL(10,2) DEFAULT 0,

    CONSTRAINT fk_os_vehicle
    FOREIGN KEY (idVehicle)
    REFERENCES Vehicle(idVehicle),

    CONSTRAINT fk_os_team
    FOREIGN KEY (idTeam)
    REFERENCES Team(idTeam)
);

-- =====================================================
-- SERVIÇO
-- =====================================================

CREATE TABLE Service (
    idService INT AUTO_INCREMENT PRIMARY KEY,
    ServiceName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

-- =====================================================
-- OS X SERVIÇO
-- =====================================================

CREATE TABLE OSService (
    idOS INT,
    idService INT,
    Quantity INT DEFAULT 1,

    PRIMARY KEY (idOS, idService),

    CONSTRAINT fk_osservice_os
    FOREIGN KEY (idOS)
    REFERENCES ServiceOrder(idOS),

    CONSTRAINT fk_osservice_service
    FOREIGN KEY (idService)
    REFERENCES Service(idService)
);

-- =====================================================
-- PEÇAS
-- =====================================================

CREATE TABLE Part (
    idPart INT AUTO_INCREMENT PRIMARY KEY,
    PartName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT DEFAULT 0
);

-- =====================================================
-- OS X PEÇAS
-- =====================================================

CREATE TABLE OSPart (
    idOS INT,
    idPart INT,
    Quantity INT DEFAULT 1,

    PRIMARY KEY (idOS, idPart),

    CONSTRAINT fk_ospart_os
    FOREIGN KEY (idOS)
    REFERENCES ServiceOrder(idOS),

    CONSTRAINT fk_ospart_part
    FOREIGN KEY (idPart)
    REFERENCES Part(idPart)
);

-- =====================================================
-- PAGAMENTO
-- =====================================================

CREATE TABLE Payment (
    idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idOS INT NOT NULL,

    PaymentMethod ENUM('PIX', 'Cartão Crédito', 'Cartão Débito', 'Dinheiro'),
    Value DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_payment_os
    FOREIGN KEY (idOS)
    REFERENCES ServiceOrder(idOS)
);