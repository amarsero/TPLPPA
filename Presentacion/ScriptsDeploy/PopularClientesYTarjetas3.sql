USE [LPPADATABASE]
GO
CREATE FUNCTION dbo.RandomString()
RETURNS varchar(20)
AS
BEGIN

DECLARE @LoopCount int
DECLARE @Length int
DECLARE @CharPool varchar(100)
DECLARE @RandomString varchar(100)
DECLARE @PoolLength int
-- min_length = 8, max_length = 12
SET @Length = 8
-- SET @Length = RAND() * (max_length - min_length + 1) + min_length

-- define allowable character explicitly - easy to read this way an easy to 
-- omit easily confused chars like l (ell) and 1 (one) or 0 (zero) and O (oh)
SET @CharPool = 
    'abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ'
SET @PoolLength = Len(@CharPool)

SET @LoopCount = 0
SET @RandomString = ''

WHILE (@LoopCount < @Length) BEGIN
    SELECT @RandomString = @RandomString + 
        SUBSTRING(@Charpool, CONVERT(int, ABS(CHECKSUM(PWDENCRYPT(N''))) / 2147483647.0 * @PoolLength), 1)
    SELECT @LoopCount = @LoopCount + 1
END
return @RandomString
END;
GO
SET NOCOUNT ON
DECLARE @RowCount INT

SET @RowCount = 0

DECLARE @DNI INT


--select CONVERT(varchar(255), NEWID())
BEGIN TRANSACTION;
WHILE @rowcount < 100000
BEGIN

SET @rowcount = @rowcount + 1;
SET @DNI = ROUND(((30000000) * RAND() + 3000000), 0);


if NOT exists(select 1 from [dbo].[Cliente] where DNI = @DNI)
begin
INSERT INTO [dbo].[Cliente]
           ([CUIT]
           ,[Domicilio]
           ,[EstadoCivil]
           ,[FechaNacimiento]
           ,[IngresoMesualAprox]
           ,[Nombre]
           ,[DNI]
           ,[Sexo]
           ,[SituacionLaboral]
           ,[TipoDocumento]
           ,[Email])
     VALUES
           (2000000000 + @DNI
           ,dbo.RandomString()
           ,RAND()*3+1
           ,DATEADD(day,(RAND()*-18000)-7000,GetDAte())
           ,RAND()*20000+5000
           ,dbo.RandomString()
           ,@DNI
           ,ROUND(RAND(),0)+1
           ,ROUND(RAND()*3,0)+1
           ,1
           ,dbo.RandomString()+'@hotmail.com')

		   INSERT INTO [dbo].[Tarjeta]
           ([Numero]
           ,[Marca]
           ,[SaldoMaximo]
           ,[Tipo]
           ,[Extension]
           ,[DNICliente]
           ,[Estado]
           ,[IdTerminalImpresion])
     VALUES
           (200000000*RAND()+30000000
           ,RAND()*2+1
           ,RAND()*5000+1000
           ,0
           ,1
           ,@DNI
           ,3
           ,RAND()*25+1)
		   end
END
COMMIT TRANSACTION
GO
DROP FUNCTION dbo.RandomString
GO

