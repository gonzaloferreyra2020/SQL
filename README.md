# Primer Entrega
@Gonzalo Ferreyra

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
 | IDTIPORES PK|           | pago_id         |
 |    TIPO     |       |---| reserva_id (FK) |
 +-------------+       |   | monto           |
         |             |   +-----------------+
+-------------------+  |    +----------------+       +-------------------+      
|   RESERVA         |  |    |   HABITACION   |       | DISPONIBILIDAD    |      
+-------------------+  |    +----------------+       +-------------------+      
| reserva_id PK     |<-|    |habitacion_id PK| (1,*) | disponibilidad_id |     
| fecha_entrada     |<------| tipo_id        |<------| fecha             |      
| fecha_salida      | (*,1) | precio         |       | tipo_id    FK     |   
| cliente_id FK     |       | hotel_id   FK  |       | disponible        |      
| habitacion_id FK  |       |                |       +-------------------+                       
| IDTIPORES   fk    |       |                |                            
|                   |       |                |                         
+-------------------+       |                | <-------------|        
       |  (*,               +---------------+       (*,1)    |
       |                         | (*,                       |
       |  1)                     |   1)                      |
+-----------------+       +---------------- +       +-------------------+           
|  CLIENTE        |       |   HOTEL         |       |  TIPOHABITACION   |     
+-----------------+       +-----------------+       +-------------------+     
|                 |       | HOTEL_ID      PK|       | tipo_id PK        |      
| cliente_id PK   |       | NOMBRE          |       |  nombre           |
| nombre          |       | DIRECCION       |       |  capacidad        |       
| telefono        |       | TELEFONO        |       |                   |      
| CORREO          |       |                 |       |                   |      
| FECHA_ALTA      |       |                 |       +-------------------+      
+-----------------+       |                 |                                  
                          +----------------+                                   
                                                                               

```
