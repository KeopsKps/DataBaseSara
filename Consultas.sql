SELECT P.*,C.Correo_Electronico, R.FechaReservacion, R.Id_reservacion,
A.Nombre_acompanante, A.Cedula
FROM Persona AS P INNER JOIN Cliente AS C ON P.Cedula = C.Cedula
INNER JOIN Reservacion AS R ON C.Cedula = R.Cedula
INNER JOIN AcompananteDeReserva as AR ON AR.Id_reservacion = R.Id_reservacion
INNER JOIN Acompanante as A ON A.id_acompanante = AR.id_acompanante