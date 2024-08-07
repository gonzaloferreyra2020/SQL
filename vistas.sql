-- VISTA DE DETALLE DE RESERVAS --
CREATE VIEW view_detalle_reserva AS
SELECT 
    r.reserva_id,
    c.nombre AS nombre_cliente,
    h.nombre AS nombre_hotel,
    hab.numero AS numero_habitacion,
    tr.descripcion AS tipo_reserva,
    p.monto AS monto_pago,
    p.estado AS estado_pago,
    r.fecha_entrada,
    r.fecha_salida
FROM 
    reserva r
JOIN 
    cliente c ON r.cliente_id = c.cliente_id
JOIN 
    habitacion hab ON r.habitacion_id = hab.habitacion_id
JOIN 
    hotel h ON hab.hotel_id = h.hotel_id
JOIN 
    tiporeserva tr ON r.id_tipo_res = tr.id_tipo_res
JOIN 
    pago p ON r.reserva_id = p.reserva_id;

--------------------------------------------------------------

-- VISTA DE INGRESOS --
CREATE VIEW vista_ingresos_por_hotel AS
SELECT 
    h.nombre AS nombre_hotel,
    SUM(p.monto) AS ingresos_totales
FROM 
    hotel h
JOIN 
    habitacion hab ON h.hotel_id = hab.hotel_id
JOIN 
    reserva r ON hab.habitacion_id = r.habitacion_id
JOIN 
    pago p ON r.reserva_id = p.reserva_id
GROUP BY 
    h.nombre;
