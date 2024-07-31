CREATE DATABASE IF NOT EXISTS bdhotel;

USE  bdhotel;

-- Creación de la tabla TipoReserva
CREATE TABLE TIPORESERVA (
    tipo_res INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(50)
);

-- Creación de la tabla Pago
CREATE TABLE PAGO (
    pago_id INT PRIMARY KEY AUTO_INCREMENT,
    reserva_id INT,
    monto DECIMAL(10, 2) NOT NULL
);

-- Creación de la tabla Reserva
CREATE TABLE RESERVA (
    reserva_id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_entrada DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    cliente_id INT,
    habitacion_id INT,
    tipo_res INT
);

-- Creación de la tabla Habitacion
CREATE TABLE HABITACION (
    habitacion_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_id INT,
    hotel_id INT
);

-- Creación de la tabla TipoHabitacion
CREATE TABLE TIPOHABITACION (
    tipo_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_nombre VARCHAR(50) NOT NULL,
    capacidad INT NOT NULL
);

-- Creación de la tabla Disponibilidad
CREATE TABLE DISPONIBILIDAD (
    disponibilidad_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_id INT,
    fecha DATE NOT NULL,
    disponible BOOLEAN NOT NULL
);

-- Creación de la tabla Cliente
CREATE TABLE CLIENTE (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL ,
    fecha_alta DATE NOT NULL,
    correo VARCHAR(50) UNIQUE NOT NULL 
);

-- Creación de la tabla Hotel
CREATE TABLE HOTEL (
    hotel_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL 
);

--Alter table

ALTER TABLE PAGO ADD CONSTRAINT FK_PAGO_RESERVA FOREIGN KEY (reserva_id) REFERENCES RESERVA (reserva_id);

ALTER TABLE RESERVA ADD CONSTRAINT FK_RESERVA_CLIENTE FOREIGN KEY (cliente_id) REFERENCES CLIENTE (cliente_id);
ALTER TABLE RESERVA ADD CONSTRAINT FK_RESERVA_HAB FOREIGN KEY (habitacion_id) REFERENCES HABITACION (habitacion_id);
ALTER TABLE RESERVA ADD CONSTRAINT FK_RESERVA_TIPORES FOREIGN KEY (tipo_res) REFERENCES TIPORESERVA (tipo_res);

ALTER TABLE HABITACION ADD CONSTRAINT FK_HAB_TIPHAB FOREIGN KEY (tipo_id) REFERENCES TIPOHABITACION (tipo_id);
ALTER TABLE HABITACION ADD CONSTRAINT FK_HAB_HOTEL FOREIGN KEY (hotel_id) REFERENCES HOTEL (hotel_id);

ALTER TABLE DISPONIBILIDAD ADD CONSTRAINT FK_DISP_TIPHAB FOREIGN KEY (tipo_id) REFERENCES TIPOHABITACION (tipo_id);


Funciones



