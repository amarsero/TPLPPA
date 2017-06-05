
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/04/2017 20:07:19
-- Generated from EDMX file: C:\Users\arigos\Source\Repos\TPLPPA\Presentacion\DAL\DB_LPPA.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LPPA];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Cliente_Cliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cliente] DROP CONSTRAINT [FK_Cliente_Cliente];
GO
IF OBJECT_ID(N'[dbo].[FK_Tarjeta_Cliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tarjeta] DROP CONSTRAINT [FK_Tarjeta_Cliente];
GO
IF OBJECT_ID(N'[dbo].[FK_Terminal_Empleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Terminal] DROP CONSTRAINT [FK_Terminal_Empleado];
GO
IF OBJECT_ID(N'[dbo].[FK_HistoricoSolicitudTarjetas_Impresora]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HistoricoSolicitudTarjetas] DROP CONSTRAINT [FK_HistoricoSolicitudTarjetas_Impresora];
GO
IF OBJECT_ID(N'[dbo].[FK_Terminal_Impresora]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Terminal] DROP CONSTRAINT [FK_Terminal_Impresora];
GO
IF OBJECT_ID(N'[dbo].[FK_HistoricoSolicitudTarjetas_Tarjeta]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HistoricoSolicitudTarjetas] DROP CONSTRAINT [FK_HistoricoSolicitudTarjetas_Tarjeta];
GO
IF OBJECT_ID(N'[dbo].[FK_Tarjeta_Tarjeta]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tarjeta] DROP CONSTRAINT [FK_Tarjeta_Tarjeta];
GO
IF OBJECT_ID(N'[dbo].[FK_HistoricoSolicitudTarjetas_Terminal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HistoricoSolicitudTarjetas] DROP CONSTRAINT [FK_HistoricoSolicitudTarjetas_Terminal];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Cliente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cliente];
GO
IF OBJECT_ID(N'[dbo].[Empleado]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Empleado];
GO
IF OBJECT_ID(N'[dbo].[Impresora]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Impresora];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[Tarjeta]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tarjeta];
GO
IF OBJECT_ID(N'[dbo].[Terminal]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Terminal];
GO
IF OBJECT_ID(N'[dbo].[HistoricoSolicitudTarjetas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HistoricoSolicitudTarjetas];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Cliente'
CREATE TABLE [dbo].[Cliente] (
    [CUIT] int  NOT NULL,
    [DniConyuge] int  NULL,
    [Domicilio] varchar(50)  NOT NULL,
    [EstadoCivil] int  NOT NULL,
    [FechaNacimiento] datetime  NOT NULL,
    [IngresoMesualAprox] int  NULL,
    [Nombre] varchar(50)  NOT NULL,
    [DNI] int  NOT NULL,
    [Sexo] int  NOT NULL,
    [SituacionLaboral] int  NOT NULL,
    [TipoDocumento] int  NOT NULL
);
GO

-- Creating table 'Empleado'
CREATE TABLE [dbo].[Empleado] (
    [DNI] int  NOT NULL,
    [Nombre] varchar(50)  NULL,
    [LoginUser] varchar(50)  NULL,
    [Password] varchar(255)  NULL,
    [Sexo] int  NULL,
    [TipoDocumento] int  NULL
);
GO

-- Creating table 'Impresora'
CREATE TABLE [dbo].[Impresora] (
    [CodImpresora] int  NOT NULL,
    [StockPapel] int  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'Tarjeta'
CREATE TABLE [dbo].[Tarjeta] (
    [Numero] int  NOT NULL,
    [Marca] int  NOT NULL,
    [SaldoMaximo] int  NOT NULL,
    [Tipo] int  NOT NULL,
    [Extension] int  NULL,
    [DNICliente] int  NOT NULL,
    [Estado] int  NOT NULL,
    [IdTerminalImpresion] int  NULL
);
GO

-- Creating table 'Terminal'
CREATE TABLE [dbo].[Terminal] (
    [CodigoTerminal] int  NOT NULL,
    [Descripcion] varchar(100)  NOT NULL,
    [IdImpresora] int  NULL,
    [DNIEmpleado] int  NULL
);
GO

-- Creating table 'HistoricoSolicitudTarjetas'
CREATE TABLE [dbo].[HistoricoSolicitudTarjetas] (
    [IdTerminal] int  NOT NULL,
    [NumTarjeta] int  NOT NULL,
    [IdImpresora] int  NOT NULL,
    [FechaSolicitud] datetime  NULL,
    [EstadoTarjeta] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [DNI] in table 'Cliente'
ALTER TABLE [dbo].[Cliente]
ADD CONSTRAINT [PK_Cliente]
    PRIMARY KEY CLUSTERED ([DNI] ASC);
GO

-- Creating primary key on [DNI] in table 'Empleado'
ALTER TABLE [dbo].[Empleado]
ADD CONSTRAINT [PK_Empleado]
    PRIMARY KEY CLUSTERED ([DNI] ASC);
GO

-- Creating primary key on [CodImpresora] in table 'Impresora'
ALTER TABLE [dbo].[Impresora]
ADD CONSTRAINT [PK_Impresora]
    PRIMARY KEY CLUSTERED ([CodImpresora] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [Numero] in table 'Tarjeta'
ALTER TABLE [dbo].[Tarjeta]
ADD CONSTRAINT [PK_Tarjeta]
    PRIMARY KEY CLUSTERED ([Numero] ASC);
GO

-- Creating primary key on [CodigoTerminal] in table 'Terminal'
ALTER TABLE [dbo].[Terminal]
ADD CONSTRAINT [PK_Terminal]
    PRIMARY KEY CLUSTERED ([CodigoTerminal] ASC);
GO

-- Creating primary key on [IdTerminal], [NumTarjeta], [IdImpresora], [EstadoTarjeta] in table 'HistoricoSolicitudTarjetas'
ALTER TABLE [dbo].[HistoricoSolicitudTarjetas]
ADD CONSTRAINT [PK_HistoricoSolicitudTarjetas]
    PRIMARY KEY CLUSTERED ([IdTerminal], [NumTarjeta], [IdImpresora], [EstadoTarjeta] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [DniConyuge] in table 'Cliente'
ALTER TABLE [dbo].[Cliente]
ADD CONSTRAINT [FK_Cliente_Cliente]
    FOREIGN KEY ([DniConyuge])
    REFERENCES [dbo].[Cliente]
        ([DNI])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Cliente_Cliente'
CREATE INDEX [IX_FK_Cliente_Cliente]
ON [dbo].[Cliente]
    ([DniConyuge]);
GO

-- Creating foreign key on [DNICliente] in table 'Tarjeta'
ALTER TABLE [dbo].[Tarjeta]
ADD CONSTRAINT [FK_Tarjeta_Cliente]
    FOREIGN KEY ([DNICliente])
    REFERENCES [dbo].[Cliente]
        ([DNI])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tarjeta_Cliente'
CREATE INDEX [IX_FK_Tarjeta_Cliente]
ON [dbo].[Tarjeta]
    ([DNICliente]);
GO

-- Creating foreign key on [DNIEmpleado] in table 'Terminal'
ALTER TABLE [dbo].[Terminal]
ADD CONSTRAINT [FK_Terminal_Empleado]
    FOREIGN KEY ([DNIEmpleado])
    REFERENCES [dbo].[Empleado]
        ([DNI])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Terminal_Empleado'
CREATE INDEX [IX_FK_Terminal_Empleado]
ON [dbo].[Terminal]
    ([DNIEmpleado]);
GO

-- Creating foreign key on [IdImpresora] in table 'HistoricoSolicitudTarjetas'
ALTER TABLE [dbo].[HistoricoSolicitudTarjetas]
ADD CONSTRAINT [FK_HistoricoSolicitudTarjetas_Impresora]
    FOREIGN KEY ([IdImpresora])
    REFERENCES [dbo].[Impresora]
        ([CodImpresora])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HistoricoSolicitudTarjetas_Impresora'
CREATE INDEX [IX_FK_HistoricoSolicitudTarjetas_Impresora]
ON [dbo].[HistoricoSolicitudTarjetas]
    ([IdImpresora]);
GO

-- Creating foreign key on [IdImpresora] in table 'Terminal'
ALTER TABLE [dbo].[Terminal]
ADD CONSTRAINT [FK_Terminal_Impresora]
    FOREIGN KEY ([IdImpresora])
    REFERENCES [dbo].[Impresora]
        ([CodImpresora])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Terminal_Impresora'
CREATE INDEX [IX_FK_Terminal_Impresora]
ON [dbo].[Terminal]
    ([IdImpresora]);
GO

-- Creating foreign key on [NumTarjeta] in table 'HistoricoSolicitudTarjetas'
ALTER TABLE [dbo].[HistoricoSolicitudTarjetas]
ADD CONSTRAINT [FK_HistoricoSolicitudTarjetas_Tarjeta]
    FOREIGN KEY ([NumTarjeta])
    REFERENCES [dbo].[Tarjeta]
        ([Numero])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HistoricoSolicitudTarjetas_Tarjeta'
CREATE INDEX [IX_FK_HistoricoSolicitudTarjetas_Tarjeta]
ON [dbo].[HistoricoSolicitudTarjetas]
    ([NumTarjeta]);
GO

-- Creating foreign key on [Extension] in table 'Tarjeta'
ALTER TABLE [dbo].[Tarjeta]
ADD CONSTRAINT [FK_Tarjeta_Tarjeta]
    FOREIGN KEY ([Extension])
    REFERENCES [dbo].[Tarjeta]
        ([Numero])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tarjeta_Tarjeta'
CREATE INDEX [IX_FK_Tarjeta_Tarjeta]
ON [dbo].[Tarjeta]
    ([Extension]);
GO

-- Creating foreign key on [IdTerminal] in table 'HistoricoSolicitudTarjetas'
ALTER TABLE [dbo].[HistoricoSolicitudTarjetas]
ADD CONSTRAINT [FK_HistoricoSolicitudTarjetas_Terminal]
    FOREIGN KEY ([IdTerminal])
    REFERENCES [dbo].[Terminal]
        ([CodigoTerminal])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------