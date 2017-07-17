USE [LPPADATABASE]
GO
DECLARE curs CURSOR FOR 
SELECT NumTarjeta
FROM dbo.HistoricoSolicitudTarjetas

OPEN curs


FETCH NEXT FROM curs
WHILE @@FETCH_STATUS = 0
BEGIN

    UPDATE [dbo].[HistoricoSolicitudTarjetas]
   SET [FechaSolicitud] = DATEADD(day,(RAND()*-18000)-7000,GetDAte())
WHERE CURRENT OF curs;
FETCH NEXT FROM curs

END 
CLOSE curs;
DEALLOCATE curs;

GO


