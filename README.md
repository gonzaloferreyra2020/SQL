# <center>Segunda Entrega</center>
@Alumno: Gonzalo Ferreyra

@Comisión: 57190

@Tutor: Leonel Lo Presti

@Docente: Anderson Ocaña



---

### **Consignas:**
- La base de datos debe contener al menos:
    * ~ 15 tablas, entre las cuales debe haber al menos 1 tabla de hechos,  2 tablas transaccionales.
    * ~ 5 vistas.
    * ~ 2 stored procedure.
    * ~ 2 trigger.
    * ~ 2 funciones
    
- El documento debe contener:
    - Introducción
    - Objetivo
    - Situación problemática
    - Modelo de negocio
    - Diagrama de entidad relación
    - Listado de tablas con descripción de estructura (columna,descripción, tipo de datos, tipo de clave)
    - Scripts de creación de cada objeto de la base de datos
    - Scripts de inserción de datos
    - Informes generados en base a la información de la base
    - Herramientas y tecnologías usadas



---

## Tematica del proyecto

Se trat de un sistema de reservaciones de hotel. Este permite gestionar hoteles, habitaciones, clientes, reservaciones, pagos y servicios adicionales.

## Características

- **Gestión de Hoteles:** Registro de información básica de hoteles como nombre y dirección.
- **Tipos de Habitaciones:** Administración de tipos de habitaciones..
- **Disponibilidad de Habitaciones:** Registro de disponibilidad por tipo de habitación para fechas específicas.
- **Clientes:** Datos de clientes incluyendo nombre, contacto, etc.
- **Reservaciones:** Funcionalidad para crear y gestionar reservaciones de habitaciones.
- **Pagos:** Registro de pagos asociados a cada reservación.


## Diagrama entidad relacion (DER)



```
(1,*)                          (1,1)
 +-------------+           +-----------------+
 | TIPORESERVA |           |      PAGO       |
 +-------------+           +-----------------+
 | tipo_res  PK|           | pago_id    PK   |
 | nombre      |       |---| reserva_id (FK) |
 +-------------+       |   | monto           |
         |             |   +-----------------+
+-------------------+  |    +----------------+       +-----------------------+      
|   RESERVA         |  |    |   HABITACION   |       | DISPONIBILIDAD        |      
+-------------------+  |    +----------------+       +-----------------------+      
| reserva_id PK     |<-|    |habitacion_id PK| (1,*) | disponibilidad_id PK  |     
| fecha_entrada     |<------| tipo_id        |<------| fecha                 |      
| fecha_salida      | (*,1) | hotel_id   FK  |       | tipo_id    FK         |   
| cliente_id FK     |       |                |       | disponible            |      
| habitacion_id FK  |       |                |       +-----------------------+                       
| tipo_res    fk    |       |                |                            
|                   |       |                |                         
+-------------------+       |                | <-------------|        
       |  (*,               +---------------+       (*,1)    |
       |                         | (*,                       |
       |  1)                     |   1)                      |
+-----------------+       +---------------- +       +-------------------+           
|  CLIENTE        |       |   HOTEL         |       |  TIPOHABITACION   |     
+-----------------+       +-----------------+       +-------------------+     
|                 |       | HOTEL_ID    PK  |       |  tipo_id PK       |      
| cliente_id PK   |       | NOMBRE          |       |  nombre           |
| nombre          |       | DIRECCION       |       |  capacidad        |       
| telefono        |       | TELEFONO        |       |                   |      
| CORREO          |       |                 |       |                   |      
| FECHA_ALTA      |       |                 |       +-------------------+      
+-----------------+       |                 |                                  
                          +----------------+                                   
                                                                               

```
## Listado de tablas y descripcion

| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| TIPORESERVA   | tipo_res          | INT                                   |
|               | nombre            | VARCHAR(50)                           |
|               | descripcion       | VARCHAR(50)                           |

| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| RESERVA       | reserva_id        | INT                                   |
|               | fecha_entrada     | DATE NOT NULL                         |
|               | fecha_salida      | DATE NOT NULL                         |
|               | cliente_id        | INT                                   |
|               | habitacion_id     | INT                                   |
|               | tipo_res          | INT                                   |


| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| PAGO          | pago_id           | INT                                   |
|               | reserva_id        | INT                                   |
|               | monto             | DECIMAL (10,2)                        |



| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| HABITACION    | habitacion_id     | INT                                   |
|               | tipo_id           | INT                                   |
|               | hotel_id          | INT                                   |



| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
|TIPOHABITACION | tipo_id           | INT                                   |
|               | tipo_nombre       | VARCHAR(50) NOT NULL                  |
|               | capacidad         | INT NOT NULL                          |

| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
|DISPONIBILIDAD | disponibilidad_id | INT                                   |
|               | tipo_id           | INT                                   |
|               | fecha             | DATE NOT NULL                         |
|               | disponible        | BOOLEAN NOT NULL                      |


| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| CLIENTE       | cliente_id        | INT                                   |
|               | nombre            | VARCHAR(50) NOT NULL                  |
|               | telefono          | VARCHAR(20) NOT NULL                  |
|               | fecha_alta        | DATE NOT NULL                         |
|               | correo            | VARCHAR(50) UNIQUE NOT NULL           |

| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| HOTEL         | hotel_id          | INT                                   |
|               | nombre            | VARCHAR(50) NOT NULL                  |
|               | direccion         | VARCHAR(50) NOT NULL                  |
|               | telefono          | VARCHAR(20) NOT NULL                  |

