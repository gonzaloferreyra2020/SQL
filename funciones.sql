USE  bdhotel;

-- FUNCION PARA CALCULAR EL TOTAL QUE PAGA UN CLIENTE--
CREATE FUNCTION IF NOT EXISTS calcular_total_pagado(cliente_id INT) 
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(p.monto) INTO total
    FROM pago p
    JOIN reserva r ON p.reserva_id = r.reserva_id
    WHERE r.cliente_id = cliente_id;

    RETURN total;
END;

----------------------------------------------

-- FUNCION PARA CALCULAR LA DURACION DE LAS RESERVAS --
CREATE FUNCTION IF NOT EXISTS duracion_promedio_reservas(cliente_id INT) 
RETURNS DECIMAL(5,2)
BEGIN
    DECLARE duracion_promedio DECIMAL(5,2);

    SELECT AVG(DATEDIFF(fecha_salida, fecha_entrada)) INTO duracion_promedio
    FROM reserva
    WHERE cliente_id = cliente_id;

    RETURN duracion_promedio;
END;
