CREATE VIEW view_detalle_reserva AS
SELECT 
    r.reserva_id,
    c.nombre AS nombre_cliente,
    h.nombre AS nombre_hotel,
    hab.numero AS numero_habitacion,
    tr.descripcion AS tipo_reserva,
    p.monto AS monto_pago,
    p.estado AS estado_pago,
    r.fecha_inicio,
    r.fecha_fin
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
