USE [LPPADATABASE]
GO
SET NOCOUNT ON
DECLARE @RowCount INT


SET @RowCount = 1


--select CONVERT(varchar(255), NEWID())
BEGIN TRANSACTION;
WHILE @rowcount < 26
BEGIN

SET @rowcount = @rowcount + 1;

INSERT INTO [dbo].[Impresora]
           ([CodImpresora]
           ,[StockPapel])
     VALUES
           (@rowcount
           ,RAND()*1000+400)
END
COMMIT TRANSACTION
GO



