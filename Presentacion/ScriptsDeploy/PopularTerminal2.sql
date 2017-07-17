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

SET @RowCount = 1


--select CONVERT(varchar(255), NEWID())
BEGIN TRANSACTION;
WHILE @rowcount < 25
BEGIN

SET @rowcount = @rowcount + 1;
INSERT INTO [dbo].[Terminal]
           ([CodigoTerminal]
           ,[Descripcion]
           ,[IdImpresora]
           ,[DNIEmpleado])
     VALUES
           (@rowcount
           ,dbo.RandomString()
           ,@rowcount
           ,(SELECT TOP 1 DNI FROM dbo.Empleado
ORDER BY NEWID()))
END
COMMIT TRANSACTION
GO
DROP FUNCTION dbo.RandomString
GO


