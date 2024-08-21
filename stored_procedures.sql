-- Creacion de stored procedures
-- Este procedimiento permite actualizar el nombre, el email y el teléfono de un cliente en la base de datos.

CREATE PROCEDURE IF NOT EXISTS actualizar_cliente(
    IN p_cliente_id INT,
    IN p_nuevo_nombre VARCHAR(50),
    IN p_nuevo_correo VARCHAR(50),
    IN p_nuevo_telefono VARCHAR(20)
)
BEGIN
    UPDATE cliente
    SET nombre = p_nuevo_nombre,
        correo = p_nuevo_correo,
        telefono = p_nuevo_telefono
    WHERE cliente_id = p_cliente_id;
END;

-- Este procedimiento genera un reporte del porcentaje de ocupación de cada hotel en un rango de fechas dado.
CREATE PROCEDURE IF NOT EXISTS reporte_ocupacion(
    IN p_fecha_entrada DATE,
    IN p_fecha_salida DATE
)
BEGIN
    SELECT h.nombre AS nombre_hotel,
           COUNT(r.reserva_id) AS total_reservas,
           COUNT(hab.habitacion_id) AS total_habitaciones,
           (COUNT(r.reserva_id) / COUNT(hab.habitacion_id)) * 100 AS porcentaje_ocupacion
    FROM hotel h
    JOIN habitacion hab ON h.hotel_id = hab.hotel_id
    LEFT JOIN reserva r ON hab.habitacion_id = r.habitacion_id
    AND r.fecha_entrada >= p_fecha_entrada AND r.fecha_salida <= p_fecha_salida
    GROUP BY h.hotel_id;
END;

