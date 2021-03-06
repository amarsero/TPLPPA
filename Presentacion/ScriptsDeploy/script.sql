USE [master]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [aguseselmejor_SQLLogin_1]    Script Date: 16/07/2017 05:30:36 p.m. ******/
CREATE LOGIN [aguseselmejor_SQLLogin_1] WITH PASSWORD=N'123456789', DEFAULT_DATABASE=[LPPADATABASE], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [aguseselmejor_SQLLogin_1] DISABLE
GO
USE [LPPADATABASE]
GO
/****** Object:  User [aguseselmejor_SQLLogin_1]    Script Date: 16/07/2017 05:30:39 p.m. ******/
CREATE USER [aguseselmejor_SQLLogin_1] FOR LOGIN [aguseselmejor_SQLLogin_1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [aguseselmejor_SQLLogin_1]
GO
/****** Object:  Schema [aguseselmejor_SQLLogin_1]    Script Date: 16/07/2017 05:30:42 p.m. ******/
CREATE SCHEMA [aguseselmejor_SQLLogin_1]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 16/07/2017 05:30:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[CUIT] [int] NOT NULL,
	[DniConyuge] [int] NULL,
	[Domicilio] [varchar](50) NOT NULL,
	[EstadoCivil] [int] NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[IngresoMesualAprox] [int] NULL,
	[Nombre] [varchar](50) NOT NULL,
	[DNI] [int] NOT NULL,
	[Sexo] [int] NOT NULL,
	[SituacionLaboral] [int] NOT NULL,
	[TipoDocumento] [int] NOT NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 16/07/2017 05:30:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleado](
	[DNI] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[LoginUser] [varchar](50) NULL,
	[Password] [varchar](255) NULL,
	[Sexo] [int] NULL,
	[TipoDocumento] [int] NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HistoricoSolicitudTarjetas]    Script Date: 16/07/2017 05:30:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoricoSolicitudTarjetas](
	[IdTerminal] [int] NOT NULL,
	[NumTarjeta] [int] NOT NULL,
	[FechaSolicitud] [datetime] NULL,
	[EstadoTarjeta] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Impresora]    Script Date: 16/07/2017 05:30:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Impresora](
	[CodImpresora] [int] NOT NULL,
	[StockPapel] [int] NULL,
 CONSTRAINT [PK_Impresora] PRIMARY KEY CLUSTERED 
(
	[CodImpresora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 16/07/2017 05:30:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [nvarchar](128) NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
 CONSTRAINT [PK_sysdiagrams] PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 16/07/2017 05:30:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[Numero] [int] NOT NULL,
	[Marca] [int] NOT NULL,
	[SaldoMaximo] [int] NOT NULL,
	[Tipo] [int] NOT NULL,
	[Extension] [int] NULL,
	[DNICliente] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[IdTerminalImpresion] [int] NULL,
 CONSTRAINT [PK_Tarjeta] PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Terminal]    Script Date: 16/07/2017 05:30:46 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Terminal](
	[CodigoTerminal] [int] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[IdImpresora] [int] NULL,
	[DNIEmpleado] [int] NULL,
 CONSTRAINT [PK_Terminal] PRIMARY KEY CLUSTERED 
(
	[CodigoTerminal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (12331232, 3333333, N'123123123sdd', 0, CAST(N'2007-12-31 01:00:00.000' AS DateTime), 23323123, N'mwefkmwe kmwelfkm', 0, 0, 0, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (33441, NULL, N'123123123sdd', 1, CAST(N'2016-10-31 00:00:00.000' AS DateTime), 23323123, N'ksksksk hshshsh', 78787, 1, 1, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (824283, NULL, N'2euu2oheb', 0, CAST(N'1946-05-12 00:00:00.000' AS DateTime), 214124, N'feonifwein ofbeofebo', 87284, 1, 2, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (413413, NULL, N'qnknj242', 0, CAST(N'1979-02-04 00:00:00.000' AS DateTime), 314134, N'uwbwfbfw fabuoiabef', 313413, 0, 2, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (123878, NULL, N'sdsdaasdasd', 0, CAST(N'1996-11-30 00:00:00.000' AS DateTime), 23323123, N'sdfhjksdf fack you mom', 321112, 0, 0, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (7382473, NULL, N'iebfahoeu 34134', 2, CAST(N'1944-03-25 00:00:00.000' AS DateTime), 23513, N'fbeofeob afeiboba', 348163, 1, 2, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (1376565, NULL, N'hknjvrkn 153135', 2, CAST(N'1956-05-31 00:00:00.000' AS DateTime), 15343, N'oefinoef ooeinoe', 765248, 1, 2, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (4312312, NULL, N'123123123sdd', 1, CAST(N'2001-10-29 00:00:00.000' AS DateTime), 23323123, N'Manuel Lanzini', 919188, 1, 1, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (3829382, NULL, N'enqeojqnone', 0, CAST(N'1994-09-04 00:00:00.000' AS DateTime), 2143, N'nfoueiufn bvbuovuoev', 984232, 1, 2, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (123312123, NULL, N'qweweq11', 0, CAST(N'2017-06-22 00:00:00.000' AS DateTime), 123321312, N'2312312d 123sda', 1312323, 0, 0, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (413413431, NULL, N'wndwdfefefr3131', 1, CAST(N'1975-04-12 00:00:00.000' AS DateTime), 1344, N'mnfneifja naoifemaoi', 1341344, 1, 1, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (18431, NULL, N'sdasdsadas', 1, CAST(N'1994-02-02 00:00:00.000' AS DateTime), 212131, N'Marcela Caseres', 2153486, 2, 2, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (2212121, NULL, N'43423eee', 0, CAST(N'1991-11-29 00:00:00.000' AS DateTime), 44342, N'jififjewief fshejj', 2322222, 1, 0, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (4284284, NULL, N'fmnwfojfw 242424', 0, CAST(N'1984-01-27 00:00:00.000' AS DateTime), 24243, N'iorwgworg efnqfeqin', 2948524, 1, 2, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (123231231, NULL, N'sdasdsadas', 1, CAST(N'1994-02-02 00:00:00.000' AS DateTime), 212131, N'asdsdasadasd dsaasdsdsda', 3333123, 1, 2, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (3322323, NULL, N'sdsdaasdasd', 1, CAST(N'2007-10-29 00:00:00.000' AS DateTime), 23213123, N'hadskjhasd dskjhdsajk', 3333333, 1, 0, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (7413488, NULL, N'femfniefni 41341', 2, CAST(N'1947-04-28 00:00:00.000' AS DateTime), 34134, N'nfnienfeni nfoeinfe', 4734738, 1, 2, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (463436, NULL, N'ubifeouif34', 2, CAST(N'1974-04-02 00:00:00.000' AS DateTime), 24341, N'ofbefjkno beufakebf', 4738147, 0, 2, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (36723232, NULL, N'idwhwdh3 31413', 1, CAST(N'1945-02-02 00:00:00.000' AS DateTime), 1344, N'ufabeifiae naoifioauibh', 8473122, 1, 1, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (79347842, NULL, N'ndwofinj 3525', 1, CAST(N'1967-07-27 00:00:00.000' AS DateTime), 14314, N'oefajnkef oafenaofen', 8473874, 1, 2, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (42221111, NULL, N'sdsddddddd', 0, CAST(N'2017-06-21 00:00:00.000' AS DateTime), 13123123, N'aaaaaaaaaaaaa sdasadsda', 8887666, 0, 1, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (23321232, 2153486, N'Calle falsa', 1, CAST(N'2017-05-31 21:47:48.090' AS DateTime), 1231, N'Gonzalo', 12311312, 1, 1, 1, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (123123123, NULL, N'sdsdaasdasd', 0, CAST(N'1995-11-28 00:00:00.000' AS DateTime), 123121231, N'Victor Contreras', 12312231, 1, 0, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (123123123, NULL, N'femknfef efoafebou', 2, CAST(N'1948-04-12 00:00:00.000' AS DateTime), 143141, N'ihbfueihbfehiofbe 4ufbeofihqbeoifhqbuefhb', 12312312, 1, 0, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (311311, NULL, N'123123123sdd', 0, CAST(N'1995-10-28 00:00:00.000' AS DateTime), 23323123, N'ddwwd Ricardo', 12312331, 0, 0, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (33441, NULL, N'123123123sdd', 1, CAST(N'2016-10-31 00:00:00.000' AS DateTime), 23323123, N'ksksksk lalalala', 32123312, 1, 1, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (135165846, NULL, N'orgnao 9353', 3, CAST(N'1906-05-21 00:00:00.000' AS DateTime), 34375, N'Lopez Micaela', 35158496, 1, 1, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (86446846, NULL, N'fwfw32fw3f2w', 2, CAST(N'1945-04-02 00:00:00.000' AS DateTime), 13513, N'fkenfne afeafe', 46846468, 1, 1, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (765456733, NULL, N'654r6tuy6r', 0, CAST(N'1945-11-11 00:00:00.000' AS DateTime), 53151, N'iubfnlkfbel fouabfiu', 65456233, 1, 1, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (765456733, NULL, N'654r6tuy6r', 0, CAST(N'1945-11-11 00:00:00.000' AS DateTime), 53151, N'iubfnlkfbel fouabfiu', 65456733, 1, 1, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (71836416, NULL, N'emfnjhbeik 13413', 2, CAST(N'1984-02-02 00:00:00.000' AS DateTime), 15351, N'jiohjjhipo nbghfboi', 71364137, 1, 1, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (76467343, NULL, N'fnnelkafn31 5313', 1, CAST(N'1985-03-05 00:00:00.000' AS DateTime), 13513, N'jeifoaoibf k jaof kadfj', 76452563, 0, 0, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (47138413, NULL, N'afienafbae 4134', 2, CAST(N'1987-02-20 00:00:00.000' AS DateTime), 14134, N'eihubfuau anbdonabdg', 81371434, 1, 2, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (12312321, NULL, N'asdasdasd 123', 0, CAST(N'1995-12-25 00:00:00.000' AS DateTime), 23323123, N'jasdkljasd asdasdjklasd', 89123723, 1, 0, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (1010101, NULL, N'123123123sdd', 1, CAST(N'1985-10-29 00:00:00.000' AS DateTime), 23323123, N'Selastraga TuVieja', 99999991, 1, 1, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (92222222, NULL, N'123123123sdd', 1, CAST(N'1985-10-29 00:00:00.000' AS DateTime), 23323123, N'klmwdkld wddwqwd', 99999999, 1, 1, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (123123123, NULL, N'23112ddd', 2, CAST(N'2017-06-15 00:00:00.000' AS DateTime), 22222, N'qweqwe qweqweqwe', 123123123, 0, 0, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (13231211, NULL, N'123123123sdd', 1, CAST(N'2013-11-29 00:00:00.000' AS DateTime), 23323123, N'kldjklasdasd sjasdkladj', 123123312, 1, 1, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (123123123, NULL, N'sdsdaasdasd', 1, CAST(N'1995-10-29 00:00:00.000' AS DateTime), 23213123, N'sdjkhdas sdahasdjk', 123132132, 1, 0, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (392623333, NULL, N'ibuobhj 24624', 2, CAST(N'1947-03-01 00:00:00.000' AS DateTime), 61534, N'winfienj fonieafnei', 331513515, 0, 2, 0, NULL)
INSERT [dbo].[Cliente] ([CUIT], [DniConyuge], [Domicilio], [EstadoCivil], [FechaNacimiento], [IngresoMesualAprox], [Nombre], [DNI], [Sexo], [SituacionLaboral], [TipoDocumento], [Email]) VALUES (1351351355, NULL, N'elibfyvei1 3513', 1, CAST(N'1995-05-26 00:00:00.000' AS DateTime), 41434, N'hiuiviho ubhviuhij', 513513515, 1, 1, 0, NULL)
INSERT [dbo].[Empleado] ([DNI], [Nombre], [LoginUser], [Password], [Sexo], [TipoDocumento]) VALUES (101010, N'Graciela', N'test', N'test', 1, 1)
INSERT [dbo].[HistoricoSolicitudTarjetas] ([IdTerminal], [NumTarjeta], [FechaSolicitud], [EstadoTarjeta]) VALUES (1, 407744793, CAST(N'2017-07-10 17:35:20.373' AS DateTime), 0)
INSERT [dbo].[Impresora] ([CodImpresora], [StockPapel]) VALUES (1, 1000)
INSERT [dbo].[Tarjeta] ([Numero], [Marca], [SaldoMaximo], [Tipo], [Extension], [DNICliente], [Estado], [IdTerminalImpresion]) VALUES (72225637, 2, 5000, 0, 1, 12311312, 0, 2)
INSERT [dbo].[Tarjeta] ([Numero], [Marca], [SaldoMaximo], [Tipo], [Extension], [DNICliente], [Estado], [IdTerminalImpresion]) VALUES (407744793, 1, 12312, 0, 1, 12311312, 0, 1)
INSERT [dbo].[Tarjeta] ([Numero], [Marca], [SaldoMaximo], [Tipo], [Extension], [DNICliente], [Estado], [IdTerminalImpresion]) VALUES (944495184, 2, 123132, 0, 1, 65456233, 0, 1)
INSERT [dbo].[Tarjeta] ([Numero], [Marca], [SaldoMaximo], [Tipo], [Extension], [DNICliente], [Estado], [IdTerminalImpresion]) VALUES (1396126513, 1, 113123, 0, 1, 65456233, 0, 2)
INSERT [dbo].[Tarjeta] ([Numero], [Marca], [SaldoMaximo], [Tipo], [Extension], [DNICliente], [Estado], [IdTerminalImpresion]) VALUES (1415285267, 2, 30000, 0, 1, 12311312, 0, 2)
INSERT [dbo].[Tarjeta] ([Numero], [Marca], [SaldoMaximo], [Tipo], [Extension], [DNICliente], [Estado], [IdTerminalImpresion]) VALUES (1703827916, 2, 8787878, 0, 1, 12311312, 0, 2)
INSERT [dbo].[Terminal] ([CodigoTerminal], [Descripcion], [IdImpresora], [DNIEmpleado]) VALUES (1, N'Sucursal principal', 1, 101010)
/****** Object:  Index [IX_FK_Cliente_Cliente]    Script Date: 16/07/2017 05:30:50 p.m. ******/
CREATE NONCLUSTERED INDEX [IX_FK_Cliente_Cliente] ON [dbo].[Cliente]
(
	[DniConyuge] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_HistoricoSolicitudTarjetas_Tarjeta]    Script Date: 16/07/2017 05:30:50 p.m. ******/
CREATE NONCLUSTERED INDEX [IX_FK_HistoricoSolicitudTarjetas_Tarjeta] ON [dbo].[HistoricoSolicitudTarjetas]
(
	[NumTarjeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Tarjeta_Cliente]    Script Date: 16/07/2017 05:30:50 p.m. ******/
CREATE NONCLUSTERED INDEX [IX_FK_Tarjeta_Cliente] ON [dbo].[Tarjeta]
(
	[DNICliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Tarjeta_Tarjeta]    Script Date: 16/07/2017 05:30:50 p.m. ******/
CREATE NONCLUSTERED INDEX [IX_FK_Tarjeta_Tarjeta] ON [dbo].[Tarjeta]
(
	[Extension] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Terminal_Empleado]    Script Date: 16/07/2017 05:30:50 p.m. ******/
CREATE NONCLUSTERED INDEX [IX_FK_Terminal_Empleado] ON [dbo].[Terminal]
(
	[DNIEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Terminal_Impresora]    Script Date: 16/07/2017 05:30:50 p.m. ******/
CREATE NONCLUSTERED INDEX [IX_FK_Terminal_Impresora] ON [dbo].[Terminal]
(
	[IdImpresora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Cliente] FOREIGN KEY([DniConyuge])
REFERENCES [dbo].[Cliente] ([DNI])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Cliente]
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD  CONSTRAINT [FK_Tarjeta_Cliente] FOREIGN KEY([DNICliente])
REFERENCES [dbo].[Cliente] ([DNI])
GO
ALTER TABLE [dbo].[Tarjeta] CHECK CONSTRAINT [FK_Tarjeta_Cliente]
GO
ALTER TABLE [dbo].[Terminal]  WITH CHECK ADD  CONSTRAINT [FK_Terminal_Empleado] FOREIGN KEY([DNIEmpleado])
REFERENCES [dbo].[Empleado] ([DNI])
GO
ALTER TABLE [dbo].[Terminal] CHECK CONSTRAINT [FK_Terminal_Empleado]
GO
ALTER TABLE [dbo].[Terminal]  WITH CHECK ADD  CONSTRAINT [FK_Terminal_Impresora] FOREIGN KEY([IdImpresora])
REFERENCES [dbo].[Impresora] ([CodImpresora])
GO
ALTER TABLE [dbo].[Terminal] CHECK CONSTRAINT [FK_Terminal_Impresora]
GO
/****** Object:  Trigger [dbo].[ActualizarHistoricoTarjeta]    Script Date: 16/07/2017 05:30:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ActualizarHistoricoTarjeta]
   ON  [dbo].[Tarjeta] 
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;

	Insert into HistoricoSolicitudTarjetas
	select IdTerminalImpresion, Numero,GETDATE(),Estado  from inserted 

END

GO