CREATE DATABASE IF NOT EXISTS bdhotel;

USE  bdhotel;

-- Creación de la tabla TipoReserva
CREATE TABLE TIPORESERVA (
    tipo_res INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

-- Creación de la tabla Pago
CREATE TABLE PAGO (
    pago_id INT PRIMARY KEY AUTO_INCREMENT,
    reserva_id INT,
    monto DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (reserva_id) REFERENCES RESERVA(reserva_id)
);

-- Creación de la tabla Reserva
CREATE TABLE RESERVA (
    reserva_id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_entrada DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    cliente_id INT,
    habitacion_id INT,
    tipo_reserva_id INT,
    FOREIGN KEY (cliente_id) REFERENCES CLIENTE(cliente_id),
    FOREIGN KEY (habitacion_id) REFERENCES HABITACION(habitacion_id),
    FOREIGN KEY (tipo_reserva_id) REFERENCES TIPORESERVA(tipo_reserva_id)
);

-- Creación de la tabla Habitacion
CREATE TABLE HABITACION (
    habitacion_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_id INT,
    hotel_id INT,
    FOREIGN KEY (tipo_id) REFERENCES TIPOHABITACION(tipo_id),
    FOREIGN KEY (hotel_id) REFERENCES HOTEL(hotel_id)
);

-- Creación de la tabla TipoHabitacion
CREATE TABLE TIPOHABITACION (
    tipo_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_nombre VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL
);

-- Creación de la tabla Disponibilidad
CREATE TABLE DISPONIBILIDAD (
    disponibilidad_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_id INT,
    fecha DATE NOT NULL,
    disponible BOOLEAN NOT NULL,
    FOREIGN KEY (tipo_id) REFERENCES TIPOHABITACION(tipo_id)
);

-- Creación de la tabla Cliente
CREATE TABLE CLIENTE (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20)
);

-- Creación de la tabla Hotel
CREATE TABLE HOTEL (
    hotel_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255)
);


