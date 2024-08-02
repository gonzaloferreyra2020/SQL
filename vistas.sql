CREATE VIEW view_detalle_reserva AS
SELECT 
    r.id_reserva,
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
    cliente c ON r.id_cliente = c.id_cliente
JOIN 
    habitacion hab ON r.id_habitacion = hab.id_habitacion
JOIN 
    hotel h ON hab.id_hotel = h.id_hotel
JOIN 
    tipo_de_reserva tr ON r.id_tipo_reserva = tr.id_tipo_reserva
JOIN 
    pago p ON r.id_reserva = p.id_reserva;
