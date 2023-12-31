USE [master]
GO
/****** Object:  Database [ApptowerProvicional]    Script Date: 8/09/2023 7:07:34 p. m. ******/
CREATE DATABASE [ApptowerProvicional]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ApptowerProvicional', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ApptowerProvicional.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ApptowerProvicional_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ApptowerProvicional_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ApptowerProvicional] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ApptowerProvicional].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ApptowerProvicional] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET ARITHABORT OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ApptowerProvicional] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ApptowerProvicional] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ApptowerProvicional] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ApptowerProvicional] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET RECOVERY FULL 
GO
ALTER DATABASE [ApptowerProvicional] SET  MULTI_USER 
GO
ALTER DATABASE [ApptowerProvicional] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ApptowerProvicional] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ApptowerProvicional] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ApptowerProvicional] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ApptowerProvicional] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ApptowerProvicional] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ApptowerProvicional', N'ON'
GO
ALTER DATABASE [ApptowerProvicional] SET QUERY_STORE = OFF
GO
USE [ApptowerProvicional]
GO
/****** Object:  Table [dbo].[Espacios]    Script Date: 8/09/2023 7:07:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Espacios](
	[IdEspacio] [int] IDENTITY(1,1) NOT NULL,
	[NombreEspacio] [varchar](255) NULL,
	[TipoEspacio] [varchar](255) NOT NULL,
	[Area] [float] NULL,
	[Capacidad] [int] NULL,
	[EstadoEspacio] [varchar](20) NOT NULL,
 CONSTRAINT [PKIdEspacios] PRIMARY KEY CLUSTERED 
(
	[IdEspacio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[NombreEspacio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parqueaderos]    Script Date: 8/09/2023 7:07:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parqueaderos](
	[IdParqueadero] [int] IDENTITY(1,1) NOT NULL,
	[IdEspacio] [int] NULL,
	[NombreParqueadero] [varchar](10) NOT NULL,
	[TipoParqueadero] [varchar](50) NOT NULL,
	[EstadoParqueadero] [varchar](20) NULL,
 CONSTRAINT [PKParqueaderos] PRIMARY KEY CLUSTERED 
(
	[IdParqueadero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNNombreParqueadro] UNIQUE NONCLUSTERED 
(
	[NombreParqueadero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propietarios]    Script Date: 8/09/2023 7:07:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propietarios](
	[IdPropietario] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumentoPropietario] [varchar](20) NOT NULL,
	[NumeroDocumentoPropietario] [varchar](15) NOT NULL,
	[NombrePropietario] [varchar](255) NOT NULL,
	[ApellidoPropietario] [varchar](255) NOT NULL,
	[FechaNacimientoPropietario] [datetime] NOT NULL,
	[CorreoPropietario] [varchar](80) NOT NULL,
	[TelefonoPropietario] [varchar](15) NULL,
	[EstadoPropietario] [varchar](20) NOT NULL,
 CONSTRAINT [PKIdPropietario] PRIMARY KEY CLUSTERED 
(
	[IdPropietario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropietariosPorEspacio]    Script Date: 8/09/2023 7:07:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropietariosPorEspacio](
	[IdPropietariosPorEspacio] [int] IDENTITY(1,1) NOT NULL,
	[IdEspacio] [int] NULL,
	[IdPropietario] [int] NULL,
 CONSTRAINT [PKPropietariosPorEspacio] PRIMARY KEY CLUSTERED 
(
	[IdPropietariosPorEspacio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservas]    Script Date: 8/09/2023 7:07:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservas](
	[IdReserva] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[TipoReserva] [varchar](40) NOT NULL,
	[FechaReserva] [int] NOT NULL,
	[EspacioReserva] [varchar](40) NOT NULL,
	[CantidadPersonas] [int] NOT NULL,
 CONSTRAINT [PKReserva] PRIMARY KEY CLUSTERED 
(
	[IdReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservasEspacios]    Script Date: 8/09/2023 7:07:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservasEspacios](
	[IdReservaEspacios] [int] IDENTITY(1,1) NOT NULL,
	[IdReserva] [int] NULL,
	[IdEspacio] [int] NULL,
 CONSTRAINT [PKReservaEspacios] PRIMARY KEY CLUSTERED 
(
	[IdReservaEspacios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservasParqueadero]    Script Date: 8/09/2023 7:07:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservasParqueadero](
	[IdReservaEspacios] [int] IDENTITY(1,1) NOT NULL,
	[IdReserva] [int] NULL,
	[IdParqueadero] [int] NULL,
	[IdVehiculo] [int] NULL,
 CONSTRAINT [PKReservaParqueadero] PRIMARY KEY CLUSTERED 
(
	[IdReservaEspacios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Residentes]    Script Date: 8/09/2023 7:07:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Residentes](
	[IdResidente] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumentoResidente] [varchar](20) NOT NULL,
	[NumeroDocumentoResidente] [varchar](15) NOT NULL,
	[NombreResidente] [varchar](255) NOT NULL,
	[ApellidoResidente] [varchar](255) NOT NULL,
	[FechaNacimientoResidente] [datetime] NOT NULL,
	[CorreoResidente] [varchar](80) NOT NULL,
	[TelefonoResidente] [varchar](15) NULL,
	[TipoResidente] [varchar](255) NOT NULL,
	[ResidenciaActual] [bit] NOT NULL,
	[IdEspacio] [int] NOT NULL,
	[FechaInicioResidencia] [datetime] NOT NULL,
	[FechaFinResidencia] [datetime] NULL,
	[EstadoResidente] [varchar](20) NOT NULL,
 CONSTRAINT [PKIdResidente] PRIMARY KEY CLUSTERED 
(
	[IdResidente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 8/09/2023 7:07:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[IdRol] [int] NULL,
	[TipoDocumento] [varchar](20) NULL,
	[Documento] [varchar](15) NULL,
	[Correo] [varchar](80) NULL,
	[Telefono] [varchar](15) NULL,
	[Contrasena] [varchar](10) NULL,
 CONSTRAINT [PkIdUsuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehiculos]    Script Date: 8/09/2023 7:07:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculos](
	[IdVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[Placa] [varchar](10) NOT NULL,
	[TipoUsuarioVehiculo] [int] NOT NULL,
	[NombrePropietarioVehiculo] [int] NOT NULL,
 CONSTRAINT [PKVehiculos] PRIMARY KEY CLUSTERED 
(
	[IdVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UCPlaca] UNIQUE NONCLUSTERED 
(
	[Placa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehiculosPorEspacio]    Script Date: 8/09/2023 7:07:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehiculosPorEspacio](
	[IdVehiculosPorEspacio] [int] IDENTITY(1,1) NOT NULL,
	[IdEspacio] [int] NULL,
	[IdVehiculo] [int] NULL,
 CONSTRAINT [PKIdVehiculosPorEspacio] PRIMARY KEY CLUSTERED 
(
	[IdVehiculosPorEspacio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visitantes]    Script Date: 8/09/2023 7:07:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitantes](
	[IdVisitante] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumentoVisitante] [varchar](20) NOT NULL,
	[NumeroDocumentoVisitante] [varchar](15) NULL,
	[NombreVisitante] [varchar](255) NOT NULL,
	[ApellidoVisitante] [varchar](255) NOT NULL,
	[GeneroVisitante] [varchar](1) NULL,
	[PermisoVisitante] [varchar](20) NOT NULL,
 CONSTRAINT [PKIdVisitante] PRIMARY KEY CLUSTERED 
(
	[IdVisitante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VisitantesPorEspacio]    Script Date: 8/09/2023 7:07:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitantesPorEspacio](
	[IdVisitantePorEspacio] [int] IDENTITY(1,1) NOT NULL,
	[IdEspacio] [int] NULL,
	[IdVisitante] [int] NULL,
 CONSTRAINT [PKIdVisitantePorEspacio] PRIMARY KEY CLUSTERED 
(
	[IdVisitantePorEspacio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Espacios] ADD  DEFAULT (NULL) FOR [Area]
GO
ALTER TABLE [dbo].[Espacios] ADD  DEFAULT (NULL) FOR [Capacidad]
GO
ALTER TABLE [dbo].[Espacios] ADD  DEFAULT ('ACTIVO') FOR [EstadoEspacio]
GO
ALTER TABLE [dbo].[Parqueaderos] ADD  DEFAULT ('ACTIVO') FOR [EstadoParqueadero]
GO
ALTER TABLE [dbo].[Propietarios] ADD  DEFAULT ('ACTIVO') FOR [EstadoPropietario]
GO
ALTER TABLE [dbo].[Residentes] ADD  DEFAULT ('PROPIETARIO') FOR [TipoResidente]
GO
ALTER TABLE [dbo].[Residentes] ADD  DEFAULT ((1)) FOR [ResidenciaActual]
GO
ALTER TABLE [dbo].[Residentes] ADD  DEFAULT (NULL) FOR [FechaFinResidencia]
GO
ALTER TABLE [dbo].[Residentes] ADD  DEFAULT ('ACTIVO') FOR [EstadoResidente]
GO
ALTER TABLE [dbo].[Visitantes] ADD  DEFAULT ('OTRO') FOR [GeneroVisitante]
GO
ALTER TABLE [dbo].[Visitantes] ADD  DEFAULT ('ACTIVO') FOR [PermisoVisitante]
GO
ALTER TABLE [dbo].[Parqueaderos]  WITH CHECK ADD  CONSTRAINT [FKEspacios] FOREIGN KEY([IdEspacio])
REFERENCES [dbo].[Espacios] ([IdEspacio])
GO
ALTER TABLE [dbo].[Parqueaderos] CHECK CONSTRAINT [FKEspacios]
GO
ALTER TABLE [dbo].[PropietariosPorEspacio]  WITH CHECK ADD  CONSTRAINT [FKEspacios3] FOREIGN KEY([IdEspacio])
REFERENCES [dbo].[Espacios] ([IdEspacio])
GO
ALTER TABLE [dbo].[PropietariosPorEspacio] CHECK CONSTRAINT [FKEspacios3]
GO
ALTER TABLE [dbo].[PropietariosPorEspacio]  WITH CHECK ADD  CONSTRAINT [FKPropietarios3] FOREIGN KEY([IdPropietario])
REFERENCES [dbo].[Propietarios] ([IdPropietario])
GO
ALTER TABLE [dbo].[PropietariosPorEspacio] CHECK CONSTRAINT [FKPropietarios3]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FKUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FKUsuario]
GO
ALTER TABLE [dbo].[ReservasEspacios]  WITH CHECK ADD  CONSTRAINT [FKEspacio1] FOREIGN KEY([IdEspacio])
REFERENCES [dbo].[Espacios] ([IdEspacio])
GO
ALTER TABLE [dbo].[ReservasEspacios] CHECK CONSTRAINT [FKEspacio1]
GO
ALTER TABLE [dbo].[ReservasEspacios]  WITH CHECK ADD  CONSTRAINT [FKReserva1] FOREIGN KEY([IdReserva])
REFERENCES [dbo].[Reservas] ([IdReserva])
GO
ALTER TABLE [dbo].[ReservasEspacios] CHECK CONSTRAINT [FKReserva1]
GO
ALTER TABLE [dbo].[ReservasParqueadero]  WITH CHECK ADD  CONSTRAINT [FKParqueadero2] FOREIGN KEY([IdParqueadero])
REFERENCES [dbo].[Parqueaderos] ([IdParqueadero])
GO
ALTER TABLE [dbo].[ReservasParqueadero] CHECK CONSTRAINT [FKParqueadero2]
GO
ALTER TABLE [dbo].[ReservasParqueadero]  WITH CHECK ADD  CONSTRAINT [FKReserva2] FOREIGN KEY([IdReserva])
REFERENCES [dbo].[Reservas] ([IdReserva])
GO
ALTER TABLE [dbo].[ReservasParqueadero] CHECK CONSTRAINT [FKReserva2]
GO
ALTER TABLE [dbo].[ReservasParqueadero]  WITH CHECK ADD  CONSTRAINT [FKVehiculo] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Vehiculos] ([IdVehiculo])
GO
ALTER TABLE [dbo].[ReservasParqueadero] CHECK CONSTRAINT [FKVehiculo]
GO
ALTER TABLE [dbo].[Residentes]  WITH CHECK ADD  CONSTRAINT [FKEspacio] FOREIGN KEY([IdEspacio])
REFERENCES [dbo].[Espacios] ([IdEspacio])
GO
ALTER TABLE [dbo].[Residentes] CHECK CONSTRAINT [FKEspacio]
GO
ALTER TABLE [dbo].[VehiculosPorEspacio]  WITH CHECK ADD  CONSTRAINT [FKEspacios2] FOREIGN KEY([IdEspacio])
REFERENCES [dbo].[Espacios] ([IdEspacio])
GO
ALTER TABLE [dbo].[VehiculosPorEspacio] CHECK CONSTRAINT [FKEspacios2]
GO
ALTER TABLE [dbo].[VehiculosPorEspacio]  WITH CHECK ADD  CONSTRAINT [FKVehiculo2] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Vehiculos] ([IdVehiculo])
GO
ALTER TABLE [dbo].[VehiculosPorEspacio] CHECK CONSTRAINT [FKVehiculo2]
GO
ALTER TABLE [dbo].[VisitantesPorEspacio]  WITH CHECK ADD  CONSTRAINT [FKEspacios1] FOREIGN KEY([IdEspacio])
REFERENCES [dbo].[Espacios] ([IdEspacio])
GO
ALTER TABLE [dbo].[VisitantesPorEspacio] CHECK CONSTRAINT [FKEspacios1]
GO
ALTER TABLE [dbo].[VisitantesPorEspacio]  WITH CHECK ADD  CONSTRAINT [FKVisitante1] FOREIGN KEY([IdVisitante])
REFERENCES [dbo].[Visitantes] ([IdVisitante])
GO
ALTER TABLE [dbo].[VisitantesPorEspacio] CHECK CONSTRAINT [FKVisitante1]
GO
ALTER TABLE [dbo].[Espacios]  WITH CHECK ADD  CONSTRAINT [CKArea] CHECK  (([Area]>(0)))
GO
ALTER TABLE [dbo].[Espacios] CHECK CONSTRAINT [CKArea]
GO
ALTER TABLE [dbo].[Espacios]  WITH CHECK ADD  CONSTRAINT [CKCapacidad] CHECK  (([Capacidad]>(0)))
GO
ALTER TABLE [dbo].[Espacios] CHECK CONSTRAINT [CKCapacidad]
GO
ALTER TABLE [dbo].[Espacios]  WITH CHECK ADD  CONSTRAINT [CKEstadoEspacio] CHECK  (([EstadoEspacio]='INACTIVO' OR [EstadoEspacio]='ACTIVO'))
GO
ALTER TABLE [dbo].[Espacios] CHECK CONSTRAINT [CKEstadoEspacio]
GO
ALTER TABLE [dbo].[Espacios]  WITH CHECK ADD  CONSTRAINT [CKNombreEspacio] CHECK  ((NOT [NombreEspacio] like '%[^a-zA-Z0-9]%'))
GO
ALTER TABLE [dbo].[Espacios] CHECK CONSTRAINT [CKNombreEspacio]
GO
ALTER TABLE [dbo].[Espacios]  WITH CHECK ADD  CONSTRAINT [CKTipoEspacio] CHECK  (([TipoEspacio] like '%[a-zA-Z0-9]%\s%[a-zA-Z]%'))
GO
ALTER TABLE [dbo].[Espacios] CHECK CONSTRAINT [CKTipoEspacio]
GO
ALTER TABLE [dbo].[Parqueaderos]  WITH CHECK ADD  CONSTRAINT [CKEstadoParqueadero] CHECK  (([EstadoParqueadero]='INACTIVO' OR [EstadoParqueadero]='ACTIVO'))
GO
ALTER TABLE [dbo].[Parqueaderos] CHECK CONSTRAINT [CKEstadoParqueadero]
GO
ALTER TABLE [dbo].[Parqueaderos]  WITH CHECK ADD  CONSTRAINT [CKNombreParqueadero] CHECK  ((NOT [NombreParqueadero] like '%[^a-zA-Z0-9]%'))
GO
ALTER TABLE [dbo].[Parqueaderos] CHECK CONSTRAINT [CKNombreParqueadero]
GO
ALTER TABLE [dbo].[Parqueaderos]  WITH CHECK ADD  CONSTRAINT [CKTipoParqueadero] CHECK  (([TipoParqueadero]='VISITANTES' OR [TipoParqueadero]='RESIDENTES'))
GO
ALTER TABLE [dbo].[Parqueaderos] CHECK CONSTRAINT [CKTipoParqueadero]
GO
ALTER TABLE [dbo].[Propietarios]  WITH CHECK ADD  CONSTRAINT [CKApellidoPropietario] CHECK  ((NOT [ApellidoPropietario] like '%[^A-Za-z]%'))
GO
ALTER TABLE [dbo].[Propietarios] CHECK CONSTRAINT [CKApellidoPropietario]
GO
ALTER TABLE [dbo].[Propietarios]  WITH CHECK ADD  CONSTRAINT [CKCorreoPropietario] CHECK  (([CorreoPropietario] like '%[A-Za-z0-9]%@%[A-Za-z0-9]%.com'))
GO
ALTER TABLE [dbo].[Propietarios] CHECK CONSTRAINT [CKCorreoPropietario]
GO
ALTER TABLE [dbo].[Propietarios]  WITH CHECK ADD  CONSTRAINT [CKEstadoPropietario] CHECK  (([EstadoPropietario]='INACTIVO' OR [EstadoPropietario]='ACTIVO'))
GO
ALTER TABLE [dbo].[Propietarios] CHECK CONSTRAINT [CKEstadoPropietario]
GO
ALTER TABLE [dbo].[Propietarios]  WITH CHECK ADD  CONSTRAINT [CKNombrePropietario] CHECK  ((NOT [NombrePropietario] like '%[^A-Za-z]%'))
GO
ALTER TABLE [dbo].[Propietarios] CHECK CONSTRAINT [CKNombrePropietario]
GO
ALTER TABLE [dbo].[Propietarios]  WITH CHECK ADD  CONSTRAINT [CKNumeroDocumentoPropietario] CHECK  (([NumeroDocumentoPropietario] like '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'))
GO
ALTER TABLE [dbo].[Propietarios] CHECK CONSTRAINT [CKNumeroDocumentoPropietario]
GO
ALTER TABLE [dbo].[Propietarios]  WITH CHECK ADD  CONSTRAINT [CKTelefonoPropietario] CHECK  (([TelefonoPropietario] like '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'))
GO
ALTER TABLE [dbo].[Propietarios] CHECK CONSTRAINT [CKTelefonoPropietario]
GO
ALTER TABLE [dbo].[Propietarios]  WITH CHECK ADD  CONSTRAINT [CKTipoDocumentoPropietario] CHECK  ((NOT [TipoDocumentoPropietario] like '%[^A-Za-z]%'))
GO
ALTER TABLE [dbo].[Propietarios] CHECK CONSTRAINT [CKTipoDocumentoPropietario]
GO
ALTER TABLE [dbo].[Residentes]  WITH CHECK ADD  CONSTRAINT [CKApellidoResidente] CHECK  ((NOT [ApellidoResidente] like '%[^A-Za-z]%'))
GO
ALTER TABLE [dbo].[Residentes] CHECK CONSTRAINT [CKApellidoResidente]
GO
ALTER TABLE [dbo].[Residentes]  WITH CHECK ADD  CONSTRAINT [CKCorreoResidente] CHECK  (([CorreoResidente] like '%[A-Za-z0-9]%@%[A-Za-z0-9]%.com'))
GO
ALTER TABLE [dbo].[Residentes] CHECK CONSTRAINT [CKCorreoResidente]
GO
ALTER TABLE [dbo].[Residentes]  WITH CHECK ADD  CONSTRAINT [CKEstadoResidente] CHECK  (([EstadoResidente]='INACTIVO' OR [EstadoResidente]='ACTIVO'))
GO
ALTER TABLE [dbo].[Residentes] CHECK CONSTRAINT [CKEstadoResidente]
GO
ALTER TABLE [dbo].[Residentes]  WITH CHECK ADD  CONSTRAINT [CKNombreResidente] CHECK  ((NOT [NombreResidente] like '%[^A-Za-z]%'))
GO
ALTER TABLE [dbo].[Residentes] CHECK CONSTRAINT [CKNombreResidente]
GO
ALTER TABLE [dbo].[Residentes]  WITH CHECK ADD  CONSTRAINT [CKNumeroDocumentoResidente] CHECK  (([NumeroDocumentoResidente] like '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'))
GO
ALTER TABLE [dbo].[Residentes] CHECK CONSTRAINT [CKNumeroDocumentoResidente]
GO
ALTER TABLE [dbo].[Residentes]  WITH CHECK ADD  CONSTRAINT [CKTelefonoResidente] CHECK  (([TelefonoResidente] like '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'))
GO
ALTER TABLE [dbo].[Residentes] CHECK CONSTRAINT [CKTelefonoResidente]
GO
ALTER TABLE [dbo].[Residentes]  WITH CHECK ADD  CONSTRAINT [CKTipoDocumentoResidente] CHECK  ((NOT [NumeroDocumentoResidente] like '%[^A-Za-z]%'))
GO
ALTER TABLE [dbo].[Residentes] CHECK CONSTRAINT [CKTipoDocumentoResidente]
GO
ALTER TABLE [dbo].[Residentes]  WITH CHECK ADD  CONSTRAINT [CKTipoResidente] CHECK  (([TipoResidente]='ARRENDATARIO' OR [TipoResidente]='PROPIETARIO'))
GO
ALTER TABLE [dbo].[Residentes] CHECK CONSTRAINT [CKTipoResidente]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [CHKApellido] CHECK  ((NOT [Apellido] like '%[^A-Za-z]%'))
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [CHKApellido]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [CHKContrasena] CHECK  (([Contrasena] like '%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]'))
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [CHKContrasena]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [CHKCorreo] CHECK  (([Correo] like '%[A-Za-z0-9]%@%[A-Za-z0-9]%.com'))
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [CHKCorreo]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [CHKDocumento] CHECK  (([Documento] like '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'))
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [CHKDocumento]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [CHKNombre] CHECK  ((NOT [Nombre] like '%[^A-Za-z]%'))
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [CHKNombre]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [CHKTelefono] CHECK  (([Telefono] like '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'))
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [CHKTelefono]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [CHKTipo] CHECK  ((NOT [TipoDocumento] like '%[^A-Za-z]%'))
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [CHKTipo]
GO
ALTER TABLE [dbo].[Visitantes]  WITH CHECK ADD  CONSTRAINT [CKApellidoVisitante] CHECK  ((NOT [ApellidoVisitante] like '%[^A-Za-z]%'))
GO
ALTER TABLE [dbo].[Visitantes] CHECK CONSTRAINT [CKApellidoVisitante]
GO
ALTER TABLE [dbo].[Visitantes]  WITH CHECK ADD  CONSTRAINT [CKGeneroVisitante] CHECK  (([GeneroVisitante]='OTRO' OR [GeneroVisitante]='M' OR [GeneroVisitante]='F'))
GO
ALTER TABLE [dbo].[Visitantes] CHECK CONSTRAINT [CKGeneroVisitante]
GO
ALTER TABLE [dbo].[Visitantes]  WITH CHECK ADD  CONSTRAINT [CKNombreVisitante] CHECK  ((NOT [NombreVisitante] like '%[^A-Za-z]%'))
GO
ALTER TABLE [dbo].[Visitantes] CHECK CONSTRAINT [CKNombreVisitante]
GO
ALTER TABLE [dbo].[Visitantes]  WITH CHECK ADD  CONSTRAINT [CKNumeroDocumentoVisitante] CHECK  (([NumeroDocumentoVisitante] like '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'))
GO
ALTER TABLE [dbo].[Visitantes] CHECK CONSTRAINT [CKNumeroDocumentoVisitante]
GO
ALTER TABLE [dbo].[Visitantes]  WITH CHECK ADD  CONSTRAINT [CKPermisoVisitante] CHECK  (([PermisoVisitante]='NO PERMITIDO' OR [PermisoVisitante]='PERMITIDO'))
GO
ALTER TABLE [dbo].[Visitantes] CHECK CONSTRAINT [CKPermisoVisitante]
GO
ALTER TABLE [dbo].[Visitantes]  WITH CHECK ADD  CONSTRAINT [CKTipoDocumentoVisitante] CHECK  ((NOT [TipoDocumentoVisitante] like '%[^A-Za-z]%'))
GO
ALTER TABLE [dbo].[Visitantes] CHECK CONSTRAINT [CKTipoDocumentoVisitante]
GO
USE [master]
GO
ALTER DATABASE [ApptowerProvicional] SET  READ_WRITE 
GO
