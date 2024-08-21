USE bdhotel;
-- Este trigger se activa después de que se realiza un pago y registra un historial de pago

CREATE TRIGGER IF NOT EXISTS registrar_historial_pago
AFTER INSERT ON reserva
FOR EACH ROW
BEGIN
    INSERT INTO pago (pago_id, reserva_id, monto)
    VALUES (NEW.pago_id, NEW.reserva_id, NEW.monto);
END;

-- Trigger para Actualizar la Disponibilidad de Habitaciones

CREATE TRIGGER IF NOT EXISTS actualizar_disponibilidad
AFTER INSERT ON reserva
FOR EACH ROW
BEGIN
    UPDATE disponibilidad
    SET disponibilidad = 'No Disponible'
    WHERE habitacion_id = NEW.habitacion_id
    AND fecha BETWEEN NEW.fecha_entrada AND NEW.fecha_salida;
END;
